############################################################################
#
#							SQL	Updatepack
#						world database (from SD2)
#
#							  15-07-2010
#
############################################################################


####
# addition (author: insider42 & rsa)
####

-- 1_mangos_naxxramass.sql
UPDATE `creature_template` SET `ScriptName`='mob_loatheb_spores' WHERE `entry`=16286;
UPDATE `creature_template` SET `ScriptName`='boss_gothik' WHERE `entry`=16060;
UPDATE `creature_template` SET `ScriptName`='mob_gothik_trainee' WHERE `entry` IN (16124,16127);
UPDATE `creature_template` SET `ScriptName`='mob_gothik_dk' WHERE `entry` IN (16125,16148);
UPDATE `creature_template` SET `ScriptName`='mob_gothik_rider' WHERE `entry` IN (16126,16150);

-- 1_mangos_vault_of_archavon.sql
UPDATE `creature_template` SET `ScriptName`='boss_archavon' WHERE `entry`=31125;
UPDATE `creature_template` SET `ScriptName`='boss_emalon' WHERE `entry`=33993;
UPDATE `creature_template` SET `ScriptName`='npc_tempest_minion' WHERE `entry`=33998;
UPDATE `creature_template` SET `ScriptName`='npc_tempest_warder' WHERE `entry`=34015;
UPDATE `creature_template` SET `ScriptName`='boss_koralon' WHERE `entry`=35013;
UPDATE `creature_template` SET `AIName`='', ScriptName='boss_toravon' WHERE `entry`=38433;
UPDATE `instance_template` SET `script`='instance_vault_of_archavon' WHERE `map`=624;
DELETE FROM `spell_script_target` WHERE `entry` IN (72034,72096);
INSERT INTO `spell_script_target` VALUES (72034,1,38433),(72096,1,38433);

-- 3_mangos_teleguy.sql
/*	not for repo
DELETE FROM `creature_template` WHERE `entry`=99001;
insert into `creature_template` values ('99001','0','0','0','0','0','18','0','18','0','Slappy McFry','The Teleport Guy',NULL,'0','59','61','6700','24000','5598','5875','20','35','35','1','1.48','1.48','0','0','181','189','0','158','1','1400','1900','0','0','0','0','0','0','0','0','0','0','100','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','1','3','1','1','0','0','0','0','0','0','0','0','1','0','0','0','teleguy');
*/

-- 4_mangos_arena_honor.sql
/*	not for repo
DELETE FROM `creature_template` WHERE `entry`=7;
INSERT INTO `creature_template` VALUES ('7','0','0','0','0','0','17858','0','17858','0','Besdoban Durnoye','Arena-Honor Exchange',NULL,'0','59','61','6700','24000','5598','5875','20','35','35','1','1.48','1.48','0','0','170','182','0','1235','1','1400','1900','0','0','0','0','0','0','0','0','0','0','100','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','1','3','0','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_arena_honor');
*/

-- 7_mangos_ulduar.sql
UPDATE `creature_template` SET `ScriptName`='boss_razorscale' WHERE `entry`=33186;
UPDATE `creature_template` SET `ScriptName`='boss_ignis' WHERE `entry`=33118;
UPDATE `creature_template` SET `ScriptName`='boss_xt002' WHERE `entry`=33293;
UPDATE `creature_template` SET `ScriptName`='boss_flame_leviathan' WHERE `entry`=33113;
UPDATE `creature_template` SET `ScriptName`='boss_auriaya' WHERE `entry`=33515;
UPDATE `creature_template` SET `ScriptName`='boss_kologarn' WHERE `entry`=32930;
UPDATE `creature_template` SET `ScriptName`='boss_kologarn_left_arm' WHERE `entry`=32933;
UPDATE `creature_template` SET `ScriptName`='boss_kologarn_right_arm' WHERE `entry`=32934;
UPDATE `creature_template` SET `ScriptName`='boss_steelbreaker' WHERE `entry`=32867;
UPDATE `creature_template` SET `ScriptName`='boss_molgeim' WHERE `entry`=32927;
UPDATE `creature_template` SET `ScriptName`='boss_brundir' WHERE `entry`=32857;
UPDATE `creature_template` SET `ScriptName`='boss_thorim' WHERE `entry`=32865;
UPDATE `creature_template` SET `ScriptName`='boss_hodir' WHERE `entry`=32845;
UPDATE `creature_template` SET `ScriptName`='boss_freya' WHERE `entry`=32906;
UPDATE `creature_template` SET `ScriptName`='boss_mimiron' WHERE `entry`=33350;
UPDATE `creature_template` SET `ScriptName`='boss_vezax' WHERE `entry`=33271;
UPDATE `creature_template` SET `ScriptName`='boss_yogg_saron' WHERE `entry`=33288;
UPDATE `creature_template` SET `ScriptName`='boss_algalon' WHERE `entry`=32871;
UPDATE `instance_template` SET `script`='instance_ulduar' WHERE `map`=603;

DELETE FROM `creature` WHERE `id` = 99005;
DELETE FROM `creature_template` WHERE `entry` = 99005;
DELETE FROM `creature_template_addon` WHERE `entry` = 99005;

UPDATE `gameobject_template` SET `flags` = 0, `ScriptName` = 'go_ulduar_teleporter' WHERE `entry`  IN (194569);

-- 712_halls_of_stone_mangos.sql
UPDATE `creature_template` SET `ScriptName` = 'boss_krystallus' WHERE `entry` =27977 LIMIT 1 ;

UPDATE `gameobject` SET `state` = '1' WHERE `guid` =53556;
UPDATE `gameobject` SET `state` = '1' WHERE `guid` =53560;

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `entry` =191293;
UPDATE `gameobject_template` SET `faction` = '0', `flags` = '0'  WHERE `entry` IN (193996,190586);
UPDATE `gameobject` SET `phaseMask` = '65535' WHERE `guid` =37577;
UPDATE `gameobject` SET `phaseMask` = '65535' WHERE `guid` =37583;

-- 715_trial_of_the_champion_mangos.sql
	-- instance
UPDATE instance_template SET script='instance_trial_of_the_champion' WHERE map=650;

	-- announcers
UPDATE creature_template SET npcflag=1, scriptname='npc_toc5_announcer' WHERE entry IN (35004, 35005);

	-- grand champions
UPDATE creature_template SET scriptname='mob_toc5_warrior' WHERE entry IN (34705, 35572);
UPDATE creature_template SET scriptname='mob_toc5_mage' WHERE entry IN (34702, 35569);
UPDATE creature_template SET scriptname='mob_toc5_shaman' WHERE entry IN (34701, 35571);
UPDATE creature_template SET scriptname='mob_toc5_hunter' WHERE entry IN (34657, 35570);
UPDATE creature_template SET scriptname='mob_toc5_rogue' WHERE entry IN (34703, 35617);

	-- argent challenge
UPDATE creature_template SET scriptname='boss_eadric' WHERE entry=35119;
UPDATE creature_template SET scriptname='boss_paletress' WHERE entry=34928;
UPDATE creature_template SET scriptname='mob_toc5_memory' WHERE entry IN (35052, 35041, 35033, 35046, 35043, 35047, 35044, 35039, 35034, 35049, 35030, 34942, 35050, 35042, 35045, 35037, 35031, 35038, 35029, 35048, 35032, 35028, 35040, 35036, 35051);

	-- black knight
UPDATE creature_template SET faction_a=14, faction_h=14, scriptname='mob_toc5_risen_ghoul' WHERE entry IN (35545, 35564);
UPDATE creature_template SET scriptname='boss_black_knight' WHERE entry=35451;

	-- free spells for creatures
UPDATE `creature_template` SET `spell1` = '0',`spell2` = '0',`spell3` = '0',`spell4` = '0' WHERE `creature_template`.`entry` IN
(34705,34702,34701,34657,34703,35572,35569,35571,35570,35617,35119,34928,35451,35545,35564,35004,35005,35052,35041,35033,35046,35043,35047,35044,35039,35034,35049,35030,34942,35050,35042,35045,35037,35031,35038,35029,35048,35032,35028,35040,35036,35051);
UPDATE `creature_template` SET `spell1` = '0',`spell2` = '0',`spell3` = '0',`spell4` = '0' WHERE `creature_template`.`entry` IN
(12002,12001,12000,12003,12004,12010,12484,12485,12447,12454,12441,12438,12453,12443,12437,12445,12725,12452,12486,12442,12482,12440,12483,12451,12456,12449,12455,12450,12487,12446,12011,12012,12436,12005,12007,12006,12009,12008);

-- 716_the_violet_hold_mangos.sql
/* VIOLET HOLD */
UPDATE `instance_template` SET `script`='instance_violet_hold' WHERE `map`=608;
UPDATE `creature_template` SET `ScriptName`='npc_sinclari', `npcflag`=1,`minhealth`=50400, `maxhealth`=50400 WHERE `entry`='30658'; -- 64
UPDATE `creature_template` SET `ScriptName`='npc_azure_saboteur' WHERE `entry`='31079';
UPDATE `creature_template` SET `ScriptName`='boss_cyanigosa' WHERE `entry`='31134';
UPDATE `creature_template` SET `ScriptName`='boss_erekem' WHERE `entry`='29315';
UPDATE `creature_template` SET `ScriptName`='mob_erekem_guard' WHERE `entry`='29395';
UPDATE `creature_template` SET `ScriptName`='boss_ichoron' WHERE `entry`='29313';
UPDATE `creature_template` SET `ScriptName`='mob_ichor_globule',`modelid_A`=5492, `modelid_H`=5492 WHERE `entry`='29321';
UPDATE `creature_template` SET `modelid_A`=5492, `modelid_H`=5492 WHERE `entry`='31515'; -- heroic
UPDATE `creature_template` SET `ScriptName`='boss_lavanthor' WHERE `entry`='29312';
UPDATE `creature_template` SET `ScriptName`='boss_moragg' WHERE `entry`='29316';
UPDATE `creature_template` SET `ScriptName`='boss_xevozz' WHERE `entry`='29266';
UPDATE `creature_template` SET `ScriptName`='mob_ethereal_sphere' WHERE `entry`='29271';
UPDATE `creature_template` SET `ScriptName`='boss_zuramat' WHERE `entry`='29314';
UPDATE `creature_template` SET `ScriptName`='mob_zuramat_sentry' WHERE `entry`='29364';
UPDATE `creature_template` SET `ScriptName`='npc_violet_portal' WHERE `entry`='31011';

DELETE FROM `creature` WHERE map = 608 AND `id`='31011';
DELETE FROM `creature` WHERE map = 608 AND `id`='31134'; -- cyanigosa should not spawn
UPDATE `gameobject_template` SET `flags`=`flags`|4 WHERE `entry` IN (191723,191564,191563,191562,191606,191722,191556,191566,191565); -- door untargetable

UPDATE `creature_template` SET AIName='EventAI',`ScriptName`='' WHERE `entry` IN ('30660','30695','30666','30668','30667','32191');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN ('30660','30695','30666','30668','30667','32191');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(3066001, 30660, 0, 0, 100, 7, 5000, 7000, 6000, 9000, 11, 58504, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Guardian - Cast Agonizing Strike'),
(3066002, 30660, 0, 0, 100, 7, 7000, 12000, 9000, 11000, 11, 58508, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Guardian - Cast Side Swipe'),
(3066601, 30666, 1, 0, 100, 6, 1000, 1000, 0, 0, 11, 58040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Captain - Cast Destroy Door Seal on Spawn'),
(3066602, 30666, 9, 0, 100, 7, 0, 5, 5000, 9000, 11, 41056, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Captain - Cast Whirlwind'),
(3066603, 30666, 0, 0, 100, 7, 3000, 6000, 7000, 10000, 11, 32736, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Captain - Cast Mortal Strike'),
(3066701, 30667, 1, 0, 100, 6, 0, 0, 0, 0, 21, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror - Prevent Combat Movement and Set Phase to 0 on Spawn'),
(3066702, 30667, 1, 0, 100, 6, 1000, 1000, 0, 0, 11, 58040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror - Cast Destroy Door Seal on Spawn'),
(3066703, 30667, 4, 0, 100, 2, 0, 0, 0, 0, 11, 60181, 4, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Azure Sorceror (Normal) - Cast Arcane Stream and Set Phase 1 on Aggro'),
(3066704, 30667, 9, 5, 100, 3, 5, 35, 6000, 8000, 11, 60181, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror (Normal) - Cast Arcane Stream (Phase 1)'),
(3066705, 30667, 4, 0, 100, 4, 0, 0, 0, 0, 11, 60204, 4, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Azure Sorceror (Heroic) - Cast Arcane Stream and Set Phase 1 on Aggro'),
(3066706, 30667, 9, 5, 100, 5, 5, 35, 6000, 8000, 11, 60204, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror (Heroic) - Cast Arcane Stream (Phase 1)'),
(3066707, 30667, 3, 5, 100, 6, 7, 0, 0, 0, 21, 1, 0, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Azure Sorceror - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
(3066708, 30667, 9, 5, 100, 6, 30, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror - Start Combat Movement at 30 Yards (Phase 1)'),
(3066709, 30667, 9, 5, 100, 6, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror - Prevent Combat Movement at 15 Yards (Phase 1)'),
(3066710, 30667, 9, 5, 100, 6, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror - Start Combat Movement Below 5 Yards'),
(3066711, 30667, 9, 0, 100, 3, 0, 8, 9000, 15000, 11, 60182, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror (Normal) - Cast Mana Detonation'),
(3066712, 30667, 9, 0, 100, 5, 0, 8, 9000, 15000, 11, 60205, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror (Heroic) - Cast Mana Detonation'),
(3066713, 30667, 3, 3, 100, 7, 100, 15, 100, 100, 23, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror - Set Phase 1 when Mana is above 15% (Phase 2)'),
(3066714, 30667, 7, 0, 100, 6, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Sorceror - Set Phase to 0 on Evade'),
(3066801, 30668, 1, 0, 100, 6, 1000, 1000, 0, 0, 11, 58040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Raider - Cast Destroy Door Seal on Spawn'),
(3066802, 30668, 9, 0, 100, 7, 0, 8, 9000, 14000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Raider - Cast Concussion Blow'),
(3066803, 30668, 0, 0, 100, 7, 7000, 14000, 12000, 18000, 11, 60158, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Raider - Cast Magic Reflection'),
(3069501, 30695, 1, 0, 100, 6, 0, 0, 0, 0, 21, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper - Prevent Combat Movement and Set Phase to 0 on Spawn'),
(3069502, 30695, 4, 0, 100, 2, 0, 0, 0, 0, 11, 58531, 1, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Portal Keeper (Normal) - Cast Arcane Missiles and Set Phase 1 on Aggro'),
(3069503, 30695, 9, 5, 100, 3, 0, 45, 6000, 8000, 11, 58531, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper (Normal) - Cast Arcane Missiles (Phase 1)'),
(3069504, 30695, 4, 0, 100, 4, 0, 0, 0, 0, 11, 61593, 1, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Portal Keeper (Heroic) - Cast Arcane Missiles and Set Phase 1 on Aggro'),
(3069505, 30695, 9, 5, 100, 5, 0, 45, 6000, 8000, 11, 61593, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper (Heroic) - Cast Arcane Missiles (Phase 1)'),
(3069506, 30695, 3, 5, 100, 6, 7, 0, 0, 0, 21, 1, 0, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Portal Keeper - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
(3069507, 30695, 9, 5, 100, 6, 40, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper - Start Combat Movement at 40 Yards (Phase 1)'),
(3069508, 30695, 9, 5, 100, 6, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper - Prevent Combat Movement at 15 Yards (Phase 1)'),
(3069509, 30695, 9, 5, 100, 6, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper - Start Combat Movement Below 5 Yards'),
(3069510, 30695, 9, 0, 100, 3, 0, 8, 13000, 19000, 11, 58532, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper (Normal) - Cast Frostbolt Volley'),
(3069511, 30695, 9, 0, 100, 5, 0, 8, 13000, 19000, 11, 61594, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper (Heroic) - Cast Frostbolt Volley'),
(3069512, 30695, 0, 0, 100, 7, 0, 8, 9000, 14000, 11, 58534, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper - Cast Deep Freeze'),
(3069513, 30695, 3, 3, 100, 7, 100, 15, 100, 100, 23, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper - Set Phase 1 when Mana is above 15% (Phase 2)'),
(3069514, 30695, 7, 0, 100, 6, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Portal Keeper - Set Phase to 0 on Evade'),
(3219101, 32191, 1, 0, 100, 6, 1000, 1000, 0, 0, 11, 58040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Stalker - Cast Destroy Door Seal on Spawn'),
(3219102, 32191, 9, 0, 100, 7, 0, 5, 5000, 7000, 11, 58471, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Stalker - Cast Backstab'),
(3219103, 32191, 0, 0, 100, 7, 11000, 16000, 13000, 21000, 11, 58470, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Azure Stalker - Cast Tactical Blink');

DELETE FROM `spell_script_target` WHERE `entry` IN (54160,59474);
INSERT INTO `spell_script_target` VALUES (54160, 1, 29266);
INSERT INTO `spell_script_target` VALUES (59474, 1, 29266);

UPDATE `creature_template` SET `ScriptName`='npc_door_seal_vh', `unit_flags`=33816580 WHERE `entry`=30896;
UPDATE `creature_template` SET `faction_A`=35, faction_H=35 WHERE `entry`=30658;
UPDATE `creature_template` SET `faction_A`=1720, faction_H=1720, `ScriptName`='mob_vh_dragons', `minlevel`=70,`maxlevel`=70,`minhealth`=7000,`maxhealth`=8000  WHERE `entry` IN (30660, 30661, 30662, 30663, 30664, 30666, 30667, 30668, 32191, 30695);

-- 717_culling_of_stratholme_mangos.sql
	-- Remove old versions
DELETE FROM `creature` WHERE `guid` IN (4456649,4456653,4458724,4458725,4458738,4458739,4458740,4458741,4459981,4459615);
DELETE FROM `creature` WHERE `id` IN (27731,27734,28249,27736,27915,30571,26499,26497,26528,27891,27892,27884,32273,28439);

UPDATE `creature` SET `spawntimesecs`= 36000 WHERE `id` IN (31127, 31126, 28167, 28169);
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) values('58825','1','27733');
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) values('35481','4100','0','0','0','0','0','1','1');
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) values('35480','4100','0','0','0','0','0','0','1');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('58825', '1', '27733');

UPDATE `instance_template` SET `script` = 'instance_culling_of_stratholme' WHERE map=595;

UPDATE `creature_template` SET `ScriptName`='npc_mike' WHERE entry=30571;
UPDATE `creature_template` SET `ScriptName`='npc_chromi_start' WHERE entry=26527;
UPDATE `creature_template` SET `ScriptName`='npc_roger' WHERE entry=27903;
UPDATE `creature_template` SET `ScriptName`='npc_morigan' WHERE entry=27877;
UPDATE `creature_template` SET `ScriptName`='npc_stratholme_crates' WHERE entry=30996;
UPDATE `creature_template` SET `ScriptName`='npc_jena' WHERE entry=27885;
UPDATE `creature_template` SET `ScriptName`='npc_malcolm' WHERE entry=27891;
UPDATE `creature_template` SET `ScriptName`='npc_bartleby_cs' WHERE entry=27907;
UPDATE `creature_template` SET `ScriptName`='npc_chromi_middle' WHERE entry=27915;
UPDATE `creature_template` SET `ScriptName`='npc_uther' WHERE entry=26528;
UPDATE `creature_template` SET `ScriptName`='npc_arthas' WHERE entry=26499;
UPDATE `creature_template` SET `ScriptName`='npc_arthas_priest' WHERE entry=27747;
UPDATE `creature_template` SET `ScriptName`='npc_arthas_marine' WHERE entry=27745;
UPDATE `creature_template` SET `ScriptName`='npc_dark_conversion' WHERE entry IN (31127, 31126, 28167, 28169);
UPDATE `creature_template` SET `ScriptName`='npc_cs_gnoul' WHERE entry=28249;
UPDATE `creature_template` SET `ScriptName`='npc_cs_necromancer' WHERE entry=28200;
UPDATE `creature_template` SET `ScriptName`='npc_cs_field' WHERE entry=27734;
UPDATE `creature_template` SET `ScriptName`='npc_cs_acolyte' WHERE entry=27731;
UPDATE `creature_template` SET `ScriptName`='npc_cs_butcher' WHERE entry=27736;
UPDATE `creature_template` SET `ScriptName`='boss_meathook' WHERE entry=26529;
UPDATE `creature_template` SET `ScriptName`='boss_salramm' WHERE entry=26530;
UPDATE `creature_template` SET `ScriptName`='npc_salramm_gnoul' WHERE entry=27733;
UPDATE `creature_template` SET `ScriptName`='boss_lord_epoch' WHERE entry=26532;
UPDATE `creature_template` SET `ScriptName`='boss_malganis' WHERE entry=26533;
UPDATE `creature_template` SET `ScriptName`='npc_time_riftCS' WHERE entry=28409;
UPDATE `creature_template` SET `ScriptName`='boss_infinite_corruptor' WHERE entry=32273;

DELETE FROM `creature` WHERE `id` in (27915, 26499, 26497, 26528, 27891, 27892, 32273, 28439);
INSERT INTO `creature` (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(27915, 595, 3, 1, 0, 0, 1812.49, 1284.81, 142.248, 4.03364, 300, 0, 0, 17010, 0, 0, 0),
(26499, 595, 3, 1, 0, 1613, 1920.87, 1287.12, 142.935, 6.25562, 43200, 0, 0, 44100, 7988, 0, 0),
(26497, 595, 3, 1, 0, 1221, 1896.39, 1292.91, 143.711, 0.016332, 25, 5, 0, 100800, 88140, 0, 0),
(26528, 595, 3, 1, 0, 1819, 1761.42, 1285.75, 139.945, 4.93874, 25, 5, 0, 126000, 59910, 0, 0),
(27891, 595, 3, 1, 0, 0, 1603.38, 805.988, 123.272, 1.90688, 25, 5, 0, 8982, 0, 0, 0),
(27892, 595, 3, 1, 0, 0, 1602.3, 809.385, 123.454, 5.02884, 25, 5, 0, 8982, 0, 0, 0),
(32273, 595, 2, 1, 0, 1839, 2330.93, 1275.59, 132.848, 3.60489, 86400, 5, 0, 417911, 0, 0, 0),
(28439, 595, 2, 1, 0, 0, 2336.56, 1277.9, 132.885, 3.47923, 25, 5, 0, 1, 0, 0, 0);

-- 718_draktharon_mangos.sql
DELETE FROM `creature` WHERE `id`=26712;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(927500, 26712, 600, 3, 1, 17188, 0, -365.477, -724.849, 32.2241, 3.92699, 3600, 5, 0, 4050, 0, 0, 1),
(927501, 26712, 600, 3, 1, 17188, 0, -365.368, -751.128, 32.3213, 2.35619, 3600, 5, 0, 4050, 0, 0, 1),
(927502, 26712, 600, 3, 1, 17188, 0, -392.123, -750.941, 32.2796, 0.680678, 3600, 5, 0, 4050, 0, 0, 1),
(927503, 26712, 600, 3, 1, 17188, 0, -392.455, -724.809, 32.1685, 5.35816, 3600, 5, 0, 4050, 0, 0, 1);

DELETE FROM `creature_template` WHERE (`entry`=26710);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (26710, 0, 0, 0, 0, 0, 2536, 1160, 9829, 14952, 'Channel Target', '', '', 0, 1, 1, 8, 8, 0, 0, 7, 190, 190, 0, 1, 1, 0, 2, 2, 0, 24, 7.5, 2000, 0, 1, 33587200, 0, 0, 0, 0, 0, 0, 1, 1, 100, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 0.2, 1, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=26712);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (26712, 0, 0, 0, 0, 0, 169, 0, 17188, 0, 'Crystal Channel Target', '', '', 0, 70, 70, 4050, 4050, 0, 0, 6719, 16, 16, 0, 1, 1, 0, 252, 357, 0, 304, 1, 2000, 0, 1, 33554436, 0, 0, 0, 0, 0, 0, 215, 320, 44, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'crystal_channel');

DELETE FROM `creature_template` WHERE (`entry`=26714);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (26714, 0, 0, 0, 0, 0, 2536, 1160, 9829, 14952, 'Dead Crystal Holder', '', '', 0, 1, 1, 8, 8, 0, 0, 7, 190, 190, 0, 1, 1, 0, 2, 2, 0, 24, 7.5, 2000, 0, 1, 32768, 0, 0, 0, 0, 0, 0, 1, 1, 100, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 0.2, 1, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, '');

/*King Dred*/

DELETE FROM creature WHERE id in (27709, 27753, 27490);

DELETE FROM `creature` WHERE `id`=26632;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(152490, 26632, 600, 3, 1, 0, 0, -237.176, -675.768, 131.866, 4.66859, 25, 0, 0, 512278, 4169, 0, 0);

DELETE FROM `creature_template` WHERE (`entry`=26632);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (26632, 31360, 0, 0, 0, 0, 27072, 0, 27072, 0, 'The Prophet Tharon\'ja', '', '', 76, 77, 275025, 275025, 0, 0, 0, 16, 16, 0, 1, 1, 1, 350, 450, 0, 400, 7.5, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 350, 450, 75, 6, 72, 26632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'boss_tharonja');

DELETE FROM `creature_template` WHERE (`entry`=31360);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (31360, 0, 0, 0, 0, 0, 27072, 0, 27072, 0, 'The Prophet Tharon\'ja (1)', '', '', 82, 82, 512278, 512278, 4169, 4169, 0, 16, 16, 0, 1, 1, 1, 450, 650, 0, 750, 13, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 350, 530, 100, 6, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 38, 1, 0, 43670, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, '');

DELETE FROM `spell_script_target` WHERE `entry` = 49555;
INSERT INTO `spell_script_target` VALUES (49555, 2, 27753);

UPDATE `creature_template` SET minhealth = 1885, maxhealth = 1885 WHERE entry = 27753;

DELETE FROM `creature_template` WHERE (`entry`=26627);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (26627, 31344, 0, 0, 0, 0, 24500, 0, 24500, 0, 'Crystal Handler', '', '', 0, 75, 75, 21270, 21270, 0, 0, 0, 15, 15, 0, 1, 1, 1, 500, 1000, 0, 500, 1, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 2.5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'crystal_handler');

DELETE FROM `creature_template` WHERE (`entry`=31344);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (31344, 0, 0, 0, 0, 0, 24500, 0, 24500, 0, 'Crystal Handler (1)', '', '', 0, 81, 81, 41704, 41704, 8979, 8979, 0, 15, 15, 0, 1, 1, 1, 1000, 1500, 0, 500, 2, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=27597);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (27597, 31348, 0, 0, 0, 0, 22337, 0, 22337, 0, 'Hulking Corpse', '', '', 0, 74, 74, 12338, 12338, 0, 0, 0, 15, 15, 0, 1, 1, 1, 500, 1000, 0, 500, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1.2, 1, 0, 0, 0, 0, 0, 0, 0, 88, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=31348);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (31348, 0, 0, 0, 0, 0, 22337, 0, 22337, 0, 'Hulking Corpse (1)', '', '', 0, 80, 80, 25200, 25200, 0, 0, 0, 15, 15, 0, 1, 1, 1, 1000, 1500, 0, 500, 2, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 88, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=27598);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (27598, 31873, 0, 0, 0, 0, 10978, 0, 10972, 0, 'Fetid Troll Corpse', '', '', 0, 74, 74, 2056, 2056, 0, 0, 0, 15, 15, 0, 1, 1, 0, 200, 400, 0, 500, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.2, 1, 0, 0, 0, 0, 0, 0, 0, 73, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=31873);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (31873, 0, 0, 0, 0, 0, 10978, 0, 10972, 0, 'Fetid Troll Corpse (1)', '', '', 0, 80, 80, 3780, 3780, 0, 0, 0, 15, 15, 0, 1, 1, 0, 500, 1000, 0, 500, 2, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.3, 1, 0, 0, 0, 0, 0, 0, 0, 73, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=27600);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (27600, 31356, 0, 0, 0, 0, 2606, 0, 2606, 0, 'Risen Shadowcaster', '', '', 0, 74, 74, 1645, 1645, 7809, 7809, 0, 15, 15, 0, 1, 1, 0, 200, 400, 0, 500, 1, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0.2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=31356);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (31356, 0, 0, 0, 0, 0, 2606, 0, 2606, 0, 'Risen Shadowcaster (1)', '', '', 0, 81, 81, 3128, 3128, 8979, 8979, 0, 15, 15, 0, 1, 1, 0, 500, 1000, 0, 500, 2, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0.3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

UPDATE `creature_template` set AIName = '', ScriptName = 'boss_trollgore' where entry = 26630;
UPDATE `creature_template` set AIName = '', ScriptName = 'boss_novos' where entry = 26631;
UPDATE `creature_template` set AIName = '', ScriptName = 'crystal_handler' where entry = 26627;
UPDATE `creature_template` set AIName = '', ScriptName = 'crystal_channel' where entry = 26712;
UPDATE `creature_template` set AIName = '', ScriptName = 'risen_shadowcaster' where entry = 27600;
UPDATE `creature_template` set AIName = '', ScriptName = 'boss_dred' where entry = 27483;
UPDATE `creature_template` set AIName = '', ScriptName = 'boss_tharonja' where entry = 26632;

-- 719_ankahet_mangos.sql
	-- Ahnkahet from Tassadar
UPDATE `instance_template` SET `script` = 'instance_ahnkahet' WHERE `map`=619;
UPDATE `creature_template` SET `ScriptName` = 'boss_jedoga', `AIName`='' WHERE `entry`=29310;
UPDATE `creature_template` SET `ScriptName` = 'boss_nadox', `AIName`='' WHERE `entry`=29309;
UPDATE `creature_template` SET `ScriptName` = 'boss_taldaram', `AIName`='' WHERE `entry`=29308;
UPDATE `gameobject_template` SET `ScriptName` = 'go_nerubian_device' WHERE `entry` IN (193093,193094);
UPDATE `creature_template` SET `ScriptName` = 'boss_volazj', `AIName`='' WHERE `entry`=29311;

DELETE FROM `creature_template_addon` WHERE `entry` IN (30385, 31474);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES
('30385', '0', '8', '1', '0', '0', NULL),
('31474', '0', '8', '1', '0', '0', NULL);

DELETE FROM `creature_template` WHERE entry IN (31474, 30385, 29310, 31465);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(29310, 31465, 0, 0, 0, 0, 26777, 0, 26777, 0, 'Jedoga Shadowseeker', '', '', 0, 75, 75, 212700, 212700, 0, 0, 8204, 16, 16, 0, 1, 1, 339, 481, 0, 370, 7.5, 2000, 0, 2, 0, 0, 0, 0, 0, 0, 0, 293, 436, 53, 7, 0, 29310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4176, 6960, '', 0, 3, 20, 20, 0, 0, 0, 0, 0, 0, 0, 172, 1, 1575, 0, 0, 'boss_jedoga'),
(30385, 31474, 0, 0, 0, 0, 27382, 27384, 27383, 27385, 'Twilight Volunteer', '', '', 0, 74, 74, 25705, 25705, 0, 0, 0, 16, 16, 0, 1, 1, 0, 0, 0, 0, 1, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 2.5, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 93, 0, 0, 'npc_twilight_volunteer'),
(31465, 0, 0, 0, 0, 0, 26777, 0, 26777, 0, 'Jedoga Shadowseeker (1)', '', '', 0, 82, 82, 431392, 431392, 0, 0, 10253, 16, 16, 0, 1, 1, 463, 640, 0, 726, 13, 2000, 0, 2, 0, 0, 0, 0, 0, 0, 0, 360, 520, 91, 7, 0, 31465, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8352, 13920, '', 0, 3, 32, 20, 0, 0, 0, 0, 0, 0, 0, 172, 1, 0, 0, 1, ''),
(31474, 0, 0, 0, 0, 0, 27382, 27384, 27383, 27385, 'Twilight Volunteer (1)', '', '', 0, 81, 81, 58648, 58648, 0, 0, 0, 16, 16, 0,  1, 1, 0, 0, 0, 0, 1, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 4.5, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '');

UPDATE `creature_template` SET `unit_flags` = '0' WHERE `entry` IN (30114,31473);

DELETE FROM `creature_addon` WHERE guid=131953;
DELETE FROM `creature` WHERE guid IN (131953, 115064);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(131953, 29310, 619, 3, 1, 26777, 0, 357.353, -692.808, -10.7028, 5.56541, 14400, 5, 0, 212700, 0, 0, 1);

DELETE FROM `gameobject` WHERE `guid` = 911321;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(911321, 194394, 619, 2, 1, 371.842, -701.621, -16.1797, 5.67851, 0, 0, 0.297751, -0.954644, -10, 0, 1);

UPDATE `creature_template` SET `unit_flags` = 0, `difficulty_entry_1` = 0 WHERE `entry` IN (30258, 30391, 30435);
UPDATE `creature_template` SET `ScriptName` ='npc_amanitar_mushroom', `AIName`='' WHERE `entry` IN (30391, 30435);
UPDATE `creature_template` SET `ScriptName` ='boss_amanitar', `AIName`='', `mindmg` = 488, `maxdmg` = 648, `attackpower` = 782, `dmg_multiplier` = 13  WHERE `entry` = 30258;

DELETE FROM `creature` WHERE `map` = 619 AND `id` IN (30258,30391);

INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
#Amanitar
(30258, 619, 2, 1, 0, 0, 340.433, -884.8, -74.6965, 6.10105, 9800, 0, 0, 1, 0, 0, 0),

#Mushrooms
(30391, 619, 2, 1, 0, 0, 358.386, -885.553, -76.1054, 3.06235, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 355.893, -871.712, -76.1473, 2.37356, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 350.343, -874.985, -76.7057, 3.40793, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 339.429, -875.16, -75.6668, 2.76233, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 333.095, -874.652, -73.8099, 3.95457, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 324.208, -878.923, -70.915, 3.95457, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 319.612, -893.614, -66.4438, 6.25892, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 335.775, -899.115, -76.1423, 0.282045, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 344.644, -898.122, -77.6435, 0.282045, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 353.341, -894.159, -77.208, 0.282045, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 363.279, -897.252, -79.5129, 0.282045, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 364.47, -903.557, -80.3345, 4.7651, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 366.219, -915.939, -82.5392, 5.04784, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 368.297, -920.562, -82.5588, 5.59919, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 381.647, -923.685, -82.4737, 0.190153, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 389.079, -916.929, -81.4451, 1.40831, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 386.916, -909.718, -79.9835, 1.40831, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 386.976, -898.374, -79.2561, 2.5652, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 390.349, -882.168, -76.0919, 1.56146, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 387.136, -871.625, -75.4158, 2.15051, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 378.056, -864.542, -73.8699, 3.01759, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 363.749, -858.04, -75.1185, 3.01759, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 352.564, -862.387, -74.7834, 3.01759, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 343.924, -860.44, -74.5909, 2.23533, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 339.94, -852.104, -74.3732, 0.995972, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 347.839, -848.228, -73.7097, 6.23065, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 324.306, -858.725, -75.0947, 3.68596, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 347.971, -882.318, -75.884, 3.55872, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 347.965, -889.829, -76.747, 3.55872, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 368.578, -877.354, -75.676, 1.46878, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 378.003, -852.353, -73.5427, 0.519235, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 361.828, -841.2, -70.86, 2.94298, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 346.972, -839.523, -73.5286, 2.94298, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 337.009, -843.074, -74.3865, 2.94298, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 330.036, -847.017, -74.318, 3.25321, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 328.839, -838.69, -72.921, 1.8929, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 322.452, -829.799, -73.5624, 2.6563, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 316.367, -822.016, -73.1033, 1.71618, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 320.592, -812.011, -73.8038, 0.957487, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 322.619, -803.898, -72.9384, 2.07668, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 331.481, -811.702, -72.9227, 5.46332, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 341.894, -826.849, -73.049, 5.46332, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 387.58, -856.341, -71.0935, 5.72486, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 401.977, -867.49, -73.3215, 5.27247, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 408.72, -872.115, -73.0256, 6.03823, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 416.438, -875.336, -70.4833, 5.08397, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 403.004, -895.527, -75.561, 5.60391, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 409.35, -902.562, -77.2837, 5.22927, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 414.538, -911.69, -79.8006, 5.22927, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 419.727, -920.818, -80.7403, 5.22927, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 428.151, -920.833, -79.0992, 0.892305, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 436.712, -911.759, -78.8367, 0.0605679, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 461.167, -910.276, -77.4777, 0.0605679, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 419.827, -930.386, -77.7951, 4.29465, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 418.017, -939.624, -80.2493, 4.29465, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 417.247, -948.532, -79.3315, 4.29465, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 409.236, -952.042, -80.6495, 4.29465, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 410.077, -959.059, -78.9977, 4.29465, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 403.871, -964.208, -77.8873, 4.29465, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 401.693, -970.428, -77.3012, 4.90255, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 402.379, -980.099, -75.4585, 4.60567, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 399.272, -984.535, -75.9494, 3.15425, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 380.102, -984.145, -74.2926, 2.13402, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 369.565, -973.481, -77.4914, 2.56756, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 360.748, -967.779, -79.832, 2.56756, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 350.138, -958.988, -79.4422, 2.16229, 30, 0, 0, 1, 0, 0, 0),
(30391, 619, 2, 1, 0, 0, 342.879, -944.352, -79.8533, 1.64157, 30, 0, 0, 1, 0, 0, 0);

UPDATE `creature_template` SET `AIname`='EventAI' WHERE `entry` = 30176;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 30176;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('3017610', '30176', '11', '0', '100', '6', '0', '0', '0', '0', '11', '56151', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('3017611', '30176', '8', '0', '100', '6', '56153', '0', '0', '0', '28', '0', '56153', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');

-- 720_mangos_ulduar.sql
	-- iron council
#UPDATE creature_template SET scriptname='mob_ulduar_lightning_elemental' WHERE entry=32958;
#UPDATE creature_template SET scriptname='mob_rune_of_power' WHERE entry=33705;
#UPDATE creature_template SET scriptname='mob_rune_of_summoning' WHERE entry=33051;
#UPDATE creature_template SET mechanic_immune_mask=619395071, scriptname='boss_brundir' WHERE entry=32857;
#UPDATE creature_template SET mechanic_immune_mask=617299803, scriptname='boss_molgeim' WHERE entry=32927;
#UPDATE creature_template SET mechanic_immune_mask=617299803, scriptname='boss_steelbreaker' WHERE entry=32867;

	-- kologarn
DELETE FROM creature WHERE id IN (32933, 32934, 232933);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) 
VALUES (9327991, 32933, 603, 3, 65535, 0, 0, 1799.68, -24.3599, 452.227, 3.14747, 604800, 0, 0, 543855, 0, 0, 0);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) 
VALUES (9327992, 32934, 603, 3, 65535, 0, 0, 1799.68, -24.3599, 452.227, 3.14747, 604800, 0, 0, 543855, 0, 0, 0);
UPDATE creature_model_info SET bounding_radius=15, combat_reach=15 WHERE modelid IN (28638, 28822, 28821);
UPDATE creature_template SET mechanic_immune_mask=652951551, scriptname='boss_kologarn_right_arm' WHERE entry=32934;
UPDATE creature_template SET mechanic_immune_mask=652951551, scriptname='boss_kologarn_left_arm' WHERE entry=32933;
UPDATE creature_template SET scriptname='mob_ulduar_rubble' WHERE entry=33768;
UPDATE creature_template SET mechanic_immune_mask=617299803, scriptname='boss_kologarn' WHERE entry=32930;

	-- razorscale
#UPDATE creature_template SET mechanic_immune_mask=617299803, scriptname='boss_razorscale' WHERE entry=33186;
#UPDATE creature_template SET scriptname='mob_devouring_flame_target' WHERE entry=34188;
#UPDATE creature_template SET scriptname='mob_dark_rune_watcher' WHERE entry=33453;
#UPDATE creature_template SET scriptname='mob_dark_rune_sentinel' WHERE entry=33846;
#UPDATE creature_template SET scriptname='mob_dark_rune_guardian' WHERE entry=33388;
#UPDATE creature_template SET scriptname='npc_expedition_commander' WHERE entry=33210;

	-- ignis
#UPDATE creature_template SET mechanic_immune_mask=617299803, scriptname='boss_ignis' WHERE entry=33118;
#UPDATE creature_template SET minlevel=80, maxlevel=80, faction_h=1925, faction_a=1925, scale=0.5, scriptname='mob_scorch_target' WHERE entry=33221;
#UPDATE creature_template SET scriptname='mob_iron_construct' WHERE entry=33121;

-- 721_icecrown_mangos.sql
	-- Entrance
UPDATE `areatrigger_teleport` SET `required_level` = '80' WHERE `areatrigger_teleport`.`id` =5670;

UPDATE `creature` SET `spawntimesecs` = 7200 WHERE `map` = 631 AND (`spawntimesecs` BETWEEN 200 AND 7100 );

DELETE FROM `gameobject` WHERE `guid` = 913334;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(913334, 202244, 631, 3, 1, -209.5, 2211.91, 199.97, 3.07661, 0, 0, 0.999472, 0.0324833, 0, 0, 1);

UPDATE `gameobject_template` SET `flags` = 0, `ScriptName` = 'go_icecrown_teleporter' WHERE `entry`  IN (202242,202243,202244,202245,202235,202223,202246);
UPDATE `gameobject` SET `phaseMask` = 1 WHERE `id`  IN (202242,202243,202244,202245,202235,202223,202246);
DELETE FROM `areatrigger_teleport` WHERE `id` = 5718 AND `target_map` = 631;

DELETE FROM `creature` WHERE `id` = 99322;
DELETE FROM `creature_template` WHERE `entry` = 99322;
DELETE FROM `locales_npc_text` WHERE `entry` = 99322;
DELETE FROM `npc_text` WHERE `ID` = 99322;
DELETE FROM `locales_npc_text` WHERE `entry` = 99323;
DELETE FROM `npc_text` WHERE `ID` = 99323;
DELETE FROM `gameobject` WHERE `guid` IN (913334);

UPDATE `instance_template` SET `script`='instance_icecrown_spire' WHERE `map`=631;

	-- Saurfang
UPDATE `creature_template` SET `ScriptName`='boss_deathbringer_saurfang' WHERE `entry`=37813;
DELETE FROM `gameobject` WHERE `guid` IN (913383, 913385, 913395, 913397);
DELETE FROM `gameobject_template` WHERE `entry` IN (902241,902242);
UPDATE `creature_template` SET `ScriptName`='mob_blood_beast', `AIName`='' WHERE `entry`= 38508;
DELETE FROM `spell_script_target` WHERE `entry` = 72260;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('72260', '1', '37813');

	-- Deathwhisper
UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwhisper' WHERE `entry`=36855;
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14,`ScriptName`='mob_vengeful_shade', `AIName`='' WHERE `entry`= 38222;
UPDATE `creature_template` SET `ScriptName`='mob_cult_adherent', `AIName`='' WHERE `entry`= 37949;
UPDATE `creature_template` SET `ScriptName`='mob_cult_fanatic', `AIName`='' WHERE `entry`= 37890;

	-- Marrowgar
UPDATE `creature_template` SET `ScriptName`='boss_lord_marrowgar' WHERE `entry`= 36612;
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201910,201911);
UPDATE `gameobject` SET `state` = '1' WHERE `guid` IN (72526,72525);
UPDATE `creature_template` SET `ScriptName`='mob_coldflame', `minlevel` = 82, `maxlevel` = 82, `modelid_A` = 11686, `modelid_A2` = 11686, `modelid_H` = 11686, `modelid_H2` = 11686, `faction_A` = 14, `faction_H` = 14  WHERE `entry`= 36672;
UPDATE `creature_template` SET `ScriptName`='mob_bone_spike' WHERE `entry`= 38711;

	-- Gunship battle
UPDATE `creature_template` SET `ScriptName`='mob_spire_frostwyrm', `AIName`='' WHERE `entry`= 37230;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 37230;
UPDATE `creature_template` SET `ScriptName`='mob_frost_giant', `AIName`='' WHERE `entry` IN (38490, 38494) ;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (38490, 38494);

	-- Gunship armory (override)
DELETE FROM `gameobject` WHERE `id` IN (201872,201873,201874,201875,202177,202178,202179,202180);
UPDATE `gameobject_template` SET `flags` = 0 WHERE `gameobject_template`.`entry` IN (201872,201873,201874,201875,202177,202178,202179,202180);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(972541, 201872, 631, 1, 1, -428.141, 2421.34, 191.233, 3.10389, 0, 0, 0.999822, 0.0188489, -604800, 100, 1),
(972543, 201873, 631, 2, 1, -428.141, 2421.34, 191.233, 3.10389, 0, 0, 0.999822, 0.0188489, -604800, 100, 1),
(972545, 201874, 631, 4, 1, -428.141, 2421.34, 191.233, 3.10389, 0, 0, 0.999822, 0.0188489, -604800, 100, 1),
(972547, 201875, 631, 8, 1, -428.141, 2421.34, 191.233, 3.10389, 0, 0, 0.999822, 0.0188489, -604800, 100, 1),
(972551, 202177, 631, 1, 1, -447.493, 2003.5, 191.235, 0.153939, 0, 0, 0.0768933, 0.997039, -604800, 100, 1),
(972553, 202178, 631, 2, 1, -447.493, 2003.5, 191.235, 0.153939, 0, 0, 0.0768933, 0.997039, -604800, 100, 1),
(972555, 202179, 631, 4, 1, -447.493, 2003.5, 191.235, 0.153939, 0, 0, 0.0768933, 0.997039, -604800, 100, 1),
(972557, 202180, 631, 8, 1, -447.493, 2003.5, 191.235, 0.153939, 0, 0, 0.0768933, 0.997039, -604800, 100, 1);

	-- Plague wing
	-- Rotface
UPDATE `creature_template` SET `ScriptName`='boss_rotface', `AIName`=''  WHERE `entry`= 36627;
UPDATE `gameobject_template` SET `faction` = '114' WHERE `gameobject_template`.`entry` IN (201370);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201370);
UPDATE `creature_template` SET `ScriptName`='mob_small_ooze', `AIName`='' WHERE `entry`= 36897;
UPDATE `creature_template` SET `ScriptName`='mob_big_ooze', `AIName`='' WHERE `entry`= 36899;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `AIName` ='', `faction_A`= 14, `faction_H` = 14, `ScriptName`='mob_sticky_ooze', `AIName`='' WHERE `entry`= 37006;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `AIName` ='', `faction_A`= 14, `faction_H` = 14, `ScriptName`='mob_ooze_stalker', `AIName`='' WHERE `entry` IN (37986,37013);
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `AIName` ='', `faction_A`= 14, `faction_H` = 14, `ScriptName`='mob_ooze_explode_stalker', `AIName`='' WHERE `entry` = 38107;
DELETE FROM `spell_script_target` WHERE `entry` = 69783;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69783', '1', '37013');
DELETE FROM `spell_script_target` WHERE `entry` = 69508;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69508', '1', '37986');


	-- Festergut
UPDATE `creature_template` SET `ScriptName`='boss_festergut', `AIName`=''  WHERE `entry`= 36626;
UPDATE `gameobject_template` SET `faction` = '114' WHERE `gameobject_template`.`entry` IN (201371);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201371);
UPDATE `creature_template` SET `ScriptName`='mob_vile_gas_stalker', `AIName`=''  WHERE `entry`= 38548;
DELETE FROM `spell_script_target` WHERE `targetEntry` = 38548;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69248', '1', '38548');
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69240', '1', '38548');

	-- Professor putricide
UPDATE `creature_template` SET `ScriptName`='boss_proffesor_putricide', `AIName`='' WHERE `entry`= 36678;
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201372,201614,201613, 201612);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201612,201614,201613);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201372);
UPDATE `creature_template` SET `ScriptName`='mob_icc_gas_cloud', `AIName`='' WHERE `entry`= 37562;
UPDATE `creature_template` SET `ScriptName`='mob_icc_volatile_ooze', `AIName`='' WHERE `entry`= 37697;
UPDATE `gameobject_template` SET `faction` = '0', `ScriptName` = 'go_plague_sigil' WHERE `gameobject_template`.`entry` IN (202182);

	-- Blood wing
UPDATE `gameobject_template` SET `faction` = '0', `ScriptName` = 'go_bloodwing_sigil' WHERE `gameobject_template`.`entry` IN (202181);
	-- Taldaram
UPDATE `creature_template` SET `ScriptName`='boss_taldaram_icc', `AIName`='' WHERE `entry`= 37973;
	-- Valanar
UPDATE `creature_template` SET `ScriptName`='boss_valanar_icc', `AIName`='' WHERE `entry`= 37970;
	-- Keleseth
UPDATE `creature_template` SET `ScriptName`='boss_keleseth_icc', `AIName`='' WHERE `entry`= 37972;

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201920,201377,201378);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201920,201377,201378);
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201376);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201376);

	-- Qween Lana'thel
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel', `AIName`='' WHERE `entry`= 37955;
UPDATE `creature_template` SET  `minlevel` = 80, `maxlevel` = 80, `AIName` ='', `faction_A`= 14, `faction_H` = 14,`ScriptName`='mob_swarming_shadows' WHERE `entry`= 38163;

UPDATE `gameobject_template` SET `faction` = '0', `ScriptName` = 'go_frostwing_sigil' WHERE `gameobject_template`.`entry` IN (202181);

	-- Valithria dreamwalker
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `ScriptName`='boss_valithria_dreamwalker' WHERE `entry`= 36789;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry`= 10067;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry`= 10068;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry`= 10069;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `ScriptName`='mob_nightmare_portal', `AIName`='' WHERE `entry`= 38429;
UPDATE `creature_template` SET `ScriptName`='mob_mana_void', `AIName`='' WHERE `entry`= 38068;


UPDATE `gameobject_template` SET `faction` = '0',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201375,201373);
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201374);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201374);
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201380,201381,201382,201383);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201380,201381,201382,201383);

	-- Sindragosa
UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE `entry`= 36853;
UPDATE `creature_template` SET `ScriptName`='mob_rimefang', `AIName`='' WHERE `entry`= 37533;
UPDATE `creature_template` SET `ScriptName`='mob_spinestalker', `AIName`='' WHERE `entry`= 37534;
UPDATE `creature_template` SET `ScriptName`='mob_ice_tomb', `AIName`='' WHERE `entry`= 36980;
UPDATE `creature_template` SET `ScriptName`='mob_frost_bomb', `AIName`='' WHERE `entry`= 37186;
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201369,201379);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201369,201379);

	-- Lich King
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king_icc', `AIName`='' WHERE `entry`= 36597;
UPDATE `creature_template` SET `ScriptName`='boss_tirion_icc', `npcflag`=1, `AIName`='' WHERE `entry`= 38995;
INSERT IGNORE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('71614', '1', '38995');

UPDATE `creature_template` SET `ScriptName`='mob_ice_sphere_icc', `AIName`='' WHERE `entry`= 36633;
UPDATE `creature_template` SET `ScriptName`='mob_defiler_icc', `AIName`='' WHERE `entry`= 38757;
UPDATE `creature_template` SET `ScriptName`='mob_strangulate_vehicle', `AIName`='' WHERE `entry`= 36598;
UPDATE `creature_template` SET `ScriptName`='mob_vile_spirit', `AIName`='' WHERE `entry`= 37799;
UPDATE `creature_template` SET `ScriptName`='mob_raging_spirit', `AIName`='' WHERE `entry`= 36701;

DELETE FROM `npc_text` WHERE `ID` IN (721001,721002);
INSERT INTO `npc_text` (`ID`, `Text0_0`) VALUES
(721001, 'Greetings $N! Are you ready to battle with Lich King?'),
(721002, 'Instance script designed by /dev/rsa especially for\n http://wow.teletoria.ru\n Thanks to:\n Vladimir Mangos\n Insider42\n Wowka321\n Selector\n and many other !\n');

DELETE FROM `locales_npc_text` WHERE `entry` IN (721001,721002);
INSERT INTO `locales_npc_text` (`entry`, `Text0_0_loc1`, `Text0_0_loc2`, `Text0_0_loc3`, `Text0_0_loc4`, `Text0_0_loc5`, `Text0_0_loc6`, `Text0_0_loc7`, `Text0_0_loc8`) VALUES
(721001, 'Greetings $N! Are you ready to battle with Lich King?', NULL, NULL, NULL, NULL, NULL, NULL, '???????????, $N! ???????? ??? ??????????? ???????? ???????? WOW?'),
(721002, 'Instance script designed by /dev/rsa especially for\n http://wow.teletoria.ru\n Thanks to:\n Vladimir Mangos\n Insider42\n Wowka321\n Selector\n and many other !\n', NULL, NULL, NULL, NULL, NULL, NULL, '?????? ???????? ?????????? ?????????? ???\n http://wow.teletoria.ru\n ?????????????:\n Vladimir Mangos\n Insider42\n Wowka321\n Selector\n ? ?????? ??????!\n (c) /dev/rsa 2010 ???');

-- 722_malygos_mangos.sql
update `creature_template` set `ScriptName` = 'boss_malygos' where `entry` = 28859;
update `instance_template` set `script` = 'instance_eye_of_eternity' where `map` = '616';
update `gameobject` set `phaseMask`=65536, `spawntimesecs`='-604800'  where id in(193905,193967);
update `gameobject_template` set `faction`=0 where entry in (193905,193967);

-- 723_icecrown_down_mangos.sql
	-- Forge of souls
UPDATE `instance_template` SET `script`='instance_forge_of_souls' WHERE `map`=632;
UPDATE `creature_template` SET `ScriptName`='boss_bronjahm', `AIName` ='' WHERE `entry`=36497;
UPDATE `creature_template` SET `ScriptName`='mob_soul_fragment', `modelid_A`= 30233, `modelid_H`= 30233, `AIName` ='' WHERE `entry`=36535;
	-- UPDATE `creature_template` SET `ScriptName`='mob_soul_storm', `AIName` ='' WHERE `entry`=;

	-- UPDATE `creature_template` SET `ScriptName`='boss_devourer', `AIName` ='' WHERE `entry`=33113;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_devourer_of_souls' where `entry` IN (36502);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_well_of_soul' where `entry` IN (36536);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_unleashed_soul' where `entry` IN (36595);

UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_FSintro' where `entry` IN (37597, 37596);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_FSextro' where `entry` IN (38160, 38161);
UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' where `entry` IN (37597, 38160, 36993, 38188, 37221, 36955);
UPDATE `creature_template` SET `scale`='0.8' where `entry` IN (36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `npcflag`='0' where `entry` IN (38160, 38161);
UPDATE `creature_template` SET `npcflag`='3' where `entry` IN (37597, 37596, 36993, 36990);
UPDATE `creature_template` SET `scale`='1' where `entry` IN (38161, 37596, 36990);
UPDATE `creature_template` SET `scale`='1' where `entry` IN (37755);
UPDATE `creature_template` SET `equipment_id`='1290' where `entry` IN (36990, 37596, 38161, 38189, 37223, 37554);
	-- UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_soulguard_watchman' where `entry` IN (36478);
	-- UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_soulguard_reaper' where `entry` IN (36499);
	-- UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_soulguard_adept' where `entry` IN (36620);
	-- UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_soulguard_bonecaster' where `entry` IN (36564);
	-- UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_soulguard_animator' where `entry` IN (36516);
	-- UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_soul_horror' where `entry` IN (36522);
	-- UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_npc_spectral_warden' where `entry` IN (36666);

	-- Pit of saron
	-- UPDATE `instance_template` SET `script`='instance_pit_of_saron' WHERE `map`=658;
	-- UPDATE `creature_template` SET `ScriptName`='boss_ick', `AIName` ='' WHERE `entry`=36476;
	-- UPDATE `creature_template` SET `ScriptName`='boss_krick', `AIName` ='' WHERE `entry`=36477;
	-- UPDATE `creature_template` SET `ScriptName`='mob_exploding_orb', `AIName` ='' WHERE `entry`=36610;
	-- UPDATE `creature_template` SET `ScriptName`='boss_forgemaster_garfrost', `AIName` ='' WHERE `entry`=36494;
	-- UPDATE `creature_template` SET `ScriptName`='boss_scourgelord_tyrannus', `AIName` ='' WHERE `entry`=36658;
	-- UPDATE `creature_template` SET `ScriptName`='mob_rimefang_pos', `AIName` ='' WHERE `entry`=36661;
	-- UPDATE `creature_template` SET `ScriptName`='npc_jaina_or_sylvanas_POSintro', `AIName` ='' WHERE `entry` IN (36990,36993);
	-- UPDATE `creature_template` SET `ScriptName`='npc_jaina_or_sylvanas_POSoutro', `AIName` ='' WHERE `entry` IN (38189,38188);

	-- Halls of reflection
UPDATE `instance_template` SET `script` = 'instance_halls_of_reflection' WHERE map=668;
UPDATE `gameobject_template` SET `ScriptName` = '' WHERE `entry` IN (202236,202302);
DELETE FROM `creature` WHERE `map` = 668 AND `id` IN (38177,38176,38173,38172,38567,38175,36940,36941,37069);

UPDATE `creature_template` SET `ScriptName`='generic_creature' WHERE `entry` IN (38177,38176,38173,38172,38567,38175);

UPDATE `gameobject_template` SET `faction` = '114' WHERE `entry` IN (197341, 201976);
UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` IN (197341, 202302, 201385, 201596);

UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='2.0' WHERE `entry` IN (36954, 37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` IN (37221, 37223);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry` IN (38112);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry` IN (38113);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_lich_king_hr' WHERE `entry` IN (36954);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hr' WHERE `entry` IN (37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='generic_creature' WHERE `entry` IN (36940,36941,37069);
UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' WHERE `entry` IN (37221, 36955);
UPDATE `creature_template` SET `equipment_id`='1290' WHERE `entry` IN (37223, 37554);
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=36954;
UPDATE `creature_template` SET `scale`='1' WHERE `entry` IN (37223);
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `unit_flags`='768', `type_flags`='268435564' WHERE `entry` IN (38177, 38176, 38173, 38172, 38567, 38175);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('70464', '1', '36881');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69708', '1', '37226');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('70194', '1', '37226');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69784', '1', '37014');

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69784', '1', '37014');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('70224', '1', '37014');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('70225', '1', '37014');

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69431', '1', '37497');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69431', '1', '37496');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69431', '1', '37496');

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69431', '1', '37588');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69431', '1', '37584');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69431', '1', '37587');

REPLACE INTO `creature_equip_template` VALUES ('38112', '50249', '49777', '0'); #Falric
UPDATE `creature_template` SET `equipment_id`='38112' WHERE `entry` IN (38112);

REPLACE INTO `creature_equip_template` VALUES ('38113', '50248', '50248', '0'); #Marwyn
UPDATE `creature_template` SET `equipment_id`='38113' WHERE `entry` IN (38113);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135341, 38112, 668, 3, 1, 0, 0, 5276.81, 2037.45, 709.32, 5.58779, 604800, 0, 0, 377468, 0, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135342, 38113, 668, 3, 1, 0, 0, 5341.72, 1975.74, 709.32, 2.40694, 604800, 0, 0, 539240, 0, 0, 0);

REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (14531739, 201596, 668, 1, 128, 5275.28, 1694.23, 786.147, 0.981225, 0, 0, 0.471166, 0.882044, 25, 0, 1);

DELETE from `creature` WHERE `id`=36955;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135349, 36955, 668, 3, 128, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

DELETE from `creature` WHERE `id`=37554;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135345, 37554, 668, 3, 64, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

DELETE from `creature` WHERE `id`=37226;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (135344, 37226, 668, 3, 1, 0, 0, 5551.29, 2261.33, 733.012, 4.0452, 604800, 0, 0, 27890000, 0, 0, 0);

UPDATE `creature_template` SET `modelid_A` = 11686, `modelid_A2` = 11686, `modelid_H` = 11686, `modelid_H2` = 11686 WHERE `entry` IN (37014,37704);

DELETE FROM `gameobject` WHERE `id` IN (201385,201596,202079);

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (197341,197342,197343);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (197341,197342,197343);

/* Original Icewalls from YTDB
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(3485, 201385, 668, 3, 1, 5540.39, 2086.48, 731.066, 1.00057, 0, 0, 0.479677, 0.877445, 604800, 100, 1),
(3438, 201385, 668, 3, 1, 5494.3, 1978.27, 736.689, 1.0885, 0, 0, 0.517777, 0.855516, 604800, 100, 1),
(3386, 201385, 668, 3, 1, 5434.27, 1881.12, 751.303, 0.923328, 0, 0, 0.445439, 0.895312, 604800, 100, 1),
(3383, 201385, 668, 3, 1, 5323.61, 1755.85, 770.305, 0.784186, 0, 0, 0.382124, 0.924111, 604800, 100, 1);
*/

-- 724_trial_of_crusader_mangos.sql
	-- instance
UPDATE `instance_template` SET `script`='instance_trial_of_the_crusader' WHERE `map`=649;
DELETE FROM `creature` WHERE `map` = 649 AND `id` IN 
(34797,34796,34799,35144,34780,34460,34463,34461,34471,34475,34472,34453,34455,34458,34454,34451,34456,34497,34496,34564,34467,35465,34468,35610,34473,34474,34441,34449,34448,34450,34606, 34605, 34607, 34564);

	-- announcers
UPDATE `creature_template` SET `npcflag`=1, `scriptname`='npc_toc_announcer' WHERE `entry`=34816;
DELETE FROM `creature` WHERE `map` = 649 AND `id` = 35766;

DELETE FROM `npc_text` WHERE `ID` IN (724001, 724002, 724003, 724004, 724005, 724006); 
INSERT INTO `npc_text` (`ID`, `Text0_0`) VALUES
(724001, 'Greetings $N! Are you ready to be tested in Crusaders Coliseum?'),
(724002, 'Are you ready for the next stage?'),
(724003, 'Are you ready to fight the champions of the Silver vanguard?'),
(724004, 'Are you ready for the next stage?'),
(724005, 'Are you ready to continue battle with Anub-Arak?'),
(724006, 'Today, the arena is closed. Script dungeon designed specifically for server Pandora http://wow.teletoria.ru (c) /dev/rsa 2010');

DELETE FROM `locales_npc_text` WHERE `entry` IN (724001, 724002, 724003, 724004, 724005, 724006); 
INSERT INTO `locales_npc_text` (`entry`, `Text0_0_loc1`, `Text0_0_loc2`, `Text0_0_loc3`, `Text0_0_loc4`, `Text0_0_loc5`, `Text0_0_loc6`, `Text0_0_loc7`, `Text0_0_loc8`) VALUES
(724001, 'Greetings $N! Are you ready to be tested in Crusaders Coliseum?', NULL, NULL, NULL, NULL, NULL, NULL, '???????????, $N! ?? ?????? ?????? ????????? ????????????'),
(724002, 'Are you ready for the next stage?', NULL, NULL, NULL, NULL, NULL, NULL, '?? ?????? ? ?????????? ??????'),
(724003, 'Are you ready to fight the champions of the Silver vanguard?', NULL, NULL, NULL, NULL, NULL, NULL, '?? ?????? ??????? ? ?????????? ??????????? ??????????'),
(724004, 'Are you ready for the next stage?', NULL, NULL, NULL, NULL, NULL, NULL, '?? ?????? ? ?????????? ??????'),
(724005, 'Are you ready to continue battle with Anub-Arak?', NULL, NULL, NULL, NULL, NULL, NULL, '?? ?????? ?????????? ??? ? ????-???????'),
(724006, 'Today, the arena is closed. Script dungeon designed specifically for server Pandora http://wow.teletoria.ru (c) /dev/rsa 2010', NULL, NULL, NULL, NULL, NULL, NULL, '?? ??????? ????? ???????. ?????? ???????? ?????????? ?????????? ??? ??????? ??????? http://wow.teletoria.ru (c) /dev/rsa 2010');

UPDATE `creature_template` SET `scriptname`='boss_lich_king_toc' WHERE `entry`=35877;
UPDATE `creature_template` SET `minhealth`= 20000, `maxhealth` = 20000, `faction_A`= 1770, `faction_H` = 1770,  `scriptname`='npc_fizzlebang_toc' WHERE `entry`=35458;
UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry` IN (22517, 35651);
DELETE FROM `creature` WHERE `map` = 649 AND `id` IN (35651, 22517);

UPDATE `creature_template` SET `scriptname`='npc_tirion_toc' WHERE `entry`=34996;
UPDATE `creature_template` SET `scriptname`='npc_garrosh_toc' WHERE `entry`=34995;
UPDATE `creature_template` SET `scriptname`='npc_rinn_toc' WHERE `entry`=34990;

	-- Grand crusaders
UPDATE `creature_template` SET `scriptname`='mob_toc_warrior', `AIName` ='' WHERE `entry` IN (34475,34453);
UPDATE `creature_template` SET `scriptname`='mob_toc_mage', `AIName` ='' WHERE `entry` IN (34468,34449);
UPDATE `creature_template` SET `scriptname`='mob_toc_shaman', `AIName` ='' WHERE `entry` IN (34463,34455);
UPDATE `creature_template` SET `scriptname`='mob_toc_enh_shaman', `AIName` ='' WHERE `entry` IN (34470,34444);
UPDATE `creature_template` SET `scriptname`='mob_toc_hunter', `AIName` ='' WHERE `entry` IN (34467,34448);
UPDATE `creature_template` SET `scriptname`='mob_toc_rogue', `AIName` ='' WHERE `entry` IN (34472,34454);
UPDATE `creature_template` SET `scriptname`='mob_toc_priest', `AIName` ='' WHERE `entry` IN (34466,34447);
UPDATE `creature_template` SET `scriptname`='mob_toc_shadow_priest', `AIName` ='' WHERE `entry` IN (34473,34441);
UPDATE `creature_template` SET `scriptname`='mob_toc_dk', `AIName` ='' WHERE `entry` IN (34461,34458);
UPDATE `creature_template` SET `scriptname`='mob_toc_paladin', `AIName` ='' WHERE `entry` IN (34465,34445);
UPDATE `creature_template` SET `scriptname`='mob_toc_retro_paladin', `AIName` ='' WHERE `entry` IN (34471,34456);
UPDATE `creature_template` SET `scriptname`='mob_toc_druid', `AIName` ='' WHERE `entry` IN (34460,34451);
UPDATE `creature_template` SET `scriptname`='mob_toc_boomkin', `AIName` ='' WHERE `entry` IN (34469,34459);
UPDATE `creature_template` SET `scriptname`='mob_toc_warlock' WHERE `entry` IN (34474,34450);

UPDATE `creature_template` SET `scriptname`='mob_toc_pet_warlock', `AIName` ='' WHERE `entry` IN (35465);
UPDATE `creature_template` SET `scriptname`='mob_toc_pet_hunter', `AIName` ='' WHERE `entry` IN (35610);

UPDATE `creature_template` SET `lootid`= 0 WHERE  `entry` IN
(34460,34463,34461,34471,34475,34472,34453,34455,34458,34454,34451,34456,34467,35465,34468,35610,34473,34474,34441,34449,34448,34450);
UPDATE `creature_template` SET `lootid`= 0 WHERE  `entry` IN
(12266,12209,12212,12281,12190,12284,12269,12272,12229,12187,12091,12088,12169,12103,12106,12112,12166,12163,12175,12183,12303,12300);
UPDATE `creature_template` SET `lootid`= 0 WHERE  `entry` IN
(12267,12210,12213,12282,12191,12285,12270,12273,12230,12188,12092,12089,12170,12104,12107,12113,12167,12164,12181,12184,12304,12301);
UPDATE `creature_template` SET `lootid`= 0 WHERE  `entry` IN
(12268,12211,12214,12283,12192,12286,12271,12274,12231,12189,12093,12090,12171,12105,12108,12114,12168,12165,12182,12185,12305,12302);

	-- N10
DELETE FROM `creature_loot_template` WHERE `entry` IN 
(34460,34463,34461,34471,34475,34472,34453,34455,34458,34454,34451,34456,34467,35465,34468,35610,34473,34474,34441,34449,34448,34450);
	-- H10
DELETE FROM `creature_loot_template` WHERE `entry` IN 
(12266,12209,12212,12281,12190,12284,12269,12272,12229,12187,12091,12088,12169,12103,12106,12112,12166,12163,12175,12183,12303,12300);
	-- N25
DELETE FROM `creature_loot_template` WHERE `entry` IN 
(12267,12210,12213,12282,12191,12285,12270,12273,12230,12188,12092,12089,12170,12104,12107,12113,12167,12164,12181,12184,12304,12301);
	-- H25
DELETE FROM `creature_loot_template` WHERE `entry` IN 
(12268,12211,12214,12283,12192,12286,12271,12274,12231,12189,12093,12090,12171,12105,12108,12114,12168,12165,12182,12185,12305,12302);

	-- Nortrend beasts
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (34796, 34799, 35144, 34797);
UPDATE `creature_template` SET `scriptname`='boss_gormok', `AIName` ='' WHERE `entry`=34796;
UPDATE `creature_template` SET `scriptname`='mob_snobold_vassal', `AIName` ='' WHERE `entry`=34800;

UPDATE `creature_template` SET `scriptname`='boss_dreadscale', `AIName` ='' WHERE `entry`=34799;
UPDATE `creature_template` SET `scriptname`='boss_acidmaw', `AIName` ='' WHERE `entry`=35144;
UPDATE `creature_template` SET `scriptname`='mob_slime_pool', `minlevel` = 80, `maxlevel` = 80, `minhealth`= 30000, `maxhealth` = 30000,`AIName` ='', `faction_A`= 14, `faction_H` = 14, `modelid_A` = 11686, `modelid_H` = 11686 WHERE `entry` = 35176;

UPDATE `creature_template` SET `scriptname`='boss_icehowl', `AIName` ='' WHERE `entry`=34797;

UPDATE `creature_template` SET `lootid`= 0 WHERE  `entry` IN (34796,34799,35144);
DELETE FROM `creature_loot_template`  WHERE  `entry` IN (34796,34799,35144);

	-- Jaraxxus
UPDATE `creature_template` SET `scriptname`='boss_jaraxxus', `AIName` ='' WHERE `entry`= 34780;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (34780, 34784, 34813, 34815, 34825, 34826);
UPDATE `creature_template` SET `scriptname`='mob_legion_flame', `minlevel` = 82, `maxlevel` = 82, `modelid_A` = 11686, `modelid_A2` = 11686, `modelid_H` = 11686, `modelid_H2` = 11686, `AIName` ='', `faction_A`= 14, `faction_H` = 14 WHERE `entry` = 34784;
UPDATE `creature_template` SET `scriptname`='mob_infernal_volcano', `AIName` ='' WHERE `entry` = 34813;
UPDATE `creature_template` SET `scriptname`='mob_fel_infernal', `AIName` ='' WHERE `entry` = 34815;
UPDATE `creature_template` SET `scriptname`='mob_nether_portal', `AIName` ='' WHERE `entry` = 34825;
UPDATE `creature_template` SET `scriptname`='mob_mistress_of_pain', `AIName` ='' WHERE `entry` = 34826;

	-- Valkiries
UPDATE `creature_template` SET `scriptname` = 'boss_fjola', `AIName` ='' WHERE `entry`=34497;
UPDATE `creature_template` SET `scriptname` = 'boss_eydis', `AIName` ='' WHERE `entry`=34496;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (34497, 34496, 34568, 34567);
UPDATE `creature_template` SET `npcflag`=1, `scriptname`='mob_light_essence', `AIName` ='' WHERE entry = 34568;
UPDATE `creature_template` SET `npcflag`=1, `scriptname`='mob_dark_essence', `AIName` ='' WHERE entry = 34567;
UPDATE `creature_template` SET `faction_A` = 14, `minlevel` = 82, `maxlevel` = 82,`faction_H` = 14, `AIName` ='', `scriptname`='mob_unleashed_dark' WHERE entry = 34628;
UPDATE `creature_template` SET `faction_A` = 14, `minlevel` = 82, `maxlevel` = 82,`faction_H` = 14, `AIName` ='', `scriptname`='mob_unleashed_light' WHERE entry = 34630;
	-- Twin pact by Wowka321
DELETE FROM `spell_script_target` WHERE `entry` IN (65875,67303,67304,67305,65876,67306,67307,67308);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES 
('65875', '1', '34497'),
('67303', '1', '34497'),
('67304', '1', '34497'),
('67305', '1', '34497'),
('65876', '1', '34496'),
('67306', '1', '34496'),
('67307', '1', '34496'),
('67308', '1', '34496');

	-- Anub'arak
UPDATE `creature_template` SET `scriptname`='boss_anubarak_trial', `unit_flags` = 0, `AIName` ='' WHERE `entry`=34564;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (34606, 34605, 34607, 34564, 34660);
UPDATE `creature_template` SET `modelid_A` = 25144, `modelid_A2` = 0, `modelid_H` = 25144, `modelid_H2` = 0, `faction_A` = 14, `faction_H` = 14, `AIName` = '', `ScriptName` = 'mob_frost_sphere' WHERE `entry` = 34606;
UPDATE `creature_template` SET `scriptname`='mob_swarm_scarab', `AIName` ='' WHERE `entry`=34605;
UPDATE `creature_template` SET `scriptname`='mob_nerubian_borrower', `AIName` ='' WHERE `entry`=34607;
UPDATE `creature_template` SET `scriptname`='mob_anubarak_spike', `faction_A` = 14, `minlevel` = 80, `maxlevel` = 80,`faction_H` = 14, `AIName` ='' WHERE `entry`=34660;

-- 726_naxxramas_mangos.sql
	--  Arachnid Quarter
UPDATE `creature_template` SET `ScriptName`='mob_crypt_guard' WHERE `entry` IN (16573);
UPDATE `creature_template` SET `ScriptName`='mob_worshippers' WHERE `entry`='16506';
UPDATE `creature_template` SET `ScriptName`='mob_webwrap' WHERE `entry`='16486';
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` IN ('16486','30183');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (16506);
	-- Construct Quarter
UPDATE `creature_template` SET `ScriptName`='boss_grobbulus' WHERE `entry`='15931';
UPDATE `creature_template` SET `ScriptName`='npc_grobbulus_poison_cloud' WHERE `entry`='16363';
UPDATE `creature_template` SET `ScriptName`='boss_thaddius', `unit_flags`=0 WHERE `entry`='15928';
UPDATE `creature_template` SET `ScriptName`='mob_stalagg' WHERE `entry`='15929';
UPDATE `creature_template` SET `ScriptName`='mob_feugen' WHERE `entry`='15930';
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` = '16027';
UPDATE `creature_template` SET `ScriptName`='mob_zombie_chows' WHERE `entry` = '16360';
	-- Military Quarter
UPDATE `creature_template` SET `attackpower` = `attackpower`*40 WHERE `entry` IN (16061,29940); -- Instructor Razuvious
UPDATE `creature_template` SET `attackpower` = `attackpower`*12 WHERE `entry` IN (16803,29941); -- Death Knight Understudy
UPDATE `creature_template` SET `spell1`=61696, `spell2`=29060, `spell3`=29061 WHERE `entry` IN (16803);
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=16211;
UPDATE `creature_template` SET `ScriptName`='boss_gothik' WHERE `entry`='16060';
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` IN (16697);
UPDATE `gameobject` SET `spawntimesecs`=-604800 WHERE `id` IN ('181366','193426');
	-- Plague Quarter
UPDATE `creature_template` SET `ScriptName`='boss_heigan' WHERE `entry`='15936';
UPDATE `creature_template` SET `ScriptName`='npc_loatheb_spores' WHERE `entry`='16286';
	-- Frostwyrm Lair
UPDATE `creature_template` SET `ScriptName`='boss_kelthuzad' WHERE `entry`='15990';
UPDATE `creature_template` SET `ScriptName`='mob_shadow_issure', `flags_extra` = '2', `faction_A`=16, `faction_H`=16 WHERE `entry`='16129';
	-- Adds
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry` IN (16981, 16427, 16429);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (16981, 16427, 16429);
INSERT INTO `creature_ai_scripts` VALUES
('1698101', '16981', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '54890', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('1698102', '16981', '0', '0', '100', '5', '10000', '20000', '10000', '20000', '11', '54891', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('1642701', '16427', '6', '0', '100', '3', '0', '0', '0', '0', '11', '28457', '6', '7', '0', '0', '0', '0', '0', '0', '0', '0', 'Soldiers of the Frozen Wastes - Dark Blast'),
('1642702', '16427', '6', '0', '100', '5', '0', '0', '0', '0', '11', '55714', '6', '7', '0', '0', '0', '0', '0', '0', '0', '0', 'Soldiers of the Frozen Wastes - Dark Blast'),
('1642901', '16429', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '28459', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Soul Weaver - Wail of Souls'),
('1642902', '16429', '0', '0', '100', '5', '10000', '20000', '10000', '20000', '11', '55765', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Soul Weaver - Wail of Souls');
UPDATE gameobject SET `state`='1' WHERE `map`=533 AND `id` IN (181225,181124);
DELETE FROM `spell_target_position` WHERE `id` IN (28444);
INSERT INTO `spell_target_position` VALUES (28444, 533, 3005.776, -3483.284, 299.551, 1.552);
	-- Portal at end
UPDATE `gameobject_template` SET `flags`=0 WHERE `entry` IN ('181575', '181576', '181577', '181578'); -- 16
DELETE FROM `gameobject` WHERE `id` in ('181575', '181576', '181577', '181578');
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(181575, 533, 3, 1, 3521.34, -3942.85, 308.106, 2.12884, 0, 0, 1, 0, -604800, 0, 1),
(181576, 533, 3, 1, 3548.85, -2958.15, 302.688, 3.16206, 0, 0, 1, 0, -604800, 0, 1),
(181577, 533, 3, 1, 2909, -4025.02, 273.475, 3.14159, 0, 0, 1, 0, -604800, 0, 1),
(181578, 533, 3, 1, 2492.16, -2921.66, 241.276, 5.52219, 0, 0, 1, 0, -604800, 0, 1);

INSERT IGNORE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('2','0','0','0','0','0','0','0','0','0','Erupt trigger','',NULL,'80','80','200','300','20','30','0','21','21','0','1','1','0','0','0','0','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','0','0','0','0','0','0','0','0','1','0','0','194','');
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (15384, 0, 18783, 0, 11686, 0, 'Plague Fissure', '', '', 83, 83, 4120, 4120, 0, 0, 0, 21, 21, 0, 1.1, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 1, 33555206, 0, 0, 0, 0, 0, 0, 0, 1, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1.35, 1, 0, 1, 0, 0, 130, 'npc_heigan_eruption');

	-- Soul Weaver
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `minhealth` = 56700, `maxhealth` = 56700 WHERE `entry` = 16429;
	-- Guardian of Icecrown 10 men
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `minhealth` = 2520000, `maxhealth` = 2520000, `dmg_multiplier` = 1.5, mechanic_immune_mask = 1073741823 WHERE entry = 16441;
	-- Guardian of Icecrown 25 men
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `minhealth` = 6300000, `maxhealth` = 6300000, `armor` = 7369, dmg_multiplier = 1.8, mechanic_immune_mask = 1073741823 WHERE entry = 30057;
	-- Shadow Fissure
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `flags_extra` = 130 WHERE `entry` = 16129;

UPDATE `gameobject_template` SET `flags` = 0 WHERE `entry` = 193426;

DELETE FROM `gameobject` WHERE `guid`=21640;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`, `animprogress`,`state`) VALUES
(21640,193426, 533, 2, 1, 2511.51, -2943.93, 245.552, 5.48707, 0, 0, 0.387631, -0.921815, -604800, 100, 1);

DELETE FROM `spell_script_target` WHERE `entry`=55479;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (55479, 1, 16803);               

DELETE FROM `npc_gossip` WHERE `npc_guid` IN (128352, 128353);
DELETE FROM `npc_text` WHERE `ID`=100;
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (128352, 100);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (128353, 100);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES (100, 'Hi. In front of you is standing a Instructor Razuvious. To defeat this boss, you ll need to use Mind Control. If you don t have any priest in your group, press button below.', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);

UPDATE `creature` set `spawnMask` = 1 where `id` = 29912;

DELETE FROM `creature_template` WHERE (`entry`=16803);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (16803, 29941, 0, 0, 0, 0, 16539, 0, 16539, 0, 'Death Knight Understudy', '', '', 0, 82, 82, 404430, 404430, 0, 0, 49905, 21, 21, 0, 1, 1, 1, 488, 642, 0, 782, 7.5, 2000, 0, 1, 32832, 0, 0, 0, 0, 0, 0, 363, 521, 121, 7, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61696, 29060, 29061, 0, 0, 0, 0, 'EventAI', 0, 3, 30, 2, 0, 22708, 0, 0, 0, 0, 0, 144, 1, 1728, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=29941);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (29941, 0, 0, 0, 0, 0, 16539, 0, 16539, 0, 'Death Knight Understudy (1)', '', '', 0, 82, 82, 404430, 404430, 0, 0, 49905, 14, 14, 0, 1.5, 1, 1, 488, 642, 0, 782, 13, 2000, 0, 1, 32832, 0, 0, 0, 0, 0, 0, 363, 521, 121, 7, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 30, 2, 0, 22708, 0, 0, 0, 0, 0, 144, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=16061);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (16061, 29940, 0, 0, 0, 0, 16582, 0, 16582, 0, 'Instructor Razuvious', '', '', 0, 83, 83, 3346800, 3346800, 0, 0, 10673, 21, 21, 0, 1.6, 1, 3, 1000, 1200, 0, 800, 70, 3500, 0, 1, 32832, 0, 0, 0, 0, 0, 0, 371, 535, 135, 6, 76, 16061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1253602, 1532181, '', 0, 3, 240, 2, 0, 0, 0, 0, 0, 0, 0, 167, 1, 1718, 617299803, 1, 'boss_razuvious');

DELETE FROM `creature_template` WHERE (`entry`=29940);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (29940, 0, 0, 0, 0, 0, 16582, 0, 16582, 0, 'Instructor Razuvious (1)', '', '', 0, 83, 83, 10110125, 10110125, 0, 0, 10673, 21, 21, 0, 2, 1, 3, 1000, 1200, 0, 800, 70, 3500, 0, 1, 32832, 0, 0, 0, 0, 0, 0, 371, 535, 135, 6, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2507204, 3064362, '', 0, 3, 725, 2, 0, 0, 0, 0, 0, 0, 0, 167, 1, 0, 617299803, 1, '');

DELETE FROM `creature_template` WHERE (`entry`=29912);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (29912, 0, 0, 0, 0, 0, 26620, 0, 26620, 0, 'Obedience Crystal', '', 'Interact', 0, 80, 80, 12600, 12600, 0, 0, 9729, 35, 35, 1, 1, 1, 0, 422, 586, 0, 642, 1, 2000, 0, 1, 64, 0, 0, 0, 0, 0, 0, 345, 509, 103, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_obedience_crystal');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 128312;
DELETE FROM `creature_movement` WHERE id = 128312;
INSERT INTO `creature_movement` (`id`,`POINT`,`position_x`,`position_y`,`position_z`) VALUES
(128312,1,2777.138672,-3110.880859,267.684509),
(128312,2,2781.611328,-3106.903076,267.684509),
(128312,3,2784.291748,-3098.885254,267.684509),
(128312,4,2781.093018,-3090.532959,267.684509),
(128312,5,2773.239014,-3085.609619,267.684509),
(128312,6,2765.775146,-3086.021240,267.684509),
(128312,7,2758.100586,-3091.694824,267.684509),
(128312,8,2755.643555,-3097.803467,267.684509),
(128312,9,2756.769775,-3104.073975,267.684509),
(128312,10,2760.447021,-3109.536621,267.684509),
(128312,11,2766.769531,-3112.940918,267.684509);

-- 727_fishing_extravaganza_mangos.sql
	-- set ai for riggle
UPDATE `creature_template` SET `ScriptName`='npc_riggle_bassbait' WHERE entry=15077;
	-- updated start time for event Fishing Extravaganza
UPDATE `game_event` SET `start_time`='2009-06-14 14:00:00', `occurence`=10080, `length`=120 where entry=15;
	-- Create Jang
DELETE FROM `creature` WHERE `id`=15078;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(954687, 15078, 0, 1, 1, 0, 1711, -14438, 473.661, 15.3137, 3.65362, 25, 0, 0, 3200, 0, 0, 0);
	-- Create Fishbot 5000
DELETE FROM `creature` WHERE `id`=15079;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(954688, 15079, 0, 1, 1, 0, 0, -14440, 477.446, 15.25, 3.71802, 25, 0, 0, 2600, 0, 0, 0);
	-- Create Riggle Bassbait
DELETE FROM `creature` WHERE `id`=15077;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(954689, 15077, 0, 1, 1, 0, 13, -14439.3, 475.42, 15.892, 3.68503, 25, 0, 0, 3700, 0, 0, 0);
	-- Create Soapbox gameobject
DELETE FROM `gameobject` WHERE `id`=180403;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(954391, 180403, 0, 1, 1, -14439.3, 475.42, 15.2791, 3.68503, 0, 0, 0.963311, -0.268388, 25, 0, 1);

	-- new event - Fishing Extravaganza Questgivers
	-- Remove NPC and GO from any other event.
DELETE FROM `game_event_creature` WHERE `guid` IN (954687,954688,954689);
DELETE FROM `game_event_gameobject`WHERE `guid`=954391;
	-- Create Event
DELETE FROM `game_event` WHERE `entry`=35;
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES (35, '2009-03-29 14:00:00', '2020-12-31 00:00:00', 10080, 180, 0, 'Fishing Extravaganza Questgivers');
	-- Add NPCs to Event
DELETE FROM `game_event_creature` WHERE abs(`event`) = 35;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (954687,35), (954688,35), (954689,35);
	-- Add Soapbox to Event
DELETE FROM `game_event_gameobject` WHERE abs(`event`) = 35;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (954391,35);
	-- Remove Quests from normal DB:
DELETE FROM `creature_questrelation` WHERE quest IN (8193,8194,8225,8224,8221);
	-- Add Quests to Event
	-- Riggle Bassbait Quest: Master Angler
	-- Jang Quest: Apprentice Angler
	-- Fishbot 5000 Quest: Rare Fish - Brownell's Blue Striped Racer
	-- Fishbot 5000 Quest: Rare Fish - Dezian Queenfish
	-- Fishbot 5000 Quest: Rare Fish - Keefer's Angelfish
DELETE FROM `game_event_creature_quest` WHERE `event` IN (15,35);
INSERT INTO `game_event_creature_quest` (`id`,`quest`,`event`) VALUES (15077,8193,35), (15078,8194,35), (15079,8225,35), (15079,8224,35), (15079,8221,35);

-- 728_ruby_sanctum_mangos.sql
	-- UPDATE `instance_template` SET `script`='instance_ruby_sanctum' WHERE `map`=???;
UPDATE `creature_template` SET `ScriptName`='boss_halion', `AIName` ='' WHERE `entry`=39863;
UPDATE `creature_template` SET `ScriptName`='boss_baltharus', `AIName` ='' WHERE `entry`=39751;
UPDATE `creature_template` SET `ScriptName`='boss_zarithian', `AIName` ='' WHERE `entry`=39746;
UPDATE `creature_template` SET `ScriptName`='boss_ragefire', `AIName` ='' WHERE `entry`=39747;

-- 730_obsidian_sanctum_mangos.sql
UPDATE creature_template SET ScriptName='mob_fire_cyclone' WHERE entry = 30648;
UPDATE creature_template SET ScriptName='mob_flame_tsunami' WHERE entry = 30616;

	-- CUSTOM hack to different hard mode loot
REPLACE INTO creature_template (entry, difficulty_entry_1, modelid_A, modelid_H, faction_A, faction_H, NAME, subname, minhealth, maxhealth, rank, lootid) VALUES
(288601, 313111, 27035, 27035, 103, 103, 'Sartharion', 'The Onyx Guardian', 1, 1, 3, 288601),
(288602, 313112, 27035, 27035, 103, 103,  'Sartharion', 'The Onyx Guardian', 1, 1, 3, 288602),
(288603, 313113, 27035, 27035, 103, 103,  'Sartharion', 'The Onyx Guardian', 1, 1, 3, 288603),
(313111, 0, 27035, 27035, 103, 103,  'Sartharion', 'The Onyx Guardian', 1, 1, 3, 313111),
(313112, 0, 27035, 27035, 103, 103,  'Sartharion', 'The Onyx Guardian', 1, 1, 3, 313112),
(313113, 0, 27035, 27035, 103, 103,  'Sartharion', 'The Onyx Guardian', 1, 1, 3, 313113);

	-- boss loot
DELETE FROM creature_loot_template WHERE entry IN (30452, 30451, 30449, 28860, 288601, 288602, 288603, 31534, 31520, 31535, 31311, 313111, 313112, 313113);
	-- Tenebron, Shadron, Vesperon
UPDATE creature_template SET lootid=30449 WHERE entry IN (30452, 30451, 30449, 31534, 31520, 31535);
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, lootcondition, condition_value1, condition_value2) VALUES
(30449, 45624, 100, 0, 1, 1, 0, 0, 0);
	-- Sartharion
	-- references
DELETE FROM reference_loot_template WHERE entry IN (615000, 615001, 615002, 615010, 615011, 615012);
INSERT INTO reference_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, lootcondition, condition_value1, condition_value2) VALUES
	-- normal, no drakes
(615000, 40426, 0, 2, 1, 1, 0, 0, 0),
(615000, 40427, 0, 2, 1, 1, 0, 0, 0),
(615000, 40428, 0, 2, 1, 1, 0, 0, 0),
(615000, 40429, 0, 2, 1, 1, 0, 0, 0),
(615000, 40430, 0, 2, 1, 1, 0, 0, 0),
(615000, 40613, 0, 1, 1, 1, 0, 0, 0),
(615000, 40614, 0, 1, 1, 1, 0, 0, 0),
(615000, 40615, 0, 1, 1, 1, 0, 0, 0),
(615000, 43345, 100, 0, 1, 1, 0, 0, 0),
(615000, 43347, 100, 0, 1, 1, 0, 0, 0),
	-- normal, 1 drake
(615001, 43992, 0, 1, 1, 1, 0, 0, 0),
(615001, 43988, 0, 1, 1, 1, 0, 0, 0),
(615001, 43990, 0, 1, 1, 1, 0, 0, 0),
(615001, 43989, 0, 1, 1, 1, 0, 0, 0),
(615001, 43991, 0, 1, 1, 1, 0, 0, 0),
	-- normal, 2 drakes
(615002, 43995, 0, 1, 1, 1, 0, 0, 0),
(615002, 43998, 0, 1, 1, 1, 0, 0, 0),
(615002, 43994, 0, 1, 1, 1, 0, 0, 0),
(615002, 43996, 0, 1, 1, 1, 0, 0, 0),
(615002, 43993, 0, 1, 1, 1, 0, 0, 0),
	-- heroic, no drakes
(615010, 40431, 0, 2, 1, 1, 0, 0, 0),
(615010, 40432, 0, 3, 1, 1, 0, 0, 0),
(615010, 40433, 0, 3, 1, 1, 0, 0, 0),
(615010, 40437, 0, 2, 1, 1, 0, 0, 0),
(615010, 40438, 0, 3, 1, 1, 0, 0, 0),
(615010, 40439, 0, 3, 1, 1, 0, 0, 0),
(615010, 40446, 0, 2, 1, 1, 0, 0, 0),
(615010, 40451, 0, 2, 1, 1, 0, 0, 0),
(615010, 40453, 0, 3, 1, 1, 0, 0, 0),
(615010, 40455, 0, 2, 1, 1, 0, 0, 0),
(615010, 40628, 0, 1, 1, 1, 0, 0, 0),
(615010, 40629, 0, 1, 1, 1, 0, 0, 0),
(615010, 40630, 0, 1, 1, 1, 0, 0, 0),
(615010, 43345, 100, 0, 1, 1, 0, 0, 0),
(615010, 43346, 100, 0, 1, 1, 0, 0, 0),
	-- heroic, 1 drake
(615011, 44003, 0, 1, 1, 1, 0, 0, 0),
(615011, 44002, 0, 1, 1, 1, 0, 0, 0),
(615011, 44000, 0, 1, 1, 1, 0, 0, 0),
(615011, 44004, 0, 1, 1, 1, 0, 0, 0),
	-- heroic, 2 drakes
(615012, 44007, 0, 1, 1, 1, 0, 0, 0),
(615012, 44006, 0, 1, 1, 1, 0, 0, 0),
(615012, 44005, 0, 1, 1, 1, 0, 0, 0),
(615012, 44008, 0, 1, 1, 1, 0, 0, 0),
(615012, 44011, 0, 1, 1, 1, 0, 0, 0);
UPDATE creature_template SET lootid=entry WHERE entry IN (28860, 288601, 288602, 288603, 31311, 313111, 313112, 313113);
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, lootcondition, condition_value1, condition_value2) VALUES
	-- normal, no drakes
(28860, 615000, 100, 0, -615000, 1, 0, 0, 0),
(28860, 45624, 100, 0, 1, 1, 0, 0, 0),
	-- normal, 1 drake
(288601, 615000, 100, 0, -615000, 1, 0, 0, 0),
(288601, 615001, 100, 0, -615001, 1, 0, 0, 0),
(288601, 45624, 100, 0, 2, 2, 0, 0, 0),
	-- normal, 2 drakes
(288602, 615000, 100, 0, -615000, 1, 0, 0, 0),
(288602, 615001, 100, 0, -615001, 1, 0, 0, 0),
(288602, 615002, 100, 0, -615002, 1, 0, 0, 0),
(288602, 45624, 100, 0, 3, 3, 0, 0, 0),
	-- normal, 3 drakes
(288603, 615000, 100, 0, -615000, 1, 0, 0, 0),
(288603, 615001, 100, 0, -615001, 1, 0, 0, 0),
(288603, 615002, 100, 0, -615002, 1, 0, 0, 0),
(288603, 43986, 100, 0, 1, 1, 0, 0, 0),
(288603, 45624, 100, 0, 4, 4, 0, 0, 0),
	-- heroic, no drakes
(31311, 615010, 100, 0, -615010, 1, 0, 0, 0),
(31311, 45624, 100, 0, 1, 1, 0, 0, 0),
	-- heroic, 1 drake
(313111, 615010, 100, 0, -615010, 1, 0, 0, 0),
(313111, 615011, 100, 0, -615011, 1, 0, 0, 0),
(313111, 45624, 100, 0, 2, 2, 0, 0, 0),
	-- heroic, 2 drakes
(313112, 615010, 100, 0, -615010, 1, 0, 0, 0),
(313112, 615011, 100, 0, -615011, 1, 0, 0, 0),
(313112, 615012, 100, 0, -615012, 1, 0, 0, 0),
(313112, 45624, 100, 0, 3, 3, 0, 0, 0),
	-- heroic, 3 drakes
(313113, 615010, 100, 0, -615010, 1, 0, 0, 0),
(313113, 615011, 100, 0, -615011, 1, 0, 0, 0),
(313113, 615012, 100, 0, -615012, 1, 0, 0, 0),
(313113, 43954, 100, 0, 1, 1, 0, 0, 0),
(313113, 45624, 100, 0, 4, 4, 0, 0, 0);

-- 731_npc_special_mangos.sql
	-- Snakes trap
UPDATE `creature_template` SET `ScriptName`='npc_snake_trap_serpents' WHERE `entry` IN (19921, 19833);
	-- Mirror Immage
UPDATE `creature_template` SET `speed_walk` = 2.5, `modelid_A` = 11686, `modelid_H` = 11686, `minlevel` = 80, `maxlevel` = 80, `AIName` = '', `ScriptName`='mob_mirror_image' WHERE `entry` = 31216;
	-- Rune blade
UPDATE `creature_template` SET  `modelid_A` = 11686, `modelid_H` = 11686,`AIName` = '', `ScriptName`='npc_runeblade' WHERE `entry` = 27893;
	-- UPDATE `creature_template` SET  `modelid_A` = 11686, `modelid_H` = 11686,`AIName` = '', `ScriptName`='' WHERE `entry` = 27893;

-- 732_azjol-nerub_mangos.sql
	-- Azjol-Nerub from MaxXx2021
UPDATE creature_template SET ScriptName = 'npc_watcher_gashra' WHERE entry = 28730;
UPDATE creature_template SET ScriptName = 'npc_watcher_narjil' WHERE entry = 28729;
UPDATE creature_template SET ScriptName = 'boss_krikthir' WHERE entry = 28684;
UPDATE creature_template SET ScriptName = 'npc_watcher_silthik' WHERE entry = 28731;
UPDATE creature_template SET ScriptName = 'boss_hadronox' WHERE entry = 28921;
UPDATE creature_template SET ScriptName = 'npc_anub_ar_warrior' WHERE entry = 28732;
UPDATE creature_template SET ScriptName = 'npc_anub_ar_skirmisher' WHERE entry = 28734;
UPDATE creature_template SET ScriptName = 'npc_anub_ar_shadowcaster' WHERE entry = 28733;
UPDATE creature_template SET ScriptName = 'npc_skittering_infector' WHERE entry = 28736;


####
# addition/wk_updates (author: selector)
####

-- alterac.sql
/* ALTERAC VALLEY */
	-- Scriptnames
UPDATE `creature_template` SET ScriptName = "boss_galvangar" WHERE entry = 11947;
UPDATE `creature_template` SET ScriptName = "boss_balinda" WHERE entry = 11949;
UPDATE `creature_template` SET ScriptName = "boss_vanndar" WHERE entry = 11948;
UPDATE `creature_template` SET ScriptName = "boss_drekthar" WHERE entry = 11946;


####
# Custom (author: Janu)
####

-- [S2] Thargold_Ironwing.sql
	-- added gossip for Thargold Ironwing

UPDATE `creature_template` SET `ScriptName`='npc_thargold_ironwing' WHERE (`entry`='29154');
REPLACE INTO `npc_gossip` VALUES ('120802', '13454');
REPLACE INTO `locales_npc_text` VALUES ('13454', null, null, 'Seid gegr??t, $C! Der Hafen von Sturmwind bietet einen wundersch?nen Anblick. Und aus der Luft kann man ihn sogar noch mehr genie?en. Wie w?rde es Euch gefallen, den Hafen aus der Vogelperspektive zu sehen?', null, null, null, null, null, null, null, 'Seid gegr??t, $C! Der Hafen von Sturmwind bietet einen wundersch?nen Anblick. Und aus der Luft kann man ihn sogar noch mehr genie?en. Wie w?rde es Euch gefallen, den Hafen aus der Vogelperspektive zu sehen?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
REPLACE INTO `npc_text` VALUES ('13454', 'Seid gegr??t, $C! Der Hafen von Sturmwind bietet einen wundersch?nen Anblick. Und aus der Luft kann man ihn sogar noch mehr genie?en. Wie w?rde es Euch gefallen, den Hafen aus der Vogelperspektive zu sehen?', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');

-- [S3] Dalaran_Guards.sql
	-- added gossip for dalaran guards

UPDATE `creature_template` SET `ScriptName`='guard_dalaran' WHERE (`entry` BETWEEN 32670 AND 32700)  AND (`IconName`='Directions');
DELETE FROM `npc_text` WHERE `ID` IN (14009, 13993, 13992, 14006, 14005, 13973, 13961, 13960, 13969, 13976, 14010, 14007, 14003, 13977, 14004, 14015, 14002, 14251, 14008, 13975, 14001, 14000, 13999, 14117);
INSERT IGNORE INTO `npc_text`(`ID`, `text0_0`, `text0_1`) VALUES (14014,"Please respect the laws of Dalaran while you are here, stranger.$B$BWere you lost? Is there something I might help you find?","Please respect the laws of Dalaran while you are here, stranger.$B$BWere you lost? Is there something I might help you find?"),
(13976,"Dalaran\'s arena and those who service it are found beneath the city, in the sewers.$B$BThere are at least three ways in: Entrances in the east and west, and a well in the north.","Dalaran\'s arena and those who service it are found beneath the city, in the sewers.$B$BThere are at least three ways in: Entrances in the east and west, and a well in the north."),
(14010,"Dalaran has no auction house of its own. You must take a portal back to one of your capitals.$B$BThey can be found in Dalaran\'s Alliance and Horde quarters: the Silver Enclave and the Sunreaver\'s Sancturary.","Dalaran has no auction house of its own. You must take a portal back to one of your capitals.$B$BThey can be found in Dalaran\'s Alliance and Horde quarters: the Silver Enclave and the Sunreaver\'s Sancturary."),
(14007,"There are three banks in the city: The Bank of Dalaran in the north, the Dalaran Merchants\' Bank in the south, and one more beneath the city, in the sewers.","There are three banks in the city: The Bank of Dalaran in the north, the Dalaran Merchants\' Bank in the south, and one more beneath the city, in the sewers."),
(14003,"The city\'s best-known barber shop is located in northern Dalaran.","The city\'s best-known barber shop is located in northern Dalaran."),
(13977,"Portals to the various capitals and battlegrounds can be found in Dalaran\'s Alliance and Horde quarters: the Silver Enclave and the Sunreaver\'s Sancturary.","Portals to the various capitals and battlegrounds can be found in Dalaran\'s Alliance and Horde quarters: the Silver Enclave and the Sunreaver\'s Sancturary."),
(14004,"You\'ll find the city\'s Flight Master at Krasus\' Landing in eastern Dalaran.","You\'ll find the city\'s Flight Master at Krasus\' Landing in eastern Dalaran."),
(14015,"Dalaran\'s guild master is found in the visitor center, just south of the city\'s center.","Dalaran\'s guild master is found in the visitor center, just south of the city\'s center."),
(14002,"The most popular inn in Dalaran is the Legerdemain Lounge, just north of the city\'s center.$B$BThe Alliance and Horde Quarters each have their own inns as well, and I am told there is one more beneath the city, in the sewers.","The most popular inn in Dalaran is the Legerdemain Lounge, just north of the city\'s center.$B$BThe Alliance and Horde Quarters each have their own inns as well, and I am told there is one more beneath the city, in the sewers."),
(14251,"If you are seeking a locksmith, might I suggest the sewers? That\'s where you\'ll find more... disreputable types.","If you are seeking a locksmith, might I suggest the sewers? That\'s where you\'ll find more... disreputable types."),
(14008,"There are many mailboxes in Dalaran: On many corners, outside nearly every inn and bank, even upon Krasus\' Landing.","There are many mailboxes in Dalaran: On many corners, outside nearly every inn and bank, even upon Krasus\' Landing."),
(13975,"There are many places of interest in Dalaran. Which do you seek?","There are many places of interest in Dalaran. Which do you seek?"),
(14001,"Dalaran\'s stable master is located inside the Magical Menagerie in northeast Dalaran.","Dalaran\'s stable master is located inside the Magical Menagerie in northeast Dalaran."),
(14000,"What sort of trainer were you trying to find?","What sort of trainer were you trying to find?"),
(13999,"The city\'s mage and portal trainers may be found in a large building in eastern Dalaran, between Runeweaver Square at the heart of the city and Krasus\' Landing.","The city\'s mage and portal trainers may be found in a large building in eastern Dalaran, between Runeweaver Square at the heart of the city and Krasus\' Landing."),
(14117,"Which vendor where you seeking?","Which vendor where you seeking?"),
(13961,"The eastern sewers entrance is just outside the entrance to Krasus\' Landing.","The eastern sewers entrance is just outside the entrance to Krasus\' Landing."),
(13960,"The western sewers entrance is beneath the stairway to the Violet Citadel.","The western sewers entrance is beneath the stairway to the Violet Citadel."),
(13969,"There is well in northern Dalaran that some of the city\'s more... adventurous... visitors use to enter the sewers.","There is well in northern Dalaran that some of the city\'s more... adventurous... visitors use to enter the sewers."),
(13973,"Visiting members of the Alliance keep primarily to the Silver Enclave in southwestern Dalaran.$B$BThere is an inn there, as well as portals to the various Alliance cities and battlegrounds.","Visiting members of the Alliance keep primarily to the Silver Enclave in southwestern Dalaran.$B$BThere is an inn there, as well as portals to the various Alliance cities and battlegrounds."),
(14005,"The Bank of Dalaran is in the northern part of the city.","The Bank of Dalaran is in the northern part of the city."),
(14006,"The Dalaran Merchants\' Bank is in the southern part of the city, off the Eventide.","The Dalaran Merchants\' Bank is in the southern part of the city, off the Eventide."),
(13992,"A Hero\'s Welcome is located right beside the Silver Enclave in southwestern Dalaran.$B$BThe place boasts a beer garden and one of the city\'s finest cooking trainer in its kitchen.","A Hero\'s Welcome is located right beside the Silver Enclave in southwestern Dalaran.$B$BThe place boasts a beer garden and one of the city\'s finest cooking trainer in its kitchen."),
(13993,"You\'re looking for The Filthy Animal in the Horde quarter of Sunreaver\'s Sanctuary, northeastern Dalaran.$B$BI am told it is a rather rough place, but with an excellent cooking trainer in its kitchen.","You\'re looking for The Filthy Animal in the Horde quarter of Sunreaver\'s Sanctuary, northeastern Dalaran.$B$BI am told it is a rather rough place, but with an excellent cooking trainer in its kitchen."),
(14009,"Krasus\' Landing is in easternmost Dalaran.$B$BThe city\'s flight master is there, as well as the cold weather flying trainer.","Krasus\' Landing is in easternmost Dalaran.$B$BThe city\'s flight master is there, as well as the cold weather flying trainer."),
(13971,"Do you see the massive spired tower in eastern Dalaran? That is the majestic Violet Citadel.","Do you see the massive spired tower in eastern Dalaran? That is the majestic Violet Citadel."),
(13970,"The Violet Hold, prison for the enemies of the Kirin Tor, is in southeast Dalaran.","The Violet Hold, prison for the enemies of the Kirin Tor, is in southeast Dalaran."),
(13980,"The Magus Commerce Exchange is in northwest Dalaran, and holds most of the city\'s profession trainers.","The Magus Commerce Exchange is in northwest Dalaran, and holds most of the city\'s profession trainers."),
(13968,"The memorial park to Antonidas is located in northern Dalaran.","The memorial park to Antonidas is located in northern Dalaran."),
(13967,"Runeweaver Square is a park at the very heart of Dalaran.","Runeweaver Square is a park at the very heart of Dalaran."),
(13966,"The Eventide is a square in southern Dalaran. The enchanted fountain there is popular for fishing.","The Eventide is a square in southern Dalaran. The enchanted fountain there is popular for fishing."),
(13965,"The city\'s cemetery is just north of the Violet Citadel in western Dalaran.","The city\'s cemetery is just north of the Violet Citadel in western Dalaran."),
(14174,"Necessary for imbuing your spells and abilities with Glyphs, the Lexicon of Power is an invaluable resource for everyone.  These ancient tomes are always found near inscription trainers.
","Necessary for imbuing your spells and abilities with Glyphs, the Lexicon of Power is an invaluable resource for everyone.  These ancient tomes are always found near inscription trainers."),
(14114,"What sort of armor?","What sort of armor?"),
(14112,"The Threads of Fate in western Dalaran is the city\'s most popular supplier of clothing and cloth armor.","The Threads of Fate in western Dalaran is the city\'s most popular supplier of clothing and cloth armor."),
(14108,"Adventurers turn in their Emblems of Heroism or Valor in the Silver Enclave or Sunreaver\'s Sanctuary.","Adventurers turn in their Emblems of Heroism or Valor in the Alliance and Horde quarters, in the Silver Enclave or Sunreaver\'s Sanctuary."),
(14107,"You can normally find Miss Primrose\'s flower stand in southeast Dalaran.","You can normally find Miss Primrose\'s flower stand in southeast Dalaran."),
(14106,"Applebough\'s fruit cart is usually in southwest Dalaran, near the Silver Enclave.","Applebough\'s fruit cart is usually in southwest Dalaran, near the Silver Enclave."),
(14105,"Glorious Goods in southern Dalaran should have all the general goods you need.","Glorious Goods in southern Dalaran should have all the general goods you need."),
(13984,"That would be Cartier & Co. Fine Jewelry in the Magus Commerce Exchange, northwest Dalaran.","That would be Cartier & Co. Fine Jewelry in the Magus Commerce Exchange, northwest Dalaran."),
(14103,"The Magical Menagerie is located in northeast Dalaran. Pet supplies, exotic mounts, and stables are all available there.","The Magical Menagerie is located in northeast Dalaran. Pet supplies, exotic mounts, and stables are all available there."),
(14102,"Aimee\'s cart can usually be found in northern Dalaran, near the Bank of Dalaran.","Aimee\'s cart can usually be found in northern Dalaran, near the Bank of Dalaran."),
(14104,"You\'ll find reagants and more at the Sisters Sorcerous in western Dalaran.$B$BJust mind the Mooreheads\' black cat...","You\'ll find reagants and more at the Sisters Sorcerous in western Dalaran.$B$BJust mind the Mooreheads\' black cat..."),
(14100,"Jepetto Joybuzz\'s Wonderworks in western Dalaran carries such items.","Jepetto Joybuzz\' Wonderworks in western Dalaran carries such items."),
(14101,"Red at Glorious Goods in southeast Dalaran can provide most general trade supplies.$B$BIf you need something more specialized, try the Magus Commerce Exchange. Each trade shop there has its own supply vendor.","Red at Glorious Goods in southeast Dalaran can provide most general trade supplies.$B$BIf you need something more specialized, try the Magus Commerce Exchange. Each trade shop there has its own supply vendor."),
(14110,"The various merchants of Curiosities & Moore in southern Dalaran sell trinkets, relics, heirlooms, and off-hand items of all sorts.","The various merchants of Curiosities & Moore in southern Dalaran sell trinkets, relics, heirlooms, and off-hand items of all sorts."),
(14113,"What sort of weapons?","What sort of weapons?"),
(14095,"You\'ll find what you are looking for at One More Glass in northern Dalaran.","You\'ll find what you are looking for at One More Glass in northern Dalaran."),
(14111,"Langrom\'s Leather & Links in southern Dalaran should have what you seek.","Langrom\'s Leather & Links in southern Dalaran should have what you seek."),
(14109,"Tanks for Everything in northern Dalaran is the city\'s most popular plate armor and shield merchant.","Tanks for Everything in northern Dalaran is the city\'s most popular plate armor and shield merchant."),
(14098,"The Arsenal Absolute in southeast Dalaran carries all manner of melee weapons.","The Arsenal Absolute in southeast Dalaran carries all manner of melee weapons."),
(14097,"The Hunter\'s Reach in eastern Dalaran sells guns, bows, ammunition and the like.","The Hunter\'s Reach in eastern Dalaran sells guns, bows, ammunition and the like."),
(14096,"The Militant Mystic in southern Dalaran should have what you desire.","The Militant Mystic in southern Dalaran should have what you desire."),
(13999,"The city\'s mage and portal trainers may be found in a large building in eastern Dalaran, between Runeweaver Square at the heart of the city and Krasus\' Landing.","The city\'s mage and portal trainers may be found in a large building in eastern Dalaran, between Runeweaver Square at the heart of the city and Krasus\' Landing."),
(13998,"The high elf Hira Snowdawn teaches Cold Weather Flying.$B$BShe can be found upon her dragonhawk at Krasus\' Landing in eastern Dalaran.","The high elf Hira Snowdawn teaches Cold Weather Flying.$B$BShe can be found upon her dragonhawk at Krasus\' Landing in eastern Dalaran."),
(13996,"Which profession trainer were you looking for?","Which profession trainer were you looking for?"),
(13995,"Look for the potion-shaped door to the Agronomical Apothecary in the Magus Commerce Exchange, northwest Dalaran. It\'s quite impossible to miss!","Look for the potion-shaped door to the Agronomical Apothecary in the Magus Commerce Exchange, northwest Dalaran. It\'s quite impossible to miss!"),
(13994,"There is a large smithy and forge in the Magus Commerce Exchange, northwest Dalaran.$B$BLook for the massive enchanted anvil and stained glass windows in he shapes of axes and shields.","There is a large smithy and forge in the Magus Commerce Exchange, northwest Dalaran.$B$BLook for the massive enchanted anvil and stained glass windows in he shapes of axes and shields."),
(13991,"Cooking trainers are located in the kitchens of the Alliance and Horde inns in their respective quarters.","Cooking trainers are located in the kitchens of the Alliance and Horde inns in their respective quarters."),
(13990,"You\'ll want to visit Simply Enchanting, just outside the Magus Commerce Exchange in northwest Dalaran.","You\'ll want to visit Simply Enchanting, just outside the Magus Commerce Exchange in northwest Dalaran."),
(13989,"Engineers often train at Like Clockwork in the Magus Commerce Exchange, northwest Dalaran.","Engineers often train at Like Clockwork in the Magus Commerce Exchange, northwest Dalaran."),
(13988,"The city\'s premier urgent care center, First to your Aid, is located in the Magus Commerce Exchange, northwest Dalaran.","The city\'s premier urgent care center, First to your Aid, is located in the Magus Commerce Exchange, northwest Dalaran."),
(13987,"One can learn to fish near the enchanted fountain in the Eventide, a square in southern Dalaran.","One can learn to fish near the enchanted fountain in the Eventide, a square in southern Dalaran."),
(13986,"There is a greenhouse attached to the Agronomical Apothecary in the Magus Commerce Exchange, northwest Dalaran. You\'ll find the city\'s best herbalists there.","There is a greenhouse attached to the Agronomical Apothecary in the Magus Commerce Exchange, northwest Dalaran. You\'ll find the city\'s best herbalists there."),
(13985,"Seek out The Scribe\'s Sacellum in the Magus Commerce Exchange, northwest Dalaran.","Seek out The Scribe\'s Sacellum in the Magus Commerce Exchange, northwest Dalaran."),
(13984,"That would be Cartier & Co. Fine Jewelry in the Magus Commerce Exchange, northwest Dalaran.","That would be Cartier & Co. Fine Jewelry in the Magus Commerce Exchange, northwest Dalaran."),
(13982,"Skinners and leatherworkers of all sorts may be Legendary Leathers in the Magus Commerce Exchange, northwest Dalaran.","Skinners and leatherworkers of all sorts may be Legendary Leathers in the Magus Commerce Exchange, northwest Dalaran."),
(13983,"Miners trainers and supplies are found in the All that Glitters Prospecting Co. in the Magus Commerce Exchange, northwest Dalaran.","Miners trainers and supplies are found in the All that Glitters Prospecting Co. in the Magus Commerce Exchange, northwest Dalaran."),
(13981,"The city\'s best tailors are in Talismanic Textiles in the Magus Commerce Exchange, northwest Dalaran.","The city\'s best tailors are in Talismanic Textiles in the Magus Commerce Exchange, northwest Dalaran.");

-- [S4] Thirst_Unending.sql
	-- Thirst Unending

UPDATE `creature_template` SET `ScriptName`='npc_mana_wyrm' WHERE `entry`='15274';
UPDATE `quest_template` SET `ReqCreatureOrGOCount1`='1' WHERE `entry`='8346';

-- [S5] Winterveil.sql
	-- Feast of Winter Veil Fixes

UPDATE `creature_template` SET `ScriptName`= 'npc_winter_reveler' WHERE `entry`='15760';
UPDATE `creature_template` SET npcflag = '1' WHERE entry = '15664';
UPDATE `creature_template` SET ScriptName = 'npc_metzen' WHERE entry = '15664';
UPDATE `quest_template` SET ReqCreatureOrGOId1 = '15665' WHERE entry = '8762';
UPDATE `quest_template` SET ReqCreatureOrGOId1 = '15665' WHERE entry = '8746';

-- [S6] Nexus.sql
	-- The Nexus - The Nexus

UPDATE `creature_template` SET scriptname = 'boss_commander_stoutbeard' where entry = '26796';
UPDATE `creature_template` SET scriptname = 'boss_commander_kolurg' where entry = '26798';

-- [S8] Powering_our_Defenses.sql
	-- Powering our Defenses

UPDATE `creature_template` SET `ScriptName`='npc_infused_crystal' WHERE `entry`='16364';

-- [S9] Lazy_Peons.sql
	-- Lazy Peons

UPDATE `creature_template` SET `ScriptName`='npc_lazy_peon' WHERE (`entry`='10556');
UPDATE `quest_template` SET `ReqSpellCast1`='0' WHERE (`entry`='5441');

-- [S10] Zul_Farrak.sql
	-- Zul'Farrak

UPDATE `gameobject_template` SET `ScriptName` = 'go_shallow_grave' WHERE `entry` = 128403;
UPDATE `creature_template` SET `ScriptName` = 'boss_antusul' WHERE `entry` = 8127;
UPDATE `creature_template` SET `ScriptName` = 'npc_servant' WHERE `entry` = 8156;
UPDATE `gameobject_template` SET `data2` = 0, `data6` = 30000, `ScriptName` = 'go_gong_of_ghazrilla' WHERE `entry` = 141832;
UPDATE `creature_template` SET `ScriptName` = 'boss_ghazrilla' WHERE `entry` = 7273;
UPDATE `creature_template` SET `ScriptName` = 'boss_velratha' WHERE `entry` = 7795;
UPDATE `creature_template` SET `ScriptName` = 'boss_ruzzlu' WHERE `entry` = 7797;
UPDATE `creature_template` SET `ScriptName` = 'boss_ukorz' WHERE `entry` = 7267;

-- [S12] Deathknight_Gargoyle.sql
	-- Deathknight Gargoyle

UPDATE `creature_template` SET `ScriptName` = 'npc_death_knight_gargoyle' WHERE `entry` = '27829';

-- [S13] Training_Dummy.sql
	-- Training Dummy

UPDATE `creature_template` SET `AIName` = 'EventAI', `flags_extra` = 2, `unit_flags` = 393220, `mechanic_immune_mask` = 4399133,  `ScriptName` = 'npc_training_dummy' WHERE `entry` IN (32666, 33229, 33243, 33272, 31146, 32667, 31144, 25225, 32666, 5652, 17578, 19139, 17059, 17060, 2673, 18504, 32542, 32546, 32545, 32543, 1921, 18504, 16211, 5202, 27222, 27223, 32541);

-- [S14] Ebon_Hold.sql
	-- Into the Realm of Shadows
UPDATE `creature_template` SET `ScriptName`='npc_salanar_the_horseman',ainame="" WHERE `entry`='28653';
UPDATE `creature_template` SET `ScriptName`='mob_dark_rider_of_acherus',ainame="" WHERE `entry`='28768';

	-- The Gift That Keeps On Giving
UPDATE `creature_template` SET `ScriptName`='mob_scarlet_miner',ainame="" WHERE `entry`='28822';

	-- How To Win Friends And Influence Enemies
UPDATE `creature_template` SET `ScriptName`='npc_crusade_persuaded',ainame="" WHERE `entry` IN (28939,28940,28610);


	-- Ambush At The Overlook
DELETE FROM `creature` WHERE `id` = 28957;
INSERT INTO `creature` (`id`, `map`, `phaseMask`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(28957, 609, 4, 1, 0, 0, 1416.466, -6017.807, 116.357, 1, 360, 0, 0, 1, 0, 0, 1);
UPDATE `creature_template` SET `ScriptName`='mob_scarlet_courier_controller',flags_extra=130,ainame="" WHERE `entry`='28957';
UPDATE `creature_template` SET `ScriptName`='mob_scarlet_courier',ainame="" WHERE `entry`='29076';

	-- Bloody Breakout
UPDATE `creature_template` SET `ScriptName`='mob_high_inquisitor_valroth',minmana=6489,maxmana=6489,unit_flags=32768,ainame="" WHERE `entry`='29001';
UPDATE `creature_template` SET `AIName`='EventAI',minmana=1020,maxmana=1058,unit_flags=32768 WHERE (`entry`='29007');
DELETE FROM creature_ai_scripts WHERE id BETWEEN 90030 AND 90033;
INSERT INTO `creature_ai_scripts` VALUES ('90030', '29007', '0', '0', '100', '1', '1000', '4000', '1000', '4000', '11', '15498', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Crimson Acolyte - Holy Smite');
INSERT INTO `creature_ai_scripts` VALUES ('90031', '29007', '0', '0', '100', '1', '1000', '10000', '20000', '21000', '11', '34809', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Crimson Acolyte - Holy Fury');
INSERT INTO `creature_ai_scripts` VALUES ('90032', '29007', '0', '0', '100', '0', '1000', '5000', '1000', '5000', '11', '19725', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Crimson Acolyte - Turn Undead');
INSERT INTO `creature_ai_scripts` VALUES ('90033', '29007', '4', '0', '100', '0', '0', '0', '0', '0', '11', '15498', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Crimson Acolyte aggro');

	-- The Light of Dawn (to do)
UPDATE `creature_template` SET `ScriptName`='npc_highlord_darion_mograine',ainame="" WHERE `entry`='29173';
UPDATE `creature_template` SET `ScriptName`='npc_the_lich_king_tirion_dawn',ainame="" WHERE `entry` in (29183,29175);
UPDATE creature_template SET AIName='EventAI',unit_flags=0,type_flags=8 WHERE entry IN (29199,29204,29200,29174,29182,29186,29190,29219,29206,29176,29178,29179,29180,29177,29181);
DELETE FROM `spell_script_target` WHERE `entry` in (53658, 53679, 53701, 53705, 53706, 53677, 53685);
	-- insert into spell_script_target values (53658, 1, 29173);
insert into spell_script_target values (53679, 1, 29183);
insert into spell_script_target values (53701, 1, 29175);
insert into spell_script_target values (53705, 1, 29183);
insert into spell_script_target values (53706, 1, 29183);
insert into spell_script_target values (53677, 1, 29227);
insert into spell_script_target values (53685, 1, 29175);

DELETE FROM `gameobject` WHERE `id` IN (191330);
INSERT INTO `gameobject` (guid, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(191330, '191330','609','1','128','2283.896','-5287.914','83.066','1','0.0','0.0','0.0','1.0','180','0','1');

DELETE FROM creature_ai_scripts WHERE id BETWEEN 90051 AND 90084;
INSERT INTO `creature_ai_scripts` VALUES ('90051', '29199', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52374', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Koltira Deathweaver - SPELL_BLOOD_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90052', '29199', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '49576', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Koltira Deathweaver - SPELL_DEATH_GRIP');
INSERT INTO `creature_ai_scripts` VALUES ('90053', '29199', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52372', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Koltira Deathweaver - SPELL_ICY_TOUCH2');
INSERT INTO `creature_ai_scripts` VALUES ('90054', '29199', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '50668', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Koltira Deathweaver - SPELL_PLAGUE_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90055', '29204', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52374', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Orbaz Bloodbane - SPELL_BLOOD_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90056', '29204', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '49576', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Orbaz Bloodbane - SPELL_DEATH_GRIP');
INSERT INTO `creature_ai_scripts` VALUES ('90057', '29204', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52372', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Orbaz Bloodbane - SPELL_ICY_TOUCH2');
INSERT INTO `creature_ai_scripts` VALUES ('90058', '29204', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '50668', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Orbaz Bloodbane - SPELL_PLAGUE_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90059', '29200', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52374', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thassarian - SPELL_BLOOD_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90060', '29200', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '49576', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thassarian - SPELL_DEATH_GRIP');
INSERT INTO `creature_ai_scripts` VALUES ('90061', '29200', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '52372', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thassarian - SPELL_ICY_TOUCH2');
INSERT INTO `creature_ai_scripts` VALUES ('90062', '29200', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '50668', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Thassarian - SPELL_PLAGUE_STRIKE1');
INSERT INTO `creature_ai_scripts` VALUES ('90063', '29174', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '29427', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_HOLY_LIGHT1');
INSERT INTO `creature_ai_scripts` VALUES ('90064', '29174', '4', '0', '100', '0', '0', '0', '0', '0', '11', '53625', '1', '5', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light aggro');
INSERT INTO `creature_ai_scripts` VALUES ('90065', '29174', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '53625', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_HEROIC_LEAP');
INSERT INTO `creature_ai_scripts` VALUES ('90066', '29174', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '53643', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_HOLY_STRIKE');
INSERT INTO `creature_ai_scripts` VALUES ('90067', '29174', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '53638', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_HOLY_WRATH');
INSERT INTO `creature_ai_scripts` VALUES ('90068', '29174', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '53629', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Defender of the Light - SPELL_UPPERCUT');
INSERT INTO `creature_ai_scripts` VALUES ('90069', '29182', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '33642', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Rimblat Earthshatter - SPELL_CHAIN_HEAL');
INSERT INTO `creature_ai_scripts` VALUES ('90070', '29182', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53630', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rimblat Earthshatter - SPELL_THUNDER');
INSERT INTO `creature_ai_scripts` VALUES ('90071', '29186', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53633', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rampaging Abomination - SPELL_CLEAVE1');
INSERT INTO `creature_ai_scripts` VALUES ('90072', '29186', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '50335', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rampaging Abomination - SPELL_SCOURGE_HOOK');
INSERT INTO `creature_ai_scripts` VALUES ('90073', '29190', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53634', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Flesh Behemoth - SPELL_SCOURGE_HOOK');
INSERT INTO `creature_ai_scripts` VALUES ('90074', '29190', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '36706', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Flesh Behemoth - SPELL_THUNDERCLAP');
INSERT INTO `creature_ai_scripts` VALUES ('90075', '29190', '0', '0', '100', '3', '5000', '10000', '5000', '10000', '11', '53627', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Flesh Behemoth - SPELL_THUNDERCLAP');
INSERT INTO `creature_ai_scripts` VALUES ('90076', '29219', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53632', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Volatile Ghoul - SPELL_GHOULPLOSION');
INSERT INTO `creature_ai_scripts` VALUES ('90077', '29206', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53631', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Warrior of the Frozen Wastes - SPELL_CLEAVE');
INSERT INTO `creature_ai_scripts` VALUES ('90078', '29176', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53631', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Korfax - SPELL_CLEAVE');
INSERT INTO `creature_ai_scripts` VALUES ('90079', '29176', '0', '0', '100', '3', '10000', '20000', '10000', '10000', '11', '53625', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Korfax - SPELL_CLEAVE');
INSERT INTO `creature_ai_scripts` VALUES ('90080', '29177', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '37979', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Commander Eligor Dawnbringer - SPELL_HOLY_LIGHT2');
INSERT INTO `creature_ai_scripts` VALUES ('90081', '29181', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '20664', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Rayne - SPELL_REJUVENATION');
INSERT INTO `creature_ai_scripts` VALUES ('90082', '29181', '14', '0', '100', '3', '10000', '20', '5000', '10000', '11', '25817', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Rayne - SPELL_TRANQUILITY');
INSERT INTO `creature_ai_scripts` VALUES ('90083', '29181', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '20678', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rayne - SPELL_STARFALL');
INSERT INTO `creature_ai_scripts` VALUES ('90084', '29181', '0', '0', '100', '3', '10000', '20000', '10000', '20000', '11', '21807', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rayne - SPELL_WRATH');

-- [S15] Onyxias_Lair.sql
	-- Onyxias Lair

	-- SPELL_BREATH_EAST_TO_WEST
DELETE FROM spell_target_position WHERE id IN (18576, 18578, 18579, 18580, 18581, 18582, 18583);
INSERT INTO spell_target_position VALUES (18576, 249, -37.743851, -243.667923, -88.217651, 1.416);
INSERT INTO spell_target_position VALUES (18578, 249, -35.805332, -232.028900, -87.749153, 1.416);
INSERT INTO spell_target_position VALUES (18579, 249, -34.045738, -224.714661, -85.529465, 1.416);
INSERT INTO spell_target_position VALUES (18580, 249, -32.081570, -214.916962, -88.327438, 1.416);
INSERT INTO spell_target_position VALUES (18581, 249, -36.611721, -202.684677, -85.653786, 1.416);
INSERT INTO spell_target_position VALUES (18582, 249, -37.067261, -195.758652, -87.745834, 1.416);
INSERT INTO spell_target_position VALUES (18583, 249, -37.728523, -188.616806, -88.074898, 1.416);
	-- SPELL_BREATH_WEST_TO_EAST
DELETE FROM spell_target_position WHERE id IN (18609, 18611, 18612, 18613, 18614, 18615, 18616);
INSERT INTO spell_target_position VALUES (18609, 249, -37.728523, -188.616806, -88.074898, 4.526);
INSERT INTO spell_target_position VALUES (18611, 249, -37.067261, -195.758652, -87.745834, 4.526);
INSERT INTO spell_target_position VALUES (18612, 249, -36.611721, -202.684677, -85.653786, 4.526);
INSERT INTO spell_target_position VALUES (18613, 249, -32.081570, -214.916962, -88.327438, 4.526);
INSERT INTO spell_target_position VALUES (18614, 249, -34.045738, -224.714661, -85.529465, 4.526);
INSERT INTO spell_target_position VALUES (18615, 249, -35.805332, -232.028900, -87.749153, 4.526);
INSERT INTO spell_target_position VALUES (18616, 249, -37.743851, -243.667923, -88.217651, 4.526);
	-- SPELL_BREATH_NW_TO_SE
DELETE FROM spell_target_position WHERE id IN (18584, 18585, 18586, 18587, 18588, 18589, 18590, 18591, 18592, 18593, 18594, 18595);
INSERT INTO spell_target_position VALUES (18584, 249, 6.016711, -181.305771, -85.654648, 3.776);
INSERT INTO spell_target_position VALUES (18585, 249, 3.860220, -183.227249, -86.375381, 3.776);
INSERT INTO spell_target_position VALUES (18586, 249, -2.529650, -188.690491, -87.172859, 3.776);
INSERT INTO spell_target_position VALUES (18587, 249, -8.449303, -193.957962, -87.564957, 3.776);
INSERT INTO spell_target_position VALUES (18588, 249, -14.321238, -199.462219, -87.922478, 3.776);
INSERT INTO spell_target_position VALUES (18589, 249, -15.602085, -216.893936, -88.403183, 3.776);
INSERT INTO spell_target_position VALUES (18590, 249, -23.650263, -221.969086, -89.172699, 3.776);
INSERT INTO spell_target_position VALUES (18591, 249, -29.495876, -213.014359, -88.910423, 3.776);
INSERT INTO spell_target_position VALUES (18592, 249, -35.439922, -217.260284, -87.336311, 3.776);
INSERT INTO spell_target_position VALUES (18593, 249, -41.762104, -221.896545, -86.114113, 3.776);
INSERT INTO spell_target_position VALUES (18594, 249, -51.067528, -228.909988, -85.765556, 3.776);
INSERT INTO spell_target_position VALUES (18595, 249, -56.559654, -241.223923, -85.423607, 3.776);
	-- SPELL_BREATH_SE_TO_NW
DELETE FROM spell_target_position WHERE id IN (18564, 18565, 18566, 18567, 18568, 18569, 18570, 18571, 18572, 18573, 18574, 18575);
INSERT INTO spell_target_position VALUES (18564, 249, -56.559654, -241.223923, -85.423607, 0.666);
INSERT INTO spell_target_position VALUES (18565, 249, -51.067528, -228.909988, -85.765556, 0.666);
INSERT INTO spell_target_position VALUES (18566, 249, -41.762104, -221.896545, -86.114113, 0.666);
INSERT INTO spell_target_position VALUES (18567, 249, -35.439922, -217.260284, -87.336311, 0.666);
INSERT INTO spell_target_position VALUES (18568, 249, -29.495876, -213.014359, -88.910423, 0.666);
INSERT INTO spell_target_position VALUES (18569, 249, -23.650263, -221.969086, -89.172699, 0.666);
INSERT INTO spell_target_position VALUES (18570, 249, -15.602085, -216.893936, -88.403183, 0.666);
INSERT INTO spell_target_position VALUES (18571, 249, -14.321238, -199.462219, -87.922478, 0.666);
INSERT INTO spell_target_position VALUES (18572, 249, -8.449303, -193.957962, -87.564957, 0.666);
INSERT INTO spell_target_position VALUES (18573, 249, -2.529650, -188.690491, -87.172859, 0.666);
INSERT INTO spell_target_position VALUES (18574, 249, 3.860220, -183.227249, -86.375381, 0.666);
INSERT INTO spell_target_position VALUES (18575, 249, 6.016711, -181.305771, -85.654648, 0.666);
	-- SPELL_BREATH_SW_TO_NE
DELETE FROM spell_target_position WHERE id IN (18596, 18597, 18598, 18599, 18600, 18601, 18602, 18603, 18604, 18605, 18606, 18607);
INSERT INTO spell_target_position VALUES (18596, 249, -58.250900, -189.020004, -85.292267, 5.587);
INSERT INTO spell_target_position VALUES (18597, 249, -52.006271, -193.796570, -85.808769, 5.587);
INSERT INTO spell_target_position VALUES (18598, 249, -46.135464, -198.548553, -85.901764, 5.587);
INSERT INTO spell_target_position VALUES (18599, 249, -40.500187, -203.001053, -85.555107, 5.587);
INSERT INTO spell_target_position VALUES (18600, 249, -30.907579, -211.058197, -88.592125, 5.587);
INSERT INTO spell_target_position VALUES (18601, 249, -20.098139, -218.681427, -88.937088, 5.587);
INSERT INTO spell_target_position VALUES (18602, 249, -12.223192, -224.666168, -87.856300, 5.587);
INSERT INTO spell_target_position VALUES (18603, 249, -6.475297, -229.098724, -87.076401, 5.587);
INSERT INTO spell_target_position VALUES (18604, 249, -2.010256, -232.541992, -86.995140, 5.587);
INSERT INTO spell_target_position VALUES (18605, 249, 2.736300, -236.202347, -86.790367, 5.587);
INSERT INTO spell_target_position VALUES (18606, 249, 7.197779, -239.642868, -86.307297, 5.587);
INSERT INTO spell_target_position VALUES (18607, 249, 12.120926, -243.439407, -85.874260, 5.587);
	-- SPELL_BREATH_NE_TO_SW
DELETE FROM spell_target_position WHERE id IN (18617, 18619, 18620, 18621, 18622, 18623, 18624, 18625, 18626, 18627, 18628, 18618);
INSERT INTO spell_target_position VALUES (18617, 249, 12.120926, -243.439407, -85.874260, 2.428);
INSERT INTO spell_target_position VALUES (18619, 249, 7.197779, -239.642868, -86.307297, 2.428);
INSERT INTO spell_target_position VALUES (18620, 249, 2.736300, -236.202347, -86.790367, 2.428);
INSERT INTO spell_target_position VALUES (18621, 249, -2.010256, -232.541992, -86.995140, 2.428);
INSERT INTO spell_target_position VALUES (18622, 249, -6.475297, -229.098724, -87.076401, 2.428);
INSERT INTO spell_target_position VALUES (18623, 249, -12.223192, -224.666168, -87.856300, 2.428);
INSERT INTO spell_target_position VALUES (18624, 249, -20.098139, -218.681427, -88.937088, 2.428);
INSERT INTO spell_target_position VALUES (18625, 249, -30.907579, -211.058197, -88.592125, 2.428);
INSERT INTO spell_target_position VALUES (18626, 249, -40.500187, -203.001053, -85.555107, 2.428);
INSERT INTO spell_target_position VALUES (18627, 249, -46.135464, -198.548553, -85.901764, 2.428);
INSERT INTO spell_target_position VALUES (18628, 249, -52.006271, -193.796570, -85.808769, 2.428);
INSERT INTO spell_target_position VALUES (18618, 249, -58.250900, -189.020004, -85.292267, 2.428);

	-- Below is not needed for current script
	-- SPELL_BREATH_SOUTH_TO_NORTH
DELETE FROM spell_target_position WHERE id IN (18351, 18352, 18353, 18354, 18355, 18356, 18357, 18358, 18359, 18360, 18361);
INSERT INTO spell_target_position VALUES (18351, 249, -68.834236, -215.036163, -84.018875, 6.280);
INSERT INTO spell_target_position VALUES (18352, 249, -61.834255, -215.051910, -84.673416, 6.280);
INSERT INTO spell_target_position VALUES (18353, 249, -53.343277, -215.071014, -85.597191, 6.280);
INSERT INTO spell_target_position VALUES (18354, 249, -42.619305, -215.095139, -86.663605, 6.280);
INSERT INTO spell_target_position VALUES (18355, 249, -35.899323, -215.110245, -87.196548, 6.280);
INSERT INTO spell_target_position VALUES (18356, 249, -28.248341, -215.127457, -89.191750, 6.280);
INSERT INTO spell_target_position VALUES (18357, 249, -20.324360, -215.145279, -88.963997, 6.280);
INSERT INTO spell_target_position VALUES (18358, 249, -11.189384, -215.165833, -87.817093, 6.280);
INSERT INTO spell_target_position VALUES (18359, 249, -2.047405, -215.186386, -86.279655, 6.280);
INSERT INTO spell_target_position VALUES (18360, 249, 7.479571, -215.207809, -86.075531, 6.280);
INSERT INTO spell_target_position VALUES (18361, 249, 20.730539, -215.237610, -85.254387, 6.280);
	-- SPELL_BREATH_NORTH_TO_SOUTH
DELETE FROM spell_target_position WHERE id IN (17086, 17087, 17088, 17089, 17090, 17091, 17092, 17093, 17094, 17095, 17097, 22267, 22268, 21132, 21133, 21135, 21136, 21137, 21138, 21139);
INSERT INTO spell_target_position VALUES (17086, 249, 20.730539, -215.237610, -85.254387, 3.142);
INSERT INTO spell_target_position VALUES (17087, 249, 7.479571, -215.207809, -86.075531, 3.142);
INSERT INTO spell_target_position VALUES (17088, 249, -2.047405, -215.186386, -86.279655, 3.142);
INSERT INTO spell_target_position VALUES (17089, 249, -11.189384, -215.165833, -87.817093, 3.142);
INSERT INTO spell_target_position VALUES (17090, 249, -20.324360, -215.145279, -88.963997, 3.142);
INSERT INTO spell_target_position VALUES (17091, 249, -28.248341, -215.127457, -89.191750, 3.142);
INSERT INTO spell_target_position VALUES (17092, 249, -35.899323, -215.110245, -87.196548, 3.142);
INSERT INTO spell_target_position VALUES (17093, 249, -42.619305, -215.095139, -86.663605, 3.142);
INSERT INTO spell_target_position VALUES (17094, 249, -53.343277, -215.071014, -85.597191, 3.142);
INSERT INTO spell_target_position VALUES (17095, 249, -61.834255, -215.051910, -84.673416, 3.142);
INSERT INTO spell_target_position VALUES (17097, 249, -68.834236, -215.036163, -84.018875, 3.142);
INSERT INTO spell_target_position VALUES (22267, 249, -75.736046, -214.984970, -83.394188, 3.142);
INSERT INTO spell_target_position VALUES (22268, 249, -84.087578, -214.857834, -82.640053, 3.142);
INSERT INTO spell_target_position VALUES (21132, 249, -90.424416, -214.601974, -82.482697, 3.142);
INSERT INTO spell_target_position VALUES (21133, 249, -96.572411, -214.353745, -82.239967, 3.142);
INSERT INTO spell_target_position VALUES (21135, 249, -102.069931, -214.131775, -80.571190, 3.142);
INSERT INTO spell_target_position VALUES (21136, 249, -107.385597, -213.917145, -77.447037, 3.142);
INSERT INTO spell_target_position VALUES (21137, 249, -114.281258, -213.866486, -73.851128, 3.142);
INSERT INTO spell_target_position VALUES (21138, 249, -123.328560, -213.607910, -71.559921, 3.142);
INSERT INTO spell_target_position VALUES (21139, 249, -130.788300, -213.424026, -70.751007, 3.142);

-- [S16] Utgarde_Pinnacle.sql
	-- UTGARDE PINNACLE instance template

	-- Utgarde Pinnacle::Svala
UPDATE `creature_template` SET `InhabitType` = '3', `unit_flags` = '0', `mindmg` = '345', `maxdmg` = '445', `attackpower` = '1500', `dmg_multiplier` = '7.5', `mechanic_immune_mask` = '1073463287', `minlevel` = '80', `maxlevel` = '80', `minhealth` = '315000', `maxhealth` = '315000', `minmana` = '15976', `maxmana` = '15976', `faction_A` = '21', `faction_H` = '21', `AIName` = '', `Scriptname` = 'boss_svala' WHERE `entry` IN (26668);
UPDATE `creature_template` SET `InhabitType` = '3', `unit_flags` = '0', `mindmg` = '345', `maxdmg` = '445', `attackpower` = '1500', `dmg_multiplier` = '13', `mechanic_immune_mask` = '1073463287', `minlevel` = '82', `maxlevel` = '82', `minhealth` = '431392', `maxhealth` = '431392', `minmana` = '15976', `maxmana` = '15976', `faction_A` = '21', `faction_H` = '21' WHERE `entry` IN (30810);
	-- Utgarde Pinnacle::svala ritual channelerer
UPDATE `creature_template` SET `faction_A` = '21', `faction_H` = '21', `minlevel` = '80', `maxlevel` = '80', `minhealth` = '8121', `maxhealth` = '8121', `minmana` = '15976', `maxmana` = '15976',`AIName` = '', `Scriptname` = 'npc_svala_channeler' WHERE `entry` IN (27281);
UPDATE `creature_template` SET `faction_A` = '21', `faction_H` = '21', `minlevel` = '81', `maxlevel` = '81', `minhealth` = '13033', `maxhealth` = '13033', `minmana` = '16324', `maxmana` = '16324' WHERE `entry` IN (30804);
	-- Utgarde Pinnacle::RitualTarget
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35' WHERE `entry` IN (27327);

	-- Utgarde Pinnacle::Gortok
	-- Boss replace removeing frozen efect
DELETE FROM creature WHERE id = '26687';
INSERT INTO creature VALUES (NULL,26687,575,3,1,0,0,320.406,-452.745,104.723,3.17097,86400,0,0,431392,0,0,0);
UPDATE `creature_template` SET `unit_flags` = '0', `type_flags` = '0', `mechanic_immune_mask` = '1073463287', `AIName` = '', `Scriptname` = 'boss_gortok' WHERE `entry` IN (26687);
UPDATE `creature_template` SET `unit_flags` = '0', `type_flags` = '0', `mechanic_immune_mask` = '1073463287' WHERE `entry` IN (30774);
	-- Utgarde Pinnacle::Gortok add flags Rhino etc.
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35', `unit_flags` = '0', `type_flags` = '0', `mechanic_immune_mask` = '1073463287' WHERE `entry` IN (26684,30803,26683,30772,26685,30790,26686,30770);

	-- Utgarde Pinnacle::Skadi  boss_skadi
UPDATE `creature_template` SET `mechanic_immune_mask` = '1073463287', `AIName` = '', `Scriptname` = 'boss_skadi' WHERE `entry` IN (26693);
UPDATE `creature_template` SET `mechanic_immune_mask` = '1073463287' WHERE `entry` IN (30807);
	-- Utgarde Pinnacle::Grouf not used in event for  now
DELETE FROM creature WHERE id = '26893';
	-- Utgarde Pinnacle::Adds
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `minhealth` = '18262', `maxhealth` = '18262', `minlevel` = '80', `maxlevel` = '81', `armor` = '4000', `mindmg` = '300', `maxdmg` = '400', `attackpower` = '2000' WHERE `entry` IN (26692,26690,26691);
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `minhealth` = '26066', `maxhealth` = '26066', `minlevel` = '80', `maxlevel` = '81', `armor` = '4000', `mindmg` = '300', `maxdmg` = '400', `attackpower` = '2000', `dmg_multiplier` ='7.5' WHERE `entry` IN (30819,30823,30822);
UPDATE `creature_template` SET `minmana` = '4080', `maxmana` = '4080' WHERE `entry` IN (26691);
	-- Utgarde Pinnacle::Skadi harpoonlancher
UPDATE gameobject_template SET ScriptName = 'go_skaldi_harpoonluncher' WHERE entry IN (192175,192176,192177); 

	-- Utgarde Pinnacle::King Ymiron
UPDATE `creature_template` SET `minmana` = '10000', `mechanic_immune_mask` = '1073463287', `AIName` = '', `Scriptname` = 'boss_ymiron' WHERE `entry` IN (26861);
UPDATE `creature_template` SET `minmana` = '10000', `mechanic_immune_mask` = '1073463287' WHERE `entry` IN (30788);
	-- Utgarde Pinnacle::delete not necesary mobs
DELETE FROM `creature` WHERE `id` IN (27303,27309,27308,27307);
	-- Utgarde Pinnacle::Avenging Spirit norm hero
UPDATE `creature_template` SET `minlevel` = '80', `maxlevel` = '80', `maxhealth` = '3000', `minhealth` = '3000' WHERE entry IN (27386);
UPDATE `creature_template` SET `dmg_multiplier` = '7.5' WHERE `entry` IN (30756);
UPDATE `creature_template` SET `type_flags` = '0', `faction_A` = '14', `faction_H` = '14', `armor` = '3000', `mindmg` = '200', `maxdmg` = '300', `attackpower` = '1000' WHERE entry IN (27386,30756);
	-- Utgarde Pinnacle::Spirit Fount
UPDATE `creature_template` SET `unit_flags` = '33554560', `modelid_A` = '11686', `minlevel` = '80', `maxlevel` = '82', `faction_A` = '14', `faction_H` = '14', `speed_run` = '0.4', `flags_extra` = '0' WHERE entry IN (30808,27339);

	-- Utgarde Pinnacle::ACID
UPDATE `creature_template` SET `AIName` = 'EventAI', `Scriptname` = '' WHERE `entry` IN (26686,26684,26683,26685,26690,26691,26692);
	-- DELETE EventAIScripts
DELETE FROM creature_ai_scripts WHERE creature_id IN (26686,26684,26683,26685,26690,26691,26692);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`,
 `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) 
VALUES
	-- Ymirjar Warrior
(2669001, '26690', '0', '0', '100', '7', '5000', '15000','30000','50000', '11', '48639', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ymirjar Warrior - Cast Hamstring'),
(2669002, '26690', '0', '0', '100', '7', '5000', '15000','10000','15000', '11', '48640', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ymirjar Warrior - Cast Strike'),
	-- Ymirjar Witch Doctor
(2669101, '26691', '0', '0', '100', '3', '5000', '15000','5000','10000', '11', '49085', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ymirjar Witch Doctor - Cast Shadow Bolt (Normal)'),
(2669102, '26691', '0', '0', '100', '5', '5000', '15000','5000','10000', '11', '59246', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ymirjar Witch Doctor - Cast Shadow Bolt (Heroic)'),
(2669103, '26691', '0', '0', '100', '3', '5000', '10000','15000','20000', '11', '49089', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ymirjar Witch Doctor - Cast Shrink (Normal)'),
(2669104, '26691', '0', '0', '100', '5', '5000', '10000','15000','20000', '11', '59247', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ymirjar Witch Doctor - Cast Shrink (Heroic)'),
	-- Ymirjar Harpooner
(2669201, '26692', '0', '0', '100', '7', '5000', '15000','30000','50000', '11', '49092', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ymirjar Harpooner - Cast Net'),
(2669202, '26692', '0', '0', '100', '7', '5000', '15000','10000','15000', '11', '49091', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Ymirjar Harpooner - Cast Throw'),
	-- Utgarde Pinnacle::Furoiuces Rhino
(2668601, '26686', '0', '0', '100', '3', '5000', '15000','20000','40000', '11', '48130', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rhino - Gore (Normal)'),
(2668602, '26686', '0', '0', '100', '5', '5000', '15000','20000','40000', '11', '59264', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rhino - Gore (Heroic)'),
(2668603, '26686', '0', '0', '100', '3', '5000', '10000','15000','20000', '11', '48105', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rhino - Grevius Wond (Normal)'),
(2668604, '26686', '0', '0', '100', '5', '5000', '10000','15000','20000', '11', '59263', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rhino - Grevius Wond (Heroic)'),
(2668605, '26686', '0', '0', '100', '7', '10000', '15000','15000','30000', '11', '48131', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rhino - Stomp'),
	-- Utgarde Pinnacle::Furbolg
(2668401, '26684', '0', '0', '100', '7', '5000', '15000','20000','40000', '11', '48139', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Furbolg - Crazed'),
(2668402, '26684', '0', '0', '100', '3', '5000', '10000','15000','20000', '11', '48140', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Furbolg - Chain Lighting (Normal)'),
(2668403, '26684', '0', '0', '100', '5', '5000', '10000','15000','20000', '11', '59273', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Furbolg - Chain Lighting (Heroic)'),
(2668404, '26684', '0', '0', '100', '7', '10000', '15000','15000','30000', '11', '48144', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Furbolg - Terrifing Roar'),
	-- Utgarde Pinnacle::Worgen
(2668301, '26683', '0', '0', '100', '7', '10000', '15000','15000','30000', '11', '48138', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Worgen - Cast Enrage'),
(2668302, '26683', '2', '0', '100', '7', '30', '0', '0','0', '11', '48142', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Worgen - Cast Enrage Perm'),
(2668303, '26683', '0', '0', '100', '3', '5000', '10000','15000','20000', '11', '48137', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Worgen - Cast Mortal Wound (Normal)'),
(2668304, '26683', '0', '0', '100', '5', '5000', '10000','15000','20000', '11', '59265', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Worgen - Cast Mortal Wound (Heroic)'),
	-- Utgarde Pinnacle::Jormungar
(2668501, '26685', '0', '0', '100', '7', '5000', '10000','15000','20000', '11', '48132', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Jormungar - Cast Acid Split (Heroic)'),
(2668502, '26685', '0', '0', '100', '3', '5000', '15000','30000','50000', '11', '48136', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Jormungar - Cast Summon (Normal)'),
(2668503, '26685', '0', '0', '100', '5', '5000', '15000','30000','50000', '11', '59272', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Jormungar - Cast Summon (Heroic)'),
(2668504, '26685', '0', '0', '100', '3', '5000', '15000','10000','15000', '11', '48133', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Jormungar - Cast Breath (Normal)'),
(2668505, '26685', '0', '0', '100', '5', '5000', '15000','10000','15000', '11', '59271', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Jormungar - Cast Breath (Heroic)');

	-- Utgarde Pinnacle::LOOT TEMPLATE
UPDATE `creature_template` SET `lootid` = '26692' WHERE `entry` IN (26692,30819);
DELETE FROM `creature_loot_template` WHERE `entry` IN (26692,30819);
INSERT INTO creature_loot_template
(entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, lootcondition, condition_value1, condition_value2)
VALUES
	-- Harpooner loot
('26692', '37372', '50', '1', '1', '1', '0', '0', '0');


	-- Spirit Fount
UPDATE creature_template SET
faction_A = 14,
faction_H = 14,
minlevel = 82,
maxlevel = 82,
modelid_A = 11686,
modelid_H = 11686,
flags_extra = flags_extra &~128 &~2,
unit_flags = unit_flags|2|33554432,
speed_run = 0.15,
AIName = ''
WHERE entry IN (30808,27339);

	-- Avenging Spirit
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 27386;
	-- Avenging Spirit (N)
UPDATE creature_template SET
faction_A = 14,
faction_H = 14,
minhealth = 3000,
maxhealth = 3000,
minlevel = 80,
maxlevel = 80,
mindmg = 150,
maxdmg = 350,
dmg_multiplier = 3,
attackpower = 53
WHERE entry = 27386;

	-- Avenging Spirit (H)
UPDATE creature_template SET
faction_A = 14,
faction_H = 14,
minhealth = 12000,
maxhealth = 12000,
minlevel = 80,
maxlevel = 80,
mindmg = 250,
maxdmg = 450,
dmg_multiplier = 3,
attackpower = 53
WHERE entry = 30756;

	-- Avenging Spirit & Spirit Fount
UPDATE creature_template SET ScriptName = 'mob_ymiron_add' WHERE entry IN (27386,27339);


	-- Avenging Spirit Summoner
UPDATE creature_template SET
unit_flags = unit_flags|2|33554432,
flags_extra = flags_extra &~128 |2,
modelid_A = 11686,
modelid_H = 11686,
AIName = 'EventAI'
WHERE entry IN (27392,30757);

	-- Avengering Spirit Summoner
DELETE FROM creature_ai_scripts WHERE creature_id = 27392;
INSERT INTO creature_ai_scripts VALUES 
(2739201,27392,11,0,100,6, 0,0,0,0, 11,48593,0,0,0,0,0,0,0,0,0,0,'Avengering Spirit Summoner - Visual Effect'),
(2739202,27392,1,0,100,6, 2500,2500,0,0, 11,48592,0,0, 0,0,0,0, 0,0,0,0,'Avengering Spirit Summoner - Summon Spirit');

	-- Kings Spirits (just invisible not triggers)
UPDATE creature_template SET 
flags_extra = flags_extra &~ 128 |2 
WHERE entry IN (27303,27307,27308,27309,30780,30782,30784,30786);

REPLACE INTO creature VALUES
('126128','27303','575','3','1','11686','0','370.639','-314.325','107.302','0.034907','604800','0','0','13945','0','0','0'),
('126147','27307','575','3','1','11686','0','413.959','-314.937','107.288','3.12414','604800','0','0','13945','0','0','0'),
('126148','27308','575','3','1','11686','0','413.568','-335.497','107.298','3.14159','604800','0','0','13945','0','0','0'),
('126149','27309','575','3','1','11686','0','370.12','-334.903','107.281','0.05236','604800','0','0','13945','0','0','0');

	-- Spirit fount Beam
DELETE FROM spell_script_target WHERE entry = 48385;
INSERT INTO spell_script_target VALUES
(48385, 1, 27339);

-- [S17] Tempest_keep.sql
/* Al'ar for TK:Eye */ 

UPDATE `creature_template` SET `ScriptName` = 'boss_alar' WHERE `entry` =19514;
UPDATE `creature_template` SET `ScriptName` = 'mob_ember_of_alar' WHERE `entry` = 19551;
UPDATE `creature_template` SET `ScriptName` = 'mob_flame_patch_alar' WHERE `entry` = 20602;

-- [S19] Hyjal.sql
UPDATE `creature_template` SET `ScriptName` = 'boss_rage_winterchill' WHERE `entry` = 17767;
UPDATE `creature_template` SET `ScriptName` = 'boss_anetheron' WHERE `entry` = 17808;
UPDATE `creature_template` SET `ScriptName` = 'boss_kazrogal' WHERE `entry` = 17888;
UPDATE `creature_template` SET `ScriptName` = 'boss_azgalor' WHERE `entry` = 17842;
UPDATE `creature_template` SET `ScriptName` = 'mob_echo_of_archimonde' WHERE `entry` = 13083;

-- [S20] Guards.sql
	-- Guards

UPDATE `creature_template` SET `ScriptName` = 'g_marcus_jonathan' WHERE `entry` = 466;
UPDATE `creature_template` SET `ScriptName` = 'archbishop_benedictus' WHERE `entry` = 1284;
UPDATE `creature_template` SET `ScriptName` = 'highlord_bolvar_fordragon' WHERE `entry` = 1748;
UPDATE `creature_template` SET `ScriptName` = 'overlord_saurfang' WHERE `entry` = 14720;
UPDATE `creature_template` SET `ScriptName` = 'high_fire_mage' WHERE `entry` IN (1749,17098);
UPDATE `creature_template` SET `ScriptName` = 'ancient_of_war' WHERE `entry` IN (3468,3469);
UPDATE `creature_template` SET `ScriptName` = 'high_sorcerer_andromath' WHERE `entry` = 5694;
UPDATE `creature_template` SET `ScriptName` = 'cathedral_of_light' WHERE `entry` = 6171;
UPDATE `creature_template` SET `ScriptName` = 'thrall' WHERE `entry` = 4949;
UPDATE `creature_template` SET `ScriptName` = 'city_guard' WHERE `entry` IN (3083,1756,4423,12480,12481,12786,12787,12788,12789,12790,12791,13839,14304,20672,20674);
UPDATE `creature_template` SET `ScriptName` = 'city_officer' WHERE `entry` IN (2041,2439,14363,14365,14367,14375,14376,14377,14378,14379,14380,14402,14403,14404,14423,14438,14439,14440,14441,14442,18103,21970,21971);

-- [S21] Experience_Eliminator.sql
	-- Experience Eliminator

UPDATE creature_template SET ScriptName="npc_experience_eliminator" WHERE entry IN ( 35365, 35364 );

-- [S22] Utgarde_Keep.sql
	-- Utgarde Keep - Utgarde Keep

UPDATE `creature_template` SET `scriptname`='mob_frost_tomb' WHERE `entry`=23965;
UPDATE `creature_template` SET `ScriptName`='mob_ingvar_throw_dummy' WHERE `entry`=23997;

-- [S23] Ulduar_Ignis.sql
	-- Ulduar Ignis

	-- Magma Rager
UPDATE `creature_template` SET
ScriptName = 'mob_magma_rager'
WHERE entry = 34086;

	-- Iron Construct
UPDATE `creature_template` SET
ScriptName='mob_iron_construct',
mechanic_immune_mask = 617299803
WHERE entry = 33121;

	-- Scorch Target
UPDATE `creature_template` SET
modelid_A = 169,
modelid_H = 169,
minlevel = 83,
maxlevel = 83,
faction_A = 14,
faction_h = 14,
unit_flags = 33554434,
type_flags = 2,
flags_extra = 2
WHERE entry = 33221;

-- [S24] Ulduar_XT002.sql
	-- Ulduar XT002

	-- Cleanup of NPC's
DELETE FROM creature WHERE id IN(33344,33346,33343,33329,34004);

	-- XM-024 Pummeller
UPDATE `creature_template` SET
ScriptName = 'mob_pummeler',
speed_walk = '0.5',
speed_run = '0.5'
WHERE entry = '33344';

	-- XE-321 Boombot
UPDATE `creature_template` SET
ScriptName = 'mob_boombot',
speed_walk = '0.5',
speed_run = '0.5'
WHERE entry = '33346';

	-- XS-013 Scrapbot
UPDATE `creature_template` SET
ScriptName = 'mob_scrapbot',
speed_walk = '0.5',
speed_run = '0.5'
WHERE entry = '33343';

	-- Heart of the Deconstructor
UPDATE `creature_template` SET
unit_flags = '8',
ScriptName = 'mob_xtheart'
WHERE entry = '33329';

	-- Void Zone
UPDATE `creature_template` SET
speed_walk = 0,
speed_run = 0,
faction_A = '16',
faction_H = '16',
ScriptName = 'mob_void_zone',
unit_flags = '33587200'
WHERE entry = '34001';

	-- Life Spark
UPDATE `creature_template` SET
ScriptName = 'mob_life_spark',
faction_A = '16',
faction_H = '16',
modelid_A = '18996', -- Display ID not blizzlike but otherwise Players cannot see them
modelid_H = '18996' -- Display ID not blizzlike but otherwise Players cannot see them
WHERE entry = '34004';

-- [S25] Ulduar_Razorscale.sql
	-- Ulduar Razorscale

	-- Devouring Flame Target
UPDATE `creature_template` SET
ScriptName = 'mob_devouring_flame_target',
speed_walk = 0,
speed_run = 0,
unit_flags = 33554434,
type_flags = 2,
flags_extra = 2,
minlevel = 83,
maxlevel = 83
WHERE entry = '34188';

	-- Dark Rune Watcher
UPDATE `creature_template` SET
ScriptName = 'mob_dark_rune_watcher'
WHERE entry = '33453';

	-- Dark Rune Guardian
UPDATE `creature_template` SET
ScriptName = 'mob_dark_rune_watcher'
WHERE entry = '33388';

	-- Dark Rune Sentinel
UPDATE `creature_template` SET
ScriptName = 'mob_dark_rune_watcher'
WHERE entry = '33846';

	-- Expedition Commander
UPDATE `creature_template` SET
ScriptName = 'npc_expedition_commander'
WHERE entry = '33210';

-- [S26] Plagued_Lands.sql
	-- Plagued Lands

UPDATE `quest_template` SET `ReqCreatureOrGOId1`='11836' WHERE (`entry`='2118');
UPDATE `creature_template` SET ScriptName='npc_captured_rabid_thistle_bear' where entry=11836;
UPDATE `creature_template` SET ScriptName='npc_rabid_thistle_bear' where entry='2164';

-- [S27] Rite_of_Vision_mangos.sql
	-- Rite of Vision

UPDATE `creature_template` SET `MovementType`='0', `flags_extra`='64', `speed_walk`='1' WHERE (`entry`='2983');
UPDATE `quest_template` SET `SpecialFlags`='2' WHERE (`entry`='772');
UPDATE `creature_template` SET `ScriptName`='npc_plains_vision' WHERE (`entry`='2983');
