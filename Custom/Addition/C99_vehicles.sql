/* 7th Legion Chain Gun */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27714);
INSERT INTO npc_spellclick_spells VALUES (27714, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27714, 0, 0, 0, 0, 0, 68, NULL, NULL);
REPLACE INTO vehicle_data VALUES (68, 5, 49190, 49550, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1301, 3);
UPDATE creature_template SET IconName = 'Gunner' WHERE entry IN (27714);
/* Alliance Steam Tank */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27587);
INSERT INTO npc_spellclick_spells VALUES (27587, 43695, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (27587, 0, 0, 0, 0, 0, 56, NULL, NULL);
REPLACE INTO vehicle_data VALUES (56, 4, 49315, 49333, 49109, 49081, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (945, 3),(946, 8),(949, 8),(950, 8);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27587);
UPDATE creature_template SET modelid_A = 25341 WHERE entry = 27587;
-- UPDATE creature_model_info SET modelid_other_team = 0 WHERE modelid = 25341;
-- UPDATE creature_template_addon SET passengers = '27163 1 27588 2 27588 3' WHERE entry = 27587;
/* Broken-down Shredder */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27354);
INSERT INTO npc_spellclick_spells VALUES (27354, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27354, 0, 0, 0, 0, 0, 49, NULL, NULL);
REPLACE INTO vehicle_data VALUES (49, 4, 48558, 48604, 48548, 0, 48610, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (821, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27354);
/* Enraged Mammoth */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28851);
INSERT INTO npc_spellclick_spells VALUES (28851, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (28851, 0, 0, 0, 0, 0, 145, NULL, NULL);
REPLACE INTO vehicle_data VALUES (145, 4, 52603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1906, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (28851);
/* Flamebringer */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27292);
INSERT INTO npc_spellclick_spells VALUES (27292, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27292, 0, 0, 0, 0, 0, 50, NULL, NULL);
REPLACE INTO vehicle_data VALUES (50, 4, 48619, 48620, 52812, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (841, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27292);
/* Forsaken Blight Spreader */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26523);
INSERT INTO npc_spellclick_spells VALUES (26523, 47961, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26523, 0, 0, 0, 0, 0, 36, NULL, NULL);
REPLACE INTO vehicle_data VALUES (36, 4, 48211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (644, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry = 26523;
/* Highland Mustang */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26472);
INSERT INTO npc_spellclick_spells VALUES (26472, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26472, 0, 0, 0, 0, 0, 62, NULL, NULL);
REPLACE INTO vehicle_data VALUES (62, 4, 49285, 29577, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1270, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (26472);
/* Horde Siege Tanks */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25334);
INSERT INTO npc_spellclick_spells VALUES (25334, 43695, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (25334, 0, 0, 0, 0, 0, 26, NULL, NULL);
REPLACE INTO vehicle_data VALUES (26, 4, 50672, 45750, 50677, 47849, 47962, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (365,3),(366,6),(367,6),(368,6);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry = 25334;
/* Infected Kodo Beast */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25596);
INSERT INTO npc_spellclick_spells VALUES (25596, 45875, 11690, 1, 11690, 1);
REPLACE INTO creature_template_addon VALUES (25596, 0, 0, 0, 0, 0, 29, NULL, NULL);
REPLACE INTO vehicle_data VALUES (29, 12, 45876, 45877, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (422, 3);
UPDATE creature_template SET speed_run = 2, IconName = 'vehichleCursor' WHERE entry = 25596;
REPLACE INTO spell_script_target VALUES (45877, 1, 25596);

/* Bring 'Em Back Alive quest */
REPLACE INTO creature_ai_scripts VALUES (2559651,25596,8,0,100,0,45877,-1,0,0,33,25698,0,0,41,0,0,0,0,0,0,0,'q11690');
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 25596;
/* Kor'kron War Rider */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26813);
INSERT INTO npc_spellclick_spells VALUES (26813, 47424, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26813, 0, 0, 0, 0, 0, 80, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (80, 4, 47434, 63507, 47454, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1431, 3),(1432, 2);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (26813);
UPDATE creature_template SET modelid_A2 = 0 WHERE entry = 26813;

/* Kor'kron War Rider II */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26572);
INSERT INTO npc_spellclick_spells VALUES (26572, 47424, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (26572, 0, 0, 0, 0, 0, 34, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (34, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (601, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (26572);
/* Massacre At Light's Point (new) */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28887,28833,28864);
INSERT INTO npc_spellclick_spells VALUES (28833,52447,12701,1,12701,1),(28887,52447,12701,1,12701,1),(28864,67373,0,0,0,1);
REPLACE INTO creature_template_addon VALUES (28887,0,0,2049,0,0,79,'',''),(28833,0,0,2049,0,0,79,'',''),(28864,0,0,0,0,0,143,NULL,'48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (143,12,0,0,0,0,0,0,0,0,0,0,0),(79,5,52435,52576,52588,0,0,0,0,0,0,0,0);
REPLACE INTO vehicle_seat_data VALUES (1427, 3),(1902, 3);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (28887,28833,28864);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (28887,28833,28864));
/* Onslaught Warhorse */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27213);
INSERT INTO npc_spellclick_spells VALUES (27213, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27213, 0, 0, 0, 0, 0, 43, NULL, NULL);
REPLACE INTO vehicle_data VALUES (43, 4, 48297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (742, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry = 27213;
/* Refurbished Shredder */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27496);
INSERT INTO npc_spellclick_spells VALUES (27496, 60944, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27496, 0, 0, 0, 0, 0, 55, NULL, NULL);
REPLACE INTO vehicle_data VALUES (55, 4, 48548, 48604, 48558, 0, 48610, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (922, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27496);
/* Rocket Propelled Warhead */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27593);
INSERT INTO npc_spellclick_spells VALUES (27593, 49177, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27593, 0, 0, 0, 0, 0, 57, NULL, NULL);
REPLACE INTO vehicle_data VALUES (57, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (961, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (27593);
/* Steel Gate Flying Machine */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (24418);
INSERT INTO npc_spellclick_spells VALUES (24418, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (24418, 0, 0, 0, 0, 0, 8, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (8, 4, 44009, 43770, 43799, 43769, 47769, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (261, 3),(461, 2);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (24418);
/* the Oculus (new) */
DELETE FROM spell_script_target where entry IN (49460, 49346, 49464);
DELETE FROM npc_spellclick_spells where npc_entry IN (27755, 27692, 27756);
DELETE FROM creature_template_addon where entry IN (27755, 27692, 27756);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27755,27756,27692);
/* Amber Drake */
INSERT INTO spell_script_target VALUES (49460, 1, 27755);
INSERT INTO npc_spellclick_spells VALUES (27755, 49459, 0, 0, 0, 1);
INSERT INTO creature_template_addon VALUES (27755, 0, 0, 0, 0, 0, 70, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (70, 12, 49840, 49838, 49592, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1323, 3);
/* Emerald Drake */
INSERT INTO spell_script_target VALUES (49346, 1, 27692);
INSERT INTO npc_spellclick_spells VALUES (27692, 49427, 0, 0, 0, 1);
INSERT INTO creature_template_addon VALUES (27692, 0, 0, 0, 0, 0, 181, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (181, 12, 50328, 50341, 50344, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2081, 3);
/* Ruby Drake */
INSERT INTO spell_script_target VALUES (49464, 1, 27756);
INSERT INTO npc_spellclick_spells VALUES (27756, 49463, 0, 0, 0, 1);
INSERT INTO creature_template_addon VALUES (27756, 0, 0, 0, 0, 0, 186, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (186, 12, 50232, 50248, 50240, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2089, 3);
/* Hack for broken Nexus Portal */
UPDATE gameobject_template SET data0 = 49665 WHERE entry = 189985;
UPDATE spell_target_position SET id = 49665 WHERE id = 49305;
/* Wintergarde Gryphon */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27258);
INSERT INTO npc_spellclick_spells VALUES (27258, 49288, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27258, 0, 0, 0, 0, 0, 44, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (44, 4, 48363, 48397, 54170, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (762, 3),(764, 2);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27258);

/* Wintergarde Gryphon II, Into Hostile Territory quest */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27661);
INSERT INTO npc_spellclick_spells VALUES (27661, 48862, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27661, 0, 0, 0, 0, 0, 61, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (61, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1267, 3),(1268, 2);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27661);
/* Wintergrasp Tower Cannon (new) */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28366);
INSERT INTO npc_spellclick_spells VALUES (28366, 60968, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (28366, 0, 0, 0, 0, 0, 244, NULL, NULL);
REPLACE INTO vehicle_data VALUES (244, 5, 51362, 51421, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2283, 3);

/* Ulduar Salvaged vehicles (fixes) */
UPDATE creature_model_info SET bounding_radius = '0.306' WHERE modelid IN (25870,25871);
UPDATE creature_template SET IconName = 'Gunner' WHERE entry = 33167;
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (33060,33062,33109));
UPDATE creature_template SET AIName = 'NullAI' WHERE entry IN (33243,33229,33272);
/* Wooly Mammoth Bull */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25743);
INSERT INTO npc_spellclick_spells VALUES (25743, 43695, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (25743, 0, 0, 0, 0, 0, 72, NULL, NULL);
REPLACE INTO vehicle_data VALUES (72, 12, 46317, 46315, 46316, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1362, 3);
UPDATE creature_template SET IconName = 'vehichleCursor' WHERE entry IN (25743);
UPDATE creature_template SET faction_A = 7, faction_H = 7 WHERE entry IN (25743);
/* Wyrmrest Defender */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27629);
INSERT INTO npc_spellclick_spells VALUES (27629, 49256, 12372, 1, 12372, 1);
REPLACE INTO creature_template_addon VALUES (27629,0,50331648,1,0,0,60,NULL,'50069 0 50069 1 50069 2');
REPLACE INTO vehicle_data VALUES (60,4,49161,49243,49263,49264,49367,0,0,0,0,0,0);
REPLACE INTO vehicle_seat_data VALUES (1262, 3);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27629);

/* Defending Wyrmrest Temple quest */
REPLACE INTO spell_script_target VALUES (49370,1,27698),(49367,1,27698);
UPDATE quest_template SET ReqSpellCast3 = 49367 WHERE entry = 12372;
UPDATE creature_template SET npcflag = 0, unit_flags = 0 WHERE entry IN (27629);
/* Wyrmrest Skytalon */
DELETE FROM npc_spellclick_spells WHERE npc_entry = 32535;
INSERT INTO npc_spellclick_spells VALUES (32535, 61245, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (32535, 0, 0, 0, 0, 0, 165, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (165, 12, 56091, 61621, 57090, 57143, 57108, 57092, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2061, 3);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry = 32535;

/* Aces High! quests */
REPLACE INTO gossip_scripts VALUES (32548,0,15,61287,1,0,0,0,0,0,0,0,0);
REPLACE INTO gossip_menu_option VALUES (10204,1,0,'I am ready Lady Corastrasza.',1,1,0,0,32548,0,0,NULL,9,13413,0,0,0,0,0,0,0);
REPLACE INTO gossip_menu_option VALUES (10204,2,0,'I am ready Lady Corastrasza.',1,1,0,0,32548,0,0,NULL,9,13414,0,0,0,0,0,0,0);
/* Wyrmrest Vanquisher */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27996);
INSERT INTO npc_spellclick_spells VALUES (27996, 67373, 0, 0, 0, 1);
REPLACE INTO creature_template_addon VALUES (27996, 0, 50331648, 1, 0, 0, 99, NULL, '48602 0 48602 2');
REPLACE INTO vehicle_data VALUES (99, 4, 50430, 55987, 50348, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (1520, 3),(1521, 8);
UPDATE creature_template SET IconName = 'vehichleCursor', InhabitType = 3 WHERE entry IN (27996);
