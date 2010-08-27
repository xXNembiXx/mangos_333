DELETE FROM `command` WHERE `name` IN ('closeticket', 'ticket');
INSERT INTO `command`
	(`name`, `security`, `help`)
values
	('closeticket','2','Syntax: .closeticket all\r\n        .closeticket #num\r\n        .closeticket $character_name\r\n    .closeticket a #num\rall to close all tickets at server, $character_name to close ticket of this character, #num to close ticket #num.'),
	('ticket','2','Syntax: .ticket on\r\n        .ticket off\r\n        .ticket #num\r\n        .ticket $character_name\r\n    .ticket a #num\r\n    .ticket assign $character_name #guid or #num GMLevel\r\n    .ticket assign $character_name del\r\non/off for GMs to show or not a new ticket directly, $character_name to show ticket of this character, #num to show ticket #num, \'a\' to get assigned ticket #num, assign to assign a ticket.');

DELETE FROM `mangos_string` WHERE `entry` IN ('290', '10000');
INSERT INTO `mangos_string`
	(`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
	('290','Ticket of %s (Last updated: %s) assigned to: %s , GMLevel: %u :\n%s ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	('10000','|cffff0000You have %i assigned tickets|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);