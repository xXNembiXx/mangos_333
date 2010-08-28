-- show ticketid in .ticket

UPDATE `mangos_string` SET `content_default` = 'Ticket %u of %s (Last updated: %s) assigned to: %s , GMLevel: %u :\n%s ', `content_loc3` = 'Ticket %u von %s (Letztes Update: %s) zugeordnet zu: %s , GMLevel: %u :\n%s ' WHERE entry = 290;
