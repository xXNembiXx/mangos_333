-- do not delete tickets, only flag them as "closed"

UPDATE `mangos_string` SET `content_default` = 'All tickets closed.', `content_loc3` = 'Alle Tickets geschlossen.' WHERE entry = 294;
UPDATE `mangos_string` SET `content_default` = 'Character %s ticket closed.', `content_loc3` = 'Ticket von Charakter %s wurde geschlossen.' WHERE entry = 295;
UPDATE `mangos_string` SET `content_default` = 'Ticket closed.', `content_loc3` = 'Ticket geschlossen.' WHERE entry = 296;
DELETE FROM `command` WHERE name = 'delticket';
INSERT INTO `command` 
	(`name`, `security`, `help`)
VALUES
	('closeticket',2,'Syntax: .closeticket all\r\n        .closeticket #num\r\n        .closeticket $character_name\r\n\rall to close all tickets at server, $character_name to close ticket of this character, #num to close ticket #num.');
