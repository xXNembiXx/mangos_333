-- Tables for External Mail System

DROP TABLE IF EXISTS `mail_external`;
CREATE TABLE `mail_external` (
    `id` bigint(20) unsigned NOT NULL auto_increment,
    `sender` bigint(20) default NULL,
    `receiver` bigint(20) default NULL,
    `subject` varchar(200) collate latin1_general_ci default 'Support',
    `message` varchar(500) collate latin1_general_ci default 'Support',
    `money` bigint(20) NOT NULL default '0',
    `stationery` int(10) default '41',
    `sent` tinyint(4) default '0',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

DROP TABLE IF EXISTS `mail_external_items`;
CREATE TABLE `mail_external_items` (
	`id` bigint(20) unsigned NOT NULL auto_increment,
    `mail_id` bigint(20) default NULL,
    `item` bigint(20) default NULL,
	`count` bigint(20) NOT NULL default '1',
PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;