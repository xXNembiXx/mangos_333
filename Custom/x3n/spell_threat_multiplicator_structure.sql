DROP TABLE IF EXISTS `spell_threat_multiplicator`;
CREATE TABLE `spell_threat_multiplicator` (
  `entry` mediumint(9) NOT NULL,
  `threat_multiplicator` float NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
