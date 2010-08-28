/*
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _GMTICKETMGR_H
#define _GMTICKETMGR_H

#include "Policies/Singleton.h"
#include "Database/DatabaseEnv.h"
#include "Util.h"
#include <map>

class GMTicket
{
    public:
        explicit GMTicket()
        {
        }

        GMTicket(uint32 ticketId, uint32 guid, const std::string& text, const std::string& responsetext, time_t update, uint8 closed, uint32 assignedGuid, uint8 assignedSecLevel) : m_ticketId(ticketId), m_guid(guid), m_text(text), m_responseText(responsetext), m_lastUpdate(update), m_closed(closed), m_assignedGuid(assignedGuid), m_assignedSecLevel(assignedSecLevel)
        {

        }

        const uint32 GetTicketId() const
        {
            return m_ticketId;
        }

        const char* GetText() const
        {
            return m_text.c_str();
        }

        const char* GetResponse() const
        {
            return m_responseText.c_str();
        }
		
		const uint32 GetAssignedGuid() const
		{
			return m_assignedGuid;
		}
		
		void SetAssignedGuid(uint32 guid)
		{
			m_assignedGuid = guid;
			CharacterDatabase.PExecute("UPDATE character_ticket SET assigned_guid = '%u' WHERE guid = '%u'", m_assignedGuid, m_guid);
		}

		const uint8 GetAssignedSecLevel() const
		{
			return m_assignedSecLevel;
		}

		void SetAssignedSecLevel(uint8 secLevel)
		{
			m_assignedSecLevel = secLevel;
			CharacterDatabase.PExecute("UPDATE character_ticket SET assigned_sec_level = '%i' WHERE guid = '%u'", m_assignedSecLevel, m_guid);
		}

        uint64 GetLastUpdate() const
        {
            return m_lastUpdate;
        }

        void SetText(const char* text)
        {
            m_text = text ? text : "";
            m_lastUpdate = time(NULL);

            std::string escapedString = m_text;
            CharacterDatabase.escape_string(escapedString);
            CharacterDatabase.PExecute("UPDATE character_ticket SET ticket_text = '%s' WHERE guid = '%u'", escapedString.c_str(), m_guid);
        }

        void SetResponseText(const char* text)
        {
            m_responseText = text ? text : "";
            m_lastUpdate = time(NULL);

            std::string escapedString = m_responseText;
            CharacterDatabase.escape_string(escapedString);
            CharacterDatabase.PExecute("UPDATE character_ticket SET response_text = '%s' WHERE guid = '%u'", escapedString.c_str(), m_guid);
        }

        bool HasResponse() { return !m_responseText.empty(); }

        void CloseInDB() const
        {
            CharacterDatabase.PExecute("UPDATE character_ticket SET closed = '1' WHERE guid = '%u' LIMIT 1", m_guid);
        }

        void SaveToDB() const
        {
            CharacterDatabase.BeginTransaction();
            CloseInDB();

            std::string escapedString = m_text;
            CharacterDatabase.escape_string(escapedString);

            std::string escapedString2 = m_responseText;
            CharacterDatabase.escape_string(escapedString2);

            CharacterDatabase.PExecute("INSERT INTO character_ticket (guid, ticket_text, response_text, closed, assigned_guid, assigned_sec_level) VALUES ('%u', '%s', '%s', 0, '%u', '%i')", m_guid, escapedString.c_str(), escapedString2.c_str(), m_assignedGuid, m_assignedSecLevel);
            CharacterDatabase.CommitTransaction();
        }
    private:
		uint32 m_ticketId;
        uint32 m_guid;
        std::string m_text;
        std::string m_responseText;
        time_t m_lastUpdate;
        uint8 m_closed;
		uint32 m_assignedGuid;
		uint8 m_assignedSecLevel;
};
typedef std::map<uint32, GMTicket> GMTicketMap;

class GMTicketMgr
{
    public:
        GMTicketMgr() {  }
        ~GMTicketMgr() {  }

        void LoadGMTickets();

        GMTicket* GetGMTicket(uint32 guid)
        {
            GMTicketMap::iterator itr = m_GMTicketMap.find(guid);
            if(itr == m_GMTicketMap.end())
                return NULL;
            return &(itr->second);
        }

        size_t GetTicketCount() const
        {
            return m_GMTicketMap.size();
        }
		
		size_t GetAssignedTicketCount(uint32 aGuid, uint8 aLevel) const
		{
			uint32 count = 0;
			for (GMTicketMap::const_iterator itr = m_GMTicketMap.begin(); itr != m_GMTicketMap.end(); ++itr)
				if (aGuid && aGuid == itr->second.GetAssignedGuid() || aLevel && aLevel == itr->second.GetAssignedSecLevel())
					++count;
			return count;
		}

        void Close(uint32 guid)
        {
            GMTicketMap::iterator itr = m_GMTicketMap.find(guid);
            if(itr == m_GMTicketMap.end())
                return;
            itr->second.CloseInDB();
            m_GMTicketMap.erase(itr);
        }

        void CloseAll();

        void Create(uint32 guid, const char* text)
        {
            GMTicket t = GMTicket(NULL, guid, text, "", time(NULL), 0, NULL, NULL);
            t.SaveToDB();
            m_GMTicketMap[guid] = t;
        }
    private:
        GMTicketMap m_GMTicketMap;
};

#define sTicketMgr MaNGOS::Singleton<GMTicketMgr>::Instance()
#endif
