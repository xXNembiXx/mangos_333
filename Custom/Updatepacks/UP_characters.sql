############################################################################
#
#							SQL	Updatepack
#							realm database
#
#							  10-07-2010
#
############################################################################


####
# addition (author: insider42)
####

-- 100_characters_cheaters.sql
CREATE TABLE IF NOT EXISTS `cheaters` (
  `entry` bigint(20) NOT NULL AUTO_INCREMENT,
  `player` varchar(30) NOT NULL,
  `acctid` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT 'unknown',
  `speed` float NOT NULL DEFAULT '0',
  `Val1` float NOT NULL DEFAULT '0',
  `Val2` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `Map` smallint(5) NOT NULL DEFAULT '-1',
  `Pos` varchar(255) NOT NULL DEFAULT '0',
  `Level` mediumint(9) NOT NULL DEFAULT '0',
  `first_date` datetime NOT NULL,
  `last_date` datetime NOT NULL,
  `Op` varchar(255) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`entry`),
  KEY `idx_Count` (`count`),
  KEY `idx_Player` (`player`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

-- 132_characters_character_battleground_random.sql
DROP TABLE IF EXISTS `character_battleground_random`;
CREATE TABLE `character_battleground_random` (
  `guid` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 132_characters_saved_variables.sql
ALTER TABLE `saved_variables` ADD COLUMN `NextRandomBGResetTime` bigint(40) unsigned NOT NULL default '0' AFTER `NextWeeklyQuestResetTime`;

