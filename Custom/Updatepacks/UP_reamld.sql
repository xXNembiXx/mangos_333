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

-- 3_realmd_autobroadcast.sql
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `id` int(11) NOT NULL auto_increment,
  `text` longtext NOT NULL,
  `next` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;