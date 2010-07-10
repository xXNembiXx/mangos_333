############################################################################
#
#							SQL	Updatepack
#							mangos database
#
#							  10-07-2010
#
############################################################################


####
# addition (author: insider42)
####

-- 3_mangos_autobroadcast.sql
DELETE FROM `mangos_string` WHERE `entry` = 1300;
INSERT INTO `mangos_string` VALUES (1300, '|cffffcc00[Server]: |cff00ff00%s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- 6_mangos_spell_disabled.sql
CREATE TABLE spell_disabled (
  entry int(11) unsigned NOT NULL default '0' COMMENT 'spell entry',
  ischeat_spell tinyint(3) unsigned NOT NULL default '0' COMMENT 'mark spell as cheat',
  active tinyint(3) unsigned NOT NULL default '1' COMMENT 'enable check of this spell',
  PRIMARY KEY  (entry)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Disabled Spell System';

-- 39_mangos_creature_template.sql
UPDATE `creature_template` SET `spell1` = 55328 WHERE `entry` = 3579;
UPDATE `creature_template` SET `spell1` = 55329 WHERE `entry` = 3911;
UPDATE `creature_template` SET `spell1` = 55330 WHERE `entry` = 3912;
UPDATE `creature_template` SET `spell1` = 55332 WHERE `entry` = 3913;
UPDATE `creature_template` SET `spell1` = 55333 WHERE `entry` = 7398;
UPDATE `creature_template` SET `spell1` = 55335 WHERE `entry` = 7399;
UPDATE `creature_template` SET `spell1` = 55278 WHERE `entry` = 15478;
UPDATE `creature_template` SET `spell1` = 58589 WHERE `entry` = 31120;
UPDATE `creature_template` SET `spell1` = 58590 WHERE `entry` = 31121;
UPDATE `creature_template` SET `spell1` = 58591 WHERE `entry` = 31122;

-- 46_mangos_spell_bonus_data.sql
DELETE FROM `spell_bonus_data` WHERE `entry` = 8026;

-- 51_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (48492,48494,48495);
INSERT INTO `spell_proc_event` VALUES 
(48492,0,7,524288,0,2048,16384,0,0,0,0);

-- 80_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE entry IN (56342,56343,56344);
INSERT INTO `spell_proc_event` VALUES
(56342,0,9,0x0C,0x8000000,0x60000,0,0,0,0,0);

-- 99_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (44543,44545);
INSERT INTO `spell_proc_event` VALUES
(44543,0,3,33555104,0,0,0,0,0,0,0);

-- 100_mangos_mangos_string.sql
DELETE FROM `mangos_string` WHERE `entry` = 11000;
INSERT INTO `mangos_string` VALUES (11000, '|cffff0000[Anticheat]: Cheater detected. Nickname: %s. Cheat type: %s.|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|cffff0000[???????]: ????? ?????????. ???: %s. ??? ????: %s.|r');

-- 111_mangos_creature_onkill_reputation.sql
ALTER TABLE `creature_onkill_reputation` 
 ADD COLUMN `ChampioningAura` int(11) unsigned NOT NULL default '0' AFTER `TeamDependent`;

-- 113_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` = 24905;
INSERT INTO `spell_proc_event` VALUES
(24905,0,0,0,0,0,0,2,0,50,0);

-- 115_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (11103,12357,12358,64343);
INSERT INTO `spell_proc_event` VALUES
(64343,0x00000000,3,0x00000002,0x00000000,0x00000000,0x00000000,0x00000000,0.0,0.0,0);

-- 116_mangos_spell_bonus_data.sql
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.286 WHERE `entry` = 49821;

-- 117_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (12317,13045,13046,13047,13048);

-- 118_mangos_spell_proc_event.sql
update `spell_proc_event` set `ppmRate` = 3 where `entry` = 12322;
update `spell_proc_event` set `ppmRate` = 6 where `entry` = 12999;
update `spell_proc_event` set `ppmRate` = 9 where `entry` = 13000;
update `spell_proc_event` set `ppmRate` = 12 where `entry` = 13001;
update `spell_proc_event` set `ppmRate` = 15 where `entry` = 13002;

-- 119_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (53551,53552,53553);
INSERT INTO `spell_proc_event` VALUES
(53551,0x00000000,10,0x00001000,0x00000000,0x00000000,0x00000000,0x00000000,0.0,0.0,0);

-- 120_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` = 67356;
INSERT INTO `spell_proc_event` VALUES (67356,0x00,7,0x00000010,0x00000000,0x00000000,0x00000000,0x00000000,0.000000,0.000000,0);

-- 124_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (51692,51696);
INSERT INTO `spell_proc_event` VALUES
(51692,0,8,516,0,0,0,0,0,0,0);

-- 129_mangos_spell_proc_event.sql
DELETE FROM `spell_bonus_data` WHERE `entry` = 54158;

-- 160_mangos_dalaran_arena.sql
delete from `gameobject` where `map` = 617;
insert into `gameobject` values
	-- buffs
('200060','184663','617','1','1','1291.7','813.424','7.11472','4.64562','0','0','0.730314','-0.683111','-120','100','1'),
('200061','184664','617','1','1','1291.7','768.911','7.11472','1.55194','0','0','0.700409','0.713742','-120','100','1'),
	-- doors
('200062','192642','617','1','1','1350.95','817.2','21.4096','3.15','0','0','0.99627','0.0862864','86400','100','1'),
('200063','192643','617','1','1','1232.65','764.913','21.4729','6.3','0','0','0.0310211','-0.999519','86400','100','1');

delete from `gameobject_battleground` where `guid` in (200060,200061,200062,200063);
insert into `gameobject_battleground` values
	-- buffs
('200060','252','0'),
('200061','252','0'),
	-- doors
('200062','254','0'),
('200063','254','0');
delete from `battleground_events` where `map` = 617;
insert into `battleground_events` values
('617','252','0','buffs'),
('617','254','0','doors');
	-- doors
update `gameobject_template` set `faction` = 114, `flags` = 32, `size` = 1.5 where `entry` in (192642,192643);

-- 161_mangos_spell_dbc.sql
DROP TABLE IF EXISTS `spell_dbc`;
CREATE TABLE `spell_dbc` (
  `Id` int(10) unsigned NOT NULL,
  `Dispel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Mechanic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Attributes` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int(10) unsigned NOT NULL DEFAULT '0',
  `Stances` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Targets` int(10) unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `AuraInterruptFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcChance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ProcCharges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DurationIndex` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RangeIndex` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `StackAmount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EquippedItemClass` int(11) NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int(11) NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int(11) NOT NULL DEFAULT '0',
  `Effect1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectDieSides1` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides2` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides3` int(11) NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel3` float NOT NULL DEFAULT '0',
  `EffectBasePoints1` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints2` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints3` int(11) NOT NULL DEFAULT '0',
  `EffectMechanic1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude1` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude2` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude3` int(11) NOT NULL DEFAULT '0',
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectMultipleValue3` float NOT NULL DEFAULT '0',
  `EffectMiscValue1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue3` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB3` int(11) NOT NULL DEFAULT '0',
  `EffectTriggerSpell1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC3` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxTargetLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags3` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DmgClass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PreventionType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `DmgMultiplier3` float NOT NULL DEFAULT '0',
  `AreaGroupId` int(11) NOT NULL DEFAULT '0',
  `SchoolMask` int(10) unsigned NOT NULL DEFAULT '0',
  `Comment` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom spell.dbc entries';

INSERT INTO `spell_dbc` VALUES
('24395', '0', '0', '536936848', '32768', '4', '0', '0', '0', '0', '1', '1', '0', '0', '101', '0', '0', '40', '40', '85', '1', '0', '-1', '0', '0', '6', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '77', '77', '77', '0', '0', '0', '0', '0', '0', '1', '5', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bestial Wrath - Immunity'),
('24396', '0', '0', '536936848', '32768', '4', '0', '0', '0', '0', '1', '1', '0', '0', '101', '0', '0', '40', '40', '85', '1', '0', '-1', '0', '0', '6', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '77', '77', '77', '0', '0', '0', '0', '0', '0', '14', '13', '24', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bestial Wrath - Immunity'),
('24397', '0', '0', '536936848', '268468224', '4', '0', '0', '0', '0', '1', '1', '0', '0', '101', '0', '0', '40', '40', '85', '1', '0', '-1', '0', '0', '6', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '77', '77', '77', '0', '0', '0', '0', '0', '0', '7', '10', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bestial Wrath - Immunity'),
('26592', '0', '0', '536936848', '268468224', '4', '0', '0', '0', '0', '1', '1', '0', '0', '101', '0', '0', '40', '40', '85', '1', '0', '-1', '0', '0', '6', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '77', '77', '77', '0', '0', '0', '0', '0', '0', '2', '18', '30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bestial Wrath - Immunity'),
('24900', '0', '0', '400', '1024', '0', '0', '2097152', '0', '1', '0', '1', '0', '0', '101', '0', '0', '0', '0', '21', '1', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '166', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Heart of the Wild - Cat Bonus'),
('24899', '0', '0', '400', '1024', '0', '0', '2097152', '0', '144', '0', '1', '0', '0', '101', '0', '0', '0', '0', '21', '1', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '137', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Heart of the Wild - Bear Bonus'),
('56817', '0', '0', '384', '0', '0', '0', '0', '0', '0', '0', '1', '0', '16', '100', '1', '0', '67', '67', '1', '0', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rune Strike - Aura for 56815'),
('62388', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '21', '1', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Demonic Circle: Teleport(48020) - casterAuraSpell');

-- 165_mangos_spell_bonus_data.sql
DELETE FROM `spell_bonus_data` where `entry` = 52042;

-- 169_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` = 22812;
INSERT INTO `spell_proc_event` VALUES (22812,0,0,0,0,0,0,3,0,0,0);

-- 170_mangos_spell_bonus_data.sql
DELETE FROM `spell_bonus_data` WHERE `entry` IN (55078,55095);

-- 172_mangos_orgrimmar_arena.sql
delete from `gameobject` where `map` = 618;
insert into `gameobject` values
	-- buffs
('200070','184663','618','1','1','735.551819','-284.794678','28.276682','0.034906','0','0','0','0','-120','100','1'),
('200071','184664','618','1','1','791.224487','-284.794464','28.276682','2.600535','0','0','0','0','-120','100','1'),
	-- elevators
('200072','194582','618','1','1','763.536377','-294.535767','0.505383','3.141593','0','0','0','0','120','100','1'),
('200073','194586','618','1','1','763.506348','-273.873352','0.505383','0','0','0','0','0','120','100','1'),
	-- fire
('200074','192704','618','1','1','743.543457','-283.799469','28.286655','0','0','0','0','0','120','100','1'),
('200075','192705','618','1','1','782.971802','-283.799469','28.286655','0','0','0','0','0','120','100','1'),
('200076','192388','618','1','1','743.711060','-284.099609','27.542587','3.141593','0','0','0','0','120','100','1'),
('200077','192387','618','1','1','783.221252','-284.133362','27.535686','0','0','0','0','0','120','100','1'),
	-- gears
('200078','192393','618','1','1','763.664551','-261.872986','26.686588','0','0','0','0','0','120','100','1'),
('200079','192394','618','1','1','763.578979','-306.146149','26.665222','3.141593','0','0','0','0','120','100','1'),
	-- pillars
('200080','194583','618','1','1','763.632385','-306.162384','25.909504','3.141593','0','0','0','0','120','100','1'),
('200081','194584','618','1','1','723.644287','-284.493256','24.648525','3.141593','0','0','0','0','120','100','1'),
('200082','194585','618','1','1','763.611145','-261.856750','25.909504','0','0','0','0','0','120','100','1'),
('200083','194587','618','1','1','802.211609','-284.493256','24.648525','0','0','0','0','0','120','100','1'),
	/*
	-- pillars collision (not work - should make you break LoS)
('200084','194580','618','1','1','763.632385','-306.162384','30.639660','3.141593','0','0','0','0','120','100','1'),
('200085','194579','618','1','1','723.644287','-284.493256','32.382710','0','0','0','0','0','120','100','1'),
('200086','194581','618','1','1','763.611145','-261.856750','30.639660','0','0','0','0','0','120','100','1'),
('200087','194578','618','1','1','802.211609','-284.493256','32.382710','3.141593','0','0','0','0','120','100','1'),
	*/
	-- pulley
('200088','192389','618','1','1','700.722290','-283.990662','39.517582','3.141593','0','0','0','0','120','100','1'),
('200089','192390','618','1','1','826.303833','-283.996429','39.517582','0','0','0','0','0','120','100','1');

delete from `gameobject_battleground` where `guid` in (200070,200071,200072,200073);
insert into `gameobject_battleground` values
	-- buffs
('200070','252','0'),
('200071','252','0'),
	-- elevators
('200072','254','0'),
('200073','254','0');

delete from `battleground_events` where `map` = 618;
insert into `battleground_events` values
('618','252','0','buffs'),
('618','254','0','doors');

update `gameobject_template` set `faction` = 114, `flags` = 32 where `entry` in (192704,192705,192388,192387,192393,192394,192389,192390);

-- 194_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (49208,49467,54639);
INSERT INTO `spell_proc_event` VALUES
(49467, 0x00, 15, 0x00000010, 0x00020000, 0x00000000, 0x00010010, 0x00000000, 0.000000, 0.000000, 0),
(49208, 0x00, 15, 0x00400000, 0x00010000, 0x00000000, 0x00010010, 0x00000000, 0.000000, 0.000000, 0),
(54639, 0x00, 15, 0x00400000, 0x00010000, 0x00000000, 0x00010010, 0x00000000, 0.000000, 0.000000, 0);

-- 203_mangos_spell_area.sql
DELETE FROM spell_area WHERE spell IN (74411);
INSERT INTO spell_area VALUES 
	-- Eye of The Storm (map 566)
(74411,3820,0,0,0,0,0,2,1), -- Eye of the storm (general)
(74411,3869,0,0,0,0,0,2,1), -- Mage Tower
(74411,3870,0,0,0,0,0,2,1), -- BE Tower
(74411,3871,0,0,0,0,0,2,1), -- Draenei Ruins
(74411,3872,0,0,0,0,0,2,1), -- Fel Reaver Ruins

	-- Arathi Basin (map 529)
(74411,3358,0,0,0,0,0,2,1), -- Arathi Basin (general)
(74411,3317,0,0,0,0,0,2,1), -- Trollbane Hall
(74411,3418,0,0,0,0,0,2,1), -- Defilers Den
(74411,3420,0,0,0,0,0,2,1), -- Farm
(74411,3421,0,0,0,0,0,2,1), -- Blacksmith
(74411,3422,0,0,0,0,0,2,1), -- Lumber Mill
(74411,3424,0,0,0,0,0,2,1), -- Stables
(74411,3423,0,0,0,0,0,2,1), -- Gold Mine

	-- Warsong Gulch (map 489)
(74411,3277,0,0,0,0,0,2,1), -- Warsong Gulch (general)
(74411,3320,0,0,0,0,0,2,1), -- Warsong Luber Mill
(74411,3321,0,0,0,0,0,2,1), -- Silverwing Hold
(74411,4571,0,0,0,0,0,2,1), -- Silverwing Flag Room
(74411,4572,0,0,0,0,0,2,1), -- Warsong Flag Room

	-- Alterac Valley (map 30)
(74411,2597,0,0,0,0,0,2,1), -- Alterac Valley (general)
(74411,2957,0,0,0,0,0,2,1), -- Irondeep Mine
(74411,2958,0,0,0,0,0,2,1), -- Stonehearth Outpost
(74411,2959,0,0,0,0,0,2,1), -- Dun Baldar
(74411,2960,0,0,0,0,0,2,1), -- Icewing Pass
(74411,2961,0,0,0,0,0,2,1), -- Frostwolf Willage
(74411,2962,0,0,0,0,0,2,1), -- Tower Point
(74411,2963,0,0,0,0,0,2,1), -- Coldtooth Mine
(74411,2964,0,0,0,0,0,2,1), -- Winterax Hold
(74411,2977,0,0,0,0,0,2,1), -- Iceblood Garrison
(74411,2978,0,0,0,0,0,2,1), -- Frostwolf Keep
(74411,3017,0,0,0,0,0,2,1), -- Frost Dagger Pass
(74411,3057,0,0,0,0,0,2,1), -- Field of Strife
(74411,3058,0,0,0,0,0,2,1), -- Icewing Cavern
(74411,3297,0,0,0,0,0,2,1), -- Frostwolf Graveyard
(74411,3298,0,0,0,0,0,2,1), -- Frostwolf Pass
(74411,3299,0,0,0,0,0,2,1), -- Dun Baldar Pass
(74411,3300,0,0,0,0,0,2,1), -- Iceblood Graveyard
(74411,3301,0,0,0,0,0,2,1), -- Snowfall Graveyard
(74411,3302,0,0,0,0,0,2,1), -- Stonehearth Graveyard
(74411,3303,0,0,0,0,0,2,1), -- Stormpike Graveyard
(74411,3304,0,0,0,0,0,2,1), -- Icewing Bunker
(74411,3305,0,0,0,0,0,2,1), -- Stonhearth Bunker
(74411,3306,0,0,0,0,0,2,1), -- Wildpaw Ridge
(74411,3318,0,0,0,0,0,2,1), -- Rock of Durotan
(74411,3337,0,0,0,0,0,2,1), -- Wildpaw Cavern
(74411,3338,0,0,0,0,0,2,1), -- The Vieled Cleft
(74411,4407,0,0,0,0,0,2,1), -- Hall of the Frostwolf
(74411,4408,0,0,0,0,0,2,1), -- Hall of the Stormpike

	-- Stand of the Ancients (map 607)
(74411,4384,0,0,0,0,0,2,1), -- Strand of the Ancients (general)
(74411,4604,0,0,0,0,0,2,1), -- Gate of the Red Sun
(74411,4605,0,0,0,0,0,2,1), -- Gate of the Blue Sapphire
(74411,4606,0,0,0,0,0,2,1), -- Gate of the Green Emerald
(74411,4607,0,0,0,0,0,2,1), -- Gate of the Purple Amethyst
(74411,4608,0,0,0,0,0,2,1), -- Gate of the Yellow Moon
(74411,4609,0,0,0,0,0,2,1), -- Courtyard of the Ancients
(74411,4610,0,0,0,0,0,2,1), -- Landing Beach

	-- Isle of Conquest (map 628)
(74411,4710,0,0,0,0,0,2,1), -- Isle of Conquest (general)
(74411,4741,0,0,0,0,0,2,1), -- Isle of Conquest - No Man's Land
(74411,4747,0,0,0,0,0,2,1), -- Workshop
(74411,4748,0,0,0,0,0,2,1), -- Quarry
(74411,4749,0,0,0,0,0,2,1), -- Docks
(74411,4750,0,0,0,0,0,2,1), -- Hangar
(74411,4751,0,0,0,0,0,2,1), -- Refinery
(74411,4752,0,0,0,0,0,2,1), -- Horde Keep
(74411,4753,0,0,0,0,0,2,1); -- Alliance Keep

DELETE FROM spell_area WHERE spell IN (74410);
INSERT INTO spell_area VALUES 
(74410,4406,0,0,0,0,0,2,1), -- Ring of Valor (map 618)
(74410,3968,0,0,0,0,0,2,1), -- Ruins of Loraeron (map 572)
(74410,3638,0,0,0,0,0,2,1), -- Ring of Trials (map 572)
(74410,3698,0,0,0,0,0,2,1), -- Nagrand Arena (map 559)
(74410,3702,0,0,0,0,0,2,1), -- BEM Arena (map 562)
(74410,4378,0,0,0,0,0,2,1); -- Dalaran Arena (map 617);

-- 207_mangos_spell_bonus_data.sql
DELETE FROM `spell_bonus_data` WHERE `entry` = 50536;
INSERT INTO `spell_bonus_data` VALUES
(50536,0,0,0,'Death Knight - Unholy Blight Triggered');

-- 207_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` = 49194;
INSERT INTO `spell_proc_event` VALUES
(49194,0x00,15,0x00002000,0x00000000,0x00000000,0x00000000,0x00000000,0.000000,0.000000,0);

-- spell_proc_event_important.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (71562, 71519);
INSERT INTO `spell_proc_event` VALUES ('71562', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('71519', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');
UPDATE `spell_proc_event` SET `SpellFamilyMask1` =  0x08000000 WHERE `entry` = 55666;

	-- Next NPCs needs for correct work of Deathbringer's Will's bonuses (only visual)
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38273, 0, 0, 0, 0, 0, 23643, 23653, 23643, 23653, 'Taunka', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38292, 0, 0, 0, 0, 0, 23643, 23653, 23643, 23653, 'Taunka', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38271, 0, 0, 0, 0, 0, 22251, 0, 22251, 0, 'Vrykul', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');

####
# Custom (author: kero99)
####

-- K19_spell_area_mangos.sql
INSERT IGNORE INTO spell_area VALUES (51913,  4298, 0, 0, 0, 0, 0, 2, 1);

-- K49_mangos_mirror_image.sql
	-- Mirror Immage summon
UPDATE creature_template SET
speed_walk = 2.5,
modelid_A = 11686,
modelid_H = 11686,
faction_A = 35,
faction_H = 35,
minlevel = 80,
maxlevel = 80,
AIName = '',
ScriptName = 'mob_mirror_image'
WHERE entry = 31216;

-- K51_mangos_DeadlyPoisons.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (2818);
INSERT INTO `spell_proc_event` VALUES (2818, 0x00, 8, 0x00010000, 0x00000000, 0x00000000, 0x00020000, 0x00000000, 0.000000, 0.000000, 0);
INSERT INTO `spell_chain` VALUES 
(2818, 0, 2818, 1, 0), 
(2819, 2818, 2818, 2, 0),
(11353, 2819, 2818, 3, 0),
(11354, 11353, 2818, 4, 0),
(25349, 11354, 2818, 5, 0),
(26968, 25349, 2818, 6, 0),
(27187, 26968, 2818, 7, 0),
(57969, 27187, 2818, 8, 0),
(57970, 57969, 2818, 9, 0);

-- K60_mangos_WanderingPlague.sql
	-- Wandering Plague
DELETE FROM spell_chain WHERE spell_id IN (49217, 49654, 49655);
INSERT INTO spell_chain VALUES
(49217, 0, 49217, 1, 0),
(49654, 49217, 49217, 2, 0),
(49655, 49654, 49217, 2, 0);
DELETE FROM spell_proc_event WHERE entry IN (49217, 49654, 49655);
INSERT INTO spell_proc_event VALUES
(49217, 0, 15, 0, 100663296, 0, 262144, 0, 0, 100, 0);

-- K64_mangos_dkghoul.sql
DELETE FROM `spell_pet_auras` WHERE `aura` = 54566;
INSERT INTO `spell_pet_auras` VALUES
(48965,1,26125,54566),
(49572,1,26125,54566),
(49571,1,26125,54566);

DELETE FROM `pet_levelstats` WHERE `creature_entry` = 26125;
INSERT INTO `pet_levelstats` VALUES
(26125,1,48,80,10,20,16,13,20,8),
(26125,2,105,106,67,22,17,14,21,9),
(26125,3,162,132,124,24,18,15,22,10),
(26125,4,219,158,181,26,19,16,23,11),
(26125,5,276,184,238,28,20,17,24,12),
(26125,6,333,210,295,30,21,18,25,13),
(26125,7,390,236,352,32,22,19,26,14),
(26125,8,447,262,409,34,23,20,27,15),
(26125,9,504,288,466,36,24,21,28,16),
(26125,10,561,314,523,38,25,22,29,17),
(26125,11,618,340,580,40,26,23,30,18),
(26125,12,675,366,637,42,27,24,31,19),
(26125,13,732,392,694,44,28,25,32,20),
(26125,14,789,418,751,46,29,26,33,21),
(26125,15,846,444,808,48,30,27,34,22),
(26125,16,903,470,865,50,31,28,35,23),
(26125,17,960,496,922,52,32,29,36,24),
(26125,18,1017,522,979,54,33,30,37,25),
(26125,19,1074,548,1036,56,34,31,38,26),
(26125,20,1131,574,1093,58,35,32,39,27),
(26125,21,1188,600,1150,60,36,33,40,28),
(26125,22,1245,626,1207,62,37,34,41,29),
(26125,23,1302,652,1264,64,38,35,42,30),
(26125,24,1359,678,1321,66,39,36,43,31),
(26125,25,1416,704,1378,68,40,37,44,32),
(26125,26,1473,730,1435,70,41,38,45,33),
(26125,27,1530,756,1492,72,42,39,46,34),
(26125,28,1587,782,1549,74,43,40,47,35),
(26125,29,1644,808,1606,76,44,41,48,36),
(26125,30,1701,834,1663,78,45,42,49,37),
(26125,31,1758,860,1720,80,46,43,50,38),
(26125,32,1815,886,1777,82,47,44,51,39),
(26125,33,1872,912,1834,84,48,45,52,40),
(26125,34,1929,938,1891,86,49,46,53,41),
(26125,35,1986,964,1948,88,50,47,54,42),
(26125,36,2043,990,2005,90,51,48,55,43),
(26125,37,2100,1016,2062,92,52,49,56,44),
(26125,38,2157,1042,2119,94,53,50,57,45),
(26125,39,2214,1068,2176,96,54,51,58,46),
(26125,40,2271,1094,2233,98,55,52,59,47),
(26125,41,2328,1120,2290,100,56,53,60,48),
(26125,42,2385,1146,2347,102,57,54,61,49),
(26125,43,2442,1172,2404,104,58,55,62,50),
(26125,44,2499,1198,2461,106,59,56,63,51),
(26125,45,2556,1224,2518,108,60,57,64,52),
(26125,46,2613,1250,2575,110,61,58,65,53),
(26125,47,2670,1276,2632,112,62,59,66,54),
(26125,48,2727,1302,2689,114,63,60,67,55),
(26125,49,2784,1328,2746,116,64,61,68,56),
(26125,50,2841,1354,2803,118,65,62,69,57),
(26125,51,2898,1380,2860,120,66,63,70,58),
(26125,52,2955,1406,2917,122,67,64,71,59),
(26125,53,3012,1432,2974,124,68,65,72,60),
(26125,54,3069,1458,3031,126,69,66,73,61),
(26125,55,3126,1484,3088,128,70,67,74,62),
(26125,56,3183,1510,3145,130,71,68,75,63),
(26125,57,3240,1536,3202,132,72,69,76,64),
(26125,58,3297,1562,3259,134,73,70,77,65),
(26125,59,3354,1588,3316,136,74,71,78,66),
(26125,60,3411,1614,3373,138,75,72,79,67),
(26125,61,3468,1640,3430,140,76,73,80,68),
(26125,62,3525,1666,3487,142,77,74,81,69),
(26125,63,3582,1692,3544,144,78,75,82,70),
(26125,64,3639,1718,3601,146,79,76,83,71),
(26125,65,3696,1744,3658,148,80,77,84,72),
(26125,66,3753,1770,3715,150,81,78,85,73),
(26125,67,3810,1796,3772,152,82,79,86,74),
(26125,68,3867,1822,3829,154,83,80,87,75),
(26125,69,3924,1848,3886,156,84,81,88,76),
(26125,70,3981,1874,3943,158,85,82,89,77),
(26125,71,4038,1900,4000,160,86,83,90,78),
(26125,72,4095,1926,4057,162,87,84,91,79),
(26125,73,4152,1952,4114,164,88,85,92,80),
(26125,74,4209,1978,4171,166,89,86,93,81),
(26125,75,4266,2004,4228,168,90,87,94,82),
(26125,76,4323,2030,4285,170,91,88,95,83),
(26125,77,4380,2056,4342,172,92,89,96,84),
(26125,78,4437,2082,4399,174,93,90,97,85),
(26125,79,4494,2108,4456,176,94,91,98,86),
(26125,80,4551,2134,4513,178,95,92,99,87);

-- K65_mangos_lifebloom.sql
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `comments`) VALUES ('33778', '0.3857', '0', '0', 'Druid - Lifebloom final heal');

####
# Custom/Addition (author: janu)
####

-- C1_mail_external.sql
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

-- C4_spell_target_pair.sql
DELETE FROM spell_script_target WHERE entry IN (43723, 62488, 62343, 61632, 61254);
INSERT INTO spell_script_target VALUES
	-- Demon Broiled Surprise
(43723, 2, 19973),
	-- Ignis - Activate Construct
(62488, 1, 33121),
	-- Ignis - Heat
(62343, 1, 33121),
	-- Sartharion - Berserk
(61632, 1, 30449),
(61632, 1, 30451),
(61632, 1, 30452),
	-- Sartharion - Will of Sartharion
(61254, 1, 30449),
(61254, 1, 30451),
(61254, 1, 30452);

-- C13_spell_proc.sql
	/*Item - Death Knight T10 Tank 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70652;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70652','0','15',0x00000008,'0','0',0x00004000,'0','0','0','0');

	/*Item - Paladin T10 Protection 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70761;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70761','0','10','0',0x80004000,'0',0x00004000,'0','0','0','0');

	/*Item - Paladin T10 Holy 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70756;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES ('70756','2','10','2097152','0','0','16384','0','0','0','0');

	/*Item - Hunter T10 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70727;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70727','0','9',0x00000001,'0','0','0','0','0','0','0');

	/*Item - Hunter T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70730;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70730','0','9',0x00004000,0x00001000,'0','0','0','0','0','0');

	/* Item - Priest T10 Healer 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70799;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70799','0','6',0x00000800,'0','0','0','0','0','0','0');

	/*Item - Shaman T10 Restoration 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70808;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70808','0','11',0x00000100,'0','0','0','2','0','0','0');

	/*Item - Druid T10 Balance 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70723;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70723','0','7',0x00000005,'0','0','0','2','0','0','0');

	/*Item - Rogue T10 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70805;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70805','0','8','0',0x00020000,'0',0x00004000,'0','0','0','0');

	/*Item - Rogue T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70803;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70803','0','8','4063232','0','0','0','0','0','0','0');

	/*Item - Shaman T10 Elemental 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70817;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70817','0','11','0',0x00001000,'0',0x00010000,'0','0','0','0');

	/*Item - Shaman T10 Enhancement 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70830;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70830','0','11','0',0x00020000,'0',0x00004000,'0','0','0','0');

	/*Item - Warlock T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70841;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70841','0','5',0x00000004,0x00000100,'0','0','0','0','0','0');

	/*Item - Warrior T10 Melee 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70854;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70854','0','5','0',0x00000010,'0','0','0','0','0','0');

	-- (64952) Item - Druid T8 Feral Relic ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (64952);
INSERT INTO `spell_proc_event` VALUES (64952, 0x00, 7, 0x00000000, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 0);

	-- (67653) Coliseum 5 Tank Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67653);
INSERT INTO `spell_proc_event` VALUES (67653, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0.000000, 0.000000, 45);

	-- (67670) Coliseum 5 CasterTrinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67670);
INSERT INTO `spell_proc_event` VALUES (67670, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0x00000000, 0.000000, 0.000000, 45);

	-- (67672) Coliseum 5 Melee Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67672);
INSERT INTO `spell_proc_event` VALUES (67672, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000044, 0x00000000, 0.000000, 0.000000, 45);

	-- (67667) Coliseum 5 Healer Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67667);
INSERT INTO `spell_proc_event` VALUES (67667, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000, 45);

-- C14_anti_magic_zone.sql
	-- Dirty hack. Just replaced flags on summoned creature made it vissible but took invisible model( he-he). Simply but it works
DELETE FROM `creature_template` WHERE (`entry`=28306);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (28306, 0, 0, 0, 0, 0, 28073, 0, 28073, 0, 'Anti-Magic Zone', '', '', 0, 80, 80, 14452, 14452, 0, 0, 9730, 2, 2, 0, 1, 0, 420, 630, 0, 158, 1.1, 2000, 2000, 1, 33947654, 0, 0, 0, 0, 0, 0, 336, 504, 126, 11, 1154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50461, 0, 0, 0, 0, 0, 0, '', 0, 5, 0.01, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

-- C30_spell_proc.sql
	/*Althor's Abacus */
DELETE FROM spell_proc_event WHERE entry = 71611;
INSERT INTO spell_proc_event VALUES
(71611, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45);

-- C35_RFC_mangos.sql
DROP TABLE IF EXISTS `player_factionchange_reputations`;
CREATE TABLE `player_factionchange_reputations` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `player_factionchange_spells`;
CREATE TABLE `player_factionchange_spells` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `player_factionchange_items`;
CREATE TABLE `player_factionchange_items` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `player_factionchange_achievements`;
CREATE TABLE `player_factionchange_achievements` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET NAMES utf8 */;

insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('33','1358','Complete 130 quests in Borean Tundra','Complete 150 quests in Borean Tundra');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('34','1356','Complete 130 quests in Howling Fjord','Complete 105 quests in Howling Fjord');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('35','1359','Complete 115 quests in Dragonblight','Complete 130 quests in Dragonblight');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('37','1357','Complete 85 quests in Grizzly Hills','Complete 75 quests in Grizzly Hills');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('203','1251','In a single Warsong Gulch battle, kill 2 flag carriers before they leave the Silverwing Flag Room','In a single Warsong Gulch battle, kill 2 flag carriers before they leave the Warsong Flag Room');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('220','873','Win Alterac Valley without losing a tower or captain. You must also control all of the Horde\'s towers','Win Alterac Valley without losing a tower or captain. You must also control all of the Alliance\'s towers');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('433','443','Earned the title, Grand Marshal','Earned the title, High Warlord');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('434','445','Earned the title, Field Marshal','Earned the title, Warlord');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('435','444','Earned the title, Commander','Earned the title, Lieutenant General');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('436','447','Earned the title, Lieutenant Commander','Earned the title, Champion');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('437','448','Earned the title, Knight-Champion','Earned the title, Centurion');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('438','469','Earned the title, Knight-Captain','Earned the title, Legionnaire');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('439','451','Earned the title, Knight','Earned the title, Stone Guard');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('440','452','Earned the title, Sergeant Major','Earned the title, First Sergeant');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('441','450','Earned the title, Master Sergeant','Earned the title, Senior Sergeant');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('442','454','Earned the title, Private','Earned the title, Scout');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('470','468','Earned the title, Corporal','Earned the title, Grunt');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('472','449','Earned the title, Knight-Lieutenant','Earned the title, Blood Guard');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('473','446','Earned the title, Marshal','Earned the title, General');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('604','603','Kill 5 Horde players in each of the cities listed below','Kill 5 Alliance players in each of the cities listed below');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('610','615','Kill Thrall','Kill King Varian Wrynn');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('611','616','Kill Cairne Bloodhoof','Kill King Magni Bronzebeard');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('612','617','Kill Lady Sylvanas Windrunner','Kill High Priestess Tyrande Whisperwind');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('613','618','Kill Lor\'themar Theron','Kill Prophet Velen');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('614','619','Slay the leaders of the Horde','Slay the leaders of the Alliance');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('701','700','Obtain an Insignia or Medallion of the Alliance','Obtain an Insignia or Medallion of the Horde');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('707','706','Obtain a Stormpike Battle Charger','Obtain a Frostwolf Howler');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('709','708','Gain exalted reputation with the Stormpike Guard','Gain exalted reputation with the Frostwolf Clan');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('711','710','Gain exalted reputation with The League of Arathor','Gain exalted reputation with The Forsaken Defilers');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('713','712','Gain exalted reputation with the Silverwing Sentinels','Gain exalted reputation with the Warsong Outriders');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('899','901','Earn exalted status with the Kurenai','Earn exalted status with The Mag\'har');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('942','943','Raise your reputation level from unfriendly to exalted with Timbermaw Hold, Sporeggar and the Kurenai','Raise your reputation level from unfriendly to exalted with Timbermaw Hold, Sporeggar and The Mag\'har');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1012','1011','Gain exalted reputation with the Alliance Vanguard','Gain exalted reputation with the Horde Expedition');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1028','1031','Desecrate the Horde\'s bonfires in Eastern Kingdoms','Desecrate the Alliance\'s bonfires in Eastern Kingdoms');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1029','1032','Desecrate the Horde\'s bonfires in Kalimdor','Desecrate the Alliance\'s bonfires in Kalimdor');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1030','1033','Desecrate the Horde\'s bonfires in Outland','Desecrate the Alliance\'s bonfires in Outland');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1034','1036','Complete the Flame Warden of Eastern Kingdoms, Kalimdor and Outland achievements','Complete the Flame Keeper of Eastern Kingdoms, Kalimdor and Outland achievements');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1040','1041','Ruin Hallow\'s End for the Horde by completing Sergeant Hartman\'s quests which involve crashing the wickerman festival and cleaning up the stinkbombs from Southshore','Ruin Hallow\'s End for the Alliance by completing Darkcaller Yanka\'s quests which involve going to Southshore, ruining the kegs with rotten eggs and tossing stinkbombs into the town');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1151','224','In Alterac Valley, kill 50 enemy players in the Hall of the Stormpike','In Alterac Valley, kill 50 enemy players in the Hall of the Frostwolf');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1189','1271','Complete 80 quests in Hellfire Peninsula','Complete 90 quests in Hellfire Peninsula');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1191','1272','Complete 63 quests in Terokkar Forest','Complete 68 quests in Terokkar Forest');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1192','1273','Complete 75 quests in Nagrand','Complete 87 quests in Nagrand');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1255','259','Throw a snowball at King Magni Bronzebeard during the Feast of Winter Veil','Throw a snowball at Cairne Bloodhoof during the Feast of Winter Veil');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1279','1280','Get completely smashed, put on your best perfume, throw a handful of rose petals on Sraaz and then kiss him. You\'ll regret it in the morning','Get completely smashed, put on your best perfume, throw a handful of rose petals on Jeremiah Payson and then kiss him. You\'ll regret it in the morning');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1676','1677','Complete 700 quests in Eastern Kingdoms','Complete 550 quests in Eastern Kingdoms');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1678','1680','Complete 700 quests in Kalimdor','Complete 685 quests in Kalimdor');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1686','1685','Use Mistletoe on the Alliance Brothers during the Feast of Winter Veil','Use Mistletoe on the Horde Brothers during the Feast of Winter Veil');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('1782','1783','Complete each of the cooking daily quests offered by Katherine Lee in Dalaran','Complete each of the cooking daily quests offered by Awilo Lon\'gomba in Dalaran');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('2421','2420','Hide a Brightly Colored Egg in Stormwind City','Hide a Brightly Colored Egg in Silvermoon City');
insert into `player_factionchange_achievements` (`alliance_id`, `horde_id`, `CommentA`, `CommentH`) values('3556','3557','Acquire the Spirit of Sharing from a complete Bountiful Table feast at every Alliance capital','Acquire the Spirit of Sharing from a complete Bountiful Table feast at every Horde capital');

insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','15196','Private\'s Tabard','0','15197','Scout\'s Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','19032','Stormpike Battle Tabard','0','19031','Frostwolf Battle Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','19506','Silverwing Battle Tabard','0','19505','Warsong Battle Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','20132','Arathor Battle Tabard','0','20131','Battle Tabard of the Defilers');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23999','Honor Hold Tabard','0','24004','Thrallmar Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28234','Medallion of the Alliance(115)','0','28240','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28235','Medallion of the Alliance(115)','0','28241','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28236','Medallion of the Alliance(115)','0','28242','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28237','Medallion of the Alliance(115)','0','28243','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28238','Medallion of the Alliance(115)','0','28239','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28379','Sergeant\'s Heavy Cape(123)','0','28378','Sergeant\'s Heavy Cape(123)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28380','Sergeant\'s Heavy Cloak(123)','0','28377','Sergeant\'s Heavy Cloak(123)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28952','Grand Marshal\'s Quickblade(115)','0','28926','High Warlord\'s Quickblade(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28954','Grand Marshal\'s Shanker(115)','0','28929','High Warlord\'s Shanker(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','28955','Grand Marshal\'s Shiv(115)','0','28930','High Warlord\'s Shiv(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29136','Far Seer\'s Helm(115)','0','29135','Earthcaller\'s Headdress(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29140','Cloak of the Ancient Spirits(115)','0','29139','Ceremonial Cover(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29142','Kurenai Kilt(115)','0','29141','Tempest Leggings(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29144','Worg Hide Quiver(109)','0','29143','Clefthoof Hide Quiver(109)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29146','Band of Elemental Spirits(115)','0','29145','Band of Ancestral Spirits(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29148','Blackened Leather Spaulders(115)','0','29147','Talbuk Hide Spaulders(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29153','Blade of the Archmage(100)','0','29155','Stormcaller(100)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29166','Hellforged Halberd(115)','0','29167','Blackened Spear(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','29169','Ring of Convalescence(115)','0','29168','Ancestral Band(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','30348','Medallion of the Alliance(115)','0','30343','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','30349','Medallion of the Alliance(115)','0','30346','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','30350','Medallion of the Alliance(115)','0','30344','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','30351','Medallion of the Alliance(115)','0','30345','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','30597','Halaani Claymore(114)','0','30570','Arkadian Claymore(114)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','30599','Avenging Blades(108)','0','30568','The Sharp Cookie(108)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','31774','Kurenai Tabard','0','31773','Mag\'har Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','37864','Medallion of the Alliance(128)','0','37865','Medallion of the Horde(128)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','38453','Shield of the Lion-hearted(166)','0','38452','Bulwark of the Warchief(166)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','38455','Hammer of the Alliance Vanguard(166)','0','38454','Warsong Punisher(166)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','38459','Orb of the Eastern Kingdoms(166)','0','38458','Darkspear Orb(166)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','38463','Lordaeron\'s Resolve(166)','0','38462','Warsong Stormshield(166)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','38465','Vanguard Soldier\'s Dagger(166)','0','38461','Warsong Shanker(166)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','38589','Medallion of the Alliance(115)','0','38588','Medallion of the Horde(115)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','42123','Medallion of the Alliance(200)','0','42122','Medallion of the Horde(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','42124','Medallion of the Alliance(226)','0','42126','Medallion of the Horde(226)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','44413','Mekgineer\'s Chopper','0','41508','Mechano-hog');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45011','Stormwind Banner','0','45014','Orgrimmar Banner');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45018','Ironforge Banner','0','45015','Sen\'jin Banner');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45019','Gnomeregan Banner','0','45013','Thunder Bluff Banner');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45020','Exodar Banner','0','45017','Silvermoon City Banner');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45021','Darnassus Banner','0','45016','Undercity Banner');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45074','Claymore of the Prophet(200)','0','45205','Greatsword of the Sin\'dorei(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45075','Ironforge Smasher(200)','0','45203','Grimhorn Crusher(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45076','Teldrassil Protector(200)','0','45204','Axe of the Sen\'jin Protector(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45077','Dagger of the Rising Moon(200)','0','45222','Spinal Destroyer(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45078','Dagger of Lunar Purity(200)','0','45214','Scalpel of the Royal Apothecary(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45128','Silvery Sylvan Stave(200)','0','45212','Staff of Feral Furies(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45129','Gnomeregan Bonechopper(200)','0','45208','Blade of the Keening Banshee(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45130','Blunderbuss of Khaz Modan(200)','0','45210','Sen\'jin Beakblade Longrifle(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45131','Jouster\'s Fury(200)','0','45219','Jouster\'s Fury(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45152','Pendant of Azure Dreams(200)','0','45223','Razor\'s Edge Pendant(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45153','Susurrating Shell Necklace(200)','0','45206','Choker of Feral Fury(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45154','Necklace of Valiant Blood(200)','0','45213','Pendant of Emerald Crusader(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45155','Choker of Spiral Focus(200)','0','45207','Necklace of Stolen Skulls(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45156','Sash of Shattering Hearts(200)','0','45209','Sash of Trumpted Pride(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45159','Treads of Nimble Evasion(200)','0','45220','Treads of the Earnest Squire(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45160','Girdle of Valorous Defeat(200)','0','45217','Clinch of Savage Fury(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45163','Stanchions of Unseatable Furor(200)','0','45218','Blood-Caked Stompers(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45181','Wrap of the Everliving Tree(200)','0','45211','Waistguard of Equine Fury(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45182','Gauntlets of Shattered Pride(200)','0','45216','Gauntlets of Mending Touch(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45183','Treads of the Glorious Spirit(200)','0','45221','Treads of Whispering Dreams(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45184','Cinch of Bonded Servitude(200)','0','45215','Links of Unquenched Savagery(200)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45574','Stormwind Tabard','0','45581','Orgrimmar Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45577','Ironforge Tabard','0','45582','Sen\'jin Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45578','Gnomeregan Tabard','0','45584','Thunder Bluff Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45579','Darnassus Tabard','0','45583','Undercity Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','45580','Exodar Tabard','0','45585','Silvermoon City Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46817','Silver Covenant Tabard','0','46818','Sunreaver Tabard');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46958','Steel Bladebreaker(245)','0','47255','Stygian Bladebreaker(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46959','Band of the Violent Temperment(245)','0','47252','Ring of the Violent Temperament(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46960','Breastplate of Cruel Intent(245)','0','47251','Cuirass of Cruel Intent(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46961','Boneshatter Armplates(245)','0','47253','Boneshatter Vambraces(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46962','Chestplate of the Towering Monstrosity(245)','0','47254','Hauberk of the Towering Monstrosity(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46963','Crystal Plated Vanguard(245)','0','47260','Forlorn Barrier(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46964','Crystal Plated Vanguard(258)','0','47421','Forlorn Barrier(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46965','Breastplate of Cruel Intent(258)','0','47412','Cuirass of Cruel Intent(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46966','Band of the Violent Temperment(258)','0','47413','Ring of the Violent Temperament(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46967','Boneshatter Armplates(258)','0','47414','Boneshatter Vambraces(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46968','Chestplate of the Towering Monstrosity(258)','0','47415','Hauberk of the Towering Monstrosity(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46969','Steel Bladebreaker(258)','0','47416','Stygian Bladebreaker(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46970','Drape of the Untamed Predator(245)','0','47257','Cloak of the Untamed Predator(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46971','Drape of the Untamed Predator(258)','0','47418','Cloak of the Untamed Predator(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46972','Cord of the Tenebrous Mist(245)','0','47258','Belt of the Tenebrous Mist(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46973','Cord of the Tenebrous Mist(258)','0','47419','Belt of the Tenebrous Mist(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46974','Leggings of the Broken Beast(245)','0','47259','Legwraps of the Broken Beast(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46975','Leggings of the Broken Beast(258)','0','47420','Legwraps of the Broken Beast(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46976','Shawl of the Refreshing Winds(245)','0','47256','Drape of the Refreshing Winds(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46977','Shawl of the Refreshing Winds(258)','0','47417','Drape of the Refreshing Winds(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46979','Blade of Tarasque(245)','0','47261','Barb of Tarasque(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46980','Blade of Tarasque(258)','0','47422','Barb of Tarasque(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46985','Boots of the Courageous(245)','0','47263','Sabatons of the Courageous(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46986','Boots of the Courageous(258)','0','47424','Sabatons of the Courageous(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46988','Boots of the Unrelenting Storm(245)','0','47262','Boots of the Harsh Winter(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46989','Boots of the Unrelenting Storm(258)','0','47423','Boots of the Harsh Winter(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46990','Belt of the Ice Burrower(245)','0','47265','Binding of the Ice Burrower(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46991','Belt of the Ice Burrower(258)','0','47426','Binding of the Ice Burrower(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46992','Flowing Vestments of Ascent(245)','0','47264','Flowing Robes of Ascent(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46993','Flowing Vestments of Ascent(258)','0','47425','Flowing Robes of Ascent(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46994','Talonstrike(245)','0','47267','Death\'s Head Crossbow(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46995','Talonstrike(258)','0','47428','Death\'s Head Crossbow(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46996','Lionhead Slasher(245)','0','47266','Blood Fury(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46997','Dawnbreaker Greaves(245)','0','47269','Dawnbreaker Sabatons(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','46999','Bloodbath Belt(245)','0','47268','Bloodbath Girdle(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47000','Cuirass of Calamitous Fate(245)','0','47270','Vest of Calamitous Fate(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47001','Lionhead Slasher(258)','0','47427','Blood Fury(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47002','Bloodbath Belt(258)','0','47429','Bloodbath Girdle(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47004','Cuirass of Calamitous Fate(258)','0','47431','Vest of Calamitous Fate(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47041','Solace of the Defeated(245)','0','47271','Solace of the Fallen(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47042','Pride of the Eredar(245)','0','47275','Pride of the Demon Lord(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47043','Charge of the Demon Lord(245)','0','47272','Charge of the Eredar(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47051','Leggings of the Soothing Touch(245)','0','47274','Pants of the Soothing Touch(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47052','Legguards of Feverish Dedication(245)','0','47273','Legplates of Feverish Dedication(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47053','Symbol of Transgression(245)','0','47276','Talisman of Heedless Sins(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47054','Band of Deplorable Violence(245)','0','47327','Lurid Manifestation(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47055','Bracers of the Autumn Willow(245)','0','47277','Bindings of the Autumn Willow(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47056','Bracers of Cloudy Omen(245)','0','47280','Legplates of Feverish Dedication(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47057','Legplates of Failing Light(245)','0','47279','Leggings of Failing Light(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47059','Solace of the Defeated(258)','0','47432','Solace of the Fallen(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47060','Charge of the Demon Lord(258)','0','47433','Charge of the Eredar(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47061','Legguards of Feverish Dedication(258)','0','47434','Legplates of Feverish Dedication(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47062','Leggings of the Soothing Touch(258)','0','47435','Pants of the Soothing Touch(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47063','Pride of the Eredar(258)','0','47436','Pride of the Demon Lord(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47064','Symbol of Transgression(258)','0','47437','Talisman of Heedless Sins(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47066','Bracers of the Autumn Willow(258)','0','47438','Bindings of the Autumn Willow(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47067','Legplates of Failing Light(258)','0','47440','Leggings of Failing Light(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47068','Bracers of Cloudy Omen(258)','0','47441','Wristwraps of Cloudy Omen(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47069','Justicebringer(245)','0','47285','Dual-blade Butcher(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47070','Ring of Callous Aggression(245)','0','47282','Band of Callous Aggression(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47071','Treads of the Icewalker(245)','0','47284','Icewalker Treads(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47072','Girdle of Bloodied Scars(245)','0','47283','Belt of Bloodied Scars(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47073','Bracers of the Untold Massacre(245)','0','47281','Bracers of the Silent Massacre(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47074','Bracers of the Untold Massacre(258)','0','47442','Bracers of the Silent Massacre(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47075','Ring of Callous Aggression(258)','0','47443','Band of Callous Aggression(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47076','Girdle of Bloodied Scars(258)','0','47444','Belt of Bloodied Scars(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47077','Treads of the Icewalker(258)','0','47445','Icewalker Treads(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47078','Justicebringer(258)','0','47446','Dual-blade Butcher(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47079','Bastion of Purity(245)','0','47287','Bastion of Resolve(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47080','Satrina\'s Impeding Scarab(245)','0','47290','Juggernaut\'s Vitality(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47081','Cord of Biting Cold(245)','0','47286','Belt of Biting Cold(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47082','Chestplate of the Frostborn Hero(245)','0','47288','Chestplate of the Frostwolf Hero(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47083','Legguards of Concealed Hatred(245)','0','47289','Leggings of Concealed Hatred(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47084','Cord of Biting Cold(258)','0','47447','Belt of Biting Cold(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47085','Bastion of Purity(258)','0','47448','Bastion of Resolve(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47086','Chestplate of the Frostborn Hero(258)','0','47449','Chestplate of the Frostwolf Hero(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47087','Legguards of Concealed Hatred(258)','0','47450','Leggings of Concealed Hatred(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47088','Satrina\'s Impeding Scarab(258)','0','47451','Juggernaut\'s Vitality(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47089','Cloak of Displacement(245)','0','47291','Shroud of Displacement(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47090','Boots of Tremoring Earth(245)','0','47295','Sabatons of Tremoring Earth(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47092','Boots of the Mourning Widow(245)','0','47293','Sandals of the Mourning Widow(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47093','Vambraces of the Broken Bond(245)','0','47294','Bracers of the Broken Bond(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47094','Vestments of the Shattered Fellowship(245)','0','47292','Robes of the Shattered Fellowship(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47095','Cloak of Displacement(258)','0','47452','Shroud of Displacement(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47096','Vestments of the Shattered Fellowship(258)','0','47453','Robes of the Shattered Fellowship(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47097','Boots of the Mourning Widow(258)','0','47454','Sandals of the Mourning Widow(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47098','Vambraces of the Broken Bond(258)','0','47455','Bracers of the Broken Bond(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47099','Boots of Tremoring Earth(258)','0','47456','Sabatons of Tremoring Earth(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47104','Twin Spike(245)','0','47300','Gouge of the Frigid Heart(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47105','The Executioner\'s Malice(245)','0','47297','The Executioner\'s Vice(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47106','Sabatons of Ruthless Judgment(245)','0','47296','Greaves of Ruthless Judgment(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47107','Belt of the Merciless Killer(245)','0','47299','Belt of the Pitiless Killer(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47108','Bracers of the Shieldmaiden(245)','0','47298','Armguards of the Shieldmaiden(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47109','Sabatons of Ruthless Judgment(258)','0','47457','Greaves of Ruthless Judgment(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47110','The Executioner\'s Malice(258)','0','47458','The Executioner\'s Vice(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47111','Bracers of the Shieldmaiden(258)','0','47459','Armguards of the Shieldmaiden(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47112','Belt of the Merciless Killer(258)','0','47460','Belt of the Pitiless Killer(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47113','Twin Spike(258)','0','47461','Gouge of the Frigid Heart(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47114','Lupine Longstaff(245)','0','47302','Twin\'s Pact(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47115','Death\'s Verdict(245)','0','47303','Death\'s Choice(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47116','The Arbiter\'s Muse(245)','0','47305','Legionnaire\'s Gorget(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47121','Legguards of Ascension(245)','0','47304','Legplates of Ascension(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47126','Skyweaver Robes(245)','0','47301','Skyweaver Vestments(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47129','Skyweaver Robes(258)','0','47462','Skyweaver Vestments(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47130','Lupine Longstaff(258)','0','47463','Twin\'s Pact(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47131','Death\'s Verdict(258)','0','47464','Death\'s Choice(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47132','Legguards of Ascension(258)','0','47465','Legplates of Ascension(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47133','The Arbiter\'s Muse(258)','0','47466','Legionnaire\'s Gorget(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47138','Chalice of Searing Light(245)','0','47309','Mystifying Charm(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47139','Wail of the Valkyr(245)','0','47307','Cry of the Valkyr(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47140','Cord of Pale Thorns(245)','0','47308','Belt of Pale Thorns(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47141','Bindings of Dark Essence(245)','0','47306','Dark Essence Bindings(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47142','Breastplate of the Frozen Lake(245)','0','47310','Chestplate of the Frozen Lake(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47143','Bindings of Dark Essence(258)','0','47467','Dark Essence Bindings(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47144','Wail of the Val\'kyr(258)','0','47468','Cry of the Val\'kyr(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47145','Cord of Pale Thorns(258)','0','47469','Belt of Pale Thorns(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47146','Chalice of Searing Light(258)','0','47470','Mystifying Charm(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47147','Breastplate of the Frozen Lake(258)','0','47471','Chestplate of the Frozen Lake(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47148','Stormpike Cleaver(245)','0','47314','Hellscream Slicer(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47149','Signet of the Traitor King(245)','0','47315','Band of the Traitor King(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47150','Greaves of the 7th Legion(245)','0','47312','Greaves of the Saronite Citadel(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47151','Bracers of Dark Determination(245)','0','47313','Armbands of Dark Determination(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47152','Belt of Deathly Dominion(245)','0','47311','Waistguard of Deathly Dominion(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47153','Belt of Deathly Dominion(258)','0','47472','Waistguard of Deathly Dominion(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47154','Greaves of the 7th Legion(258)','0','47473','Greaves of the Saronite Citadel(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47155','Bracers of Dark Determination(258)','0','47474','Armbands of Dark Determination(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47156','Stormpike Cleaver(258)','0','47475','Hellscream Slicer(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47157','Signet of the Traitor King(258)','0','47476','Band of the Traitor King(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47182','Reign of the Unliving(245)','0','47316','Reign of the Dead(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47183','Strength of the Nerub(245)','0','47320','Might of the Nerub(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47184','Legguards of the Lurking Threat(245)','0','47319','Leggings of the Lurking Threat(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47186','Legwraps of the Awakening(245)','0','47318','Leggings of the Awakening(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47187','Leggings of the Deepening Void(245)','0','47317','Breeches of the Deepening Void(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47188','Reign of the Unliving(258)','0','47477','Reign of the Dead(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47189','Leggings of the Deepening Void(258)','0','47478','Breeches of the Deepening Void(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47190','Legwraps of the Awakening(258)','0','47479','Leggings of the Awakening(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47191','Legguards of the Lurking Threat(258)','0','47480','Leggings of the Lurking Threat(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47192','Strength of the Nerub(258)','0','47481','Might of the Nerub(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47193','Misery\'s End(245)','0','47322','Suffering\'s End(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47194','Footpads of the Icy Floe(245)','0','47321','Boots of the Icy Floe(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47195','Belt of the Forgotten Martyr(245)','0','47323','Girdle of the Forgotten Martyr(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47203','Armbands of the Ashen Saint(245)','0','47324','Bindings of the Ashen Saint(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47204','Chestguard of Flowing Elements(245)','0','47325','Cuirass of Flowing Elements(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47205','Footpads of the Icy Floe(258)','0','47482','Boots of the Icy Floe(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47206','Misery\'s End(258)','0','47483','Suffering\'s End(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47207','Belt of the Forgotten Martyr(258)','0','47484','Girdle of the Forgotten Martyr(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47208','Armbands of the Ashen Saint(258)','0','47485','Bindings of the Ashen Saint(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47209','Chestguard of Flowing Elements(258)','0','47486','Cuirass of Flowing Elements(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47223','Ring of the Darkmender(245)','0','47278','Circle of the Darkmender(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47224','Ring of the Darkmender(258)','0','47439','Circle of the Darkmender(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47225','Maiden\'s Favor(245)','0','47328','Maiden\'s Adoration(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47233','Archon Glaive(245)','0','47329','Hellion Glaive(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47234','Gloves of Bitter Reprisal(245)','0','47330','Gauntlets of Bitter Reprisal(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47235','Gloves of the Lifeless Touch(245)','0','47326','Handwraps of the Lifeless Touch(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47236','Gloves of the Lifeless Touch(258)','0','47487','Handwraps of the Lifeless Touch(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47237','Band of Deplorable Violence(258)','0','47489','Lurid Manifestation(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47238','Maiden\'s Favor(258)','0','47490','Maiden\'s Adoration(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47239','Archon Glaive(258)','0','47491','Hellion Glaive(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47240','Gloves of Bitter Reprisal(258)','0','47492','Gauntlets of Bitter Reprisal(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47506','Silverwing Defender(258)','0','47513','Orgrim\'s Deflector(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47515','Decimation(258)','0','47516','Fleshrender(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47517','Blade of the Unbroken Covenant(258)','0','47518','Mortalis(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47519','Catastrophe(258)','0','47520','Grievance(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47521','BRK-1000(258)','0','47523','Fezzik\'s Autocannon(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47524','Clemency(258)','0','47525','Sufferance(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47526','Remorseless(258)','0','47528','Cudgel of the Damned(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47545','Vereesa\'s Dexterity(272)','0','47546','Sylvanas\' Cunning(272)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47547','Varian\'s Furor(272)','0','47548','Garrosh\'s Rage(272)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47549','Magni\'s Resolution(272)','0','47550','Cairne\'s Endurance(272)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47552','Jaina\'s Radiance(272)','0','47551','Aethas\' Intensity(272)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47553','Bolvar\'s Devotion(272)','0','47554','Lady Liadrin\'s Conviction(272)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47570','Saronite Swordbreakers(245)','0','47571','Saronite Swordbreakers(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47572','Titanium Spikeguards(245)','0','47573','Titanium Spikeguards(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47574','Sunforged Bracers(245)','0','47575','Sunforged Bracers(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47576','Crusader\'s Dragonscale Bracers(245)','0','47577','Crusader\'s Dragonscale Bracers(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47578','Carnivorous Band(232)','0','47854','Gormok\'s Band(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47579','Black Chitin Bracers(245)','0','47580','Black Chitin Bracers(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47581','Bracers of Swift Death(245)','0','47582','Bracers of Swift Death(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47583','Moonshadow Armguards(245)','0','47584','Moonshadow Armguards(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47585','Bejeweled Wizard\'s Bracers(245)','0','47586','Bejeweled Wizard\'s Bracers(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47587','Royal Moonshroud Bracers(245)','0','47588','Royal Moonshroud Bracers(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47589','Titanium Razorplate(245)','0','47590','Titanium Razorplate(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47591','Breastplate of the White Knight(245)','0','47592','Breastplate of the White Knight(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47593','Sunforged Breastplate(245)','0','47594','Sunforged Breastplate(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47595','Crusader\'s Dragonscale Breastplate(245)','0','47596','Crusader\'s Dragonscale Breastplate(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47597','Ensorcelled Nerubian Breastplate(245)','0','47598','Ensorcelled Nerubian Breastplate(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47599','Knightbane Carapace(245)','0','47600','Knightbane Carapace(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47602','Lunar Eclipse Chestguard(245)','0','47601','Lunar Eclipse Chestguard(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47603','Merlin\'s Robe(245)','0','47604','Merlin\'s Robe(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47605','Royal Moonshroud Robe(245)','0','47606','Royal Moonshroud Robe(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47607','Collar of Ceaseless Torment(232)','0','47849','Collar of Unending Torment(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47608','Acidmaw Boots(232)','0','47853','Acidmaw Treads(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47609','Gauntlets of Rising Anger(232)','0','47851','Gauntlets of Mounting Anger(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47610','Armbands of the Northern Stalker(232)','0','47850','Bracers of the Northern Stalker(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47611','Dreadscale Armguards(232)','0','47852','Dreadscale Bracers(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47612','Rod of Imprisoned Souls(232)','0','47856','Scepter of Imprisoned Souls(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47613','Shoulderpads of the Glacial Wilds(232)','0','47857','Pauldrons of the Glacial Wilds(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47614','Girdle of the Impaler(232)','0','47859','Belt of the Impaler(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47615','Belt of the Frozen Reach(232)','0','47858','Girdle of the Frozen Reach(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47616','Shoulderguards of the Spirit Walker(232)','0','47860','Pauldrons of the Spirit Walker(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47617','Icehowl Cinch(232)','0','47855','Icehowl Binding(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47618','Firestorm Ring(232)','0','47862','Firestorm Band(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47619','Amulet of Binding Elements(232)','0','47864','Pendant of Binding Elements(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47620','Leggings of the Demonic Messenger(232)','0','47865','Legwraps of the Demonic Messenger(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47621','Girdle of the Farseer(232)','0','47866','Darkspear Ritual Binding(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47622','Plans: Breastplate of the White Knight(85)','0','47640','Plans: Breastplate of the White Knight(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47623','Plans: Saronite Swordbreakers(85)','0','47641','Plans: Saronite Swordbreakers(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47624','Plans: Titanium Razorplate(85)','0','47644','Plans: Titanium Razorplate(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47625','Plans: Titanium Spikeguards(85)','0','47645','Plans: Titanium Spikeguards(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47626','Plans: Sunforged Breastplate(85)','0','47643','Plans: Sunforged Breastplate(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47627','Plans: Sunforged Bracers(85)','0','47642','Plans: Sunforged Bracers(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47628','Pattern: Ensorcelled Nerubian Breastplate(85)','0','47650','Pattern: Ensorcelled Nerubian Breastplate(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47629','Pattern: Black Chitin Bracers(85)','0','47646','Pattern: Black Chitin Bracers(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47630','Pattern: Crusader\'s Dragonscale Breastplate(85)','0','47649','Pattern: Crusader\'s Dragonscale Breastplate(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47631','Pattern: Crusader\'s Dragonscale Bracers(85)','0','47648','Pattern: Crusader\'s Dragonscale Bracers(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47632','Pattern: Lunar Eclipse Chestguard(85)','0','47652','Pattern: Lunar Eclipse Chestguard(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47633','Pattern: Moonshadow Armguards(85)','0','47653','Pattern: Moonshadow Armguards(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47634','Pattern: Knightbane Carapace(85)','0','47651','Pattern: Knightbane Carapace(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47635','Pattern: Bracers of Swift Death(85)','0','47647','Pattern: Bracers of Swift Death(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47654','Pattern: Bejeweled Wizard\'s Bracers(85)','0','47639','Pattern: Bejeweled Wizard\'s Bracers(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47655','Pattern: Merlin\'s Robe(85)','0','47638','Pattern: Merlin\'s Robe(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47656','Pattern: Royal Moonshroud Bracers(85)','0','47637','Pattern: Royal Moonshroud Bracers(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47657','Pattern: Royal Moonshroud Robe(85)','0','47636','Pattern: Royal Moonshroud Robe(85)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47663','Felspark Bindings(232)','0','47861','Felspark Bracers(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47669','Belt of the Winter Solstice(232)','0','47863','Belt of the Bloodhoof Emissary(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47674','Helm of Thunderous Rampage(245)','0','47675','Faceplate of Thunderous Rampage(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47676','Dirk of the Night Watch(232)','0','47871','Orcish Deathblade(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47677','Faceplate of the Honorbound(245)','0','47678','Headplate of the Honorbound(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47679','Endurance of the Infernal(232)','0','47872','Fortitude of the Infernal(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47680','Armguards of the Nether Lord(232)','0','47869','Armplates of the Nether Lord(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47681','Heaume of the Restless Watch(245)','0','47682','Helm of the Restless Watch(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47683','Sentinel Scouting Greaves(232)','0','47867','Warsong Poacher\'s Greaves(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47685','Helm of the Brooding Dragon(245)','0','47684','Coif of the Brooding Dragon(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47686','Helm of Inner Warmth(245)','0','47687','Headguard of Inner Warmth(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47689','Hood of Lethal Intent(245)','0','47688','Mask of Lethal Intent(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47690','Helm of Abundant Growth(245)','0','47691','Mask of Abundant Growth(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47693','Hood of Fiery Aftermath(245)','0','47692','Hood of Smoldering Aftermath(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47694','Helm of Clouded Sight(245)','0','47695','Hood of Clouded Sight(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47697','Pauldrons of Trembling Rage(245)','0','47696','Shoulderplates of Trembling Rage(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47698','Shoulderplates of Enduring Order(245)','0','47699','Shoulderguards of Enduring Order(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47700','Loop of the Twin Valkyr(232)','0','47888','Band of the Twin Val\'kyr(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47702','Pauldrons of the Cavalier(245)','0','47701','Shoulderplates of the Cavalier(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47703','Planestalker Signet(232)','0','47868','Planestalker Band(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47704','Epaulets of the Devourer(245)','0','47705','Pauldrons of the Devourer(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47707','Mantle of the Groundbreaker(245)','0','47706','Shoulders of the Groundbreaker(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47708','Duskstalker Shoulderpads(245)','0','47709','Duskstalker Pauldrons(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47712','Shoulders of the Fateful Accord(245)','0','47710','Epaulets of the Fateful Accord(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47713','Mantle of Catastrophic Emanation(245)','0','47714','Pauldrons of Catastrophic Emanation(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47715','Pauldrons of Revered Mortality(245)','0','47716','Mantle of Revered Mortality(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47717','Faceplate of the Silver Champion(232)','0','47876','Sunreaver Champion\'s Faceplate(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47718','Helm of the Silver Ranger(232)','0','47875','Sunreaver Ranger\'s Helm(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47719','Gloves of the Silver Assassin(232)','0','47878','Sunreaver Assassin\'s Gloves(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47720','Pauldrons of the Silver Defender(232)','0','47877','Sunreaver Defender\'s Pauldrons(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47721','Sandals of the Silver Magus(232)','0','47873','Sunreaver Magus\' Sandals(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47724','Blade of the Silver Disciple(232)','0','47874','Sunreaver Disciple\'s Blade(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47725','Victor\'s Call(232)','0','47881','Vengeance of the Forsaken(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47726','Talisman of Volatile Power(232)','0','47879','Fetish of Volatile Power(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47727','Fervor of the Frostborn(232)','0','47882','Eitrigg\'s Oath(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47728','Binding Light(232)','0','47880','Binding Stone(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47736','Icefall Blade(232)','0','47886','Nemesis Blade(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47737','Reckoning(232)','0','47884','Edge of Agony(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47738','Sabatons of the Lingering Vortex(232)','0','47885','Greaves of the Lingering Vortex(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47739','Armor of Shifting Shadows(232)','0','47887','Vest of Shifting Shadows(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47740','The Diplomat(232)','0','47883','Widebarrel Flintlock(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47741','Baelgun\'s Heavy Crossbow(232)','0','47907','Darkmaw Crossbow(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47742','Chalice of Benedictus(232)','0','47913','Lightbane Focus(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47743','Enlightenment(232)','0','47892','Illumination(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47744','Gloves of the Azure Prophet(232)','0','47893','Sen\'jin Ritualist Gloves(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47745','Gloves of Looming Shadow(232)','0','47889','Looming Shadow Wraps(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47746','Helm of the Snowy Grotto(232)','0','47891','Helm of the High Mesa(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47747','Darkbane Pendant(232)','0','47890','Darkbane Amulet(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47748','Khadgar\'s Hood of Conquest','0','47774','Sunstrider\'s Hood of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47749','Khadgar\'s Robe of Conquest','0','47776','Sunstrider\'s Robe of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47750','Khadgar\'s Leggings of Conquest','0','47775','Sunstrider\'s Leggings of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47751','Khadgar\'s Shoulderpads of Conquest','0','47777','Sunstrider\'s Shoulderpads of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47752','Khadgar\'s Gauntlets of Conquest','0','47773','Sunstrider\'s Gauntlets of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47753','Khadgar\'s Gauntlets of Triumph','0','47772','Sunstrider\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47754','Khadgar\'s Hood of Triumph','0','47771','Sunstrider\'s Hood of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47755','Khadgar\'s Leggings of Triumph','0','47770','Sunstrider\'s Leggings of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47756','Khadgar\'s Robe of Triumph','0','47769','Sunstrider\'s Robe of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47757','Khadgar\'s Shoulderpads of Triumph','0','47768','Sunstrider\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47758','Khadgar\'s Shoulderpads of Triumph','0','47767','Sunstrider\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47759','Khadgar\'s Robe of Triumph','0','47766','Sunstrider\'s Robe of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47760','Khadgar\'s Leggings of Triumph','0','47765','Sunstrider\'s Leggings of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47761','Khadgar\'s Hood of Triumph','0','47764','Sunstrider\'s Hood of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47762','Khadgar\'s Gauntlets of Triumph','0','47763','Sunstrider\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47778','Kel\'Thuzad\'s Hood of Triumph','0','47804','Gul\'dan\'s Hood of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47779','Kel\'Thuzad\'s Robe of Triumph','0','47806','Gul\'dan\'s Robe of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47780','Kel\'Thuzad\'s Leggings of Triumph','0','47805','Gul\'dan\'s Leggings of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47781','Kel\'Thuzad\'s Shoulderpads of Triumph','0','47807','Gul\'dan\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47782','Kel\'Thuzad\'s Gloves of Triumph','0','47803','Gul\'dan\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47783','Kel\'Thuzad\'s Gloves of Conquest','0','47802','Gul\'dan\'s Gloves of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47784','Kel\'Thuzad\'s Hood of Conquest','0','47801','Gul\'dan\'s Hood of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47785','Kel\'Thuzad\'s Leggings of Conquest','0','47800','Gul\'dan\'s Leggings of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47786','Kel\'Thuzad\'s Robe of Conquest','0','47799','Gul\'dan\'s Robe of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47787','Kel\'Thuzad\'s Shoulderpads of Conquest','0','47798','Gul\'dan\'s Shoulderpads of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47788','Kel\'Thuzad\'s Gloves of Triumph','0','47797','Gul\'dan\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47789','Kel\'Thuzad\'s Hood of Triumph','0','47796','Gul\'dan\'s Hood of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47790','Kel\'Thuzad\'s Leggings of Triumph','0','47795','Gul\'dan\'s Leggings of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47791','Kel\'Thuzad\'s Robe of Triumph','0','47794','Gul\'dan\'s Robe of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47792','Kel\'Thuzad\'s Shoulderpads of Triumph','0','47793','Gul\'dan\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47808','The Lion\'s Maw(232)','0','47898','Frostblade Hatchet(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47809','Argent Resolve(232)','0','47894','Mace of the Earthborn Chieftain(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47810','Crusader\'s Glory(232)','0','47899','Ardent Guard(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47811','Chestguard of the Warden(232)','0','47896','Stoneskin Chestplate(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47812','Vigilant Ward(232)','0','47895','Pride of the Kor\'kron(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47813','Helmet of the Crypt Lord(232)','0','47897','Helm of the Crypt Lord(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47814','Westfall Saber(232)','0','47903','Forsaken Bonecarver(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47815','Cold Convergence(232)','0','47900','Perdition(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47816','The Grinder(232)','0','47905','Blackhorn Bludgeon(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47829','Pauldrons of the Timeless Hunter(232)','0','47901','Pauldrons of the Shadow Hunter(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47830','Legplates of the Silver Hand(232)','0','47902','Legplates of Redeemed Blood(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47832','Spaulders of the Snow Bandit(232)','0','47904','Shoulderpads of the Snow Bandit(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47834','Fordragon Blades(232)','0','47911','Anguish(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47835','Bulwark of the Royal Guard(232)','0','47910','Aegis of the Coliseum(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47836','Legplates of the Immortal Spider(232)','0','47908','Sunwalker Legguards(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47837','Cinch of the Undying(232)','0','47909','Belt of the Eternal(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47838','Vestments of the Sleepless(232)','0','47906','Robes of the Sleepless(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47914','Velen\'s Cowl of Conquest','0','48068','Zabra\'s Cowl of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47915','Collar of Ceaseless Torment(245)','0','47988','Collar of Unending Torment(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47916','Armbands of the Northern Stalker(245)','0','47989','Bracers of the Northern Stalker(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47917','Gauntlets of Rising Anger(245)','0','47990','Gauntlets of Mounting Anger(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47918','Dreadscale Armguards(245)','0','47991','Dreadscale Bracers(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47919','Acidmaw Boots(245)','0','47992','Acidmaw Treads(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47920','Gormok\'s Band(245)','0','47993','Carnivorous Band(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47921','Icehowl Cinch(245)','0','47994','Icehowl Binding(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47922','Rod of Imprisoned Souls(245)','0','47995','Scepter of Imprisoned Souls(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47923','Shoulderpads of the Glacial Wilds(245)','0','47996','Pauldrons of the Glacial Wilds(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47924','Belt of the Frozen Reach(245)','0','47997','Girdle of the Frozen Reach(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47925','Girdle of the Impaler(245)','0','47998','Belt of the Impaler(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47926','Shoulderguards of the Spirit Walker(245)','0','47999','Pauldrons of the Spirit Walker(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47927','Felspark Bindings(245)','0','48000','Felspark Bracers(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47928','Firestorm Ring(245)','0','48001','Firestorm Band(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47929','Belt of the Winter Solstice(245)','0','48002','Belt of the Bloodhoof Emissary(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47930','Amulet of Binding Elements(245)','0','48003','Pendant of Binding Elements(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47931','Leggings of the Demonic Messenger(245)','0','48004','Legwraps of the Demonic Messenger(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47932','Girdle of the Farseer(245)','0','48005','Darkspear Ritual Binding(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47933','Sentinel Scouting Greaves(245)','0','48006','Warsong Poacher\'s Greaves(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47934','Planestalker Signet(245)','0','48007','Planestalker Band(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47935','Armguards of the Nether Lord(245)','0','48008','Armplates of the Nether Lord(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47936','Velen\'s Robe of Conquest','0','48070','Zabra\'s Robe of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47938','Dirk of the Night Watch(245)','0','48010','Orcish Deathblade(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47939','Endurance of the Infernal(245)','0','48011','Fortitude of the Infernal(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47940','Sandals of the Silver Magus(245)','0','48012','Sunreaver Magus\' Sandals(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47941','Blade of the Silver Disciple(245)','0','48013','Sunreaver Disciple\'s Blade(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47942','Helm of the Silver Ranger(245)','0','48014','Sunreaver Ranger\'s Helm(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47943','Faceplate of the Silver Champion(245)','0','48015','Sunreaver Champion\'s Faceplate(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47944','Pauldrons of the Silver Defender(245)','0','48016','Sunreaver Defender\'s Pauldrons(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47945','Gloves of the Silver Assassin(245)','0','48017','Sunreaver Assassin\'s Gloves(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47946','Talisman of Volatile Power(245)','0','48018','Fetish of Volatile Power(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47947','Binding Light(245)','0','48019','Binding Stone(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47948','Victor\'s Call(245)','0','48020','Vengeance of the Forsaken(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47949','Fervor of the Frostborn(245)','0','48021','Eitrigg\'s Oath(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47950','The Diplomat(245)','0','48022','Widebarrel Flintlock(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47951','Reckoning(245)','0','48023','Edge of Agony(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47952','Sabatons of the Lingering Vortex(245)','0','48024','Greaves of the Lingering Vortex(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47953','Icefall Blade(245)','0','48025','Nemesis Blade(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47954','Armor of Shifting Shadows(245)','0','48026','Vest of Shifting Shadows(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47955','Loop of the Twin Val\'kyr(245)','0','48027','Band of the Twin Val\'kyr(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47956','Gloves of Looming Shadow(245)','0','48028','Looming Shadow Wraps(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47957','Darkbane Pendant(245)','0','48030','Darkbane Amulet(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47958','Chalice of Benedictus(245)','0','48032','Lightbane Focus(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47959','Helm of the Snowy Grotto(245)','0','48034','Helm of the High Mesa(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47960','Enlightenment(245)','0','48036','Illumination(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47961','Gloves of the Azure Prophet(245)','0','48038','Sen\'jin Ritualist Gloves(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47962','Argent Resolve(245)','0','48039','Mace of the Earthborn Chieftain(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47963','Vigilant Ward(245)','0','48040','Pride of the Kor\'kron(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47964','Chestguard of the Warden(245)','0','48041','Stoneskin Chestplate(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47965','Headpiece of the Crypt Lord(245)','0','48042','Helm of the Crypt Lord(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47966','The Lion\'s Maw(245)','0','48043','Frostblade Hatchet(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47967','Crusader\'s Glory(245)','0','48044','Ardent Guard(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47968','Cold Convergence(245)','0','48045','Perdition(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47969','Pauldrons of the Timeless Hunter(245)','0','48046','Pauldrons of the Shadow Hunter(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47970','Legplates of the Silver Hand(245)','0','48047','Legplates of the Redeemed Blood Knight(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47971','Westfall Saber(245)','0','48048','Forsaken Bonecarver(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47972','Spaulders of the Snow Bandit(245)','0','48049','Shoulderpads of the Snow Bandit(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47973','The Grinder(245)','0','48050','Blackhorn Bludgeon(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47974','Vestments of the Sleepless(245)','0','48051','Robes of the Sleepless(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47975','Baelgun\'s Heavy Crossbow(245)','0','48052','Darkmaw Crossbow(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47976','Legplates of the Immortal Spider(245)','0','48053','Sunwalker Legguards(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47977','Cinch of the Undying(245)','0','48054','Belt of the Eternal(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47978','Bulwark of the Royal Guard(245)','0','48055','Aegis of the Coliseum(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47979','Fordragon Blades(245)','0','48056','Anguish(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47980','Velen\'s Leggings of Conquest','0','48069','Zabra\'s Leggings of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47981','Velen\'s Shoulderpads of Conquest','0','48071','Zabra\'s Shoulderpads of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47982','Velen\'s Gloves of Conquest','0','48067','Zabra\'s Gloves of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47983','Velen\'s Gloves of Triumph','0','48066','Zabra\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47984','Velen\'s Cowl of Triumph','0','48065','Zabra\'s Cowl of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47985','Velen\'s Leggings of Triumph','0','48064','Zabra\'s Leggings of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47986','Velen\'s Robe of Triumph','0','48063','Zabra\'s Robe of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47987','Velen\'s Shoulderpads of Triumph','0','48062','Zabra\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48029','Velen\'s Shoulderpads of Triumph','0','48061','Zabra\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48031','Velen\'s Robe of Triumph','0','48060','Zabra\'s Robe of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48033','Velen\'s Leggings of Triumph','0','48059','Zabra\'s Leggings of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48035','Velen\'s Cowl of Triumph','0','48058','Zabra\'s Cowl of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48037','Velen\'s Gloves of Triumph','0','48057','Zabra\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48102','Malfurion\'s Headpiece of Conquest','0','48154','Runetotem\'s Headpiece of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48129','Malfurion\'s Robe of Conquest','0','48156','Runetotem\'s Robe of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48130','Malfurion\'s Leggings of Conquest','0','48155','Runetotem\'s Leggings of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48131','Malfurion\'s Spaulders of Conquest','0','48157','Runetotem\'s Spaulders of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48132','Malfurion\'s Handguards of Conquest','0','48153','Runetotem\'s Handguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48133','Malfurion\'s Handguards of Triumph','0','48152','Runetotem\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48134','Malfurion\'s Headpiece of Triumph','0','48151','Runetotem\'s Headpiece of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48135','Malfurion\'s Leggings of Triumph','0','48150','Runetotem\'s Leggings of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48136','Malfurion\'s Robe of Triumph','0','48149','Runetotem\'s Robe of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48137','Malfurion\'s Spaulders of Triumph','0','48148','Runetotem\'s Spaulders of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48138','Malfurion\'s Spaulders of Triumph','0','48147','Runetotem\'s Spaulders of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48139','Malfurion\'s Robe of Triumph','0','48146','Runetotem\'s Robe of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48140','Malfurion\'s Leggings of Triumph','0','48145','Runetotem\'s Leggings of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48141','Malfurion\'s Headpiece of Triumph','0','48144','Runetotem\'s Headpiece of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48142','Malfurion\'s Handguards of Triumph','0','48143','Runetotem\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48158','Malfurion\'s Cover of Conquest','0','48184','Runetotem\'s Cover of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48159','Malfurion\'s Vestments of Conquest','0','48186','Runetotem\'s Vestments of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48160','Malfurion\'s Trousers of Conquest','0','48185','Runetotem\'s Trousers of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48161','Malfurion\'s Mantle of Conquest','0','48187','Runetotem\'s Mantle of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48162','Malfurion\'s Gloves of Conquest','0','48183','Runetotem\'s Gloves of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48163','Malfurion\'s Gloves of Triumph','0','48182','Runetotem\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48164','Malfurion\'s Cover of Triumph','0','48181','Runetotem\'s Cover of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48165','Malfurion\'s Trousers of Triumph','0','48180','Runetotem\'s Trousers of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48166','Malfurion\'s Vestments of Triumph','0','48179','Runetotem\'s Vestments of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48167','Malfurion\'s Mantle of Triumph','0','48178','Runetotem\'s Mantle of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48168','Malfurion\'s Mantle of Triumph','0','48177','Runetotem\'s Mantle of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48169','Malfurion\'s Vestments of Triumph','0','48176','Runetotem\'s Vestments of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48170','Malfurion\'s Trousers of Triumph','0','48175','Runetotem\'s Trousers of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48171','Malfurion\'s Cover of Triumph','0','48174','Runetotem\'s Cover of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48172','Malfurion\'s Gloves of Triumph','0','48173','Runetotem\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48203','Malfurion\'s Handgrips of Triumph','0','48202','Runetotem\'s Handgrips of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48204','Malfurion\'s Headguard of Triumph','0','48201','Runetotem\'s Headguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48205','Malfurion\'s Legguards of Triumph','0','48200','Runetotem\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48206','Malfurion\'s Raiments of Triumph','0','48199','Runetotem\'s Raiments of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48207','Malfurion\'s Shoulderpads of Triumph','0','48198','Runetotem\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48208','Malfurion\'s Shoulderpads of Triumph','0','48197','Runetotem\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48209','Malfurion\'s Raiments of Triumph','0','48196','Runetotem\'s Raiments of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48210','Malfurion\'s Legguards of Triumph','0','48195','Runetotem\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48211','Malfurion\'s Headguard of Triumph','0','48194','Runetotem\'s Headguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48212','Malfurion\'s Handgrips of Triumph','0','48193','Runetotem\'s Handgrips of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48213','Malfurion\'s Handgrips of Conquest','0','48192','Runetotem\'s Handgrips of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48214','Malfurion\'s Headguard of Conquest','0','48188','Runetotem\'s Headguard of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48215','Malfurion\'s Legguards of Conquest','0','48190','Runetotem\'s Legguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48216','Malfurion\'s Raiments of Conquest','0','48189','Runetotem\'s Raiments of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48217','Malfurion\'s Shoulderpads of Conquest','0','48191','Runetotem\'s Shoulderpads of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48218','VanCleef\'s Helmet of Conquest','0','48245','Garona\'s Helmet of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48219','VanCleef\'s Breastplate of Conquest','0','48243','Garona\'s Breastplate of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48220','VanCleef\'s Legplates of Conquest','0','48246','Garona\'s Legplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48221','VanCleef\'s Pauldrons of Conquest','0','48247','Garona\'s Pauldrons of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48222','VanCleef\'s Gauntlets of Conquest','0','48244','Garona\'s Gauntlets of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48223','VanCleef\'s Breastplate of Triumph','0','48242','Garona\'s Breastplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48224','VanCleef\'s Gauntlets of Triumph','0','48241','Garona\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48225','VanCleef\'s Helmet of Triumph','0','48240','Garona\'s Helmet of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48226','VanCleef\'s Legplates of Triumph','0','48239','Garona\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48227','VanCleef\'s Pauldrons of Triumph','0','48238','Garona\'s Pauldrons of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48228','VanCleef\'s Pauldrons of Triumph','0','48237','Garona\'s Pauldrons of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48229','VanCleef\'s Legplates of Triumph','0','48236','Garona\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48230','VanCleef\'s Helmet of Triumph','0','48235','Garona\'s Helmet of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48231','VanCleef\'s Gauntlets of Triumph','0','48234','Garona\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48232','VanCleef\'s Breastplate of Triumph','0','48233','Garona\'s Breastplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48250','Windrunner\'s Headpiece of Conquest','0','48277','Windrunner\'s Headpiece of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48251','Windrunner\'s Tunic of Conquest','0','48275','Windrunner\'s Tunic of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48252','Windrunner\'s Legguards of Conquest','0','48278','Windrunner\'s Legguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48253','Windrunner\'s Spaulders of Conquest','0','48279','Windrunner\'s Spaulders of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48254','Windrunner\'s Handguards of Conquest','0','48276','Windrunner\'s Handguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48255','Windrunner\'s Tunic of Triumph','0','48274','Windrunner\'s Tunic of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48256','Windrunner\'s Handguards of Triumph','0','48273','Windrunner\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48257','Windrunner\'s Headpiece of Triumph','0','48272','Windrunner\'s Headpiece of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48258','Windrunner\'s Legguards of Triumph','0','48271','Windrunner\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48259','Windrunner\'s Spaulders of Triumph','0','48270','Windrunner\'s Spaulders of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48260','Windrunner\'s Spaulders of Triumph','0','48269','Windrunner\'s Spaulders of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48261','Windrunner\'s Legguards of Triumph','0','48268','Windrunner\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48262','Windrunner\'s Headpiece of Triumph','0','48267','Windrunner\'s Headpiece of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48263','Windrunner\'s Handguards of Triumph','0','48266','Windrunner\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48264','Windrunner\'s Tunic of Triumph','0','48265','Windrunner\'s Tunic of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48280','Nobundo\'s Headpiece of Conquest','0','48297','Thrall\'s Headpiece of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48281','Nobundo\'s Tunic of Conquest','0','48295','Thrall\'s Tunic of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48282','Nobundo\'s Legguards of Conquest','0','48298','Thrall\'s Legguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48283','Nobundo\'s Spaulders of Conquest','0','48299','Thrall\'s Spaulders of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48284','Nobundo\'s Handguards of Conquest','0','48296','Thrall\'s Handguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48285','Nobundo\'s Tunic of Triumph','0','48300','Thrall\'s Tunic of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48286','Nobundo\'s Handguards of Triumph','0','48301','Thrall\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48287','Nobundo\'s Headpiece of Triumph','0','48302','Thrall\'s Headpiece of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48288','Nobundo\'s Legguards of Triumph','0','48303','Thrall\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48289','Nobundo\'s Spaulders of Triumph','0','48304','Thrall\'s Spaulders of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48290','Nobundo\'s Spaulders of Triumph','0','48309','Thrall\'s Spaulders of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48291','Nobundo\'s Legguards of Triumph','0','48308','Thrall\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48292','Nobundo\'s Headpiece of Triumph','0','48307','Thrall\'s Headpiece of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48293','Nobundo\'s Handguards of Triumph','0','48306','Thrall\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48294','Nobundo\'s Tunic of Triumph','0','48305','Thrall\'s Tunic of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48310','Nobundo\'s Hauberk of Conquest','0','48336','Thrall\'s Hauberk of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48312','Nobundo\'s Gloves of Conquest','0','48337','Thrall\'s Gloves of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48313','Nobundo\'s Helm of Conquest','0','48338','Thrall\'s Helm of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48314','Nobundo\'s Kilt of Conquest','0','48339','Thrall\'s Kilt of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48315','Nobundo\'s Shoulderpads of Conquest','0','48340','Thrall\'s Shoulderpads of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48316','Nobundo\'s Hauberk of Triumph','0','48335','Thrall\'s Hauberk of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48317','Nobundo\'s Gloves of Triumph','0','48334','Thrall\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48318','Nobundo\'s Helm of Triumph','0','48333','Thrall\'s Helm of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48319','Nobundo\'s Kilt of Triumph','0','48332','Thrall\'s Kilt of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48320','Nobundo\'s Shoulderpads of Triumph','0','48331','Thrall\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48321','Nobundo\'s Shoulderpads of Triumph','0','48330','Thrall\'s Shoulderpads of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48322','Nobundo\'s Kilt of Triumph','0','48329','Thrall\'s Kilt of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48323','Nobundo\'s Helm of Triumph','0','48328','Thrall\'s Helm of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48324','Nobundo\'s Gloves of Triumph','0','48327','Thrall\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48325','Nobundo\'s Hauberk of Triumph','0','48326','Thrall\'s Hauberk of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48341','Nobundo\'s Chestguard of Conquest','0','48366','Thrall\'s Chestguard of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48342','Nobundo\'s Grips of Conquest','0','48367','Thrall\'s Grips of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48343','Nobundo\'s Faceguard of Conquest','0','48368','Thrall\'s Faceguard of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48344','Nobundo\'s War-Kilt of Conquest','0','48369','Thrall\'s War-Kilt of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48345','Nobundo\'s Shoulderguards of Conquest','0','48370','Thrall\'s Shoulderguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48346','Nobundo\'s Chestguard of Triumph','0','48365','Thrall\'s Chestguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48347','Nobundo\'s Grips of Triumph','0','48364','Thrall\'s Grips of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48348','Nobundo\'s Faceguard of Triumph','0','48363','Thrall\'s Faceguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48349','Nobundo\'s War-Kilt of Triumph','0','48362','Thrall\'s War-Kilt of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48350','Nobundo\'s Shoulderguards of Triumph','0','48361','Thrall\'s Shoulderguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48351','Nobundo\'s Shoulderguards of Triumph','0','48360','Thrall\'s Shoulderguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48352','Nobundo\'s War-Kilt of Triumph','0','48359','Thrall\'s War-Kilt of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48353','Nobundo\'s Faceguard of Triumph','0','48358','Thrall\'s Faceguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48354','Nobundo\'s Grips of Triumph','0','48357','Thrall\'s Grips of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48355','Nobundo\'s Chestguard of Triumph','0','48356','Thrall\'s Chestguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48356','Thrall\'s Chestguard of Triumph','0','48385','Wrynn\'s Battleplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48357','Thrall\'s Grips of Triumph','0','48384','Wrynn\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48358','Thrall\'s Faceguard of Triumph','0','48383','Wrynn\'s Helmet of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48359','Thrall\'s War-Kilt of Triumph','0','48382','Wrynn\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48360','Thrall\'s Shoulderguards of Triumph','0','48381','Wrynn\'s Shoulderplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48361','Thrall\'s Shoulderguards of Triumph','0','48380','Wrynn\'s Shoulderplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48362','Thrall\'s War-Kilt of Triumph','0','48379','Wrynn\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48363','Thrall\'s Faceguard of Triumph','0','48378','Wrynn\'s Helmet of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48364','Thrall\'s Grips of Triumph','0','48377','Wrynn\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48365','Thrall\'s Chestguard of Triumph','0','48376','Wrynn\'s Battleplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48366','Thrall\'s Chestguard of Conquest','0','48372','Wrynn\'s Battleplate of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48367','Thrall\'s Grips of Conquest','0','48375','Wrynn\'s Gauntlets of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48368','Thrall\'s Faceguard of Conquest','0','48371','Wrynn\'s Helmet of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48369','Thrall\'s War-Kilt of Conquest','0','48373','Wrynn\'s Legplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48370','Thrall\'s Shoulderguards of Conquest','0','48374','Wrynn\'s Shoulderplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48371','Wrynn\'s Helmet of Conquest','0','48388','Hellscream\'s Helmet of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48372','Wrynn\'s Battleplate of Conquest','0','48386','Hellscream\'s Battleplate of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48373','Wrynn\'s Legplates of Conquest','0','48389','Hellscream\'s Legplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48374','Wrynn\'s Shoulderplates of Conquest','0','48390','Hellscream\'s Shoulderplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48375','Wrynn\'s Gauntlets of Conquest','0','48387','Hellscream\'s Gauntlets of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48376','Wrynn\'s Battleplate of Triumph','0','48391','Hellscream\'s Battleplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48377','Wrynn\'s Gauntlets of Triumph','0','48392','Hellscream\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48378','Wrynn\'s Helmet of Triumph','0','48393','Hellscream\'s Helmet of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48379','Wrynn\'s Legplates of Triumph','0','48394','Hellscream\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48380','Wrynn\'s Shoulderplates of Triumph','0','48395','Hellscream\'s Shoulderplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48381','Wrynn\'s Shoulderplates of Triumph','0','48400','Hellscream\'s Shoulderplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48382','Wrynn\'s Legplates of Triumph','0','48399','Hellscream\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48383','Wrynn\'s Helmet of Triumph','0','48398','Hellscream\'s Helmet of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48384','Wrynn\'s Gauntlets of Triumph','0','48397','Hellscream\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48385','Wrynn\'s Battleplate of Triumph','0','48396','Hellscream\'s Battleplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48429','Wrynn\'s Greathelm of Conquest','0','48458','Hellscream\'s Greathelm of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48430','Wrynn\'s Greathelm of Triumph','0','48463','Hellscream\'s Greathelm of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48433','Wrynn\'s Greathelm of Triumph','0','48468','Hellscream\'s Greathelm of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48436','Wrynn\'s Breastplate of Conquest','0','48456','Hellscream\'s Breastplate of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48445','Wrynn\'s Legguards of Conquest','0','48459','Hellscream\'s Legguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48446','Wrynn\'s Legguards of Triumph','0','48464','Hellscream\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48447','Wrynn\'s Legguards of Triumph','0','48469','Hellscream\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48448','Wrynn\'s Pauldrons of Conquest','0','48460','Hellscream\'s Pauldrons of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48449','Wrynn\'s Handguards of Conquest','0','48457','Hellscream\'s Handguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48450','Wrynn\'s Breastplate of Triumph','0','48461','Hellscream\'s Breastplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48451','Wrynn\'s Breastplate of Triumph','0','48466','Hellscream\'s Breastplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48452','Wrynn\'s Handguards of Triumph','0','48462','Hellscream\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48453','Wrynn\'s Handguards of Triumph','0','48467','Hellscream\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48454','Wrynn\'s Pauldrons of Triumph','0','48465','Hellscream\'s Pauldrons of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48455','Wrynn\'s Pauldrons of Triumph','0','48470','Hellscream\'s Pauldrons of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48472','Thassarian\'s Helmet of Conquest','0','48503','Koltira\'s Helmet of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48474','Thassarian\'s Battleplate of Conquest','0','48501','Koltira\'s Battleplate of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48476','Thassarian\'s Legplates of Conquest','0','48504','Koltira\'s Legplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48478','Thassarian\'s Shoulderplates of Conquest','0','48505','Koltira\'s Shoulderplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48480','Thassarian\'s Gauntlets of Conquest','0','48502','Koltira\'s Gauntlets of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48481','Thassarian\'s Battleplate of Triumph','0','48500','Koltira\'s Battleplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48482','Thassarian\'s Gauntlets of Triumph','0','48499','Koltira\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48483','Thassarian\'s Helmet of Triumph','0','48498','Koltira\'s Helmet of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48484','Thassarian\'s Legplates of Triumph','0','48497','Koltira\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48485','Thassarian\'s Shoulderplates of Triumph','0','48496','Koltira\'s Shoulderplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48486','Thassarian\'s Shoulderplates of Triumph','0','48495','Koltira\'s Shoulderplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48487','Thassarian\'s Legplates of Triumph','0','48494','Koltira\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48488','Thassarian\'s Helmet of Triumph','0','48493','Koltira\'s Helmet of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48489','Thassarian\'s Gauntlets of Triumph','0','48492','Koltira\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48490','Thassarian\'s Battleplate of Triumph','0','48491','Koltira\'s Battleplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48529','Thassarian\'s Faceguard of Conquest','0','48560','Koltira\'s Faceguard of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48531','Thassarian\'s Chestguard of Conquest','0','48558','Koltira\'s Chestguard of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48533','Thassarian\'s Legguards of Conquest','0','48561','Koltira\'s Legguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48535','Thassarian\'s Pauldrons of Conquest','0','48562','Koltira\'s Pauldrons of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48537','Thassarian\'s Handguards of Conquest','0','48559','Koltira\'s Handguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48538','Thassarian\'s Chestguard of Triumph','0','48557','Koltira\'s Chestguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48539','Thassarian\'s Handguards of Triumph','0','48556','Koltira\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48540','Thassarian\'s Faceguard of Triumph','0','48555','Koltira\'s Faceguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48541','Thassarian\'s Legguards of Triumph','0','48554','Koltira\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48542','Thassarian\'s Pauldrons of Triumph','0','48553','Koltira\'s Pauldrons of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48543','Thassarian\'s Pauldrons of Triumph','0','48552','Koltira\'s Pauldrons of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48544','Thassarian\'s Legguards of Triumph','0','48551','Koltira\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48545','Thassarian\'s Faceguard of Triumph','0','48550','Koltira\'s Faceguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48546','Thassarian\'s Handguards of Triumph','0','48549','Koltira\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48547','Thassarian\'s Chestguard of Triumph','0','48548','Koltira\'s Chestguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48564','Turalyon\'s Headpiece of Conquest','0','48597','Liadrin\'s Headpiece of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48566','Turalyon\'s Tunic of Conquest','0','48599','Liadrin\'s Tunic of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48568','Turalyon\'s Greaves of Conquest','0','48596','Liadrin\'s Greaves of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48572','Turalyon\'s Spaulders of Conquest','0','48595','Liadrin\'s Spaulders of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48574','Turalyon\'s Gloves of Conquest','0','48598','Liadrin\'s Gloves of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48575','Turalyon\'s Tunic of Triumph','0','48594','Liadrin\'s Tunic of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48576','Turalyon\'s Gloves of Triumph','0','48593','Liadrin\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48577','Turalyon\'s Headpiece of Triumph','0','48592','Liadrin\'s Headpiece of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48578','Turalyon\'s Greaves of Triumph','0','48591','Liadrin\'s Greaves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48579','Turalyon\'s Spaulders of Triumph','0','48590','Liadrin\'s Spaulders of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48580','Turalyon\'s Spaulders of Triumph','0','48585','Liadrin\'s Spaulders of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48581','Turalyon\'s Greaves of Triumph','0','48586','Liadrin\'s Greaves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48582','Turalyon\'s Headpiece of Triumph','0','48587','Liadrin\'s Headpiece of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48583','Turalyon\'s Gloves of Triumph','0','48588','Liadrin\'s Gloves of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48584','Turalyon\'s Tunic of Triumph','0','48589','Liadrin\'s Tunic of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48602','Turalyon\'s Battleplate of Conquest','0','48631','Liadrin\'s Battleplate of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48603','Turalyon\'s Gauntlets of Conquest','0','48630','Liadrin\'s Gauntlets of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48604','Turalyon\'s Helm of Conquest','0','48629','Liadrin\'s Helm of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48605','Turalyon\'s Legplates of Conquest','0','48628','Liadrin\'s Legplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48606','Turalyon\'s Shoulderplates of Conquest','0','48627','Liadrin\'s Shoulderplates of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48607','Turalyon\'s Battleplate of Triumph','0','48626','Liadrin\'s Battleplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48608','Turalyon\'s Gauntlets of Triumph','0','48625','Liadrin\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48609','Turalyon\'s Helm of Triumph','0','48624','Liadrin\'s Helm of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48610','Turalyon\'s Legplates of Triumph','0','48623','Liadrin\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48611','Turalyon\'s Shoulderplates of Triumph','0','48622','Liadrin\'s Shoulderplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48612','Turalyon\'s Shoulderplates of Triumph','0','48621','Liadrin\'s Shoulderplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48613','Turalyon\'s Legplates of Triumph','0','48620','Liadrin\'s Legplates of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48614','Turalyon\'s Helm of Triumph','0','48619','Liadrin\'s Helm of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48615','Turalyon\'s Gauntlets of Triumph','0','48618','Liadrin\'s Gauntlets of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48616','Turalyon\'s Battleplate of Triumph','0','48617','Liadrin\'s Battleplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48632','Turalyon\'s Breastplate of Conquest','0','48652','Liadrin\'s Breastplate of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48633','Turalyon\'s Handguards of Conquest','0','48653','Liadrin\'s Handguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48634','Turalyon\'s Faceguard of Conquest','0','48654','Liadrin\'s Faceguard of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48635','Turalyon\'s Legguards of Conquest','0','48655','Liadrin\'s Legguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48636','Turalyon\'s Shoulderguards of Conquest','0','48656','Liadrin\'s Shoulderguards of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48637','Turalyon\'s Shoulderguards of Triumph','0','48661','Liadrin\'s Shoulderguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48638','Turalyon\'s Legguards of Triumph','0','48660','Liadrin\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48639','Turalyon\'s Faceguard of Triumph','0','48659','Liadrin\'s Faceguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48640','Turalyon\'s Handguards of Triumph','0','48658','Liadrin\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48641','Turalyon\'s Breastplate of Triumph','0','48657','Liadrin\'s Breastplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48642','Turalyon\'s Breastplate of Triumph','0','48651','Liadrin\'s Breastplate of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48643','Turalyon\'s Handguards of Triumph','0','48650','Liadrin\'s Handguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48644','Turalyon\'s Faceguard of Triumph','0','48649','Liadrin\'s Faceguard of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48645','Turalyon\'s Legguards of Triumph','0','48648','Liadrin\'s Legguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48646','Turalyon\'s Shoulderguards of Triumph','0','48647','Liadrin\'s Shoulderguards of Triumph');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48671','Drape of Bitter Incantation(258)','0','48666','Drape of the Sunreavers(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48672','Shawl of Fervent Crusader(258)','0','48667','Shawl of the Devout Crusader(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48673','Cloak of the Silver Covenant(258)','0','48668','Cloak of Serrated Blades(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48674','Cloak of the Victorious Combatant(258)','0','48669','Cloak of the Triumphant Combatant(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48675','Cloak of the Unmoving Guardian(258)','0','48670','Cloak of the Unflinching Guardian(258)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48708','Spellstorm Blade(245)','0','48701','Spellharvest(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48709','Heartcrusher(245)','0','48693','Heartsmasher(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48710','Paragon\'s Breadth(245)','0','48705','Attrition(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48711','Rhok\'shalla, the Shadow\'s Bane(245)','0','48697','Frenzystrike Longbow(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48712','The Spinebreaker(245)','0','48703','The Facebreaker(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48713','Lothar\'s Edge(245)','0','48695','Mor\'kosh, the Bloodreaver(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48714','Honor of the Fallen(245)','0','48699','Blood and Glory(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48743','Kel\'Thuzad\'s Robe ','0','47799','Gul\'dan\'s Robe of Conquest');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','49052','Tabard of Conquest(A)','0','49054','Tabard of Conquest(H)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','49231','Boots of the Grieving Soul(232)','0','49232','Sandals of the Grieving Soul(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','49234','Boots of the Grieving Soul(245)','0','49233','Sandals of the Grieving Soul(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','49235','Boots of Tortured Space(232)','0','49236','Sabatons of Tortured Space(232)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','49238','Boots of Tortured Space(245)','0','49237','Sabatons of Tortured Space(245)');
insert into `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','51377','Medallion of the Alliance(264)','0','51378','Medallion of the Horde(264)');

insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','47','Ironforge','0','530','Darkspear Trolls');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','54','Gnomeregan Exiles','0','81','Thunder Bluff');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','69','Darnassus','0','68','Undercity');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','72','Stormwind','0','76','Orgrimmar');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','509','The League of Arathor','0','510','The Defilers');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','730','Stormpike Guard','0','729','Frostwolf Clan');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','890','Silverwing Sentinels','0','889','Warsong Outriders');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','930','Exodar','0','911','Silvermoon City');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','946','Honor Hold','0','947','Thrallmar');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','978','Kurenai','0','941','The Mag\'har');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','1037','Alliance Vanguard','0','1052','Horde Expedition');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','1050','Valiance Expedition','0','1085','Warsong Offensive');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','1068','Explorers\' League','0','1064','The Taunka');
insert into `player_factionchange_reputations` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','1126','The Frostborn','0','1067','The Hand of Vengeance');

insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62609','Argent Squire','0','62746','Argent Gruntling');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32182','Heroism','0','2825','Bloodlust');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','10059','Portal: Stormwind','0','11417','Portal: Orgrimmar');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32266','Portal: Exodar','0','32267','Portal: Silvermoon');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','49360','Portal: Theramore','0','40361','Portal: Stonard');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','11419','Portal: Darnassus','0','11420','Portal: Thunder Bluff');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','11416','Portal: Ironforge','0','11418','Portal: Undercity');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','31801','Seal of Vengeance','0','53736','Seal of Corruption');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','3561','Teleport: Stormwind','0','3567','Teleport: Orgrimmar');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32271','Teleport: Exodar','0','32272','Teleport: Silvermoon');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','49359','Teleport: Theramore','0','49358','Teleport: Stonard');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','3565','Teleport: Darnassus','0','3566','Teleport: Thunder Bluff');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','3562','Teleport: Ironforge','0','3563','Teleport: Undercity');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','61229','Armored Snowy Gryphon','0','61230','Armored Blue Wind Rider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32240','Snowy Gryphon','0','32244','Blue Wind Rider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','68187','Crusader\'s White Warhorse','0','68188','Crusader\'s Black Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23510','Stormpike Battle Charger','0','23509','Frostwolf Howler');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32235','Golden Gryphon','0','32245','Green Wind Rider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','60424','Mekgineer\'s Chopper','0','55531','Mechano-hog');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23214','Charger','0','34767','Summon Charger');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','13819','Warhorse','0','34769','Summon Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','66087','Silver Covenant Hippogryph','0','66088','Sunreaver Dragonhawk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','66090','Quel\'dorei Steed','0','66091','Sunreaver Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32290','Swift Green Gryphon','0','32295','Swift Green Wind Rider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','68057','Swift Alliance Steed','0','68056','Swift Horde Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','65643','Swift Violet Ram','0','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32292','Swift Purple Gryphon','0','32297','Swift Purple Wind Rider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32289','Swift Red Gryphon','0','32246','Swift Red Wind Rider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32242','Swift Blue Gryphon','0','32296','Swift Yellow Wind Rider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','32239','Ebon Gryphon','0','32243','Tawny Wind Rider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','17229','Winterspring Frostsaber','0','64659','Venomhide Ravasaur');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','472','Pinto','0','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','6648','Chestnut Mare','0','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','458','Brown Horse','0','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','470','Black Stallion','0','64658','Black Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23229','Swift Brown Steed','0','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23228','Swift White Steed','0','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23227','Swift Palomino','0','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','16082','Palomino','0','16080','Red Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','16083','White Stallion','0','16081','Winter Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','63232','Stormwind Steed','0','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','65640','Swift Gray Steed','0','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','22717','Black War Steed','0','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','6777','Gray Ram','0','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','6898','White Ram','0','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','6899','Brown Ram','0','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23239','Swift Gray Ram','0','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23240','Swift White Ram','0','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23238','Swift Brown Ram','0','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','17461','Black Ram','0','16084','Mottled Red Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','17460','Frost Ram','0','17450','Ivory Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','63636','Ironforge Ram','0','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','65643','Swift Violet Ram','0','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','22720','Black War Ram','0','22721','Black War Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','8394','Striped Frostsaber','0','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','10789','Spotted Frostsaber','0','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','10793','Striped Nightsaber','0','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','66847','Striped Dawnsaber','0','17462','Red Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23338','Swift Stormsaber','0','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23219','Swift Mistsaber','0','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23221','Swift Frostsaber','0','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','63637','Darnassian Nightsaber','0','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','65638','Swift Moonsaber','0','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','22723','Black War Tiger','0','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','63641','Thunder Bluff Kodo','0','63638','Gnomeregan Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','65641','Great Golden Kodo','0','65642','Turbostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','22718','Black War Kodo','0','22719','Black Battlestrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','10969','Blue Mechanostrider','0','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','17453','Green Mechanostrider','0','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','10873','Red Mechanostrider','0','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23225','Swift Green Mechanostrider','0','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23223','Swift White Mechanostrider','0','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','23222','Swift Yellow Mechanostrider','0','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','17459','Icy Blue Mechanostrider Mod A','0','18991','Green Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','15779','White Mechanostrider Mod B','0','18992','Teal Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','63638','Gnomeregan Mechanostrider','0','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','65642','Turbostrider','0','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','22719','Black Battlestrider','0','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','34406','Brown Elekk','0','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','35710','Gray Elekk','0','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','35711','Purple Elekk','0','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','35713','Great Blue Elekk','0','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','35712','Great Green Elekk','0','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','35714','Great Purple Elekk','0','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','63639','Exodar Elekk','0','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','65637','Great Red Elekk','0','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','48027','Black War Elekk','0','35028','Swift Warstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','472','Pinto','5','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6648','Chestnut Mare','5','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','458','Brown Horse','5','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','470','Black Stallion','5','17462','Red Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23229','Swift Brown Steed','5','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23228','Swift White Steed','5','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23227','Swift Palomino','5','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63232','Stormwind Steed','5','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65640','Swift Gray Steed','5','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','22717','Black War Steed','5','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','8394','Striped Frostsaber','5','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','10789','Spotted Frostsaber','5','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','10793','Striped Nightsaber','5','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','66847','Striped Dawnsaber','5','64658','Black Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23338','Swift Stormsaber','5','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23219','Swift Mistsaber','5','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23221','Swift Frostsaber','5','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','16056','Ancient Frostsaber','5','16080','Red Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63637','Darnassian Nightsaber','5','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65638','Swift Moonsaber','5','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','22723','Black War Tiger','5','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','472','Pinto','6','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6648','Chestnut Mare','6','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','458','Brown Horse','6','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23229','Swift Brown Steed','6','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23228','Swift White Steed','6','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23227','Swift Palomino','6','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','16082','Palomino','6','18991','Green Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','16083','White Stallion','6','18992','Teal Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63232','Stormwind Steed','6','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65640','Swift Gray Steed','6','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','22717','Black War Steed','6','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','10969','Blue Mechanostrider','6','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','17453','Green Mechanostrider','6','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','10873','Red Mechanostrider','6','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','17454','Unpainted Mechanostrider','6','64658','Black Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23225','Swift Green Mechanostrider','6','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23223','Swift White Mechanostrider','6','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23222','Swift Yellow Mechanostrider','6','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','17459','Icy Blue Mechanostrider Mod A','6','16080','Red Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','15779','White Mechanostrider Mod B','6','16081','Winter Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63638','Gnomeregan Mechanostrider','6','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65642','Turbostrider','6','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','22719','Black Battlestrider','6','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','472','Pinto','8','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6648','Chestnut Mare','8','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','458','Brown Horse','8','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23229','Swift Brown Steed','8','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23228','Swift White Steed','8','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23227','Swift Palomino','8','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','16082','Palomino','8','16084','Mottled Red Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','16083','White Stallion','8','17450','Ivory Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63232','Stormwind Steed','8','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65640','Swift Gray Steed','8','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','22717','Black War Steed','8','22721','Black War Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6777','Gray Ram','8','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6898','White Ram','8','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6899','Brown Ram','8','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23239','Swift Gray Ram','8','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23240','Swift White Ram','8','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23238','Swift Brown Ram','8','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','17461','Black Ram','8','16080','Red Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','17460','Frost Ram','8','16081','Winter Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63636','Ironforge Ram','8','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65643','Swift Violet Ram','8','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','22720','Black War Ram','8','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','472','Pinto','10','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6648','Chestnut Mare','10','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','458','Brown Horse','10','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','470','Black Stallion','10','35018','Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23229','Swift Brown Steed','10','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23228','Swift White Steed','10','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23227','Swift Palomino','10','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63232','Stormwind Steed','10','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65640','Swift Gray Steed','10','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','22717','Black War Steed','10','35028','Swift Warstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','34406','Brown Elekk','10','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','35710','Gray Elekk','10','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','35711','Purple Elekk','10','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','35713','Great Blue Elekk','10','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','35712','Great Green Elekk','10','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','35714','Great Purple Elekk','10','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63639','Exodar Elekk','10','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65637','Great Red Elekk','10','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','48027','Black War Elekk','10','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','472','Pinto','2','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6648','Chestnut Mare','2','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','458','Brown Horse','2','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23229','Swift Brown Steed','2','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23228','Swift White Steed','2','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23227','Swift Palomino','2','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','16082','Palomino','2','16084','Mottled Red Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','16083','White Stallion','2','17450','Ivory Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63232','Stormwind Steed','2','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65640','Swift Gray Steed','2','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','22717','Black War Steed','2','22721','Black War Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6777','Gray Ram','2','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6898','White Ram','2','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6899','Brown Ram','2','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23239','Swift Gray Ram','2','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23240','Swift White Ram','2','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23238','Swift Brown Ram','2','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','17461','Black Ram','2','16080','Red Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','17460','Frost Ram','2','16081','Winter Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63636','Ironforge Ram','2','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65643','Swift Violet Ram','2','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','22720','Black War Ram','2','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6777','Gray Ram','5','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6898','White Ram','5','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6899','Brown Ram','5','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23239','Swift Gray Ram','5','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23240','Swift White Ram','5','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23238','Swift Brown Ram','5','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63636','Ironforge Ram','5','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65643','Swift Violet Ram','5','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','22720','Black War Ram','5','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','8394','Striped Frostsaber','5','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','10789','Spotted Frostsaber','5','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','10793','Striped Nightsaber','5','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23338','Swift Stormsaber','5','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23219','Swift Mistsaber','5','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23221','Swift Frostsaber','5','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','16056','Ancient Frostsaber','5','16084','Mottled Red Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63637','Darnassian Nightsaber','5','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65638','Swift Moonsaber','5','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','22723','Black War Tiger','5','22721','Black War Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6777','Gray Ram','6','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6898','White Ram','6','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6899','Brown Ram','6','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23239','Swift Gray Ram','6','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23240','Swift White Ram','6','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23238','Swift Brown Ram','6','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','17461','Black Ram','6','18991','Green Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','17460','Frost Ram','6','18992','Teal Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63636','Ironforge Ram','6','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65643','Swift Violet Ram','6','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','22720','Black War Ram','6','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','10969','Blue Mechanostrider','6','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','17453','Green Mechanostrider','6','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','10873','Red Mechanostrider','6','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23225','Swift Green Mechanostrider','6','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23223','Swift White Mechanostrider','6','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23222','Swift Yellow Mechanostrider','6','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','17459','Icy Blue Mechanostrider Mod A','6','16084','Mottled Red Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','15779','White Mechanostrider Mod B','6','17450','Ivory Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63638','Gnomeregan Mechanostrider','6','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65642','Turbostrider','6','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','22719','Black Battlestrider','6','22721','Black War Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6777','Gray Ram','10','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6898','White Ram','10','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6899','Brown Ram','10','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23239','Swift Gray Ram','10','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23240','Swift White Ram','10','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23238','Swift Brown Ram','10','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63636','Ironforge Ram','10','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65643','Swift Violet Ram','10','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','22720','Black War Ram','10','35028','Swift Warstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','34406','Brown Elekk','10','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','35710','Gray Elekk','10','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','35711','Purple Elekk','10','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','35713','Great Blue Elekk','10','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','35712','Great Green Elekk','10','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','35714','Great Purple Elekk','10','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63639','Exodar Elekk','10','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65637','Great Red Elekk','10','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','48027','Black War Elekk','10','0','Black War Rapto');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','472','Pinto','2','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','6648','Chestnut Mare','2','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','458','Brown Horse','2','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','470','Black Stallion','2','17462','Red Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23229','Swift Brown Steed','2','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23228','Swift White Steed','2','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23227','Swift Palomino','2','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63232','Stormwind Steed','2','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65640','Swift Gray Steed','2','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','22717','Black War Steed','2','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','8394','Striped Frostsaber','2','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10789','Spotted Frostsaber','2','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10793','Striped Nightsaber','2','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','66847','Striped Dawnsaber','2','64658','Black Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23338','Swift Stormsaber','2','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23219','Swift Mistsaber','2','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23221','Swift Frostsaber','2','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','16056','Ancient Frostsaber','2','16080','Red Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63637','Darnassian Nightsaber','2','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65638','Swift Moonsaber','2','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','22723','Black War Tiger','2','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','8394','Striped Frostsaber','6','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10789','Spotted Frostsaber','6','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10793','Striped Nightsaber','6','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23338','Swift Stormsaber','6','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23219','Swift Mistsaber','6','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23221','Swift Frostsaber','6','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','16056','Ancient Frostsaber','6','18991','Green Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63637','Darnassian Nightsaber','6','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65638','Swift Moonsaber','6','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','22723','Black War Tiger','6','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10969','Blue Mechanostrider','6','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','17453','Green Mechanostrider','6','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10873','Red Mechanostrider','6','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','17454','Unpainted Mechanostrider','6','17462','Red Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23225','Swift Green Mechanostrider','6','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23223','Swift White Mechanostrider','6','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23222','Swift Yellow Mechanostrider','6','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63638','Gnomeregan Mechanostrider','6','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65642','Turbostrider','6','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','22719','Black Battlestrider','6','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','6777','Gray Ram','8','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','6898','White Ram','8','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','6899','Brown Ram','8','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23239','Swift Gray Ram','8','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23240','Swift White Ram','8','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23238','Swift Brown Ram','8','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63636','Ironforge Ram','8','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65643','Swift Violet Ram','8','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','22720','Black War Ram','8','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','8394','Striped Frostsaber','8','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10789','Spotted Frostsaber','8','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10793','Striped Nightsaber','8','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23338','Swift Stormsaber','8','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23219','Swift Mistsaber','8','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23221','Swift Frostsaber','8','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','16056','Ancient Frostsaber','8','16084','Mottled Red Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63637','Darnassian Nightsaber','8','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65638','Swift Moonsaber','8','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','22723','Black War Tiger','8','22721','Black War Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','8394','Striped Frostsaber','10','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10789','Spotted Frostsaber','10','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10793','Striped Nightsaber','10','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','66847','Striped Dawnsaber','10','35018','Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23338','Swift Stormsaber','10','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23219','Swift Mistsaber','10','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23221','Swift Frostsaber','10','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','34406','Brown Elekk','10','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','35710','Gray Elekk','10','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','35711','Purple Elekk','10','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','35713','Great Blue Elekk','10','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','35712','Great Green Elekk','10','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','35714','Great Purple Elekk','10','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63639','Exodar Elekk','10','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65637','Great Red Elekk','10','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','48027','Black War Elekk','10','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','472','Pinto','2','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','6648','Chestnut Mare','2','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','458','Brown Horse','2','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23229','Swift Brown Steed','2','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23228','Swift White Steed','2','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23227','Swift Palomino','2','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','16082','Palomino','2','18991','Green Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','16083','White Stallion','2','18992','Teal Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63232','Stormwind Steed','2','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65640','Swift Gray Steed','2','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','22717','Black War Steed','2','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','0','lue Mechanostrider','2','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17453','Green Mechanostrider','2','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10873','Red Mechanostrider','2','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17454','Unpainted Mechanostrider','2','64658','Black Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23225','Swift Green Mechanostrider','2','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23223','Swift White Mechanostrider','2','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23222','Swift Yellow Mechanostrider','2','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17459','Icy Blue Mechanostrider Mod A','2','16080','Red Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','15779','White Mechanostrider Mod B','2','16081','Winter Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63638','Gnomeregan Mechanostrider','2','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65642','Turbostrider','2','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','22719','Black Battlestrider','2','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','8394','Striped Frostsaber','5','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10789','Spotted Frostsaber','5','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10793','Striped Nightsaber','5','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23338','Swift Stormsaber','5','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23219','Swift Mistsaber','5','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23221','Swift Frostsaber','5','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','16056','Ancient Frostsaber','5','18991','Green Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63637','Darnassian Nightsaber','5','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65638','Swift Moonsaber','5','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','22723','Black War Tiger','5','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10969','Blue Mechanostrider','5','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17453','Green Mechanostrider','5','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10873','Red Mechanostrider','5','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17454','Unpainted Mechanostrider','5','17462','Red Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23225','Swift Green Mechanostrider','5','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23223','Swift White Mechanostrider','5','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23222','Swift Yellow Mechanostrider','5','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63638','Gnomeregan Mechanostrider','5','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65642','Turbostrider','5','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','22719','Black Battlestrider','5','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','6777','Gray Ram','8','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','6898','White Ram','8','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','6899','Brown Ram','8','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23239','Swift Gray Ram','8','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23240','Swift White Ram','8','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23238','Swift Brown Ram','8','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17461','Black Ram','8','18991','Green Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17460','Frost Ram','8','18992','Teal Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63636','Ironforge Ram','8','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65643','Swift Violet Ram','8','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','22720','Black War Ram','8','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10969','Blue Mechanostrider','8','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17453','Green Mechanostrider','8','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10873','Red Mechanostrider','8','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23225','Swift Green Mechanostrider','8','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23223','Swift White Mechanostrider','8','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23222','Swift Yellow Mechanostrider','8','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17459','Icy Blue Mechanostrider Mod A','8','16084','Mottled Red Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','15779','White Mechanostrider Mod B','8','17450','Ivory Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63638','Gnomeregan Mechanostrider','8','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65642','Turbostrider','8','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','22719','Black Battlestrider','8','22721','Black War Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10969','Blue Mechanostrider','10','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17453','Green Mechanostrider','10','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10873','Red Mechanostrider','10','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17454','Unpainted Mechanostrider','10','35018','Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23225','Swift Green Mechanostrider','10','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23223','Swift White Mechanostrider','10','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23222','Swift Yellow Mechanostrider','10','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63638','Gnomeregan Mechanostrider','10','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65642','Turbostrider','10','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','22719','Black Battlestrider','10','35028','Swift Warstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','34406','Brown Elekk','10','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','35710','Gray Elekk','10','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','35711','Purple Elekk','10','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','35713','Great Blue Elekk','10','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','35712','Great Green Elekk','10','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','35714','Great Purple Elekk','10','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63639','Exodar Elekk','10','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65637','Great Red Elekk','10','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','48027','Black War Elekk','10','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','472','Pinto','2','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','6648','Chestnut Mare','2','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','458','Brown Horse','2','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','470','Black Stallion','2','35018','Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23229','Swift Brown Steed','2','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23228','Swift White Steed','2','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23227','Swift Palomino','2','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63232','Stormwind Steed','2','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65640','Swift Gray Steed','2','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','22717','Black War Steed','2','35028','Swift Warstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','34406','Brown Elekk','2','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35710','Gray Elekk','2','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35711','Purple Elekk','2','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35713','Great Blue Elekk','2','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35712','Great Green Elekk','2','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35714','Great Purple Elekk','2','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63639','Exodar Elekk','2','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65637','Great Red Elekk','2','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','48027','Black War Elekk','2','22724','Black War Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','8394','Striped Frostsaber','5','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','10789','Spotted Frostsaber','5','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','10793','Striped Nightsaber','5','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','66847','Striped Dawnsaber','5','35018','Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23338','Swift Stormsaber','5','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23219','Swift Mistsaber','5','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23221','Swift Frostsaber','5','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63637','Darnassian Nightsaber','5','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65638','Swift Moonsaber','5','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','22723','Black War Tiger','5','35028','Swift Warstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','34406','Brown Elekk','5','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35710','Gray Elekk','5','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35711','Purple Elekk','5','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35713','Great Blue Elekk','5','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35712','Great Green Elekk','5','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35714','Great Purple Elekk','5','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63639','Exodar Elekk','5','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65637','Great Red Elekk','5','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','48027','Black War Elekk','5','22722','Red Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','10969','Blue Mechanostrider','6','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','17453','Green Mechanostrider','6','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','10873','Red Mechanostrider','6','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','17454','Unpainted Mechanostrider','6','35018','Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23225','Swift Green Mechanostrider','6','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23223','Swift White Mechanostrider','6','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23222','Swift Yellow Mechanostrider','6','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63638','Gnomeregan Mechanostrider','6','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65642','Turbostrider','6','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','22719','Black Battlestrider','6','35028','Swift Warstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','34406','Brown Elekk','6','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35710','Gray Elekk','6','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35711','Purple Elekk','6','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35713','Great Blue Elekk','6','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35712','Great Green Elekk','6','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35714','Great Purple Elekk','6','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63639','Exodar Elekk','6','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65637','Great Red Elekk','6','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','48027','Black War Elekk','6','22718','Black War Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','6777','Gray Ram','8','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','6898','White Ram','8','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','6899','Brown Ram','8','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23239','Swift Gray Ram','8','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23240','Swift White Ram','8','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','23238','Swift Brown Ram','8','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63636','Ironforge Ram','8','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65643','Swift Violet Ram','8','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','22720','Black War Ram','8','35028','Swift Warstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','34406','Brown Elekk','8','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35710','Gray Elekk','8','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35711','Purple Elekk','8','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35713','Great Blue Elekk','8','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35712','Great Green Elekk','8','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35714','Great Purple Elekk','8','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63639','Exodar Elekk','8','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65637','Great Red Elekk','8','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','48027','Black War Elekk','8','22721','Black War Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','472','Pinto','3','6777','Gray Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6648','Chestnut Mare','3','6898','White Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','458','Brown Horse','3','6899','Brown Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23229','Swift Brown Steed','3','23239','Swift Gray Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23228','Swift White Steed','3','23240','Swift White Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23227','Swift Palomino','3','23238','Swift Brown Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63232','Stormwind Steed','3','63636','Ironforge Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65640','Swift Gray Steed','3','65643','Swift Violet Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','472','Pinto','4','8394','Striped Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6648','Chestnut Mare','4','10789','Spotted Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','458','Brown Horse','4','10793','Striped Nightsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','470','Black Stallion','4','66847','Striped Dawnsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23229','Swift Brown Steed','4','23338','Swift Stormsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23228','Swift White Steed','4','23219','Swift Mistsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23227','Swift Palomino','4','23221','Swift Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63232','Stormwind Steed','4','63637','Darnassian Nightsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65640','Swift Gray Steed','4','65638','Swift Moonsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','472','Pinto','7','10969','Blue Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6648','Chestnut Mare','7','17453','Green Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','458','Brown Horse','7','10873','Red Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','470','Black Stallion','7','17454','Unpainted Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23229','Swift Brown Steed','7','23225','Swift Green Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23228','Swift White Steed','7','23223','Swift White Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23227','Swift Palomino','7','23222','Swift Yellow Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63232','Stormwind Steed','7','63638','Gnomeregan Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65640','Swift Gray Steed','7','65642','Turbostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','472','Pinto','11','34406','Brown Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','6648','Chestnut Mare','11','35710','Gray Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','458','Brown Horse','11','35711','Purple Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23229','Swift Brown Steed','11','35713','Great Blue Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23228','Swift White Steed','11','35712','Great Green Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','23227','Swift Palomino','11','35714','Great Purple Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','63232','Stormwind Steed','11','63639','Exodar Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('1','65640','Swift Gray Steed','11','65637','Great Red Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6777','Gray Ram','1','472','Pinto');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6898','White Ram','1','6648','Chestnut Mare');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6899','Brown Ram','1','458','Brown Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23239','Swift Gray Ram','1','23229','Swift Brown Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23240','Swift White Ram','1','23228','Swift White Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23238','Swift Brown Ram','1','23227','Swift Palomino');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63636','Ironforge Ram','1','63232','Stormwind Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65643','Swift Violet Ram','1','65640','Swift Gray Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6777','Gray Ram','4','8394','Striped Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6898','White Ram','4','10789','Spotted Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6899','Brown Ram','4','10793','Striped Nightsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23239','Swift Gray Ram','4','23338','Swift Stormsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23240','Swift White Ram','4','23219','Swift Mistsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23238','Swift Brown Ram','4','23221','Swift Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63636','Ironforge Ram','4','63637','Darnassian Nightsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65643','Swift Violet Ram','4','65638','Swift Moonsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6777','Gray Ram','7','10969','Blue Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6898','White Ram','7','17453','Green Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6899','Brown Ram','7','10873','Red Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23239','Swift Gray Ram','7','23225','Swift Green Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23240','Swift White Ram','7','23223','Swift White Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23238','Swift Brown Ram','7','23222','Swift Yellow Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63636','Ironforge Ram','7','63638','Gnomeregan Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65643','Swift Violet Ram','7','65642','Turbostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6777','Gray Ram','11','34406','Brown Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6898','White Ram','11','35710','Gray Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','6899','Brown Ram','11','35711','Purple Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23239','Swift Gray Ram','11','35713','Great Blue Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23240','Swift White Ram','11','35712','Great Green Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','23238','Swift Brown Ram','11','35714','Great Purple Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','63636','Ironforge Ram','11','63639','Exodar Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('3','65643','Swift Violet Ram','11','65637','Great Red Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','8394','Striped Frostsaber','1','472','Pinto');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10789','Spotted Frostsaber','1','6648','Chestnut Mare');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10793','Striped Nightsaber','1','458','Brown Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','66847','Striped Dawnsaber','1','470','Black Stallion');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23338','Swift Stormsaber','1','23229','Swift Brown Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23219','Swift Mistsaber','1','23228','Swift White Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23221','Swift Frostsaber','1','23227','Swift Palomino');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63637','Darnassian Nightsaber','1','63232','Stormwind Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65638','Swift Moonsaber','1','65640','Swift Gray Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','8394','Striped Frostsaber','3','6777','Gray Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10789','Spotted Frostsaber','3','6898','White Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10793','Striped Nightsaber','3','6899','Brown Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23338','Swift Stormsaber','3','23239','Swift Gray Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23219','Swift Mistsaber','3','23240','Swift White Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23221','Swift Frostsaber','3','23238','Swift Brown Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63637','Darnassian Nightsaber','3','63636','Ironforge Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65638','Swift Moonsaber','3','65643','Swift Violet Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','8394','Striped Frostsaber','7','10969','Blue Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10789','Spotted Frostsaber','7','17453','Green Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10793','Striped Nightsaber','7','10873','Red Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','66847','Striped Dawnsaber','7','17454','Unpainted Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23338','Swift Stormsaber','7','23225','Swift Green Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23219','Swift Mistsaber','7','23223','Swift White Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23221','Swift Frostsaber','7','23222','Swift Yellow Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63637','Darnassian Nightsaber','7','63638','Gnomeregan Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65638','Swift Moonsaber','7','65642','Turbostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','8394','Striped Frostsaber','11','34406','Brown Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10789','Spotted Frostsaber','11','35710','Gray Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','10793','Striped Nightsaber','11','35711','Purple Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23338','Swift Stormsaber','11','35713','Great Blue Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23219','Swift Mistsaber','11','35712','Great Green Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','23221','Swift Frostsaber','11','35714','Great Purple Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','63637','Darnassian Nightsaber','11','63639','Exodar Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('4','65638','Swift Moonsaber','11','65637','Great Red Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10969','Blue Mechanostrider','1','472','Pinto');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17453','Green Mechanostrider','1','6648','Chestnut Mare');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10873','Red Mechanostrider','1','458','Brown Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17454','Unpainted Mechanostrider','1','470','Black Stallion');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23225','Swift Green Mechanostrider','1','23229','Swift Brown Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23223','Swift White Mechanostrider','1','23228','Swift White Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23222','Swift Yellow Mechanostrider','1','23227','Swift Palomino');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63638','Gnomeregan Mechanostrider','1','63232','Stormwind Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65642','Turbostrider','1','65640','Swift Gray Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10969','Blue Mechanostrider','3','6777','Gray Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17453','Green Mechanostrider','3','6898','White Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10873','Red Mechanostrider','3','6899','Brown Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23225','Swift Green Mechanostrider','3','23239','Swift Gray Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23223','Swift White Mechanostrider','3','23240','Swift White Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23222','Swift Yellow Mechanostrider','3','23238','Swift Brown Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63638','Gnomeregan Mechanostrider','3','63636','Ironforge Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65642','Turbostrider','3','65643','Swift Violet Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10969','Blue Mechanostrider','4','8394','Striped Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17453','Green Mechanostrider','4','10789','Spotted Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10873','Red Mechanostrider','4','10793','Striped Nightsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17454','Unpainted Mechanostrider','4','66847','Striped Dawnsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23225','Swift Green Mechanostrider','4','23338','Swift Stormsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23223','Swift White Mechanostrider','4','23219','Swift Mistsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23222','Swift Yellow Mechanostrider','4','23221','Swift Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63638','Gnomeregan Mechanostrider','4','63637','Darnassian Nightsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65642','Turbostrider','4','65638','Swift Moonsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10969','Blue Mechanostrider','11','34406','Brown Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','17453','Green Mechanostrider','11','35710','Gray Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','10873','Red Mechanostrider','11','35711','Purple Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23225','Swift Green Mechanostrider','11','35713','Great Blue Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23223','Swift White Mechanostrider','11','35712','Great Green Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','23222','Swift Yellow Mechanostrider','11','35714','Great Purple Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','63638','Gnomeregan Mechanostrider','11','63639','Exodar Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('7','65642','Turbostrider','11','65637','Great Red Elekk');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','34406','Brown Elekk','1','472','Pinto');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35710','Gray Elekk','1','6648','Chestnut Mare');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35711','Purple Elekk','1','458','Brown Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35713','Great Blue Elekk','1','23229','Swift Brown Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35712','Great Green Elekk','1','23228','Swift White Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35714','Great Purple Elekk','1','23227','Swift Palomino');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63639','Exodar Elekk','1','63232','Stormwind Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65637','Great Red Elekk','1','65640','Swift Gray Steed');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','34406','Brown Elekk','3','6777','Gray Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35710','Gray Elekk','3','6898','White Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35711','Purple Elekk','3','6899','Brown Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35713','Great Blue Elekk','3','23239','Swift Gray Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35712','Great Green Elekk','3','23240','Swift White Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35714','Great Purple Elekk','3','23238','Swift Brown Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63639','Exodar Elekk','3','63636','Ironforge Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65637','Great Red Elekk','3','65643','Swift Violet Ram');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','34406','Brown Elekk','4','8394','Striped Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35710','Gray Elekk','4','10789','Spotted Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35711','Purple Elekk','4','10793','Striped Nightsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35713','Great Blue Elekk','4','23338','Swift Stormsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35712','Great Green Elekk','4','23219','Swift Mistsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35714','Great Purple Elekk','4','23221','Swift Frostsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63639','Exodar Elekk','4','63637','Darnassian Nightsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65637','Great Red Elekk','4','65638','Swift Moonsaber');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','34406','Brown Elekk','7','10969','Blue Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35710','Gray Elekk','7','17453','Green Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35711','Purple Elekk','7','10873','Red Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35713','Great Blue Elekk','7','23225','Swift Green Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35712','Great Green Elekk','7','23223','Swift White Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','35714','Great Purple Elekk','7','23222','Swift Yellow Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','63639','Exodar Elekk','7','63638','Gnomeregan Mechanostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('11','65637','Great Red Elekk','7','65642','Turbostrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','580','Timber Wolf','5','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','6653','Dire Wolf','5','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','6654','Brown Wolf','5','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','64658','Black Wolf','5','17462','Red Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23250','Swift Brown Wolf','5','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23252','Swift Gray Wolf','5','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23251','Swift Timber Wolf','5','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','63640','Orgrimmar Wolf','5','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','65646','Swift Burgundy Wolf','5','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','580','Timber Wolf','6','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','6653','Dire Wolf','6','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','6654','Brown Wolf','6','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23250','Swift Brown Wolf','6','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23252','Swift Gray Wolf','6','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23251','Swift Timber Wolf','6','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','63640','Orgrimmar Wolf','6','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','65646','Swift Burgundy Wolf','6','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','580','Timber Wolf','8','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','6653','Dire Wolf','8','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','6654','Brown Wolf','8','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23250','Swift Brown Wolf','8','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23252','Swift Gray Wolf','8','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23251','Swift Timber Wolf','8','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','63640','Orgrimmar Wolf','8','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','65646','Swift Burgundy Wolf','8','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','580','Timber Wolf','10','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','6653','Dire Wolf','10','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','6654','Brown Wolf','10','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','64658','Black Wolf','10','35018','Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23250','Swift Brown Wolf','10','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23252','Swift Gray Wolf','10','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','23251','Swift Timber Wolf','10','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','63640','Orgrimmar Wolf','10','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('2','65646','Swift Burgundy Wolf','10','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','64977','Black Skeletal Horse','2','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17464','Brown Skeletal Horse','2','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17463','Blue Skeletal Horse','2','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17462','Red Skeletal Horse','2','64658','Black Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17465','Green Skeletal Warhorse','2','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','23246','Purple Skeletal Warhorse','2','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','66846','Ochre Skeletal Warhorse','2','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','63643','Forsaken Warhorse','2','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','65645','White Skeletal Warhorse','2','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','64977','Black Skeletal Horse','6','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17464','Brown Skeletal Horse','6','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17463','Blue Skeletal Horse','6','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17465','Green Skeletal Warhorse','6','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','23246','Purple Skeletal Warhorse','6','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','66846','Ochre Skeletal Warhorse','6','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','63643','Forsaken Warhorse','6','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','65645','White Skeletal Warhorse','6','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','64977','Black Skeletal Horse','8','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17464','Brown Skeletal Horse','8','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17463','Blue Skeletal Horse','8','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17465','Green Skeletal Warhorse','8','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','23246','Purple Skeletal Warhorse','8','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','66846','Ochre Skeletal Warhorse','8','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','63643','Forsaken Warhorse','8','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','65645','White Skeletal Warhorse','8','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','64977','Black Skeletal Horse','10','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17464','Brown Skeletal Horse','10','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17463','Blue Skeletal Horse','10','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17462','Red Skeletal Horse','10','35018','Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','17465','Green Skeletal Warhorse','10','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','23246','Purple Skeletal Warhorse','10','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','66846','Ochre Skeletal Warhorse','10','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','63643','Forsaken Warhorse','10','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('5','65645','White Skeletal Warhorse','10','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','18990','Brown Kodo','2','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','18989','Gray Kodo','2','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','64657','White Kodo','2','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23249','Great Brown Kodo','2','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23248','Great Gray Kodo','2','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23247','Great White Kodo','2','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','63641','Thunder Bluff Kodo','2','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','65641','Great Golden Kodo','2','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','18990','Brown Kodo','5','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','18989','Gray Kodo','5','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','64657','White Kodo','5','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23249','Great Brown Kodo','5','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23248','Great Gray Kodo','5','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23247','Great White Kodo','5','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','63641','Thunder Bluff Kodo','5','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','65641','Great Golden Kodo','5','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','18990','Brown Kodo','8','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','18989','Gray Kodo','8','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','64657','White Kodo','8','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23249','Great Brown Kodo','8','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23248','Great Gray Kodo','8','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23247','Great White Kodo','8','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','63641','Thunder Bluff Kodo','8','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','65641','Great Golden Kodo','8','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','18990','Brown Kodo','10','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','18989','Gray Kodo','10','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','64657','White Kodo','10','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23249','Great Brown Kodo','10','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23248','Great Gray Kodo','10','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','23247','Great White Kodo','10','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','63641','Thunder Bluff Kodo','10','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('6','65641','Great Golden Kodo','10','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','8395','Emerald Raptor','2','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','10796','Turquoise Raptor','2','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','10799','Violet Raptor','2','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23241','Swift Blue Raptor','2','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23242','Swift Olive Raptor','2','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23243','Swift Orange Raptor','2','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','63635','Darkspear Raptor','2','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','65644','Swift Purple Raptor','2','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','8395','Emerald Raptor','5','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','10796','Turquoise Raptor','5','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','10799','Violet Raptor','5','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23241','Swift Blue Raptor','5','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23242','Swift Olive Raptor','5','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23243','Swift Orange Raptor','5','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','63635','Darkspear Raptor','5','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','65644','Swift Purple Raptor','5','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','8395','Emerald Raptor','6','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','10796','Turquoise Raptor','6','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','10799','Violet Raptor','6','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23241','Swift Blue Raptor','6','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23242','Swift Olive Raptor','6','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23243','Swift Orange Raptor','6','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','63635','Darkspear Raptor','6','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','65644','Swift Purple Raptor','6','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','8395','Emerald Raptor','10','35022','Black Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','10796','Turquoise Raptor','10','35020','Blue Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','10799','Violet Raptor','10','34795','Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23241','Swift Blue Raptor','10','35025','Swift Green Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23242','Swift Olive Raptor','10','35027','Swift Purple Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','23243','Swift Orange Raptor','10','33660','Swift Pink Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','63635','Darkspear Raptor','10','63642','Silvermoon Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('8','65644','Swift Purple Raptor','10','65639','Swift Red Hawkstrider');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35022','Black Hawkstrider','2','580','Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35020','Blue Hawkstrider','2','6653','Dire Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','34795','Red Hawkstrider','2','6654','Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35018','Purple Hawkstrider','2','64658','Black Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35025','Swift Green Hawkstrider','2','23250','Swift Brown Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35027','Swift Purple Hawkstrider','2','23252','Swift Gray Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','33660','Swift Pink Hawkstrider','2','23251','Swift Timber Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','63642','Silvermoon Hawkstrider','2','63640','Orgrimmar Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','65639','Swift Red Hawkstrider','2','65646','Swift Burgundy Wolf');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35022','Black Hawkstrider','5','64977','Black Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35020','Blue Hawkstrider','5','17464','Brown Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','34795','Red Hawkstrider','5','17463','Blue Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35018','Purple Hawkstrider','5','17462','Red Skeletal Horse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35025','Swift Green Hawkstrider','5','17465','Green Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35027','Swift Purple Hawkstrider','5','23246','Purple Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','33660','Swift Pink Hawkstrider','5','66846','Ochre Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','63642','Silvermoon Hawkstrider','5','63643','Forsaken Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','65639','Swift Red Hawkstrider','5','65645','White Skeletal Warhorse');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35022','Black Hawkstrider','6','18990','Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35020','Blue Hawkstrider','6','18989','Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','34795','Red Hawkstrider','6','64657','White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35025','Swift Green Hawkstrider','6','23249','Great Brown Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35027','Swift Purple Hawkstrider','6','23248','Great Gray Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','33660','Swift Pink Hawkstrider','6','23247','Great White Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','63642','Silvermoon Hawkstrider','6','63641','Thunder Bluff Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','65639','Swift Red Hawkstrider','6','65641','Great Golden Kodo');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35022','Black Hawkstrider','8','8395','Emerald Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35020','Blue Hawkstrider','8','10796','Turquoise Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','34795','Red Hawkstrider','8','10799','Violet Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35025','Swift Green Hawkstrider','8','23241','Swift Blue Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','35027','Swift Purple Hawkstrider','8','23242','Swift Olive Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','33660','Swift Pink Hawkstrider','8','23243','Swift Orange Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','63642','Silvermoon Hawkstrider','8','63635','Darkspear Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('10','65639','Swift Red Hawkstrider','8','65644','Swift Purple Raptor');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67065','Pattern: Royal Moonshroud Bracers','0','67147','Pattern: Royal Moonshroud Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67086','Pattern: Knightbane Carapace','0','67142','Pattern: Knightbane Carapace');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67084','Pattern: Lunar Eclipse Chestguard','0','67140','Pattern: Lunar Eclipse Chestguard');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67085','Pattern: Moonshadow Armguards','0','67141','Pattern: Moonshadow Armguards');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67080','Pattern: Ensorcelled Nerubian Breastplate','0','67136','Pattern: Ensorcelled Nerubian Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67064','Pattern: Royal Moonshroud Robe','0','67144','Pattern: Royal Moonshroud Robe');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67081','Pattern: Black Chitin Bracers','0','67137','Pattern: Black Chitin Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67093','Plans: Titanium Razorplate','0','67132','Plans: Titanium Razorplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67095','Plans: Sunforged Breastplate','0','67134','Plans: Sunforged Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67087','Pattern: Bracers of Swift Death','0','67139','Pattern: Bracers of Swift Death');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67082','Pattern: Crusader\'s Dragonscale Breastplate','0','67138','Pattern: Crusader\'s Dragonscale Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67079','Pattern: Bejeweled Wizard\'s Bracers','0','67145','Pattern: Bejeweled Wizard\'s Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67094','Plans: Titanium Spikeguards','0','67133','Plans: Titanium Spikeguards');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67066','Pattern: Merlin\'s Robe','0','67146','Pattern: Merlin\'s Robe');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67083','Pattern: Crusader\'s Dragonscale Bracers','0','67143','Pattern: Crusader\'s Dragonscale Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67092','Plans: Saronite Swordbreakers','0','67131','Plans: Saronite Swordbreakers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67091','Plans: Breastplate of the White Knight','0','67130','Plans: Breastplate of the White Knight');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67096','Plans: Sunforged Bracers','0','67135','Plans: Sunforged Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67065','Pattern: Royal Moonshroud Bracers','0','67147','Pattern: Royal Moonshroud Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67086','Pattern: Knightbane Carapace','0','67142','Pattern: Knightbane Carapace');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67084','Pattern: Lunar Eclipse Chestguard','0','67140','Pattern: Lunar Eclipse Chestguard');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67085','Pattern: Moonshadow Armguards','0','67141','Pattern: Moonshadow Armguards');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67080','Pattern: Ensorcelled Nerubian Breastplate','0','67136','Pattern: Ensorcelled Nerubian Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67064','Pattern: Royal Moonshroud Robe','0','67144','Pattern: Royal Moonshroud Robe');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67081','Pattern: Black Chitin Bracers','0','67137','Pattern: Black Chitin Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67093','Plans: Titanium Razorplate','0','67132','Plans: Titanium Razorplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67095','Plans: Sunforged Breastplate','0','67134','Plans: Sunforged Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67087','Pattern: Bracers of Swift Death','0','67139','Pattern: Bracers of Swift Death');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67082','Pattern: Crusader\'s Dragonscale Breastplate','0','67138','Pattern: Crusader\'s Dragonscale Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67079','Pattern: Bejeweled Wizard\'s Bracers','0','67145','Pattern: Bejeweled Wizard\'s Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67094','Plans: Titanium Spikeguards','0','67133','Plans: Titanium Spikeguards');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67066','Pattern: Merlin\'s Robe','0','67146','Pattern: Merlin\'s Robe');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67083','Pattern: Crusader\'s Dragonscale Bracers','0','67143','Pattern: Crusader\'s Dragonscale Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67092','Plans: Saronite Swordbreakers','0','67131','Plans: Saronite Swordbreakers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67091','Plans: Breastplate of the White Knight','0','67130','Plans: Breastplate of the White Knight');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67096','Plans: Sunforged Bracers','0','67135','Plans: Sunforged Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67065','Pattern: Royal Moonshroud Bracers','0','67147','Pattern: Royal Moonshroud Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67086','Pattern: Knightbane Carapace','0','67142','Pattern: Knightbane Carapace');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67084','Pattern: Lunar Eclipse Chestguard','0','67140','Pattern: Lunar Eclipse Chestguard');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67085','Pattern: Moonshadow Armguards','0','67141','Pattern: Moonshadow Armguards');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67080','Pattern: Ensorcelled Nerubian Breastplate','0','67136','Pattern: Ensorcelled Nerubian Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67064','Pattern: Royal Moonshroud Robe','0','67144','Pattern: Royal Moonshroud Robe');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67081','Pattern: Black Chitin Bracers','0','67137','Pattern: Black Chitin Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67093','Plans: Titanium Razorplate','0','67132','Plans: Titanium Razorplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67095','Plans: Sunforged Breastplate','0','67134','Plans: Sunforged Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67087','Pattern: Bracers of Swift Death','0','67139','Pattern: Bracers of Swift Death');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67082','Pattern: Crusader\'s Dragonscale Breastplate','0','67138','Pattern: Crusader\'s Dragonscale Breastplate');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67079','Pattern: Bejeweled Wizard\'s Bracers','0','67145','Pattern: Bejeweled Wizard\'s Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67094','Plans: Titanium Spikeguards','0','67133','Plans: Titanium Spikeguards');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67066','Pattern: Merlin\'s Robe','0','67146','Pattern: Merlin\'s Robe');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67083','Pattern: Crusader\'s Dragonscale Bracers','0','67143','Pattern: Crusader\'s Dragonscale Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67092','Plans: Saronite Swordbreakers','0','67131','Plans: Saronite Swordbreakers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67091','Plans: Breastplate of the White Knight','0','67130','Plans: Breastplate of the White Knight');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','67096','Plans: Sunforged Bracers','0','67135','Plans: Sunforged Bracers');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','33690','Teleport: Shattrath(A)','0','35715','Teleport: Shattrath(H)');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','33691','Portal: Shattrath(A)','0','35717','Portal: Shattrath(H)');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62737','Ironforge Banner','0','62738','Sen\'jin Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62741','Gnomeregan Banner','0','62745','Thunder Bluff Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62736','Stormwind Banner','0','62742','Orgrimmar Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62739','Darnassus Banner','0','62743','Undercity Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62740','Exodar Banner','0','62744','Silvermoon City Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62737','Ironforge Banner','0','62738','Sen\'jin Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62741','Gnomeregan Banner','0','62745','Thunder Bluff Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62736','Stormwind Banner','0','62742','Orgrimmar Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62739','Darnassus Banner','0','62743','Undercity Banner');
insert into `player_factionchange_spells` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) values('0','62740','Exodar Banner','0','62744','Silvermoon City Banner');

-- C37_achievement_criteria_requirement.sql
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (3685,3879,3880,7020,7021);
INSERT INTO achievement_criteria_requirement (criteria_id,TYPE,value1) VALUES
	-- Stormtrooper
(3685,6,3820),
(3685,7,34976),
	-- Take a Chill Pill
(3879,6,3820),
(3879,7,23505),
	-- Not So Fast
(3880,6,3277),
(3880,7,23451),
	-- Not In My House
(7020,6,3321),
(7020,7,23335),
(7021,6,3320),
(7021,7,23333);

	-- We Had It All Along *cough*
UPDATE achievement_criteria_requirement SET value1 = 1590, value2 = 1590 WHERE criteria_id = 1235;

	-- Children' Week achievements
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (6651,6652,6653,6654,6655,6656,6657,12398,6659,10391,6641,6642,6643,6644);
INSERT INTO achievement_criteria_requirement (criteria_id,TYPE,value1) VALUES
(6651,16,201),
(6652,16,201),
(6653,16,201),
(6654,16,201),
(6655,16,201),
(6656,16,201),
(6657,16,201),
(12398,16,201),
(6659,16,201),
(10391,16,201),
(6641,16,201),
(6642,16,201),
(6643,16,201),
(6644,16,201);