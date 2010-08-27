-- do not delete tickets, only flag them as "closed"

ALTER TABLE `character_ticket` ADD COLUMN `closed` smallint(1) unsigned DEFAULT '0' NOT NULL AFTER `ticket_lastchange`;
