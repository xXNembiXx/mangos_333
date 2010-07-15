############################################################################
#
#							SQL	Updatepack
#						  ScriptDev2 database
#
#							  15-07-2010
#
############################################################################


####
# addition (author: insider42 & rsa)
####

-- boss_spell_table_scriptdev2.sql
DROP TABLE IF EXISTS `boss_spell_table`;
CREATE TABLE IF NOT EXISTS `boss_spell_table` (
  `entry`        mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Creature entry',
  `spellID_N10`  mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell ID for 10 normal',
  `spellID_N25`  mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell ID for 25 normal',
  `spellID_H10`  mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell ID for 10 heroic',
  `spellID_H25`  mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell ID for 25 heroic',
  `timerMin_N10` mediumint(8) unsigned NOT NULL DEFAULT '15000' COMMENT 'Minimum timer for this spell (in ms.) for 10 normal',
  `timerMin_N25` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum timer for this spell (in ms.) for 25 normal',
  `timerMin_H10` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum timer for this spell (in ms.) for 10 heroic',
  `timerMin_H25` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum timer for this spell (in ms.) for 25 heroic',
  `timerMax_N10` mediumint(8) unsigned NOT NULL DEFAULT '30000' COMMENT 'Maximum timer for this spell (in ms.) for 10 normal',
  `timerMax_N25` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Maximum timer for this spell (in ms.) for 25 normal',
  `timerMax_H10` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Maximum timer for this spell (in ms.) for 10 heroic',
  `timerMax_H25` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Maximum timer for this spell (in ms.) for 25 heroic',
  `data1`        mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Various INT data for this spell or summon for 10 normal',
  `data2`        mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Various INT data for this spell for 25 normal',
  `data3`        mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Various INT data for this spell for 10 heroic',
  `data4`        mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Various INT data for this spell for 25 heroic',
  `locData_x`    float NOT NULL DEFAULT '0' COMMENT 'Location X data for this spell',
  `locData_y`    float NOT NULL DEFAULT '0' COMMENT 'Location Y data for this spell',
  `locData_z`    float NOT NULL DEFAULT '0' COMMENT 'Location Z data for this spell',
  `varData`      mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Special data field for this spell (basepoint for Aura, for example)',
  `StageMask_N`  smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stage mask for this spell (don\'t used now)',
  `StageMask_H`  smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stage mask for this spell - heroic mode (don\'t used now)',
  `CastType`     smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Type of cast (by enum BossSpellTableParameters)',
  `isVisualEffect` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Is spell is Visual effect only',
  `isBugged`     tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Is spell bugged and need override',
  `textEntry`    mediumint(8) NOT NULL DEFAULT '0' COMMENT 'Text from script_texts for this spell casting',
  `comment`      text,
  PRIMARY KEY (`entry`,`spellID_N10`,`CastType`),
  INDEX `idx_entry`(`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT 'Boss spell table by /dev/rsa';

-- 4_scriptdev2_sapphiron.sql
DELETE FROM `script_texts` where entry in ('-1533082','-1533083');
INSERT INTO `script_texts`  (entry,content_default,sound,type,language,emote,comment) VALUES
(-1533082,'%s takes in a deep breath.',0,3,0,0,'sapphiron EMOTE_BREATH'),
(-1533083,'%s lifts off into the air!',0,3,0,0,'sapphiron EMOTE_FLY'),
(-1533160,'%s resumes hit attacks!',0,3,0,0,'sapphiron EMOTE_GROUND'),
(-1533161,'%s enrages!',0,3,0,0,'sapphiron EMOTE_ENRAGE');

-- 7_scriptdev2_ulduar.sql
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1603017 AND -1603000;
INSERT INTO `script_texts` VALUES
(-1603000, "New toys? For me? I promise I won't break them this time!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15724, 1, 0, 0, "XT-002 Aggro"),
(-1603001, "NO! NO! NO! NO! NO!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15727, 1, 0, 0, "XT-002 Tympanic Tantrum"),
(-1603002, "I... I think I broke it.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15728, 1, 0, 0, "XT-002 Slay 1"),
(-1603003, "I guess it doesn't bend that way.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15729, 1, 0, 0, "XT-002 Slay 2"),
(-1603004, "So tired. I will rest for just a moment!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15725, 1, 0, 0, "XT-002 Heart Opened"),
(-1603005, "I'm ready to play!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15726, 1, 0, 0, "XT-002 Heart Closed"),
(-1603006, "Time for a new game! My old toys will fight my new toys!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15732, 1, 0, 0, "XT-002 Adds"),
(-1603007, "I'm tired of these toys. I don't want to play anymore!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15730, 1, 0, 0, "XT-002 Berserk"),
(-1603008, "You are bad... Toys... Very... Baaaaad!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15731, 1, 0, 0, "XT-002 Death"),
(-1603009, "Hostile entities detected. Threat assessment protocol active. Primary target engaged. Time minus thirty seconds to re-evaluation.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15506, 1, 0, 0, "Flame Leviathan Aggro"),
(-1603010, "Total systems failure. Defense protocols breached. Leviathan Unit shutting down.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15520, 1, 0, 0, "Flame Leviathan Death"),
(-1603011, "Threat assessment routine modified. Current target threat level: zero. Acquiring new target.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15521, 1, 0, 0, "Flame Leviathan Slay"),
(-1603012, "You will suffer for this trespass!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15552, 1, 0, 0, "Hodir Aggro"),
(-1603013, "I... I am released from his grasp... at last.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15557, 1, 0, 0, "Hodir Death"),
(-1603014, "Tragic. To come so far, only to fail.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15553, 1, 0, 0, "Hodir Slay 1"),
(-1603015, "Welcome to the endless winter.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15554, 1, 0, 0, "Hodir Slay 2"),
(-1603016, "Winds of the north consume you!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15555, 1, 0, 0, "Hodir Flash Freeze"),
(-1603017, "<Furious Roar>", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15556, 1, 0, 0, "Hodir Frozen Blows");

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1050010 AND -1050000;
INSERT INTO `script_texts` VALUES
(-1050001, "Expedition Base Camp", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "?????? ??????????", 0, 0, 0, 0, "Ulduar teleporter text 1"),
(-1050002, "Formation Grounds", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "???????? ????", 0, 0, 0, 0, "Ulduar teleporter text 2"),
(-1050003, "Colossal Forge", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "???????????? ????", 0, 0, 0, 0, "Ulduar teleporter text 3"),
(-1050004, "Scrapyard", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "???????? ??????", 0, 0, 0, 0, "Ulduar teleporter text 4"),
(-1050005, "Antechamber of Ulduar", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "????????? ????????", 0, 0, 0, 0, "Ulduar teleporter text 5"),
(-1050006, "Shattered Walkway", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "???????????? ???????", 0, 0, 0, 0, "Ulduar teleporter text 6"),
(-1050007, "Conservatory of Life", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "???? ??????????", 0, 0, 0, 0, "Ulduar teleporter text 7"),
(-1050008, "Spark of Imagination", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "????? ???????????", 0, 0, 0, 0, "Ulduar teleporter text 8"),
(-1050009, "Prison of Yogg-Saron", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "?????? ???????", 0, 0, 0, 0, "Ulduar teleporter text 9");

-- 712_halls_of_stone_scriptdev2.sql
DELETE FROM `script_texts` WHERE `entry` IN
('-1712001','-1712002','-1712003','-1712004','-1712005','-1712006','-1712007','-1712008');

INSERT IGNORE INTO `script_texts` 
(`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) 
VALUES 
('-1712001', 'Soft meat! Come to me!', 'Soft meat! Come to me!', NULL, NULL, NULL, NULL, NULL, NULL, '?????? ??????! ????????!', '0', '0', '0', '0', NULL),
('-1712002', 'Get it!', 'Get it!', NULL, NULL, NULL, NULL, NULL, NULL, '???? ??????!', '0', '0', '0', '0', NULL),
('-1712003', 'Into the ice!', 'Into the ice!', NULL, NULL, NULL, NULL, NULL, NULL, '???? ????????!', '0', '0', '0', '0', NULL),
('-1712004', 'Stone curse!', 'Stone curse!', NULL, NULL, NULL, NULL, NULL, NULL, '????????!', '0', '0', '0', '0', NULL),
('-1712005', 'Gr-r-r-r!', 'Gr-r-r-r!', NULL, NULL, NULL, NULL, NULL, NULL, '??, ??? ? ???!', '0', '0', '0', '0', NULL),
('-1712006', 'It is cool!', 'It is cool!', NULL, NULL, NULL, NULL, NULL, NULL, '???, ?????', '0', '0', '0', '0', NULL),
('-1712007', 'O, no...', 'O, no...', NULL, NULL, NULL, NULL, NULL, NULL, '?? ????? ????...', '0', '0', '0', '0', NULL),
('-1712008', 'Enrage!', 'Enrage!', NULL, NULL, NULL, NULL, NULL, NULL, '?? ???, ?? ???? ???????...', '0', '0', '0', '0', NULL);

-- 716_the_violet_hold_scriptdev2_text.sql
	-- -1 608 000 VIOLET HOLD
INSERT IGNORE INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
	-- Cyanigosa
   (-1608000, 'We finish this now, champions of Kirin Tor!', 13947, 1, 0, 'cyanigosa SAY_AGGRO'),
   (-1608001, 'I will end the Kirin Tor!', 13952, 1, 0, 'cyanigosa SAY_SLAY_1'),
   (-1608002, 'Dalaran will fall!', 13953, 1, 0, 'cyanigosa SAY_SLAY_2'),
   (-1608003, 'So ends your defiance of the Spell-Weaver!', 13954, 1, 0, 'cyanigosa SAY_SLAY_3'),
   (-1608004, 'Perhaps... we have... underestimated... you.', 13955, 1, 0, 'cyanigosa SAY_DEATH'),
   (-1608005, 'A valiant defense, but this city must be razed. I will fulfill Malygos\'s wishes myself!', 13946, 1, 0, 'cyanigosa SAY_SPAWN'),
   (-1608006, 'Am I interrupting?', 13951, 1, 0, 'cyanigosa SAY_DISRUPTION'),
   (-1608007, 'Shiver and die!', 13948, 1, 0, 'cyanigosa SAY_BREATH_ATTACK'),
   (-1608008, 'The world has forgotten what true magic is! Let this be a reminder!', 13949, 1, 0, 'cyanigosa SAY_SPECIAL_ATTACK_1'),
   (-1608009, 'Who among you can withstand my power?', 13950, 1, 0, 'cyanigosa SAY_SPECIAL_ATTACK_2'),
	-- Erekem
   (-1608010, 'Notcawwget in way ofrrak-rrakflee!', 14219, 1, 0, 'erekem SAY_AGGRO'),
   (-1608011, '...', 14222, 1, 0, 'erekem SAY_SLAY_1'),
   (-1608012, 'Precious life ... wasted.', 14223, 1, 0, 'erekem SAY_SLAY_2'),
   (-1608013, 'Only strong ... survive.', 14224, 1, 0, 'erekem SAY_SLAY_3'),
   (-1608014, 'Nokaw, kawflee...', 14225, 1, 0, 'erekem SAY_DEATH'),
   (-1608015, 'Free tommfly onw. Ra-aak... Not find usekh-ekh! Escape!', 14218, 1, 0, 'erekem SAY_SPAWN'),
   (-1608016, 'My-raaakfavorite! Awk awk awk! Raa-kaa!', 14220, 1, 0, 'erekem SAY_ADD_KILLED'),
   (-1608017, 'Nasty little...A-ak, kaw! Kill! Yes, kill you!', 14221, 1, 0, 'erekem SAY_BOTH_ADDS_KILLED'),
	-- Ichoron
   (-1608018, 'Stand aside, mortals!', 14230, 1, 0, 'ichoron SAY_AGGRO'),
   (-1608019, 'I am a force of nature!', 14234, 1, 0, 'ichoron SAY_SLAY_1'),
   (-1608020, 'I shall pass!', 14235, 1, 0, 'ichoron SAY_SLAY_2'),
   (-1608021, 'You can not stop the tide!', 14236, 1, 0, 'ichoron SAY_SLAY_3'),
   (-1608022, 'I... recede.', 14237, 1, 0, 'ichoron SAY_DEATH'),
   (-1608023, 'I... am fury... unrestrained!', 14239, 1, 0, 'ichoron SAY_SPAWN'),
   (-1608024, 'I shall consume, decimate, devastate, and destroy! Yield now to the wrath of the pounding sea!', 14231, 1, 0, 'ichoron SAY_ENRAGE'),
   (-1608025, 'I will not be contained! Ngyah!!', 14233, 1, 0, 'ichoron SAY_SHATTER'),
   (-1608026, 'Water can hold any form, take any shape... overcome any obstacle.', 14232, 1, 0, 'ichoron SAY_BUBBLE'),
	-- Xevozz
   (-1608027, 'It seems my freedom must be bought with blood...', 14499, 1, 0, 'xevozz SAY_AGGRO'),
   (-1608028, 'Nothing personal.', 14504, 1, 0, 'xevozz SAY_SLAY_1'),
   (-1608029, 'Business concluded.', 14505, 1, 0, 'xevozz SAY_SLAY_2'),
   (-1608030, 'Profit!', 14506, 1, 0, 'xevozz SAY_SLAY_3'),
   (-1608031, 'This is an... unrecoverable... loss.', 14507, 1, 0, 'xevozz SAY_DEATH'),
   (-1608032, 'Back in business! Now to execute an exit strategy.', 14498, 1, 0, 'xevozz SAY_SPAWNED'),
   (-1608033, 'It would seem that a renegotiation is in order.', 14503, 1, 0, 'xevozz SAY_CHARGED'),
   (-1608034, 'The air teems with latent energy... quite the harvest!', 14501, 1, 0, 'xevozz SAY_REPEAT_SUMMON_1'),
   (-1608035, 'Plentiful, exploitable resources... primed for acquisition!', 14502, 1, 0, 'xevozz SAY_REPEAT_SUMMON_2'),
   (-1608036, 'Intriguing... a high quantity of arcane energy is near. Time for some prospecting...', 14500, 1, 0, 'xevozz SAY_SUMMON_ENERGY'),
	-- Zuramat
   (-1608037, 'Eradicate.', 13996, 1, 0, 'zuramat SAY_AGGRO'),
   (-1608038, 'More... energy.', 13999, 1, 0, 'zuramat SAY_SLAY_1'),
   (-1608039, 'Relinquish.', 14000, 1, 0, 'zuramat SAY_SLAY_2'),
   (-1608040, 'Fall... to shadow.', 14001, 1, 0, 'zuramat SAY_SLAY_3'),
   (-1608041, 'Disperse.', 14002, 1, 0, 'zuramat SAY_DEATH'),
   (-1608042, 'I am... renewed.', 13995, 1, 0, 'zuramat SAY_SPAWN'),
   (-1608043, 'Know... my... pain.', 13997, 1, 0, 'zuramat SAY_SHIELD'),
   (-1608044, 'Gaze... into the void.', 13998, 1, 0, 'zuramat SAY_WHISPER');

-- 717_culling_of_stratholme_scriptdev2.sql
REPLACE INTO script_texts (entry, content_default, content_loc8, sound, type, language, emote, comment) VALUES
# TAVERN EVENT
(-1557270, 'Hey! Stop rooting around in my cellar! Clear out!', '??! ? ??, ????? ?????? ? ???? ????????! ????????????!', 0,0,0,1, '34587'),
(-1557271, 'This whole situation seems a bit paranoid, don\'t you think?', '??-?????, ??? ??? ?????? ????????? ?? ????????, ?? ?? ?????????', 0,0,0,25, '34587'),
(-1557272, 'Orders are orders, if prince says jump...', '?????? ???? ??????. ???? ????? ??????? ???????...', 0,0,0,1, '34587'),
(-1557273, 'It\'s strange order, you cant deny Suspicious food? Under that definition, you should arrest Belfast!', '???????? ??????, ??? ?????, ?? ?????. ?????????????? ????? ????? ?? ? ???????? ?????????????!', 0,0,0,1, '34587'),
(-1557274, 'I HEARD THAT! No more ale for you! Not a drop!', '? ??? ??????! ?????? ??? ?? ?? ????????! ?? ?????!', 0,0,0,25, '34587'),
(-1557275, 'Enough, Michael. Business is hurting enough with this scare as it is. We can use every copper.', '????????, ?????. ???? ???? ? ??? ???????? ??-?? ???? ??????. ?????? ?????? ????? ?? ?????.', 0,0,0,274, '34587'),
(-1557276, 'The soldiers are doing important work. The safely of the people is more important, Mal, if you\'re interested in your customers living to spend another day.', '??????? ?????? ????? ?????? ?????, ???. ???? ?? ??????, ????? ???? ?????????? ?????? ?? ??????????? ??? - ???? ?????????? ?? ????????????.', 0,0,0,1, '34587'),
(-1557277, 'I can\'t argue with that.', '? ???? ?? ?????????.', 0,0,0,1, '34587'),
(-1557278, 'Don\'t worry too much. By the time I went odd duty, we hadnt a scrap of befouled grain here.', '?? ????? ??? ?????? ???????????. ? ???? ???????, ??? ? ???? ????, ?? ?? ????? ????? ? ????? ????? ????????? ?????.', 0,0,0,274, '34587'),
(-1557279, 'Thank the Light for that.', '????? ??????? ?????.', 0,0,0,1, '34587'),
# ROGER EVENT
(-1557280, 'Wait, what\'s that smell?', '????, ??? ?? ?????', 0,0,0,1, '34587'),
(-1557281, 'Can\'t be me, I took a bath 3 days ago!', '??? ?? ?? ????, ? ????? 3 ??? ?????!', 0,0,0,1, '34587'),
(-1557282, 'Oh, close call. It\'s just the grain here.', '?, ??? ????? ???? ?????.', 0,0,0,1, '34587'),
(-1557283, 'Wait a second. Grain isn\'t supposed to smell like THAT! I better go find a guard.', '??????. ????? ?? ????? ??? ??????! ? ????? ????? ????? ?????????.', 0,0,0,1, '34587'),
# MORIGAN EVENT
(-1557284, 'You don\'t mind me checking out your merchandise for signs of tampering, do you?', '?? ?? ?? ??????????, ????? ? ???????? ???? ???????', 0,0,0,1, '34587'),
(-1557285, 'No, sir.', '???, ???.', 0,0,0,1, '34587'),
(-1557286, 'Wait, what is it? Youve been holding out on me, Perelli!', '?????????-??, ??? ???? ?? ??????? ??? ?? ????, ???????!', 0,0,0,0, '34587'),
(-1557287, 'What are you talking about, Sergeant?', '? ??? ?? ????????, ????????', 0,0,0,1, '34587'),
(-1557288, 'I am confiscating this suspicious grain, Perelli. We were looking for signs of tampered food, and it would be in your best interest to stay put while Prince Arthas checks this out.', '? ????????? ??? ?????????????? ?????, ???????. ?? ?????? ???????? ?????????????? ???, ? ???? ?? ? ????? ?????? ????????? ?????????? ?? ?????, ???? ????? ????? ??????????? ? ????????????.', 0,0,0,1, '34587'),
(-1557289, 'You have to belive me, I am innocent!', '?? ?????? ?????? ???, ? ?? ???????!', 0,0,0,20, '34587'),
(-1557290, 'Well see about that. Perelli. Well see about that.', '??? ?? ?????????, ???????. ??? ?? ?????????.', 0,0,0,1, '34587'),
# JENA EVENT
(-1557291, 'Martha. I am out of flour for bread. You wouldn\'t happen to have any grain from that recent, would you?', '?????, ? ?? ????? ? ???? ???? ??? ??????? ?????. ?? ?? ???????? ??? ??????', 0,0,0,1, '34587'),
(-1557292, 'Oh hello, Jena. Of Course you can borrow some grain. Help yourself.', '?, ?????? ?????. ??????? ? ?????? ??? ?????. ???????? ????.', 0,0,0,1, '34587'),
(-1557293, 'Thanks. Martha! I owe you one.', '???????. ?????! ? ???? ????????.', 0,0,0,1, '34587'),
(-1557294, 'Martha, somethings wrong with this grain! Some of the Princes soldiers were looking for this. Im going to go look for one.', '?????, ? ???? ?????? ???-?? ?? ???! ??????? ?????? ???-?? ???????? ? ???. ?????-?? ????? ????-?????? ?? ???.', 0,0,0,1, '34587'),
(-1557295, 'Oh, my.', '???? ???.', 0,0,0,1, '34587'),
# MALCOLM EVENT
(-1557296, 'Looks like a storms coming in, Scruffy...', '?????? ?? ?????????????? ????, ??????...', 0,0,0,0, '34587'),
(-1557297, 'Whats wrong, pal?', '??? ?????????, ?????', 0,0,0,1, '34587'),
(-1557298, 'What did you find, boy?', '??? ?? ?????, ???????', 0,0,0,0, '34587'),
(-1557299, 'This is no good, Scruffy. Stay here and guard the house. I need to go find a soldier.', '???????? ?????, ??????. ???? ??? ? ??????? ???, ? ? ???? ?????? - ????? ??????.', 0,0,0,0, '34587'),
# BARTLEBY EVENT
(-1557300, 'I knew I should have secured the wagon lock better when I was in Andorhal.', '???? ???? ??????? ???????? ?????? ? ????????.', 0,0,0,1, '34587'),
(-1557301, 'This grain shipmend has been nothing but trouble!', '?? ????? ????? ???? ???? ???? ???????!', 0,0,0,1, '34587'),
(-1557302, 'Well, guess I should load everything back into the cart.', '??, ????????, ??? ????? ??????? ??? ??????? ? ??????.', 0,0,0,0, '34587'),
(-1557303, 'Oh, come on! My cart broke, my horse a shoe, and now the cargo goes bad!', '?, ????! ??? ?????? ?????????, ??? ?????? ???????? ???????, ? ?????? ??? ? ? ?????? ????????!', 0,0,0,1, '34587'),
(-1557304, 'I guess I\'ll go find the authorites. If I\'m lucky theyll tell me it\'s the plague and that were all to die!', '??????, ??? ???????? ???? ?????? ?????????????? ??????. ???? ??? ???????, ??? ??????, ??? ??? ???? ? ??? ????? ?? ??? ?????!', 0,0,0,1, '34587'),
# ARTHAS INTRO EVENT
(-1594071, 'Glad you could make it, Uther.', '? ???, ??? ?? ??????, ????!', 12828,0,0,1, '34587'),
(-1594072, 'Watch your tone with me boy. You may be the prince, but I am still your superior as a paladin!', '????? ?? ????? ?????, ?????. ???? ?? ? ?????, ??, ??? ???????, ?? ??? ??? ?????????? ??? ???? ?????????????.', 12839,0,0,25, '34587'),
(-1594073, 'As if I could forget. Listen, Uther, there\'s something about the plague you should know...', '??? ????? ? ?? ?????. ????????, ????, ? ?????? ?????????? ???? ???-??? ??? ????...', 12829,0,0,0, '34587'),
(-1594074, 'Oh, no. Were too late. These people have all been infected! They may look fine now, but it\'s just a matter of time before they turn into the undead!', '? ???. ?? ????????. ??? ??? ???? ???????? ?????! ?????? ??? ??? ?????????, ?? ????? ??? ??? ??????????? ? ??????!', 12830,0,0,1, '34587'),
(-1594075, 'What?', '????', 12840,0,0,5, '34587'),
(-1594076, 'This entire city must be purged.', '???? ????? ?????? ???? ??????.', 12831,0,0,1, '34587'),
(-1594077, 'How can you even consider that? There\'s got to be some other way.', '??? ?? ??? ???? ???????? ?? ?????! ?????? ???? ?????-?? ?????? ????!', 12841,0,0,1, '34587'),
(-1594078, 'Damn it, Uther! As your future king, I order you to purge this city!', '?????????, ????! ??? ??????? ??????, ? ?????????? ???? ???????? ???? ?????!', 12832,1,0,5, '34587'),
(-1594079, 'You are not my king yet, boy! Nor would I obey that command even if you were!', '???? ?? ??? ?? ??????, ?????. ?? ???? ?????? ? ?? ???????? ??, ???? ?? ???? ?????? ???????!', 12842,1,0,22, '34587'),
(-1594080, 'Then I must consider this an act of treason.', '????? ? ???? ??????????? ??? ??? ??????.', 12833,0,0,0, '34587'),
(-1594081, 'Treason? Have you lost your mind, Arthas?', '??????? ?? ?????? ??????? ????????, ??????', 12843,0,0,5, '34587'),
(-1594082, 'Have I? Lord Uther, by my right of succession and the sovereignty of my crown, I hereby relieve you of your commnad and suspend your paladins from service.', '???????? ???? ????, ???????, ?????? ??? ?? ????? ????????????, ? ????????? ??? ?? ???????????? ? ?????????? ?? ?????? ????? ?????????.', 12834,0,0,1, '34587'),
(-1594083, 'Arthas! You cant just...', '?????! ?? ?? ?????? ??? ??????...', 12837,0,0,1, '34587'),
(-1594084, 'It\'s done! those of you who have the will to save this land, follow me! The rest of you... get out of my sight!', '??? ??? ???????! ?? ?? ???, ??? ????????????? ????? ?????? ??? ????? - ?? ????! ????????? - ????? ? ???? ????!', 12835,0,0,0, '34587'),
(-1594085, 'You\'ve just crossed a terrible inreshold, Arthas!', '?? ??????? ??????? ?????, ?????.', 12844,0,0,25, '34587'),
(-1594086, 'Jaina?', '???????', 12836,0,0,1, '34587'),
(-1594087, 'Im sorry Arthas. I can\'t watch you do this.', '??????, ?????. ? ?? ???? ?? ??? ????????.', 12838,0,0,1, '34587'),
(-1594088, 'Take position here and I will lead a small force inside Stratholme to begin the culling. We must contain and purge the infected for the sake of all of Lordaeron!', '??????? ???????, ? ? ?????? ????????? ????? ? ?????????? ? ????? ????????. ?? ?????? ??????????? ? ?????????? ?????????? ??????? ???? ????? ?????????!', 14327,1,0,1, '34587'),
#ARTHAS ENTER IN THE CITY
(-1594089, 'Everyone looks ready. Remember, these people are all infected with the plague and will die soon. We must purge Stratholme to protect the remainder of Lordaeron from the Scourge. Lets go!', '??????, ??? ??????. ???????, ??? ???? ???????? ????? ? ????? ?????. ?? ?????? ???????? ?????????? ? ???????? ???????? ?? ?????. ??????.', 14293,0,0,1, '26499'),
(-1594090, 'Prince Arthas, may the light be praised. Many people in the town have begun to fall seriously ill. Can you help us?', '????? ?????, ????? ?????! ?????? ???????? ???????? ??????. ?????? ?? ?? ?????? ????', 0,0,0,1, '26499'),
(-1594091, 'I can help you only with a clean death.', '? ???? ?????? ??? ???? ??????? ???????.', 14294,0,0,0, '26499'),
(-1594092, 'What? This cant be!', '???? ????? ?? ????? ????!', 0,0,0,0, '26499'),
(-1594093, 'Oh... My g...', '?... ??? ?...', 0,0,0,0, '26499'),
(-1594094, 'This is begining!', '??? ???? ?????? ??????.', 14295,0,0,1, '26499'),
(-1594095, 'Yes, this is the beginning. I\'ve been waiting for you, young prince. I am Mal\'Ganis.', '??, ??? ??????. ? ???? ????, ???? ?????. ? ???\'?????.', 14410,0,0,1, '26499'),
(-1594096, 'As you can see, your people are now mine. I will now turn this city, household by household, until the flame of life has been snuffed out forever.', '??? ??????, ???? ???? ?????? ??????????? ???. ??? ?? ????? ? ???????? ???? ?????, ? ????? ????? ??????? ????? ????????...',14411,0,0,1, '26499'),
(-1594097, 'I will not allow this, Mal\'Ganis. Better these people will die from my hand, than become your slaves after death.', '? ?? ?????? ?????, ???\'?????! ????? ??? ???? ???????? ?? ???? ????, ??? ?????? ?????? ?????? ????? ??????!',14296,0,0,5, '26499'),
(-1594098, 'Mal\'Ganis will send his Scourge henchmen to meet us. Skilled warriors and mages go and destroy enemies. I will lead the remaining troops in the purification of Stratholme from infection.', '???\'????? ???????? ????? ???????????? ?? ????? ????????? ???. ??????? ????? ? ????, ???????? ? ?????????? ??????. ? ????????? ?????????? ?????? ? ???? ???????? ??????????? ?? ??????.',14885,0,0,1, '26499'),
#MEATHOOK
(-1594110, 'Play time!', '????????!',13428,0,0,0, '26499'),
(-1594111, 'New toys!', '????? ???????!',13429,1,0,0, '26499'),
(-1594112, 'This not fun...', '??? ?? ??????...',13433,1,0,0, '26499'),
(-1594113, 'Boring...', '??????...',13430,1,0,0, '26499'),
(-1594114, 'Why you stop moving?', '?????? ?? ?? ??????????',13431,1,0,0, '26499'), # !
(-1594115, 'Get up! Me not done!', '???????! ? ?? ????????!',13432,1,0,0, '26499'), # !
#SALRAMM
(-1594129, 'You are too late, champion of Lordaeron. The dead shall have their day.', '??????? ??????, ????? ?????????! ?????? ????? ???????.',0,1,0,0, '26499'),
(-1594130, 'Ah, the entertainment has arrived!', '?, ???????????!',0,1,0,0, '26499'),
(-1594131, 'You only advance... the master\'s plan...', '?? ????? ???? ????? ????? ???????...',0,1,0,0, '26499'),
(-1594132, 'The fun is just beginning!', '??????? ?????? ??????????!',0,1,0,0, '26499'),
(-1594133, 'Aah, quality materials!', '????, ???????????? ????????...',0,1,0,0, '26499'),
(-1594134, 'Don\'t worry, I\'ll make good use of you.', '?? ????????, ? ????? ???? ???? ????????????...',0,1,0,0, '26499'),
(-1594135, 'I want a sample...', '??? ????? ???????!',0,1,0,0, '26499'),
(-1594136, 'Such strength... it must be mine!', '??????? ????... ??? ????? ????....',0,1,0,0, '26499'),
(-1594137, 'Your flesh betrays you.', '???? ????? ??????? ????!',0,1,0,0, '26499'),
(-1594138, 'Say hello to some friends of mine.', '???????????? ? ????? ????????...',0,1,0,0, '26499'),
(-1594139, 'Come, citizen of Stratholme! Meet your saviors.', '?????? ???????????, ?????????? ????? ??????????...',0,1,0,0, '26499'),
(-1594140, 'BOOM! Hahahahah...', '???... ??-??-??-??...',0,1,0,0, '26499'),
(-1594141, 'Blood... destruction... EXHILARATING!', '?????... ??????????... ?????????????...',0,1,0,0, '26499'),
#ARTHAS - HOUSE
(-1594142, 'Heroes, hurry up, we\'ll meet near town hall. We must fight with Mal\'Ganis on its territory!', '?????, ?????????, ?????????? ? ????????? ??????. ?? ?????? ????????? ? ???\'??????? ?? ??? ??????????!',14297,1,0,0, '26499'),
(-1594143, 'Follow me, I know the way.', '????? ?? ????. ? ???? ??????.',14298,0,0,1, '26499'),
(-1594144, 'Ah, You\'ve finaly arrived, Prince Arthas. You\'re here just in the nick of time.', '?, ?? ???????-?? ???????, ????? ?????. ?? ???? ??????.',0,0,0,1, '26499'),
(-1594145, 'Yes! I\'m glad to get here before plague!', '??! ? ???, ??? ???? ????????? ???? ?????? ????.',14299,0,0,1, '26499'),
(-1594146, 'What kind of magic is this?', '??? ??? ?? ??????',14300,0,0,0, '26499'),
(-1594147, 'Theres no need for you in understand Arthas. All you need to do is die!', '???? ? ?? ???? ????? ????????, ?????. ???, ??? ?? ???? ????????? � ??? ???????.',0,0,0,11, '26499'),
(-1594148, 'Seems that Mal\'Ganis has something else except Scourge. Let\'s hurry.', '??????? ? ???\'?????? ? ???????????? ???? ??? ??? ??? ????? ?????. ??????? ????????.',14301,0,0,0, '26499'),
(-1594149, 'Dark magic again... Be ready for all.', '????? ?????? ?????... ?????? ?????? ?? ?????!',14302,0,0,0, '26499'),
(-1594150, 'Come on.', '???? ??????.',14303,0,0,0, '26499'),
(-1594151, 'Be on the alert. We were surrounded.', '?????? ??????. ??? ????????.',14304,0,0,0, '26499'),
(-1594152, 'Mal\'Ganis doesn\'t want to make our life easier...', '???\'????? ?? ?????????? ????????? ??? ?????.',14305,0,0,0, '26499'),
(-1594153, 'They are stubborn.', '??? ??????.',14306,0,0,0, '26499'),
(-1594154, 'What else he will put on my way?', '??? ??? ?? ???????? ? ???? ?? ?????',14307,0,0,0, '26499'),
(-1594155, 'Prince Arthas Menethil, in this day mighty evil devoured your soul. Death, which you had to bring to others, today will come for you.', '????? ????? ???????, ? ???? ????? ???? ?????????????? ??? ????????? ???? ????. ??????, ??????? ?? ?????? ??? ???????? ??????, ??????? ?????? ?? ?????.',13408,0,0,0, '26499'),
(-1594156, 'I do for Lordaeron that should, and words and deeds will not stop me.', '? ????? ??? ????????? ??, ??? ??????, ? ??????? ????? ? ???????? ???? ?? ?????????.',14309,0,0,5, '26499'),
(-1594157, 'Let\'s see, young prince...', '?? ??? ?, ?????????, ???? ?????.',13409,0,0,0, '26499'),
#Epoch
(-1594119, 'We\'ll see about that, young prince.', '??c??????, ??????? ?????.',13416,0,0,0, '26499'),
(-1594120, 'There is no future for you.', '? ???? ??? ????????...',13413,1,0,0, '26499'),
(-1594121, 'This is the hour of our greatest triumph!', '?????? ??? ?????? ??????????? ???????..',13414,1,0,0, '26499'),
(-1594122, 'You were destined to fail.', '???? ???? ??????? ????????? ?????????...',13415,1,0,0, '26499'),
(-1594123, 'Tick tock, tick tock...', '???-???... ???-???...',13410,1,0,0, '26499'),
(-1594124, 'Not quick enough!', '??????? ????????...',13411,1,0,0, '26499'),
(-1594125, 'Let\'s get this over with.', '???? ???????????...',13412,1,0,0, '26499'),
#Street
(-1594158, 'It will take not much time.', '??? ?????? ?????? ??????? ???????.',14310,0,0,0, '26499'),
(-1594159, 'Thanks Light, backdoor still works!', '????? ?????, ??? ???????? ??? ??? ????????.',14311,0,0,0, '26499'),
(-1594160, 'Let\'s pass through this area as soon as possible. If we do not perish from the undead, we can die from this fire.', '??????? ??????? ???? ??????? ??? ????? ???????. ???? ?? ?? ???????? ?? ??????, ?? ????? ????????? ?? ????? ????.',14312,0,0,0, '26499'),
(-1594161, 'Breather a little bit, but keep in mind, we will soon again in the path.', '?????????? ???????. ?? ?????? ? ????, ??? ????? ????? ? ????.',14313,0,0,0, '26499'),
(-1594162, 'The rest is over, let\'s go. Mal\'Ganis waits.', '????? ???????, ???? ????. ???\'????? ????.',14314,0,0,0, '26499'),
(-1594163, 'Finally, we even like that lucky! The fire has not yet reached the commercial area. Mal\'Ganis should be in Square of Knights, which is not far from here. Tell me when you\'re ready to go.', '??????? ??? ???? ???-?? ???????. ????? ??? ?? ???????? ?? ????????? ????. ???\'????? ?????? ???? ?? ??????? ???????, ??????? ????????? ???????? ??????. ??????? ???, ??? ?????? ?????? ???? ??????.',14315,0,0,0, '26499'),
(-1594164, 'Let\'s justice will be here.', '?? ????????? ??????????.',14316,0,0,0, '26499'),
#malganis
(-1594170, 'This will be a fine test, Prince Arthas.', '??? ????? ????????? ?????????, ????? ?????.',14413,1,0,0, '26499'),
(-1594171, 'All too easy.', '??????? ??????...',14416,1,0,0, '26499'),
(-1594172, 'The dark lord is displeased with your interference.', '?????? ?????????? ?? ??????? ????? ??????????????...',144107,1,0,0, '26499'),
(-1594173, 'It is Prince Arthas I want, not you.', '??? ????? ????? ?????, ? ?? ??...',14418,1,0,0, '26499'),
(-1594174, 'Anak\'Keri...', '???? ????...',14422,1,0,0, '26499'),
(-1594175, 'My onslaught will wash over the Lich King\'s forces...', '??? ?????? ?????? ???? ??????-????...',14423,1,0,0, '26499'),
(-1594176, 'Your death is in vain, tiny mortal...', '???? ?????? ???? ???????? ?????????...',14424,1,0,0, '26499'),
(-1594177, 'Your time has come to an end!', '???? ????? ?????...',14425,1,0,0, '26499'),
(-1594178, '*Struggling sounds* I spent too much time in that weak little shell...', '?????????... ? ? ??? ?????? ??????? ????? ??????? ? ???? ?????? ????????...',14426,1,0,0, '26499'),
(-1594179, 'I AM MAL\'GANIS! I AM ETERNAL!', '??? ?????... ? ???\'?????.... ? ?????...',14427,1,0,0, '26499'),
(-1594180, 'You\'ll never defeat the Lich King without my forces! I\'ll have my revenge...on him, AND you...', '???? ??????? ?? ???????? ?????? - ???? ??? ???? ?????! ? ?????? ? ???? ? ???...',14429,1,0,0, '26499'),
(-1594181, 'We\'re going to finish this right now, Mal\'Ganis!', '?? ???????? ? ???? ?????? ??, ???\'?????. ???? ?? ????.',14317,0,0,0, '26499'),
(-1594182, 'Your journey has just begun, young prince. Gather your forces, and meet me in the arctic land of Northrend. It is there we shall settle the score between us. It is there that your true destiny will unfold.', '???? ??????????? ??????????, ???? ?????. ??????? ???? ?????? ? ??????????? ? ??????? ?????? ??????, ? ????????. ??? ?? ? ?????? ??? ???? ????, ??? ?? ??????? ???? ??????.',14412,0,0,0, '26499'),
(-1594183, 'I\'ll hunt you to the ends of the earth if I have to! Do you hear me? To the ends of the earth!', '? ????? ???? ?? ???? ?????! ?? ??????? ????? ?? ???? ?????!',14318,1,0,5, '26499'),
(-1594184, 'You performed well this day. Anything that Mal\'Ganis has left behind is yours. Take it as your reward. I must now begin plans for an expedition to Northrend.', '?? ?????? ????????? ???????. ???, ??? ???\'????? ??????? ??? � ???? ???????. ? ??? ????? ???????? ?????????? ? ?????????? ? ????????.',14319,0,0,5, '26499'),
(-1594185, 'Time out...', '???????!',14414,1,0,0, '26499'),
(-1594186, 'You seem tired.', '?? ????????? ???????!',14415,1,0,0, '26499'),
(-1594187, 'ENOUGH! I waste my time here...I must gather my strength on the home world...', '? ???? ??? ????? ??? ???? ?????. ??? ????? ????????? ?????? ? ???? ?????? ????.',14428,1,0,0, '26499');

DELETE FROM script_waypoint WHERE entry=26528;
DELETE FROM script_waypoint WHERE entry=26499;
INSERT INTO script_waypoint VALUES
#Uther
   (26528, 0, 1772.707,1263.927,138.867, 0, 'WP1'),
   (26528, 1, 1810.249,1276.557,141.854, 0, 'WP2'),
   (26528, 2, 1810.249,1276.557,141.854, 0, 'WP3'),
   (26528, 3, 1851.476,1281.370,144.106, 0, 'WP4 - Arthas Move'),
   (26528, 4, 1898.716,1288.757,143.461, 90000, 'WP5 - Pause Escort'),
   (26528, 5, 1851.476,1281.370,144.106, 0, 'WP6'),
   (26528, 6, 1794.357,1272.183,140.558, 0, 'WP7 - Uther Despawn'),
#Arthas
   (26499, 0, 1902.959,1295.127,143.388, 0, 'WP1'),
   (26499, 1, 1916.657,1287.327,141.946, 0, 'WP2'),
   (26499, 2, 1913.726,1287.407,141.927, 10000, 'WP3 - Dialog'),
   (26499, 3, 1990.833,1293.391,145.467, 0, 'WP4'),
   (26499, 4, 1997.003,1317.776,142.963, 0, 'WP5'),
   (26499, 5, 2019.631,1326.084,142.929, 0, 'WP6'),
   (26499, 6, 2026.469,1287.088,143.596, 0, 'WP7'),
   (26499, 7, 2054.879,1287.505,142.422, 0, 'WP8'),
   (26499, 8, 2050.660,1287.333,142.671, 0, 'WP9 - Pause Escort'), 
   (26499, 9, 2050.652,1287.382,142.672, 12000, 'WP10'),
   (26499, 10, 2081.447,1287.770,141.324, 2000, 'wp11'),
   (26499, 11, 2099.876,1280.210,138.550, 0, 'WP12'),
   (26499, 12, 2120.757,1286.970,136.343, 0, 'WP13'),
   (26499, 13, 2165.073,1279.338,133.400, 0, 'WP14'),
   (26499, 14, 2186.441,1234.445,136.524, 0, 'WP15'),
   (26499, 15, 2210.385,1207.550,136.259, 0, 'WP16'),
   (26499, 16, 2243.594,1177.705,137.144, 0, 'WP17'),
   (26499, 17, 2286.883,1177.262,137.631, 0, 'WP18'),
   (26499, 18, 2320.374,1179.954,133.926, 0, 'WP19'),
   (26499, 19, 2354.626,1192.099,130.535, 0, 'WP20'),
   (26499, 20, 2363.374,1194.101,131.414, 0, 'WP21 - pause'),
   (26499, 21, 2364.749,1194.660,131.672, 3000, 'WP22 - say'),
   (26499, 22, 2390.256,1204.235,134.125, 0, 'WP21 - pause escort and start event'), #2500  2396.035 1206.942 134.038
   (26499, 23, 2442.023,1219.205,133.999, 0, 'WP22'),
   (26499, 24, 2446.945,1192.559,148.100, 0, 'WP23'),
   (26499, 25, 2443.161,1191.442,148.076, 5000, 'WP24 - summon portal'),
   (26499, 26, 2428.901,1192.164,148.076, 0, 'WP25'),
   (26499, 27, 2418.487,1196.059,148.076, 0, 'WP26'),
   (26499, 28, 2401.221,1191.705,148.076, 0, 'WP27'),
   (26499, 29, 2409.143,1157.000,148.190, 1000, 'WP28 - trap'),
   (26499, 30, 2417.584,1121.026,148.082, 10000, 'WP29'),
   (26499, 31, 2420.949,1119.944,148.075, 29000, 'WP30 - pause'),
   (26499, 32, 2444.682,1111.705,148.076, 0, 'WP31 - Stop'),

   (26499, 33, 2457.133,1120.941,150.008, 0, 'House WP11'),
   (26499, 34, 2459.694,1127.012,150.008, 0, 'House WP12'),
   (26499, 35, 2469.617,1122.274,150.008, 0, 'House WP13'),
   (26499, 36, 2470.437,1122.794,150.008, 3000, 'Open Shkaf'),
   (26499, 37, 2471.662,1123.077,150.035, 3000, 'Shkaf Dialog'),
   (26499, 38, 2483.183,1125.042,149.905, 0, 'Secret WP1'),
   (26499, 39, 2487.867,1099.760,144.858, 0, 'Secret WP2'),
   (26499, 40, 2498.270,1101.929,144.599, 0, 'Secret WP3'),
   (26499, 41, 2492.114,1128.238,139.967, 0, 'Secret WP4'),
   (26499, 42, 2500.286,1130.183,139.982, 0, 'Room WP1'),
   (26499, 43, 2503.010,1119.241,139.978, 0, 'Room WP2'),
   (26499, 44, 2517.820,1122.645,132.066, 0, 'Room WP3'),
   (26499, 45, 2540.479,1129.061,130.868, 7000, 'Fire Street WP1'),
   (26499, 46, 2568.619,1157.794,126.906, 0, 'Fire Street WP2'),
   (26499, 47, 2556.074,1222.058,125.412, 0, 'Fire Street WP3'),
   (26499, 48, 2521.531,1295.209,130.573, 20000, 'Fire Street WP4'),
   (26499, 49, 2504.362,1348.667,132.944, 0, 'Fire Street WP5'),
   (26499, 50, 2450.594,1431.544,131.361, 0, 'Fire Street WP6'),
   (26499, 51, 2353.485,1404.839,128.531, 0, 'Stop Malganis'),
   (26499, 52, 2329.882,1406.273,128.013, 0, 'wp'),
   (26499, 53, 2300.415,1489.316,128.362, 0, 'wp stop'),
   (26499, 54, 2329.882,1406.273,128.013, 0, 'wp');

-- 718_draktharon_scriptdev2.sql
DELETE FROM script_texts WHERE entry in (-1600020, -1600021);
INSERT INTO script_texts (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) values
('-1600020','King Dred raises his talon menacingly!','0','5','0','King Dred Talon'),
('-1600021','King Dred calls for a raptor!','0','5','0','King Dred Call for Raptor');

-- 721_icecrown_scriptdev2.sql
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1631600 AND -1631000;
INSERT INTO `script_texts` (`entry`,`content_loc8`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES

	-- Lord Marrowgar
('-1631000','Это начало и конец, смертные. Никто не может войти в Храм!','This is the beginning AND the end, mortals. None may enter the master\'s sanctum!','16950','6','0','0','marrowgar SAY_INTRO'),
('-1631001','Проклятые несут миру смерть и разрушение!','The Scourge will wash over this world as a swarm of death and destruction!','16941','6','0','0','marrowgar SAY_AGGRO'),
('-1631002','Шторм костей!','BONE STORM!','16946','3','0','0','marrowgar SAY_BONESTORM'),
('-1631003','Проткнут костью!','Bound by bone!','16947','3','0','0','marrowgar SAY_BONESPIKE1'),
('-1631004','Кости вокруг!','Stick Around!','16948','3','0','0','marrowgar SAY_BONESPIKE2'),
('-1631005','Выход - только смерть!','The only escape is death!','16949','6','0','0','marrowgar SAY_BONESPIKE3'),
('-1631006','Больше костей!','More bones for the offering!','16942','6','0','0','marrowgar SAY_KILL1'),
('-1631007','Будьте прокляты!','Languish in damnation!','16943','6','0','0','marrowgar SAY_KILL2'),
('-1631008','ЯРОСТЬ МАСТЕРА ТЕЧЕТ ЧЕРЕЗ МЕНЯ!','THE MASTER\'S RAGE COURSES THROUGH ME!','16945','3','0','0','marrowgar SAY_ENRAGE'),
('-1631009','Я вижу... Только тьму...','I see... only darkness...','16944','6','0','0','marrowgar SAY_DEATH'),

	-- Lady Deathwhisper
('-1631020','Взгляните на ваши мягкие руки! Сухожилия, мясо, кровь! Это слабость! Серьезная ошибка! Шутка создателя со своими творениями! Чем раньше вы поймете что жизнь - это дефект, тем раньше вы сможете преодолеть вашу слабость!','Fix your eyes upon your crude hands! The sinew, the soft meat, the dark blood coursing within! It is a weakness! A crippling flaw! A joke played by the creators upon their own creations! The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it!','16878','6','0','0','deathwhisper SAY_INTRO1'),
('-1631021','Через нашего Мастера все возможно! Его сила не имеет предела, и его воля непреклонна! Те, кто против него будут истреблены! А те, кто служат, которые подчиняются полностью, беспрекословно, с беззаветной преданностью ума и души? Возвышены!','Through our master all things are possible! His power is without limit, and his will unbending! Those who oppose him will be destroyed utterly! And those who serve, who serve wholly, unquestioningly, with utter devotion of mind and soul? Elevated! To heights beyond your ken!','16879','6','0','0','deathwhisper SAY_INTRO2'),
('-1631022','Вы нашли свой путь здесь, потому что вы принадлежите к числу немногих одаренных истинным видением мира, проклятого слепотой! Вы можете видеть сквозь туман, что висит над этим миром, как саван, и понять, где истинная сила лжи!','You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness! You can see through the fog that hangs over this world like a shroud and grasp where true power lies!','16880','6','0','0','deathwhisper SAY_INTRO3'),
('-1631023','Что это за беспорядок?! Вы смеете гадить на этой священной земле? Вот вам и место последнего упокоения!','What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.','16868','6','0','0','deathwhisper SAY_AGGRO'),
('-1631024','Однако! Я вижу что пора взять дело в свои руки.','Enough! I see I must take matters into my own hands!','16877','6','0','0','deathwhisper SAY_PHASE2'),
('-1631025','Вы слабы и бессильны против меня!','You are weak, powerless to resist my will!','16876','6','0','0','deathwhisper SAY_DOMINATEMIND'),
('-1631026','Возьмите это благословение и покажите этим злоумышленникам где раки зимуют!','Take this blessing and show these intruders a taste of our master\'s power.','16873','6','0','0','deathwhisper SAY_DARKEMPOWERMENT'),
('-1631027','Мои слуги! Я освобождаю вас от проклятия плоти!','Loyal adherent! I release you from the curse of flesh!','16874','6','0','0','deathwhisper SAY_DARKTRANSFORMATION'),
('-1631028','Встань и предстань в истинном виде!','Arise and exalt in your pure form!','16875','6','0','0','deathwhisper SAY_ANIMATEDEAD'),
('-1631029','Вы еще не осознали бесполезность своих действий?','Do you yet grasp of the futility of your actions?','16869','6','0','0','deathwhisper SAY_KILL1'),
('-1631030','Прими Тьму! Тьма вечна...','Embrace the darkness... Darkness eternal!','16870','6','0','0','deathwhisper SAY_KILL2'),
('-1631031','Это игра продолжается слишком долго!','This charade has gone on long enough.','16872','3','0','0','deathwhisper SAY_BERSERK'),
('-1631032','Все - части плана Мастера! Ваш конец неизбежен...','All part of the masters plan! Your end is... inevitable!','16871','6','0','0','deathwhisper SAY_DEATH'),

	-- Saurfang
('-1631100','Во имя Короля-Лича!','BY THE MIGHT OF THE LICH KING!','16694','6','0','0','saurfang SAY_AGGRO'),
('-1631101','Земля обагрится вашей кровью!','The ground runs red with your blood!','16699','6','0','0','saurfang SAY_FALLENCHAMPION'),
('-1631102','Веселитесь, слуги мои!','Feast, my minions!','16700','3','0','0','saurfang SAY_BLOODBEASTS'),
('-1631103','Ты никто!','You are nothing!','16695','6','0','0','saurfang SAY_KILL1'),
('-1631104','Ваши души не найдут здесь избавления!','Your soul will find no redemption here!','16696','6','0','0','saurfang SAY_KILL2'),
('-1631105','Я вижу приближение смерти!','I have become... death!','16698','3','0','0','saurfang SAY_BERSERK'),
('-1631106','Я... Освободился...','I... Am... Released.','16697','6','0','0','saurfang SAY_DEATH'),
('-1631107','Все павшие воины орды, все дохлые псы альянса - все пополнят армию Короля-Лича! Даже сейчас валькиры воскрешают ваших покойников, чтобы они стали частью Плети!','For every Horde soldier that you killed, for every Alliance dog that fell, the Lich King\'s armies grew. Even now the Val\'kyr work to raise your fallen... As Scourge.','16701','6','0','0','saurfang SAY_INTRO'),
('-1631108','Сейчас все будет еще хуже. Идите сюда, я покажу вам, какой силой меня наделил Король-Лич!','Things are about to get much worse. Come, taste the power that the Lich King has bestowed upon me!','16702','6','0','0','saurfang SAY_BERSERK'),
('-1631109','Ха-ха-ха. Дворфы!','Hahahaha! Dwarves.','16703','6','0','0','saurfang SAY'),

	-- Festergut
('-1631201','Отличные новости народ! Я починил трубы для подачи ядовитой смеси!','Good news, everyone! I\'ve fixed the poison slime pipes!','17123','6','0','0','Putricide Valve01'),
('-1631202','Тухлопуз! Ты всегда был моим любимчиком, как и Гниломорд... Молодец, что оставил столько газа. Я его даже чувствую.','Oh, Festergut. You were always my favorite. Next to Rotface. The good news is you left behind so much gas, I can practically taste it!','17124','6','0','0','Putricide Festergut Dead'),
('-1631203','Повеселимся!','Fun time!','16901','6','0','0','Festergut Aggro'),
('-1631204','Папочка! У меня получилось!','Daddy, I did it!','16902','6','0','0','Festergut Slay 01'),
('-1631205','Мертвец! Мертвец! Мертвец!','Dead, dead, dead!','16903','6','0','0','Festergut Slay 02'),
('-1631206','А-а-а-а-а...','Da ... Ddy...','16904','6','0','0','Festergut Death'),
('-1631207','Веселью конец!','Fun time over!','16905','6','0','0','Festergut Berserk'),
('-1631208','Что-то мне нехорошо...','Gyah! Uhhh, I not feel so good...','16906','6','0','0','Festergut Explunge Blight'),
('-1631209','Нет! Вы убили Вонючку! Сейчас получите!','NOOOO! You kill Stinky! You pay!','16907','6','0','0','Festergut Stinky Death '),
('-1631210','Их-ха!','...','16908','6','0','0','Festergut say '),
('-1631211','Ы-ы-ы!','...','16909','6','0','0','Festergut say '),
('-1631212','(Непереводимо)','...','16910','6','0','0','Festergut say '),
('-1631213','Пук.','...','16911','6','0','0','Festergut brrr '),

	-- Rotface
('-1631220','Отличные новости народ! Слизь снова потекла!','Great news, everyone! The slime is flowing again!','17126','6','0','0','Putricide Slime Flow'),
('-1631221','Й-й-йя-хахаха!','WEEEEEE!','16986','6','0','0','Rotface Aggro'),
('-1631222','Я ЭТО заломал!','I brokes-ded it...','16987','6','0','0','Rotface Slay 01'),
('-1631223','Папочка сделает новые игрушки из тебя!','Daddy make toys out of you!','16988','6','0','0','Rotface Slay 02'),
('-1631224','Папочка, не огорчайся...','Bad news daddy.','16989','6','0','0','Rotface Death'),
('-1631225','Тихий час!','Sleepy Time!','16990','6','0','0','Rotface Berserk'),
('-1631226','Липучка-вонючка!','Icky sticky.','16991','6','0','0','Rotface Infection'),
('-1631227','Я сделал очень злую каку! Сейчас взорвется!','I think I made an angry poo-poo. It gonna blow!','16992','6','0','0','Rotface Unstable Ooze'),
('-1631228','Что? Прелесть? Не-е-е-т!','What? Precious? Noooooooooo!!!','16993','6','0','0','Rotface Precious played when precious dies'),
('-1631229','Й-а-а-а!','...','16994','6','0','0','Rotface say'),
('-1631230','Ах!','...','16995','6','0','0','Rotface say'),
('-1631231','А-а-у!','...','16996','6','0','0','Rotface say'),

	-- Professor Putricide
('-1631240','Отличные новости народ! Я усовершенствовал штамм чумы, которая уничтожит весь Азерот!','Good news, everyone! I think I perfected a plague that will destroy all life on Azeroth!','17114','6','0','0','Putricide Aggro'),
('-1631241','М-м-м. Интересно.','Hmm... Interesting...','17115','6','0','0','Putricide Slay 01'),
('-1631242','О, как неожиданно!','That was unexpected!','17116','6','0','0','Putricide Slay 02'),
('-1631243','Плохие новости, народ... Похоже, у меня ничего не выйдет.','Bad news, everyone! I don\'t think I\'m going to make it.','17117','6','0','0','Putricide Death'),
('-1631244','Прекрасные новости, народ!','Great news, everyone!','17118','6','0','0','Putricide Berserk'),
('-1631245','Это обычное облако газа. Но будьте осторожны, не такое уж оно и обычное...','Just an ordinary gas cloud. But watch out, because that\'s no ordinary gas cloud!','17119','6','0','0','Putricide Gas Explosion'),
('-1631246','Что-то я ничего не чувствую. Что? Это еще откуда?','Hmm. I don\'t feel a thing. Whaa...? Where\'d those come from?','17120','6','0','0','Putricide Transform 01'),
('-1631247','На вкус как вишенка. Ой, извините...','Tastes like... Cherry! Oh! Excuse me!','17121','6','0','0','Putricide Transform 02'),
('-1631248','Два слизнюка в одной комнате? Может получиться что-то любопытное...','Two oozes, one room! So many delightful possibilities...','17122','6','0','0','Putricide Summon Ooze'),
('-1631249','Вы слишком грязные чтобы тут расхаживать! Надо сперва соскрести эту мерзкую плоть.','You can\'t come in here all dirty like that! You need that nasty flesh scrubbed off first!','17125','6','0','0','Putricide Airlock01 Before fight'),

	-- Blood Prince Council
('-1631301','Глупые смертные! Думали, что одолели нас? Санлейн, непобедимые воины Короля-Лича! Теперь наши силы едины!','Foolish mortals. You thought us defeated so easily? The San\'layn are the Lich King\'s immortal soldiers! Now you shall face their might combined!','16795','6','0','0','Lanathel Intro Princes'),
('-1631302','Кушать подано!','Dinner... is served.','16681','6','0','0','Valanar Slay 01'),
('-1631303','Теперь вы видите, насколько мы сильны?','Do you see NOW the power of the Darkfallen?','16682','6','0','0','Valanar Slay 02'),
('-1631304','Охохо...','...why...?','16683','6','0','0','Valanar Death'),
('-1631305','Хорош тянуть время перед Санлейн!','BOW DOWN BEFORE THE SAN\'LAYN!','16684','6','0','0','Valanar Berserk'),
('-1631306','Наксанар был досадным недоразумением! Силы сферы позволят Валанару свершить отмщение!','Naxxanar was merely a setback! With the power of the orb, Valanar will have his vengeance!','16685','6','0','0','Valanar Empower'),
('-1631307','Моя чаша полна','My cup runneth over.','16686','6','0','0','Valanar Special'),
('-1631308','Йих!','...','16687','6','0','0','Princes say'),
('-1631309','Э-эх!','...','16688','6','0','0','Princes say'),
('-1631310','До-хо!','...','16689','6','0','0','Princes say'),

	-- Blood Queen Lana'thel
('-1631321','Это было неразумное решение!','You have made an... unwise... decision.','16782','6','0','0','Lanathel Aggro'),
('-1631322','Я только попробую на вкус...','Just a taste...','16783','6','0','0','Lanathel Bite 01'),
('-1631323','Я голодна!','Know my hunger!','16784','6','0','0','Lanathel Bite 02'),
('-1631324','Смерть вас не спасет!','Death is no escape!','16785','6','0','0','Lanathel Add'),
('-1631325','Страдайте же!','SUFFER!','16786','6','0','0','Lanathel Special 01'),
('-1631326','Как вам такое?','Can you handle this?','16787','6','0','0','Lanathel Special 02'),
('-1631327','Начинаем представление!','Here it comes.','16788','6','0','0','Lanathel Special 03'),
('-1631328','Не повезло...','How... Unfortunate...','16789','6','0','0','Lanathel Reset'),
('-1631329','Нет. Моя прелесть, приятного аппетита!','Yes... feed my precious one! You\'re mine now!','16790','6','0','0','Lanathel Mind Control'),
('-1631330','Вот как... У тебя не получилось?','Really...? Is that all you\'ve got?','16791','6','0','0','Lanathel Slay 01'),
('-1631331','Какая жалость...','Such a pity!','16792','6','0','0','Lanathel Slay 02'),
('-1631332','Сейчас все кончится!','THIS! ENDS! NOW!','16793','6','0','0','Lanathel Berserk'),
('-1631333','Но... Мы ведь так хорошо ладили...','But... we were getting along... so well...','16794','6','0','0','Lanathel Death'),
('-1631334','Восстаньте братья! И уничтожьте наших врагов!','Rise up brothers! And destroy our enemies!','16796','6','0','0','Lanathel Empower'),
('-1631335','Ха-х!','Ha!','16797','6','0','0','Lanathel say'),
('-1631338','Ах-ха...','Oo...','16798','6','0','0','Lanathel say'),
('-1631339','Ых...','Oh...','16799','6','0','0','Lanathel say'),

	-- Valithria Dreamwalker
('-1631401','Герои! Вы должны мне помочь! Мои силы на исходе... Залечите мои раны...','Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!','17064','6','0','0','Valithria Aggro'),
('-1631402','Одержимые не знают отдыха...','No rest for the wicked...','17065','6','0','0','Valithria Slay Bad Hostile NPC'),
('-1631403','Прискобная потеря.','A tragic loss...','17066','6','0','0','Valithria Slay Good - Player'),
('-1631404','Неудачники!','FAILURES!','17067','6','0','0','Valithria Berserk'),
('-1631405','Я открыла портал в изумрудный сон. Там вы найдете спасение, герои!','I have opened a portal into the Dream. Your salvation lies within, heroes.','17068','6','0','0','Valithria Dream World Open'),
('-1631406','Я долго не продержусь!','I will not last much longer!','17069','6','0','0','Valithria Health Low'),
('-1631407','Силы возвращаются ко мне! Герои, еще немного!','My strength is returning! Press on, heroes!','17070','6','0','0','Valithria Health High'),
('-1631408','Я излечилась! Изера, даруй мне силу покончить с этими нечестивыми тварями!','I am renewed! Ysera grants me the favor to lay these foul creatures to rest!','17071','6','0','0','Valithria Win'),
('-1631409','Простите меня, я не могу остано... ВСЕ ВО ВЛАСТИ КОШМАРА!','Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!','17072','6','0','0','Valithria Lose'),

	-- Sindragosa
('-1631420','Глупцы! Зачем вы сюда явились? Ледяные ветра Нордскола унесут ваши души!','You are fools who have come to this place! The icy winds of Northrend will consume your souls!','17007','6','0','0','Sindragosa Aggro'),
('-1631421','Погибни!','Perish!','17008','6','0','0','Sindragosa Slay 01'),
('-1631422','Удел смертных!','A flaw of mortality...','17009','6','0','0','Sindragosa Slay 02'),
('-1631423','Наконец-то! Свободна!','Free...at last...','17010','6','0','0','Sindragosa Death'),
('-1631424','Хватит! Эти игры меня утомляют!','Enough! I tire of these games!','17011','6','0','0','Sindragosa Berserk'),
('-1631425','Здесь ваше вторжение и окончится! Никто не уцелеет!','Your incursion ends here! None shall survive!','17012','6','0','0','Sindragosa Take Off - fly'),
('-1631426','Вы чувствуете, как ледяная ладонь смерти сжимает сердце?','Can you feel the cold hand of death upon your heart?','17013','6','0','0','Sindragosa Freeze'),
('-1631427','Трепещите, смертные! Ибо ваша жалкая магия теперь бессильна!','Suffer, mortals, as your pathetic magic betrays you!','17014','6','0','0','Sindragosa Arcane'),
('-1631428','А-а-а! Жжот! Что это за колдовство?','Suffer, mortals, as your pathetic magic betrays you!','17015','6','0','0','Sindragosa Special'),
('-1631429','А теперь почувствуйте всю мощь Господина и погрузитесь в отчаяние!','Now feel my master\'s limitless power and despair!','17016','6','0','0','Sindragosa Low HP'),

	-- Lich king
('-1631501','Неужели прибыли, наконец, хваленые силы света? Мне бросить Ледяную скорбь и сдаться на твою милость, Фордринг?','So...the Light\'s vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?','17349','6','0','0','Lich King SAY_INTRO1'),
('-1631503','Ты пройдешь через эти мучения сам.','You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.','17350','6','0','0','Lich King SAY_INTRO3'),
('-1631505','Я оставлю тебя в живых, чтобы ты увидел финал! Не могу допустить чтобы величайший служитель света пропустил рождение МОЕГО мира!','I\'ll keep you alive to witness the end, Fordring. I would not want the Light\'s greatest champion to miss seeing this wretched world remade in my image.','17351','6','0','0','Lich King SAY_AGGRO'),
('-1631506','Ну же, герои! В вашей ярости - МОЯ сила!','Come then champions, feed me your rage!','17352','6','0','0','Lich King SAY'),
('-1631507','Сомнений нет - вы сильнейшие герои Азерота! Вы преодолели все препятствия, которые я воздвиг перед вами! Сильнейшие из моих слуг пали под вашим натиском, сгорели в пламени вашей ярости!','No question remains unanswered. No doubts linger. You are Azeroth\'s greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury..','17353','6','0','0','Lich King SAY'),
('-1631508','Что движет вами? Праведность? Не знаю...','Is it truly righteousness that drives you? I wonder.','17354','6','0','0','Lich King SAY'),
('-1631509','Ты отлично их обучил, Фордринг! Ты привел сюда лучших воинов, которых знал мир! И отдал их в мои руки. Как я и рассчитывал.','You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.','17355','6','0','0','Lich King SAY'),
('-1631510','Смотри как я буду воскрешать их и превращать в воинов Плети! Они повергнут этот мир в пучину хаоса. Азерот падет от их рук. И ты станешь первой жертвой. ','Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth\'s fall will come at their hands -- and you will be the first to die.','17356','6','0','0','Lich King SAY'),
('-1631511','Мне по душе эта ирония!','I delight in the irony.','17357','6','0','0','Lich King SAY'),
('-1631512','Невозможно!','Impossible...','17358','6','0','0','Lich King SAY'),
('-1631513','Да! Вы меня и правда ранили. Я слишком долго с вами играл. Испытайте на себе возмездие Смерти!','You gnats actually hurt me! Perhaps I\'ve toyed with you long enough, now taste the vengeance of the grave!','17359','6','0','0','Lich King SAY'),
('-1631514','А-а-х!','...','17360','6','0','0','Lich King SAY'),
('-1631515','И вот я стою как лев пред агнцами. И не дрожат они.','Now I stand, the lion before the lambs... and they do not fear.','17361','6','0','0','Lich King SAY'),
('-1631516','Им неведом страх!','They cannot fear.','17362','6','0','0','Lich King SAY'),
('-1631517','Надежда тает!','Hope wanes!','17363','6','0','0','Lich King SAY'),
('-1631518','Пришел конец!','The end has come!','17364','6','0','0','Lich King SAY'),
('-1631519','Встречайте трагический финал!','Face now your tragic end!','17365','6','0','0','Lich King SAY_KILL'),
('-1631520','Ледяная скорбь жаждет крови!','Frostmourne hungers...','17366','6','0','0','Lich King SAY'),
('-1631521','Ледяная скорбь, повинуйся мне!','Argh... Frostmourne, obey me!','17367','6','0','0','Lich King SAY'),
('-1631522','Ледяная скорбь поглотит душу вашего товарища!','Frostmourne feeds on the soul of your fallen ally!','17368','6','0','0','Lich King SAY_KILL'),
('-1631523','Я проморожу вас насквозь и вы разлетитесь на ледяные осколки!','I will freeze you from within until all that remains is an icy husk!','17369','6','0','0','Lich King SAY'),
('-1631524','Смотрите, как мир рушится вокруг вас!','Watch as the world around you collapses!','17370','6','0','0','Lich King SAY_WIN'),
('-1631525','Конец света!','Apocalypse!','17371','6','0','0','Lich King SAY'),
('-1631526','Склонись перед своим господином и повелителем!','Bow down before your lord and master!','17372','6','0','0','Lich King SAY'),
('-1631527','Валькирия! Твой господин зовет!','Val\'kyr, your master calls!','17373','6','0','0','Lich King SAY_SUMMON'),
('-1631528','...','...','17374','6','0','0','Lich King SAY_DEATH'),
('-1631531','Оскверняю!','Defile!','0','3','0','0','Lich King SAY'),

	-- Tirion
('-1631552','Мы даруем тебе быструю смерть, Артас! Более быструю чем ты заслуживаешь за то что замучил и погубил десятки тысяч жизней!','We will grant you a swift death, Arthas. More than can be said for the thousands you\'ve tortured and slain.','17390','6','0','0','Tirion SAY_INTRO2'),
('-1631554','Да будет так! Герои, в атаку','So be it. Champions, attack!','17391','6','0','0','Tirion SAY_INTRO4'),
('-1631555','Свет! Даруй мне последнее благословение! Дай мне разбить эти оковы!','LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!','17392','6','0','0','Tirion SAY'),
('-1631556','Хватит, Артас! Твоя ненависть не заберет больше ни одной жизни!','No more, Arthas! No more lives will be consumed by your hatred!','17393','6','0','0','Tirion SAY'),

	-- Menethil
('-1631557','Вы пришли чтобы вершить суд над Артасом? Чтобы уничтожить короля-лича?','You have come to bring Arthas to justice? To see the Lich King destroyed?','17394','6','0','0','Terenas Menethil II SAY'),
('-1631558','Вы не должны оказаться во власти Ледяной скорби. Иначе, как и я, будете навеки порабощены этим проклятым клинком.','First, you must escape Frostmourne\'s hold, or be damned as I am; trapped within this cursed blade for all eternity.','17395','6','0','0','Terenas Menethil II SAY'),
('-1631559','Помогите мне уничтожить эти истерзанные души. Вместе мы вытянем силу из ледяной скорби и ослабим короля-лича.','Aid me in destroying these tortured souls! Together we will loosen Frostmourne\'s hold and weaken the Lich King from within!','17396','6','0','0','Terenas Menethil II SAY'),
('-1631560','Наконец я свободен. Все кончено, сын мой. Настал час расплаты.','Free at last! It is over, my son. This is the moment of reckoning.','17397','6','0','0','Terenas Menethil II SAY'),
('-1631561','Поднимитесь, воины света!','Rise up, champions of the Light!','17398','6','0','0',' SAY'),

	-- Adds
('-1631590','Р-р-р-рота, подъем!','<need translate>','0','6','0','0','custom message'),
('-1631591','Хилы, не спать!','<need translate>','0','6','0','0','custom message'),
('-1631592','ДД поднажали!','<need translate>','0','6','0','0','custom message'),
('-1631593','Лидер, гони лентяев из рейда! А то еще час возиться будете!','<need translate>','0','6','0','0','custom message'),
('-1631594','Ну вот вы и прикончили Артаса. Теперь будем ждать Катаклизм.','<need translate>','0','6','0','0','custom message');

-- 721_icecrown_spelltable_scriptdev2.sql
	-- Icecrown citadel spelltable

	-- Lord Marrowgar
DELETE FROM `boss_spell_table` WHERE `entry` = 36612;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36612, 71021, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(36612, 69138, 0, 0, 0, 6000, 0, 0, 0, 12000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36612, 71580, 0, 0, 0, 6000, 0, 0, 0, 12000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36612, 69146, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36612, 69057, 0, 0, 0, 17000, 0, 0, 0, 27000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36612, 69076, 0, 0, 0, 60000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36612, 69075, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 5, 0, 0, 12, 0, 1),
(36612, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36612, 38711, 10000, 12000, 1, 1, 2, 2, 1, 5, 0, 9),
(36612, 36672, 45000, 45000, 1, 1, 2, 2, 75, 100, 0, 9);
	-- Cold flame
DELETE FROM `boss_spell_table` WHERE `entry` = 36672;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36672, 69146, 70823, 70824, 70825, 3000, 0, 0, 0, 3000, 0, 0, 0, 5, 0, 0, 12, 0, 0),
(36672, 69145, 0, 0, 0, 3000, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
	-- Bone spike
DELETE FROM `boss_spell_table` WHERE `entry` = 38711;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38711, 69065, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 6, 0, 0);

	-- Lady Deathwhisper
DELETE FROM `boss_spell_table` WHERE `entry` = 36855;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36855, 70842, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 1, 0, 0),
(36855, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 1, 0, 0),
(36855, 71254, 72008, 72008, 72504, 5000, 0, 0, 0, 8000, 0, 0, 0, 4, 0, 0),
(36855, 71420, 72501, 72007, 72502, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(36855, 71001, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(36855, 71204, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36855, 70901, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 6, 0, 0),
(36855, 71289, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(36855, 71494, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36855, 37890, 45000, 75000, 1, 1, 2, 2, 75, 100, 0, 11),
(36855, 37949, 45000, 75000, 1, 1, 2, 2, 75, 100, 0, 11),
(36855, 38010, 45000, 45000, 1, 1, 2, 2, 75, 100, 0, 9),
(36855, 38222, 8000,  15000, 1, 1, 1, 1, 75, 100, 0, 9),
(36855, 38009, 45000, 45000, 1, 1, 2, 2, 75, 100, 0, 9);
	-- Vengeful shade
DELETE FROM `boss_spell_table` WHERE `entry` = 38222;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38222, 71494, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 1, 0, 0),
(38222, 71544, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 3, 0, 0);
	-- Adherent
DELETE FROM `boss_spell_table` WHERE `entry` = 37949;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37949, 71129, 0, 0, 0, 15000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37949, 70594, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 4, 0, 0),
(37949, 71254, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 4, 0, 0),
(37949, 70906, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 4, 0, 0),
(37949, 70903, 0, 0, 0, 1000, 0, 0, 0, 2000, 0, 0, 0, 1, 0, 0),
(37949, 71237, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37949, 70768, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 4, 0, 0),
(37949, 41236, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 1, 0, 0),
(37949, 71234, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 4, 0, 0);
	-- Fanatic
DELETE FROM `boss_spell_table` WHERE `entry` = 37890;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37890, 70659, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 3, 0, 0),
(37890, 70670, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 3, 0, 0),
(37890, 70674, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 1, 0, 0);

	-- Gunship battle
	-- Frost wyrm
DELETE FROM `boss_spell_table` WHERE `entry` = 37230;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37230, 70116, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(37230, 70362, 0, 0, 0, 20000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(37230, 71203, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 4, 0, 0),
(37230, 70361, 0, 0, 0, 3000, 0, 0, 0, 5000, 0, 0, 0, 3, 0, 0),
(37230, 47008, 0, 0, 0, 180000, 0, 0, 0, 180000, 0, 0, 0, 1, 0, 0);

	-- Rotted frost giant
DELETE FROM `boss_spell_table` WHERE `entry` IN (38490, 38494);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38490, 64652, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 4, 0, 0),
(38490, 72865, 0, 0, 0, 5000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(38490, 71203, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 4, 0, 0),
(38490, 47008, 0, 0, 0, 300000, 0, 0, 0, 300000, 0, 0, 0, 1, 0, 0);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38494, 64652, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 4, 0, 0),
(38494, 72865, 0, 0, 0, 5000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(38494, 71203, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 4, 0, 0),
(38494, 47008, 0, 0, 0, 300000, 0, 0, 0, 300000, 0, 0, 0, 1, 0, 0);

	-- Deathbringer Saurfang
DELETE FROM `boss_spell_table` WHERE `entry` = 37813;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37813, 72178, 0, 0, 0, 20000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(37813, 72371, 0, 0, 0, 3000, 0, 0, 0, 5000, 0, 0, 0, 1, 0, 0),
(37813, 72293, 0, 0, 0, 35000, 0, 0, 0, 45000, 0, 0, 0, 6, 0, 0),
(37813, 72737, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 4, 0, 0),
(37813, 72385, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 4, 0, 0),
(37813, 72380, 0, 0, 0, 25000, 0, 0, 0, 45000, 0, 0, 0, 4, 0, 0),
(37813, 72408, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 4, 0, 0),
(37813, 72173, 0, 0, 0, 45000, 0, 0, 0, 45000, 0, 0, 0, 1, 0, 0),
(37813, 72769, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 4, 0, 0),
(37813, 72723, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0),
(37813, 47008, 0, 0, 0, 480000, 0, 0, 0, 480000, 0, 0, 0, 1, 0, 0);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(37813, 38508, 45000, 45000, 1, 1, 2, 2, 15, 25, 0, 9);
	-- Blood beast
DELETE FROM `boss_spell_table` WHERE `entry` = 38508;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38508, 72176, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0),
(38508, 72723, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0),
(38508, 72769, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0),
(38508, 21150, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0);


	-- Festergut
DELETE FROM `boss_spell_table` WHERE `entry` = 36626;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
( 36626, 69162, 0, 0, 0, 25000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69166, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69165, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69157, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 150, 0, 0, 12, 0, 0),
( 36626, 69126, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 150, 0, 0, 12, 0, 0),
( 36626, 69195, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69278, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69279, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69290, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 72103, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 1),
( 36626, 72214, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
( 36626, 72219, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
( 36626, 72227, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 1),
( 36626, 72272, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 69244, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 69248, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 72287, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36626, 38548, 12000, 12000, 1, 1, 1, 1, 10, 20, 0, 11);

	-- Rotface
DELETE FROM `boss_spell_table` WHERE `entry` = 36627;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36627, 69508, 0, 0, 0, 15000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(36627, 69674, 0, 0, 0, 1000, 0, 0, 0,  1000, 0, 0, 0, 6, 0, 0),
(36627, 70003, 0, 0, 0, 15000, 0, 0, 0, 15000, 0, 0, 0, 6, 0, 0),
(36627, 69788, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 1, 0, 0),
(36627, 69783, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 3, 0, 0),
(36627, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 1, 0, 0),
(36627, 69789, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 6, 0, 1);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36627, 36897, 12000, 12000, 1, 1, 1, 1, 1, 5, 0, 9),
(36627, 37986, 15000, 15000, 1, 1, 1, 1, 10, 20, 0, 11),
(36627, 37013, 15000, 15000, 1, 1, 1, 1, 0, 0, 0, 11);
	-- Small ooze
DELETE FROM `boss_spell_table` WHERE `entry` = 36897;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36897,69774, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 4, 0, 0),
(36897,69750, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(36897,69644, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 6, 0, 0),
(36897,69889, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 6, 0, 0);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36897, 36899, 12000, 12000, 1, 1, 1, 1, 1, 5, 0, 9);
	-- Big ooze
DELETE FROM `boss_spell_table` WHERE `entry` = 36899;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36899,69774, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(36899,69839, 0, 0, 0, 6000, 0, 0, 0, 6000, 0, 0, 0, 1, 0, 0),
(36899,69760, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(36899,69644, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(36899,69558, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(36899,69889, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 6, 0, 0);
	-- Ooze explode stalker
DELETE FROM `boss_spell_table` WHERE `entry` = 38107;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38107,69840, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 1, 0, 0);

	-- Professor Putricide
DELETE FROM `boss_spell_table` WHERE `entry` = 36678;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36678,70346, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36678,71968, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 1, 0, 0),
(36678,71617, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36678,71618, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(36678,71621, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36678,71278, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36678,71279, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36678,73122, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36678,71603, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36678,70311, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(36678, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 1, 0, 0),
(36678,72672, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36678,70852, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 10, 30, 0, 15, 0, 0);

	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36678, 37562, 20000, 40000, 1, 1, 1, 1, 5, 10, 0, 9),
(36678, 37697, 20000, 40000, 1, 1, 1, 1, 5, 10, 0, 9);
	-- Gas cloud
DELETE FROM `boss_spell_table` WHERE `entry` = 37562;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37562,70672, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37562,70215, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 0),
(37562,71203, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(37562,70701, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0);
	-- Volatile ooze
DELETE FROM `boss_spell_table` WHERE `entry` = 37697;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37697,70492, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(37697,71203, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(37697,70447, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 0);
	-- Mutated abomination (pet?)
DELETE FROM `boss_spell_table` WHERE `entry` = 37672;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37672,70311, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(37672,72527, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37672,72539, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37672,70542, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37672,70405, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0);

	-- Taldaram
DELETE FROM `boss_spell_table` WHERE `entry` = 37973;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37973, 71807, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37973, 71718, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37973, 71393, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37973, 72040, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37973, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37973, 71708, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0);

	-- Valanar
DELETE FROM `boss_spell_table` WHERE `entry` = 37970;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37970, 72053, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37970, 38459, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 11, 0, 0),
(37970, 72052, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37970, 72037, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37970, 38422, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 11, 0, 0),
(37970, 71944, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37970, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37970, 72039, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0);

	-- Keleseth
DELETE FROM `boss_spell_table` WHERE `entry` = 37972;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37972, 71405, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37972, 71815, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37972, 71943, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37972, 71822, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37972, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37972, 38369, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 11, 0, 0);

	-- Lanathel
DELETE FROM `boss_spell_table` WHERE `entry` = 37955;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37955, 72981, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37955, 71623, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(37955, 70821, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(37955, 71510, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(37955, 71726, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 70867, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 70923, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 71340, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 71264, 0, 0, 0, 20000, 0, 0, 0, 35000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 71446, 0, 0, 0, 7000, 0, 0, 0, 12000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 71772, 0, 0, 0, 90000, 0, 0, 0, 90000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37955, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37955, 71952, 0, 0, 0, 5000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 1, 0, 0);

	-- Valithria
DELETE FROM `boss_spell_table` WHERE `entry` = 36789;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36789, 71977, 0, 0, 0, 30000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 71987, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(36789, 72481, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 70873, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 71189, 0, 0, 0, 3000, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 72724, 0, 0, 0, 3000, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 70904, 0, 0, 0, 5000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 1, 0, 1),
(36789, 71196, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 70702, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 16, 0, 1);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36789, 38429, 30000, 40000, 1, 1, 1, 1, 5, 70, 0, 9),
(36789, 37868, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11),
(36789, 37863, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11),
(36789, 36791, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11),
(36789, 37934, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11),
(36789, 37886, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11);
	-- Nightmare portal
DELETE FROM `boss_spell_table` WHERE `entry` = 38429;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38429, 70873, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 6, 0, 1);

	-- Sindragosa
DELETE FROM `boss_spell_table` WHERE `entry` = 36853;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36853, 70084, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36853, 57764, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(36853, 19983, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(36853, 71077, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 69649, 0, 0, 0, 20000, 0, 0, 0, 35000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 70107, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 69762, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 69766, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36853, 69846, 0, 0, 0, 15000, 0, 0, 0, 20000, 0, 0, 0, 50.0, 100.0, 0, 15, 0, 0),
(36853, 70117, 0, 0, 0, 30000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36853, 70123, 0, 0, 0, 20000, 0, 0, 0, 35000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36853, 70126, 0, 0, 0, 90000, 0, 0, 0, 90000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 70157, 0, 0, 0, 6000, 0, 0, 0, 6000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36853, 71665, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36853, 71053, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 36980, 0, 0, 0, 90000, 0, 0, 0, 90000, 0, 0, 0, 0, 0, 0, 9, 0, 0),
(36853, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36853, 70128, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 30.0, 0, 0, 12, 0, 0);

	-- Rimefang
DELETE FROM `boss_spell_table` WHERE `entry` = 37533;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37533, 71387, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37533, 71386, 0, 0, 0, 5000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37533, 71376, 0, 0, 0, 4000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 4, 0, 0);
	-- Spinestalker
DELETE FROM `boss_spell_table` WHERE `entry` = 37534;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37534, 36922, 0, 0, 0, 8000, 0, 0, 0, 24000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37534, 40505, 0, 0, 0, 5000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(37534, 71369, 0, 0, 0, 4000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 4, 0, 0);
	-- Ice tomb
DELETE FROM `boss_spell_table` WHERE `entry` = 36980;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36980, 70157, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 6, 0, 0);

	-- Lich king
DELETE FROM `boss_spell_table` WHERE `entry` = 36597;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36597, 70541, 0, 0, 0, 6000, 0, 0, 0, 12000, 0, 0, 0, 60, 0, 0, 12, 0, 0),
(36597, 70337, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 74074, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 69409, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(36597, 72762, 0, 0, 0, 20000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 68980, 0, 0, 0, 1500, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 68981, 0, 0, 0, 60000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 72133, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 72262, 0, 0, 0, 5000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69201, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 1),
(36597, 69200, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 69242, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69103, 0, 0, 0, 3000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69099, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69108, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70358, 0, 0, 0, 5000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70372, 0, 0, 0, 45000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 72149, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 72143, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70498, 0, 0, 0, 3600001, 0, 0, 0, 3600001, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70503, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69037, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 36609, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 9, 0, 0),
(36597, 71769, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70063, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 1),
(36597, 47008, 0, 0, 0, 900000, 0, 0, 0, 900000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 74352, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36597, 37799, 60000, 60000, 8, 10, 10, 10, 15, 25, 0, 11);
	-- ice sphere
DELETE FROM `boss_spell_table` WHERE `entry` = 36633;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36633, 69099, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36633, 69108, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(36633, 69090, 0, 0, 0, 8000, 0, 0, 0, 24000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
	-- vile spirit
DELETE FROM `boss_spell_table` WHERE `entry` = 37799;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37799, 70503, 0, 0, 0, 10000, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
	-- raging spirit
DELETE FROM `boss_spell_table` WHERE `entry` = 36701;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36701, 69242, 0, 0, 0, 2000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 3, 0, 0);

-- 723_icecrown_down_scriptdev2.sql
	-- Pit of saron
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1658100 AND -1658000;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
	-- Garfrost
(-1658001,'Tiny creatures under feet, you bring Garfrost something good to eat!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16912,1,0,0,'garfrost SAY_AGGRO'),
(-1658002,'Will save for snack. For later.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16913,1,0,0,'garfrost SAY_SLAY_1'),
(-1658003,'That one maybe not so good to eat now. Stupid Garfrost! BAD! BAD!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16914,1,0,0,'garfrost SAY_SLAY_2'),
(-1658004,'Garfrost hope giant underpants clean. Save boss great shame. For later.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16915,1,0,0,'garfrost SAY_DEATH'),
(-1658005,'Axe too weak. Garfrost make better and CRUSH YOU!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16916,1,0,0,'garfrost SAY_PHASE2'),
(-1658006,'Garfrost tired of puny mortals. Now your bones will freeze!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16917,1,0,0,'garfrost SAY_PHASE3'),
(-1658007,'Another shall take his place. You waste your time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16752,1,0,0,'Tyrannus SAY_TYRANNUS_DEATH'),

	-- Krick
(-1658010,'Our work must not be interrupted! Ick! Take care of them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16926,1,0,0,'Krick SAY_AGGRO'),
(-1658011,'Ooh...We could probably use these parts!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16927,1,0,0,'Krick SAY_SLAY_1'),
(-1658012,'Arms and legs are in short supply...Thanks for your contribution!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16928,1,0,0,'Krick SAY_SLAY_2'),
(-1658013,'Enough moving around! Hold still while I blow them all up!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16929,1,0,0,'Krick SAY_BARRAGE_1'),
(-1658014,'Krick begins rapidly conjuring explosive mines!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Krick SAY_BARRAGE_2'),
(-1658015,'Quickly! Poison them all while they''re still close!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16930,1,0,0,'Krick SAY_POISON_NOVA'),
(-1658016,'No! That one! That one! Get that one!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16931,1,0,0,'Krick SAY_CHASE_1'),
(-1658017,'I''ve changed my mind...go get that one instead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16932,1,0,0,'Krick SAY_CHASE_2'),
(-1658018,'What are you attacking him for? The dangerous one is over there,fool!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16933,1,0,0,'Krick SAY_CHASE_3'),

	-- Ick
(-1658020,'Ick begins to unleash a toxic poison cloud!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Ick SAY_ICK_POISON_NOVA'),
(-1658021,'Ick is chasing you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Ick SAY_ICK_CHASE_1'),

	-- Krick OUTRO
(-1658030,'Wait! Stop! Don''t kill me, please! I''ll tell you everything!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16934,1,0,0,'Krick SAY_KRICK_OUTRO_1'),
(-1658031,'I''m not so naive as to believe your appeal for clemency, but I will listen.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16611,1,0,0,'Jaina SAY_JAINA_OUTRO_2'),
(-1658032,'Why should the Banshee Queen spare your miserable life?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17033,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_2'),
(-1658033,'What you seek is in the master''s lair, but you must destroy Tyrannus to gain entry. Within the Halls of Reflection you will find Frostmourne. It... it holds the truth.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16935,1,0,0,'Krick SAY_KRICK_OUTRO_3'),
(-1658034,'Frostmourne lies unguarded? Impossible!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16612,1,0,0,'Jaina SAY_JAINA_OUTRO_4'),
(-1658035,'Frostmourne? The Lich King is never without his blade! If you are lying to me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17034,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_4'),
(-1658036,'I swear it is true! Please, don''t kill me!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16936,1,0,0,'Krick SAY_KRICK_OUTRO_5'),
(-1658037,'Worthless gnat! Death is all that awaits you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16753,1,0,0,'Tyrannus SAY_TYRANNUS_OUTRO_7'),
(-1658038,'Urg... no!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16937,1,0,0,'Krick SAY_KRICK_OUTRO_8'),
(-1658039,'Do not think that I shall permit you entry into my master''s sanctum so easily. Pursue me if you dare.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16754,1,0,0,'Tyrannus SAY_TYRANNUS_OUTRO_9'),
(-1658040,'What a cruel end. Come, heroes. We must see if the gnome''s story is true. If we can separate Arthas from Frostmourne, we might have a chance at stopping him.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16613,1,0,0,'Jaina SAY_JAINA_OUTRO_10'),
(-1658041,'A fitting end for a traitor. Come, we must free the slaves and see what is within the Lich King''s chamber for ourselves.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17035,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_10'),

	-- Tyrannus
(-1658050,'Your pursuit shall be in vain, adventurers, for the Lich King has placed an army of undead at my command! Behold!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16755,1,0,0,'Tyrannus SAY_AMBUSH_1'),
(-1658051,'Persistent whelps! You will not reach the entrance of my lord''s lair! Soldiers, destroy them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16756,1,0,0,'Tyrannus SAY_AMBUSH_2'),
(-1658052,'Rimefang! Trap them within the tunnel! Bury them alive!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16757,1,0,0,'Tyrannus SAY_GAUNTLET_START'),
(-1658053,'Alas, brave, brave adventurers, your meddling has reached its end. Do you hear the clatter of bone and steel coming up the tunnel behind you? That is the sound of your impending demise.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16758,1,0,0,'Tyrannus SAY_INTRO_1'),
(-1658054,'Ha, such an amusing gesture from the rabble. When I have finished with you, my master''s blade will feast upon your souls. Die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16759,1,0,0,'Tyrannus SAY_INTRO_2'),

(-1658055,'I shall not fail The Lich King! Come and meet your end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16760,1,0,0,'Tyrannus SAY_AGGRO'),
(-1658056,'Such a shameful display... You are better off dead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16761,1,0,0,'Tyrannus SAY_SLAY_1'),
(-1658057,'Perhaps you should have stayed in the mountains!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16762,1,0,0,'Tyrannus SAY_SLAY_2'),
(-1658058,'Impossible! Rimefang... Warn...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16763,1,0,0,'Tyrannus SAY_DEATH'),
(-1658059,'Rimefang, destroy this fool!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16764,1,0,0,'Tyrannus SAY_MARK_RIMEFANG_1'),
(-1658060,'The frostwyrm Rimefang gazes at $N and readies an icy attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Tyrannus SAY_MARK_RIMEFANG_2'),
(-1658061,'Power... overwhelming!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16765,1,0,0,'Tyrannus SAY_DARK_MIGHT_1'),
(-1658062,'Scourgelord Tyrannus roars and swells with dark might!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Tyrannus SAY_DARK_MIGHT_2'),

(-1658063,'Brave champions, we owe you our lives, our freedom... Though it be a tiny gesture in the face of this enormous debt, I pledge that from this day forth, all will know of your deeds, and the blazing path of light you cut through the shadow of this dark citadel.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Gorkun  SAY_GORKUN_OUTRO_1'),
(-1658064,'This day will stand as a testament not only to your valor, but to the fact that no foe, not even the Lich King himself, can stand when Alliance and Horde set aside their differences and ---',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Gorkun  SAY_GORKUN_OUTRO_2'),
(-1658065,'Heroes, to me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16614,1,0,0,'Jaina SAY_JAYNA_OUTRO_3'),
(-1658066,'Take cover behind me! Quickly!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17037,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_3'),
(-1658067,'The Frost Queen is gone. We must keep moving - our objective is near.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16615,0,0,0,'Jaina SAY_JAYNA_OUTRO_4'),
(-1658068,'I thought he''d never shut up. At last, Sindragosa silenced that long-winded fool. To the Halls of Reflection, champions! Our objective  is near... I can sense it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17036,0,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_4'),
(-1658069,'I... I could not save them... Damn you, Arthas! DAMN YOU!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16616,0,0,0,'Jaina SAY_JAYNA_OUTRO_5');

	-- Forge of souls
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1632099 AND -1632000;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
	-- Bronjham
(-1632001,'Finally...a captive audience!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Наконец то! Гости пожаловали!',16595,6,0,0,'Bronjham SAY_AGGRO'),
(-1632002,'Fodder for the engine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Скормлю тебя машине!',16596,6,0,0,'Bronjham SAY_SLAY_1'),
(-1632003,'Another soul to strengthen the host!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Еще одна душа обогатит вместилище!',16597,6,0,0,'Bronjham SAY_SLAY_2'),
(-1632004,'Oooooo...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Аааааааааааа...',16598,6,0,0,'Bronjham SAY_DEATH'),
(-1632005,'The vortex of the harvested calls to you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вихрь погубленных душ, взываю к вам!',16599,3,0,0,'Bronjham SAY_SOUL_STORM'),
(-1632006,'I will sever the soul from your body!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я вырву душу из твоего тела!',16600,6,0,0,'Bronjham SAY_CORRUPT_SOUL'),

	-- Devourer of Souls
(-1632010,'You dare look upon the host of souls? I SHALL DEVOUR YOU WHOLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы осмелились взглянуть на вместилище душ! Я сожру вас заживо!',16884,1,0,0,'Devoureur SAY_FACE_ANGER_AGGRO'),
(-1632011,'You dare look upon the host of souls? I SHALL DEVOUR YOU WHOLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16890,1,0,0,'Devoureur SAY_FACE_DESIRE_AGGRO'),
(-1632012,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Проклинаю тебя!',16885,1,0,0,'Devoureur SAY_FACE_ANGER_SLAY_1'),
(-1632013,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16896,1,0,0,'Devoureur SAY_FACE_SORROW_SLAY_1'),
(-1632014,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16891,1,0,0,'Devoureur SAY_FACE_DESIRE_SLAY_1'),
(-1632015,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Обрекаю тебя на вечные муки!',16886,1,0,0,'Devoureur SAY_FACE_ANGER_SLAY_2'),
(-1632016,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16897,1,0,0,'Devoureur SAY_FACE_SORROW_SLAY_2'),
(-1632017,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16892,1,0,0,'Devoureur SAY_FACE_DESIRE_SLAY_2'),
(-1632018,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вместилише душ не ослабнет! Вы лишь пытаетесь отсрочить неизбежное.',16887,1,0,0,'Devoureur SAY_FACE_ANGER_DEATH'),
(-1632019,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16898,1,0,0,'Devoureur SAY_FACE_SORROW_DEATH'),
(-1632020,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16893,1,0,0,'Devoureur SAY_FACE_DESIRE_DEATH'),
(-1632021,'Devourer of Souls begins to cast Mirrored Soul!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Devoureur EMOTE_MIRRORED_SOUL'),
(-1632022,'Devourer of Souls begins to Unleash Souls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Devoureur EMOTE_UNLEASH_SOUL'),
(-1632023,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Страдание, мучение, хаос! Восстаньте и пируйте!',16888,1,0,0,'Devoureur SAY_FACE_ANGER_UNLEASH_SOUL'),
(-1632024,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16899,1,0,0,'Devoureur SAY_FACE_SORROW_UNLEASH_SOUL'),
(-1632025,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16894,1,0,0,'Devoureur SAY_FACE_DESIRE_UNLEASH_SOUL'),
(-1632026,'Devourer of Souls begins to cast Wailing Souls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Devoureur EMOTE_WAILING_SOUL'),
(-1632027,'Stare into the abyss, and see your end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вглядитесь в бездну, и узрите свою смерть!',16889,1,0,0,'Devoureur SAY_FACE_ANGER_WAILING_SOUL'),
(-1632028,'Stare into the abyss, and see your end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16895,1,0,0,'Devoureur SAY_FACE_DESIRE_WAILING_SOUL'),
(-1632029,'Excellent work, champions! We shall set up our base camp in these chambers. My mages will get the Scourge transport device working shortly. Step inside it when you''re ready for your next mission. I will meet you on the other side.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы справились. Мы разобьем лагерь в этих покоях. Вскоре мои маги заставят портал плети работать! Войдите в него, когда будете готовы к следующему заданию. Я присоеденусь к вам чуть позже.',16625,1,0,0,'Jaina SAY_JAINA_OUTRO'),
(-1632030,'Excellent work, champions! We shall set up our base camp in these chambers. My mages will get the Scourge transport device working shortly. Step inside when you are ready for your next mission. I will meet you on the other side.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Превосходно! Мы разобьем лагерь в этих покоях! Вскоре мои маги заставят портал плети работать, войдите в него когда будете готовы к следующему заданию! Я присоединюсь к вам позже.',17044,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO'),

	-- Jaina
(-1632040,'Thank the light for seeing you here safely. We have much work to do if we are to defeat the Lich King and put an end to the Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Слава свету! Вы целы и невредимы нам предстоит многое сделать, если мы хотим покончить с королем личем и плетью.',16617,0,0,0,'Jaina SAY_INTRO_1'),
(-1632041,'Our allies within the Argent Crusade and the Knights of the Ebon Blade have broken through the front gate of Icecrown and are attempting to establish a foothold within the Citadel.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Серебряный Авангард и рыцари черного клинка прорвались через главные ворота и пытаются укрепить свои позиции в цитадели!',16618,0,0,0,'Jaina SAY_INTRO_2'),
(-1632042,'Their success hinges upon what we discover in these cursed halls. Although our mission is a wrought with peril, we must persevere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Их успех зависит от того что мы найдем этих ужасных залах. Пусть наша миссия опасна, но мы должны выстоять.',16619,0,0,0,'Jaina SAY_INTRO_3'),
(-1632043,'With the attention of the Lich King drawn toward the front gate, we will be working our way through the side in search of information that will enable us to defeat the Scourge - once and for all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пока король лич отвлекся на главные ворота, мы проникнем внутрь другим путем и постараемся узнать как можно покончить с плетью раз и навсегда.',16620,0,0,0,'Jaina SAY_INTRO_4'),
(-1632044,'King Varian''s SI7 agents have gathered information about a private sanctum of the Lich King''s deep within a place called the Halls of Reflection.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Разведчики SI7 отправленные Варианом сообщают что покои короля находятся в глубине дворца! Это место называется Залами отражений.',16621,0,0,0,'Jaina SAY_INTRO_5'),
(-1632045,'We will carve a path through this wretched place and find a way to enter the Halls of Reflection. I sense powerful magic hidden away within those walls... Magic that could be the key to destroy the Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы проложим себе путь сквозь это проклятое место и найдем вход в залы отражений. Я чувствую что в них сокрыта могушественная магия, которая поможет нам сокрушить плеть!',16622,0,0,0,'Jaina SAY_INTRO_6'),
(-1632046,'Your first mission is to destroy the machines of death within this malevolent engine of souls, and clear a path for our soldiers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ваша первая задача разрушить машины смерти в этом механизме душ, это откроет путь нашим солдатам.',16623,0,0,0,'Jaina SAY_INTRO_7'),
(-1632047,'Make haste, champions! I will prepare the troops to fall in behind you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Спешите герои, я прикажу солдатам следовать за вами!',16624,0,0,0,'Jaina SAY_INTRO_8'),

	-- Sylvanas
(-1632050,'The Argent Crusade and the Knights of the Ebon Blade have assaulted the gates of Icecrown Citadel and are preparing for a massive attack upon the Scourge. Our missition is a bit more subtle, but equally as important.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Серебряный Авангард и рыцари черного клинка штурмуют ворота цитадели ледяной короны! И готовятся нанести решаюший удар! Мы будем действовать незаметно, но не менее эффективно.',17038,0,0,0,'Sylvanas SAY_INTRO_1'),
(-1632051,'With the attention of the Lich King turned towards the front gate, we''ll be working our way through the side in search of information that will enable us to defeat the Lich King - once and for all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пока Король-Лич отвлекся мы проникнем внутрь другим путем и постараемся понять как можно покончить с ним раз и навсегда.',17039,0,0,0,'Sylvanas SAY_INTRO_2'),
(-1632052,'Our scouts have reported that the Lich King has a private chamber, outside of the Frozen Throne, deep within a place called the Halls of Reflection. That is our target, champions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Наши разведчики сообщили что покои короля лича находятся в глубине дворца, недалеко от ледяного трона. Это место называется залами отражений, туда и лежит наш путь.',17040,0,0,0,'Sylvanas SAY_INTRO_3'),
(-1632053,'We will cut a swath of destruction through this cursed place and find a way to enter the Halls of Reflection. If there is anything of value to be found here, it will be found in the Halls.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы проложим себе путь сквозь это проклетое место и найдем и найдем вход в залы отражений! Если в цитадели и есть что то достойное внимания оно ждет нас именно там.',17041,0,0,0,'Sylvanas SAY_INTRO_4'),
(-1632054,'Your first mission is to destroy the machines of death within this wretched engine of souls, and clear a path for our soldiers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вашей первой задачей будет  разрушение машин смерти в этом гнусном механизме душ, это откроет путь к нашим солдатам',17042,0,0,0,'Sylvanas SAY_INTRO_5'),
(-1632055,'The Dark Lady watches over you. Make haste!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Темная госпожа будет наблюдать за вами, спешите!',17043,0,0,0,'Sylvanas SAY_INTRO_6');

	-- Halls of reflection (from MaxXx2021 aka Mioka)
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1594540 AND -1594430;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
# SCENE - Hall Of Reflection (Intro) - PreUther
(-1594433, 'The chill of this place freezes the marrow of my bones!', 'Как же тут холодно... Кровь стынет в жилах.', 16631,0,0,1, '67234'),
(-1594434, 'I... I don\'t believe it! Frostmourne stands before us, unguarded! Just as the Gnome claimed. Come, heroes!', 'Я... Я не верю своим глазам. Ледяная скорбь перед нами без всякой охраны! Как и говорил гном. Вперед герои!', 17049,0,0,1, '67234'),
(-1594435, 'What is that? Up ahead! Could it be ... ? Heroes at my side!', 'Что это там впереди? Неужели? Скорее герои!', 16632,1,0,1, '67234'),
(-1594436, 'Frostmourne ... The blade that destroyed our kingdom ...', 'Ледяная Скорбь, клинок, разрушивший наше королевство...', 16633,1,0,1, '67234'),
(-1594437, 'Standing this close to the blade that ended my life... The pain... It is renewed.', 'Боль снова захлестывает меня, когда я так близко вижу меч, отнявший у меня жизнь.', 17050,0,0,1, '67234'),
(-1594438, 'Stand back! Touch that blade and your soul will be scarred for all eternity! I must attempt to commune with the spirits locked away within Frostmourne. Give me space, back up please!', 'Отойдите. Тот кто коснется этого клинка обречет себя на вечные муки. Я попытаюсь заговорить с душами заключенными в Ледяной скорби. Расступитесь... Чуть назад! Прошу.', 16634,1,0,1, '67234'),
(-1594439, 'I dare not touch it. Stand back! Stand back! As I attempt to commune with the blade. Perhaps our salvation lies within.', 'Я не смею его коснуться. Назад! Отступите! Я попробую установить связь с мечом. Возможно, спасение находится внутри!', 17051,1,0,1, '67234'),
# SCENE - Hall Of Reflection (Intro) - UtherDialog
(-1594440, 'Jaina! Could it truly be you?', 'Джайна? Неужели это ты?', 16666,0,0,1, '67234'),
(-1594441, 'Careful, girl. I\'ve heard talk of that cursed blade saving us before. Look around you and see what has been born of Frostmourne.', 'Осторожней девочка! Однажды мне уже говорили, что этот проклятый меч может нас спасти. Посмотри вокруг, и ты увидишь, что из этого вышло.', 16659,0,0,1, '67234'),
(-1594442, 'Uther! Dear Uther! I... I\'m so sorry.', 'Утер? Милый Утер! Мне... Мне так жаль.', 16635,0,0,1, '67234'),
(-1594443, 'Uther...Uther the Lightbringer. How...', 'Утер? Утер Светоносный? Как...', 17052,0,0,1, '67234'),
(-1594444, 'Jaina, you haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', 'Джайна, у вас мало времени. Король - Лич видит все что видит Ледяная Скорбь. Вскоре он будет здесь.', 16667,0,0,1, '67234'),
(-1594445, 'You haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', 'У вас мало времени. Король - Лич видит все что видит Ледяная Скорбь. Вскоре он будет здесь.', 16660,0,0,1, '67234'),
(-1594446, 'Arthas is here? Maybe I...', 'Артас здесь? Может я...', 16636,0,0,1, '67234'),
(-1594447, 'The Lich King is here? Then my destiny shall be fulfilled today!', 'Король - Лич здесь? Значит моя судьба решится сегодня!', 17053,1,0,1, '67234'),
(-1594448, 'No, girl. Arthas is not here. Arthas is merely a presence within the Lich King\'s mind. A dwindling presence...', 'Нет девочка. Артаса здесь нет. Артас лишь тень, мелькающая в сознании Короля - Лича. Смутная тень.', 16668,0,0,1, '67234'),
(-1594449, 'You cannot defeat the Lich King. Not here. You would be a fool to try. He will kill those who follow you and raise them as powerful servants of the Scourge. But for you, Sylvanas, his reward for you would be worse than the last.', 'Вам не победить Короля - Лича. Покрайней мере не здесь. Глупо и пытаться. Он убьет твоих соратников и воскресит их как воинов плети. Но что до тебя Сильвана, он готовит тебе участь еще страшнее, чем в прошлый раз.', 16661,0,0,1, '67234'),
(-1594450, 'But Uther, if there\'s any hope of reaching Arthas. I... I must try.', 'Но если есть малейшая надежда вернуть Артаса... Я должна попытаться!', 16637,0,0,1, '67234'),
(-1594451, 'There must be a way...', 'Должен быть способ!', 17054,0,0,1, '67234'),
(-1594452, 'Jaina, listen to me. You must destroy the Lich King. You cannot reason with him. He will kill you and your allies and raise you all as powerful soldiers of the Scourge.', 'Джайна послушай меня. Вам нужно уничтожить Короля - Лича. С ним нельзя договориться. Он убьет вас всех и превратит в могущественных воинов Плети.', 16669,0,0,1, '67234'),
(-1594453, 'Perhaps, but know this: there must always be a Lich King. Even if you were to strike down Arthas, another would have to take his place, for without the control of the Lich King, the Scourge would wash over this world like locusts, destroying all that they touched.', 'Возможно... Но знай! Король - Лич должен быть всегда. Даже если вы убьете Артаса кто то обязан будет занять его место. Лишившись правителя Плеть налетит на мир как стая саранчи и уничтожит все на своем пути.', 16662,0,0,1, '67234'),
(-1594454, 'Tell me how, Uther? How do I destroy my prince? My...', 'Но как Утер? Как мне убить моего принца, моего...', 16638,0,0,1, '67234'),
(-1594455, 'Who could bear such a burden?', 'Кому по силам такое бремя?', 17055,0,0,1, '67234'),
(-1594456, 'Snap out of it, girl. You must destroy the Lich King at the place where he merged with Ner\'zhul - atop the spire, at the Frozen Throne. It is the only way.', 'Забудь об этом девочка. Короля - Лича нужно уничтожить на том месте, где он слился с Нерзулом. На самой вершине, у Ледяного Трона!', 16670,0,0,1, '67234'),
(-1594457, 'I do not know, Banshee Queen. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', 'Не знаю, Королева Баньши... Если бы не Артас, который все еще является частью Короля - Лича, Плеть давно бы уже уничтожила Азерот.', 16663,0,0,1, '67234'),
(-1594458, 'You\'re right, Uther. Forgive me. I... I don\'t know what got a hold of me. We will deliver this information to the King and the knights that battle the Scourge within Icecrown Citadel.', 'Ты прав Утер, прости меня... Я не знаю что на меня нашло. Мы передадим твои слова Королю и рыцарям, которые сражаются с Плетью в Цитадели Ледяной Короны.', 16639,0,0,1, '67234'),
(-1594459, 'There is... something else that you should know about the Lich King. Control over the Scourge must never be lost. Even if you were to strike down the Lich King, another would have to take his place. For without the control of its master, the Scourge would run rampant across the world - destroying all living things.', 'Тебе нужно знать еще кое что о Короле - Личе. Плеть не должна выйти из под контроля. Даже если вы убьете Короля - Лича, кто-то должен будет занять его место. Без Короля Плеть налетит на мир как стая саранчи и уничтожит все живое.', 16671,0,0,1, '67234'),
(-1594460, 'Alas, the only way to defeat the Lich King is to destroy him at the place he was created.', 'Увы единственый способ одолеть Короля - Лича - это убить его там где он был порожден.', 16664,0,0,1, '67234'),
(-1594461, 'Who could bear such a burden?', 'Кому по силам такое бремя?', 16640,0,0,1, '67234'),
(-1594462, 'The Frozen Throne...', 'Ледяной Трон!', 17056,0,0,1, '67234'),
(-1594463, 'A grand sacrifice by a noble soul...', 'Великая жертва, благородной души.', 16672,0,0,1, '67234'),
(-1594464, 'I do not know, Jaina. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', 'Не знаю Джайна... мне кажется если бы не Артас, который все еще является частью Короля - Лича, Плеть давно бы уже уничтожила Азерот.', 16673,0,0,1, '67234'),
(-1594465, 'Then maybe there is still hope...', 'Но может еще есть надежда?', 16641,0,0,1, '67234'),
(-1594466, 'No, Jaina! ARRRRRRGHHHH... He... He is coming. You... You must...', 'Нет Джайна... Эээээ... Он... Он приближается... Вы... Вы должны...', 16674,1,0,1, '67234'),
(-1594467, 'Aye. ARRRRRRGHHHH... He... He is coming. You... You must...', 'Да... Эээээ... Он... Он приближается... Вы... Вы должны...', 16665,1,0,1, '67234'),
(-1594468, 'SILENCE, PALADIN!', 'Замолчи, паладин.', 17225,1,0,0, '67234'),
(-1594469, 'So you wish to commune with the dead? You shall have your wish.', 'Так ты хочешь поговорить с мертвыми? Нет ничего проще!', 17226,1,0,0, '67234'),
(-1594470, 'Falric. Marwyn. Bring their corpses to my chamber when you are through.', 'Фалрик, Марвин, когда закончите, принесите их тела в мои покои.', 17227,0,0,0, '67234'),
(-1594471, 'You won\'t deny me this, Arthas! I must know... I must find out...', 'Ты от меня не отмахнешься Артас. Я должна понять, я должна знать.', 16642,1,0,1, '67234'),
(-1594472, 'You will not escape me that easily, Arthas! I will have my vengeance!', 'Ты так просто от меня не уйдешь Артас. Я отомщу тебе!', 17057,1,0,1, '67234'),
(-1594473, '<need translate>', 'Глупая девчонка! Тот кого ты ищещь давно убит! Теперь он лишь призрак, слабый отзвук в моем сознании!', 17229,1,0,0, '67234'),
(-1594474, '<need translate>', 'Я не повторю прежней ошибки, Сильвана. На этот раз тебе не спастись. Ты не оправдала моего доверия и теперь тебя ждет только забвение!', 17228,1,0,0, '67234'),
(-1594475, 'As you wish, my lord.', 'Как пожелаете, мой господин!', 16717,1,0,0, '67234'),
(-1594476, 'As you wish, my lord.', 'Как пожелаете, мой господин!', 16741,1,0,0, '67234'),
# SCENE - Hall Of Reflection (Extro) - PreEscape
(-1594477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', 'Твои союзники прибыли, Джайна! Как ты и обещала... Ха-ха-ха-ха... Все вы станете могучими солдатами Плети...', 17212,1,0,0, '67234'),
(-1594478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', 'Я не повторю прежней ошибки, Сильвана! На этот раз тебе не спастись. Вы все будите служить мне после смерти...', 17213,1,0,0, '67234'),
(-1594479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', 'Он слишком силен. Мы должны выбраться от сюда как можно скорее. Моя магия задержит его ненадолго, быстрее герои...', 16644,0,0,1, '67234'),
(-1594480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', 'Он слишком силен. Герои скорее, за мной. Мы должны выбраться отсюда немедленно. Я постараюсь его задержать, пока мы будем убегать.', 17058,0,0,1, '67234'),
# SCENE - Hall Of Reflection (Extro) - Escape
(-1594481, 'Death\'s cold embrace awaits.', 'Смерть распростерла ледяные обьятия!', 17221,1,0,0, '67234'),
(-1594482, 'Rise minions, do not left them us!', 'Восстаньте прислужники, не дайте им сбежать!', 17216,1,0,0, '67234'),
(-1594483, 'Minions sees them. Bring their corpses back to me!', 'Схватите их! Принесите мне их тела!', 17222,1,0,0, '67234'),
(-1594484, 'No...', 'Надежды нет!', 17214,1,0,0, '67234'),
(-1594485, 'All is lost!', 'Смирись с судьбой.', 17215,1,0,0, '67234'),
(-1594486, 'There is no escape!', 'Бежать некуда!', 17217,1,0,0, '67234'),
(-1594487, 'I will destroy this barrier. You must hold the undead back!', 'Я разрушу эту преграду, а вы удерживайте нежить на расстоянии!', 16607,1,0,0, '67234'),
(-1594488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', 'Никакие стены не удержат Королеву Баньши. Держите нежить на расстоянии, я сокрушу эту преграду.', 17029,1,0,0, '67234'),
(-1594489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', 'Опять ледяная стена... Я разобью ее, только не дайте нежити прервать мои заклинания...', 16608,1,0,0, '67234'),
(-1594490, 'Another barrier? Stand strong, champions! I will bring the wall down!', 'Еще одна преграда. Держитесь герои! Я разрушу эту стену!', 17030,1,0,0, '67234'),
(-1594491, 'Succumb to the chill of the grave.', 'Покоритесь Леденящей смерти!', 17218,1,0,0, '67234'),
(-1594492, 'Another dead end.', 'Вы в ловушке!', 17219,1,0,0, '67234'),
(-1594493, 'How long can you fight it?', 'Как долго вы сможете сопротивляться?', 17220,1,0,0, '67234'),
(-1594494, '<need translate>', 'Он с нами играет. Я  покажу ему что бывает когда лед встречается со огнем!', 16609,0,0,0, '67234'),
(-1594495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', 'Твои преграды больше не задержат нас, чудовище. Я смету их с пути!', 16610,1,0,0, '67234'),
(-1594496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', 'Я устала от этих игр Артас. Твои стены не остановят меня!', 17031,1,0,0, '67234'),
(-1594497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', 'Ты не помешаешь нам уйти, монстр. Сдерживайте нежить, а я уничтожу эту преграду.', 17032,1,0,0, '67234'),
(-1594498, 'There\'s an opening up ahead. GO NOW!', 'Я вижу выход, скорее!', 16645,1,0,0, '67234'),
(-1594499, 'We\'re almost there... Don\'t give up!', 'Мы почти выбрались, не сдавайтесь!', 16646,1,0,0, '67234'),
(-1594500, 'There\'s an opening up ahead. GO NOW!', 'Я вижу выход, скорее!', 17059,1,0,0, '67234'),
(-1594501, 'We\'re almost there! Don\'t give up!', 'Мы почти выбрались, не сдавайтесь!', 17060,1,0,0, '67234'),
(-1594502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', 'Больше некуда бежать. Теперь нам придется сражаться. Это наша последняя битва!', 16647,1,0,0, '67234'),
(-1594503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', 'Проклятый тупик, значит все закончится здесь. Готовьтесь герои, это наша последняя битва.', 17061,1,0,0, '67234'),
(-1594504, 'Nowhere to run! You\'re mine now...', 'Ха-ха-ха... Бежать некуда. Теперь вы мои!', 17223,1,0,0, '67234'),
(-1594505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', 'Солдаты Лордерона, восстаньте по зову Господина!', 16714,1,0,0, '67234'),
(-1594506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', 'Господин осмотрел свое королевство и признал его негодным! Его суд был быстрым и суровым - предать всех смерти!', 16738,1,0,0, '67234'),

#Falric
(-1594507, 'Men, women and children... None were spared the master\'s wrath. Your death will be no different.', 'Мужчины, Женщины и дети... Никто не избежал гнева господина. Вы разделите их участь!', 16710,1,0,0, '67234'),
(-1594508, 'Marwyn, finish them...', 'Марвин... Добей их...', 16713,1,0,0, '67234'),
(-1594509, 'Sniveling maggot!', 'Сопливый червяк!', 16711,1,0,0, '67234'),
(-1594510, 'The children of Stratholme fought with more ferocity!', 'Стратхольмские детишки - и те сражались отчаяннее!', 16712,1,0,0, '67234'),
(-1594511, 'Despair... so delicious...', 'Как сладостно отчаянье!', 16715,1,0,0, '67234'),
(-1594512, 'Fear... so exhilarating...', 'Как приятен страх!', 16716,1,0,0, '67234'),

#Marwyn
(-1594513, 'Death is all that you will find here!', 'Вы найдете здесь лишь смерть!', 16734,1,0,0, '67234'),
(-1594514, 'Yes... Run... Run to meet your destiny... Its bitter, cold embrace, awaits you.', 'Эээээ... Да... Бегите навстречу судьбе. Ее жестокие и холодные обьятия ждут вас...', 16737,1,0,0, '67234'),
(-1594515, 'I saw the same look in his eyes when he died. Terenas could hardly believe it. Hahahaha!', 'У Теренаса был такой же взгляд в миг смерти, он никак не мог поверить... Ха-ха-ха-ха-ха...', 16735,1,0,0, '67234'),
(-1594516, 'Choke on your suffering!', 'Захлебнись страданием!', 16736,1,0,0, '67234'),
(-1594517, 'Your flesh shall decay before your very eyes!', 'Вы увидите как разлагается ваша плоть!', 16739,1,0,0, '67234'),
(-1594518, 'Waste away into nothingness!', 'Сгиньте без следа!', 16740,1,0,0, '67234'),

#FrostWorn General
(-1594519, 'You are not worthy to face the Lich King!', 'Вы недостойны предстать перед Королем - Личом!', 16921,1,0,0, '67234'),
(-1594520, 'Master, I have failed...', 'Господин... Я подвел вас...', 16922,1,0,0, '67234'),

#add
(-1594531, '<need translate>', 'Ну теперь-то точно пора сваливать.', 0,0,0,0, '67234'),
(-1594532, '<need translate>', 'Вот вам сундук за работу.', 0,0,0,0, '67234'),
(-1594533, '<need translate>', 'И, поскольку корабля с оффа не будет, вот вам портал в Даларан.', 0,0,0,0, '67234');

	-- Waipoints to escort event on Halls of reflection

DELETE FROM script_waypoint WHERE entry=36955;
DELETE FROM script_waypoint WHERE entry=37226;
DELETE FROM script_waypoint WHERE entry=37554;

INSERT INTO script_waypoint VALUES
	-- Jaina

   (36955, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (36955, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (36955, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (36955, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (36955, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (36955, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (36955, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (36955, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (36955, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (36955, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (36955, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (36955, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (36955, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (36955, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (36955, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (36955, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (36955, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (36955, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (36955, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (36955, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (36955, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (36955, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

	-- Sylvana

   (37554, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (37554, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (37554, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (37554, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (37554, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (37554, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (37554, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (37554, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (37554, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (37554, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37554, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37554, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37554, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (37554, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37554, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37554, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37554, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (37554, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37554, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37554, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (37554, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (37554, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

	-- Lich King

   (37226, 0, 5577.187,2236.003,733.012, 0, 'WP1'),
   (37226, 1, 5587.682,2228.586,733.011, 0, 'WP2'),
   (37226, 2, 5600.715,2209.058,731.618, 0, 'WP3'),
   (37226, 3, 5606.417,2193.029,731.129, 0, 'WP4'),
   (37226, 4, 5598.562,2167.806,730.918, 0, 'WP5'), 
   (37226, 5, 5559.218,2106.802,731.229, 0, 'WP6'),
   (37226, 6, 5543.498,2071.234,731.702, 0, 'WP7'),
   (37226, 7, 5528.969,2036.121,731.407, 0, 'WP8'),
   (37226, 8, 5512.045,1996.702,735.122, 0, 'WP9'),
   (37226, 9, 5504.490,1988.789,735.886, 0, 'WP10'),

   (37226, 10, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37226, 11, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37226, 12, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37226, 13, 5445.157,1894.955,748.757, 0, 'WP13'),
   (37226, 14, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37226, 15, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37226, 16, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37226, 17, 5335.422,1766.951,767.635, 0, 'WP17'),
   (37226, 18, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37226, 19, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37226, 20, 5278.694,1697.912,785.692, 0, 'WP20'),
   (37226, 21, 5283.589,1703.755,784.176, 0, 'WP19');

-- 723_icecrown_down_spelltable_scriptdev2.sql
	-- Icecrown down spelltable

	-- Boss Bronjahm
DELETE FROM `boss_spell_table` WHERE `entry` = 36497;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `timerMin_N10`, `timerMin_N25`, `timerMax_N10`, `timerMax_N25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(36497, 68793, 0, 3000, 0, 8000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(36497, 36535, 0, 30000, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, NULL),
(36497, 68839, 0, 15000, 0, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(36497, 68858, 0, 1000, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(36497, 68988, 0, 1000, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(36497, 68950, 0, 8000, 0, 12000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(36497, 68872, 0, 1000, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(36497, 68921, 0, 360001, 0, 360001, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL),
(36497, 70043, 0, 2000, 0, 6000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL);

-- 724_trial_of_crusader_scriptdev2.sql
	-- TOC original texts/sounds (thanks to griffonheart)
	-- english translation by Cristy
	-- reworked by rsa

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1713799 AND -1713499;
INSERT INTO `script_texts`
(`comment`,`sound`, `entry`,`content_loc8`,`type`,`language`,`emote`,`content_default`) VALUES
('34996','16036','-1713500','Добро пожаловать, герои! Вы услышали призыв Серебряного Авангарда и без колебаний откликнулись на него! В этом колизее вам предстоит сразиться с опаснейшими противниками. Те из вас, кто смогут пережить испытания, войдут в ряды Серебряного Авангарда, который направится в Цитадель Ледяной Короны.','6','0','0','Welcome champions, you have heard the call of the argent crusade and you have boldly answered. It is here in the crusaders coliseum that you will face your greatest challenges. Those of you who survive the rigors of the coliseum will join the Argent Crusade on its marsh to ice crown citadel.'),
('34996','16038','-1713501','Из самых глубоких и темных пещер Грозовой Гряды был призван Гормок Пронзающий Бивень! В бой, герои!','6','0','0','Hailing from the deepest, darkest carverns of the storm peaks, Gormok the Impaler! Battle on, heroes!'),
('34990','16069','-1713502','Твои чудовища не чета героям Альянса, Тирион!','6','0','0','Your beast will be no match for my champions Tirion!'),
('34995','16026','-1713702','Я видел и более достойных соперников в багровом круге. Ты напрасно тратишь наше время, паладин.','6','0','0','Your beast will be no match for my champions Tirion!'),
('34796','0','-1713601','Мои рабы! Уничтожьте врага!','3','0','0','My slaves! Destroy the enemy!'),
('34996','16039','-1713503','Приготовьтесь к схватке с близнецами-чудовищами, Кислотной Утробой и Жуткой Чешуей!','6','0','0','Steel yourselves, heroes, for the twin terrors Acidmaw and Dreadscale. Enter the arena!'),
('34799','0','-1713504','После гибели товарища %s приходит в ярость!','3','0','0','After the death of sister %s goes berserk!'),
('34996','16040','-1713505','В воздухе повеяло ледяным дыханием следующего бойца: на арену выходит Ледяной Рев! Сражайтесь или погибните, чемпионы!','6','0','0','The air freezes with the introduction of our next combatant, Icehowl! Kill or be killed, champions!'),
('34797','0','-1713506','%s глядит на |3-3($n) и испускает гортанный вой!','3','0','0','%S looks at |3-3($n) and emits a guttural howl!'),
('34797','0','-1713507','%s врезается в стену Колизея и теряет ориентацию!','3','0','0','%S crashes into a wall of the Colosseum and lose focus!'),
('34797','0','-1713508','|3-3(%s) охватывает кипящая ярость, и он растаптывает всех на своем пути!','3','0','0','|3-3(%s) covers boiling rage, and he tramples all in its path!'),
('34996','16041','-1713509','Все чудовища повержены!','6','0','0','All the monsters defeated!'),
('34996','16042','-1713709','Прискорбно. Как яростно они не бились, чудовища Нордскола оказались сильнее. Почтим память павших героев минутой молчания.','6','0','0',''),
('34996','16043','-1713510','Сейчас великий чернокнижник Вилфред Непопамс призовет вашего нового противника. Готовьтесь к бою!','6','0','0','Grand Warlock Wilfred Fizzlebang will summon forth your next challenge. Stand by for his entry!'),
('35458','16268','-1713511','Благодарю, Верховный лорд. А теперь, смельчаки, я приступаю к ритуалу призыва. Когда я закончу, появится грозный демон!','6','0','0','Thank you, Highlord! Now challengers, I will begin the ritual of summoning! When I am done, a fearsome Doomguard will appear!'),
('35458','16269','-1713512','Готовьтесь к забвению!','6','0','0','Prepare for oblivion!'),
('35458','16270','-1713513','АГА! Получилось! Трепещи перед всевластным Вилфредом Непопамсом, мастером призыва! Ты покорен мне, демон!','6','0','0','Ah ha! Behold the absolute power of Wilfred Fizzlebang, master summoner! You are bound to ME, demon!'),
('34780','16143','-1713514','Ничтожный гном! Тебя погубит твоя самоуверенность!','6','0','0','Trifling gnome, your arrogance will be your undoing!'),
('35458','16271','-1713515','Тут я главный!','6','0','0','But I am in charge here-'),
('35458','0','-1713715','Ну вот, опять я облажался...','6','0','0','Agonized Scream!!!'),
('34996','16044','-1713516','Быстрей, герои, расправьтесь с повелителем демонов, прежде чем он откроет портал в свое темное царство!','6','0','0','Quickly, heroes! Destroy the demon lord before it can open a portal to its twisted demonic realm!'),
('34780','16144','-1713517','Перед вами Джараксус, эредарский повелитель Пылающего Легиона!','6','0','0','You face Jaraxxus, eredar lord of the Burning Legion!'),
('34780','0','-1713518','На вас направлено |cFFFF0000Пламя Легиона!|r','3','0','0','You have been sent |cFFFF0000Plamya Legion!|R'),
('34780','0','-1713519','%s создает врата Пустоты!','3','0','0','%S creates the gates of the Void!'),
('34780','0','-1713520','%s создает |cFF00FF00Вулкан инферналов!|r','3','0','0','%S creates |cFF00FF00Vulkan Infernals!|R'),
('34780','16150','-1713521','Явись, сестра! Господин зовет!','6','0','0','Come forth, sister! Your master calls!'),
('34780','0','-1713522','$n $gподвергся:подверглась; |cFF00FFFFИспепелению плоти!|r Исцелите $gего:ее;!','3','0','0','$N $gpodvergsya:been; |cFF00FFFFIspepeleniyu flesh!|R Heal $gego:it;!'),
('34780','16149','-1713523','ПЛОТЬ ОТ КОСТИ!','6','0','0','FLESH FROM BONE!'),
('34780','16151','-1713524','ИНФЕРНАЛ!','6','0','0','INFERNO!'),
('34780','16147','-1713525','Мое место займут другие. Ваш мир обречен...','6','0','0','Another will take my place. Your world is doomed.'),
('34996','16045','-1713526','Гибель Вилфреда Непопамса весьма трагична и должна послужить уроком тем, кто смеет беспечно играть с темной магией. К счастью, вы победили демона, и теперь вас ждет новый противник.','6','0','0','The loss of Wilfred Fizzlebang, while unfortunate, should be a lesson to those that dare dabble in dark magic. Alas, you are victorious and must now face the next challenge.'),
('34995','16021','-1713527','Подлые собаки Альянса! Вы выпустили повелителя демонов на воинов Орды? Ваша смерть будет быстрой!','6','0','0','Treacherous Alliance dogs! You summon a demon lord against warriors of the Horde!? Your deaths will be swift!'),
('34990','16064','-1713528','Альянсу не нужна помощь повелителя демонов, чтобы справиться с ордынским отродьем, пес!','6','0','0','The Alliance doesnt need the help of a demon lord to deal with Horde filth. Come, pig!'),
('34996','16046','-1713529','Тише! Успокойтесь! Никакого заговора здесь нет. Чернокнижник заигрался и поплатился за это. Турнир продолжается!','6','0','0','Everyone, calm down! Compose yourselves! There is no conspiracy at play here. The warlock acted on his own volition - outside of influences from the Alliance. The tournament must go on!'),
('34996','16047','-1713530','В следующем бою вы встретитесь с могучими рыцарями Серебряного Авангарда! Лишь победив их, вы заслужите достойную награду.','6','0','0','The next battle will be against the Argent Crusades most powerful knights! Only by defeating them will you be deemed worthy...'),
('34995','16023','-1713531','Орда требует справедливости! Мы вызываем Альянс на бой! Позволь нам встать на место твоих рыцарей, паладин. Мы покажем этим псам, как оскорблять Орду!','6','0','0','The Horde demands justice! We challenge the Alliance. Allow us to battle in place of your knights, paladin. We will show these dogs what it means to insult the Horde!'),
('34995','16066','-1713731','Они хотели запятнать честь Альянса, они пытались нас оклеветать! Я требую справедливости! Тириорн, позволь моим чемпионам сражаться вместо твоих рыцарей. Мы бросаем вызов Орде!','6','0','0','Our honor has been besmirched! They make wild claims and false accusations against us. I demand justice! Allow my champions to fight in place of your knights, Tirion. We challenge the Horde!'),
('34996','16048','-1713532','Хорошо. Да будет так. Сражайтесь с честью!','','0','0','Very well, I will allow it. Fight with honor!'),
('34995','16022','-1713533','Не щадите никого, герои Орды! ЛОК-ТАР ОГАР!','6','0','0','Show them no mercy, Horde champions! LOK-TAR OGAR!'),
('34995','16065','-1713733','Сражайтесь во славу Альянса, герои! Во имя вашего короля!','6','0','0','Fight for the glory of the Alliance, heroes! Honor your king and your people!'),
('34990','16067','-1713534','СЛАВА АЛЬЯНСУ!','6','0','0','GLORY OF THE ALLIANCE!'),
('34990','16024','-1713734','Это было лишь пробой того, что ждёт нас в будущем. За Орду!','6','0','0','LOK-TAR OGAR!'),
('34996','16049','-1713535','Пустая и горькая победа. После сегодняшних потерь мы стали слабее как целое. Кто еще, кроме Короля-лича, выиграет от подобной глупости? Пали великие воины. И ради чего? Истинная опасность еще впереди - нас ждет битва с Королем-личом.','6','0','0','A shallow and tragic victory. We are weaker as a whole from the losses suffered today. Who but the Lich King could benefit from such foolishness? Great warriors have lost their lives. And for what? The true threat looms ahead - the Lich King awaits us all in death.'),
('34996','16050','-1713536','Лишь сплотившись, вы сможете пройти последнее испытание. Из глубин Ледяной Короны навстречу вам подымаются две могучие воительницы Плети: жуткие валькирии, крылатые вестницы Короля-лича!','6','0','0','Only by working together will you overcome the final challenge. From the depths of Icecrown come two of the Scourges most powerful lieutenants: fearsome valkyr, winged harbingers of the Lich King!'),
('34996','16037','-1713537','Пусть состязания начнутся!','6','0','0','Let the games begin!'),
('34497','0','-1713538','%s начинает читать заклинание|cFFFFFFFFСветлая воронка!|r Переключение к |cFFFFFFFFСветлой|r сущности!','3','0','0','%S begins to read a spell |cFFFFFFFFSvetlaya funnel!|R switch to |cFFFFFFFFSvetloy|r essence!'),
('34497','0','-1713539','%s начинает читать заклинание Договор близнецов!','3','0','0','%S begins to read the spell Treaty twins!'),
('34496','0','-1713540','%s начинает читать заклинание |cFF9932CDТемная воронка!|r Переключение к |cFF9932CDТемной|r сущности!','3','0','0','%S begins to read a spell |cFF9932CDTemnaya funnel!|R switch to |cFF9932CDTemnoy|r essence!'),
('34497','16272','-1713541','Во имя темного повелителя. Во имя Короля-лича. Вы. Умрете.','6','0','0','In the name of our dark master. For the Lich King. You. Will. Die.'),
('34496','16272','-1713741','Во имя светлого повелителя. Во имя Короля-лича. Вы. Умрете.','6','0','0','In the name of our dark master. For the Lich King. You. Will. Die.'),
('34496','16279','-1713542','Да поглотит вас Свет!','6','0','0','Let the light consume you!'),
('34496','16277','-1713543','Пустое место!','6','0','0','Empty place!'),
('34497','16276','-1713544','Тебя оценили и признали ничтожеством.','6','0','0','You appreciated and acknowledged nothing.'),
('34497','16274','-1713545','ХАОС!','3','0','0','CHAOS!'),
('34496','16278','-1713546','Да поглотит вас Тьма!','6','0','0','Let the dark consume you!'),
('34496','16275','-1713547','Плеть не остановить...','6','0','0','The Scourge cannot be stopped...'),
('34990','16068','-1713548','Против Альянса не выстоять даже самым сильным прислужникам Короля-лича! Все славьте наших героев!','6','0','0','Against the Alliance can not stand even the most powerful henchmen of the Lich King! All glorify our heroes!'),
('34995','16025','-1713748','Ты все еще сомневаешься в могуществе Орды, паладин? Мы примем любой вызов!','6','0','0','Against the Horde does not withstand even the most powerful henchmen of the Lich King! All glorify our heroes!'),
('34996','16051','-1713549','Король-лич понес тяжелую потерю! Вы проявили себя как бесстрашные герои Серебряного Авангарда! Мы вместе нанесем удар по Цитадели Ледяной Короны и разнесем в клочья остатки Плети! Нет такого испытания, которое мы бы не могли пройти сообща!','6','0','0','A mighty blow has been dealt to the Lich King! You have proven yourselves able bodied champions of the Argent Crusade. Together we will strike at Icecrown Citadel and destroy what remains of the Scourge! There is no challenge that we cannot face united!'),
('16980','16321','-1713550','Будет тебе такое испытание, Фордринг.','6','0','0','You will have your challenge, Fordring.'),
('34996','16052','-1713551','Артас! Нас гораздо больше! Сложи Ледяную Скорбь, и я подарю тебе заслуженную смерть.','6','0','0','Arthas! You are hopelessly outnumbered! Lay down Frostmourne and I will grant you a just death.'),
('35877','16322','-1713552','Нерубианцы воздвигли целую империю под льдами Нордскола. Империю, на которой вы так бездумно построили свои дома. МОЮ ИМПЕРИЮ.','6','0','0','The Nerubians built an empire beneath the frozen wastes of Northrend. An empire that you so foolishly built your structures upon. MY EMPIRE.'),
('16980','16323','-1713553','Души твоих павших чемпионов будут принадлежать мне, Фордринг.','6','0','0','The souls of your fallen champions will be mine, Fordring.'),
('34564','16235','-1713554','А вот и гости заявились, как и обещал господин.','6','0','0','Ahhh... Our guests arrived, just as the master promised.'),
('34564','16234','-1713555','Это место станет вашей могилой!','3','0','0','This place will serve as your tomb!'),
('34564','16240','-1713556','Ауум на-л ак-к-к-к, ишшш. Вставайте, слуги мои. Время пожирать...','6','0','0','Auum na-l ak-k-k-k, isshhh. Rise, minions. Devour...'),
('34564','0','-1713557','%s зарывается в землю!','3','0','0','%S buries itself in the earth!'),
('34660','0','-1713558','Шипы %s преследуют $n!','3','0','0','%s spikes  pursuing $n!'),
('34564','0','-1713559','%s вылезает на поверхность!','3','0','0','%S getting out of the ground!'),
('34564','16241','-1713560','Стая поглотит вас!','6','0','0','The swarm shall overtake you!'),
('34564','0','-1713561','%s выпускает рой жуков-трупоедов, чтобы восстановить здоровье!','3','0','0','%S produces a swarm of beetles Peon to restore your health!'),
('34564','16236','-1713562','Ф-лаккх шир!','6','0','0','F-lakkh shir!'),
('34564','16237','-1713563','Еще одна душа накормит хозяина.','6','0','0','Another soul to sate the host.'),
('34564','16238','-1713564','Я подвел тебя, господин...','6','0','0','I have failed you, master...'),
('36095','0','-1713565','Чемпионы, вы прошли испытание великого крестоносца! Знайте, что только самые сильные искатели приключений могли рассчитывать завершить это испытание.','6','0','0','Champions, you are alive! Not only have you defeated every challenge of the Trial of the Crusader, but thwarted Arthas directly! Your skill and cunning will prove to be a powerful weapon against the Scourge. Well done! Allow one of my mages to transport you back to the surface!'),
('36095','0','-1713566','Позвольте вручить вам эти сундуки в качестве заслуженной награды, и пусть его содержимое послужит вам верой и правдой в походе против Артаса в самом центре Цитадели Ледяной Короны!','6','0','0','Let me hand you the chests as a reward, and let its contents will serve you faithfully in the campaign against Arthas in the heart of the Icecrown Citadel!');

-- 724_trial_of_crusader_spelltable_scriptdev2.sql
	-- Trial of the crusader spelltable
DELETE FROM `boss_spell_table` WHERE `entry` IN 
(34496,34497,34564,34605,34607,34780,34784,34796,34797,34799, 34800, 34813, 34815, 34826, 35144, 35176, 34606, 34660);

	-- Eydis Darkbane
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34496, 64238, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34496, 65768, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34496, 65874, 0, 0, 0, 15000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34496, 65876, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34496, 65879, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34496, 65916, 0, 0, 0, 15000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34496, 66058, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34496, 66069, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(34496, 67282, 0, 0, 0, 8000, 0, 6000, 0, 12000, 0, 8000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(34496, 34628, 45000, 45000, 1, 1, 2, 2, 10, 100, 0, 11);

	-- Fjola Lightbane
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34497, 64238, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34497, 65766, 67270, 67271, 67272, 30000, 30000, 30000, 30000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34497, 65858, 0, 0, 0, 15000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34497, 65875, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34497, 65879, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34497, 65916, 0, 0, 0, 15000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34497, 66046, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34497, 66075, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(34497, 67297, 0, 0, 0, 8000, 0, 6000, 0, 0, 12000, 0, 8000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL);
	-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(34497, 34630, 45000, 45000, 1, 1, 2, 2, 10, 100, 0, 11);

	-- AnubArak
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34564, 26662, 26662, 26662, 26662, 600000, 600000, 600000, 600000, 600000, 600000, 600000, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34564, 34605, 0, 0, 0, 90000, 0, 0, 0, 90000, 0, 0, 0, 0, 0, 0, 0, 20.0, 100.0, 0, 0, 0, 0, 9, 1, 0, 0, NULL),
(34564, 34660, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 0, 5.0, 10.0, 0, 0, 0, 0, 9, 1, 0, 0, NULL),
(34564, 34606, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 10.0, 100.0, 0, 0, 0, 0, 9, 1, 0, 0, NULL),
(34564, 34607, 0, 0, 0, 70000, 0, 0, 0, 90000, 0, 0, 0, 0, 0, 0, 0, 20.0, 100.0, 0, 0, 0, 0, 9, 1, 0, 0, NULL),
(34564, 53421, 53421, 53421, 53421, 45000, 45000, 45000, 45000, 60000, 60000, 60000, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, NULL),
(34564, 66169, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34564, 66012, 66012, 66012, 66012, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34564, 66013, 67700, 68509, 68510, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34564, 66339, 66339, 66339, 66339, 5000, 5000, 5000, 5000, 10000, 10000, 10000, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, NULL),
(34564, 67574, 0, 0, 0, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 1, 0, NULL),
(34564, 66118, 67630, 68646, 68647, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34564, 66240, 0, 0, 0, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34564, 66125, 0, 0, 0, 10000, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34564, 67730, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL);

	-- Anub'arak scarab
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34605, 66092, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34605, 67861, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL);

	-- Cold sphere
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34606, 66193, 67855, 67856, 67857, 5000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL);

	-- Anub'arak spike
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34660, 67574, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(34660, 66193, 67855, 67856, 67857, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34660, 65920, 65921, 65922, 65923, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

	-- Nerubian Borrower
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34607, 66129, 66129, 66129, 66129, 10000, 10000, 10000, 10000, 20000, 20000, 20000, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(34607, 67322, 67322, 67322, 67322, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, NULL),
(34607, 67847, 67847, 67847, 67847, 5000, 5000, 5000, 5000, 20000, 20000, 20000, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL);

	-- Jaraxxus
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34780, 26662, 26662, 26662, 26662, 600000, 600000, 600000, 600000, 600000, 600000, 600000, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34780, 66197, 68123, 68124, 68125, 30000, 30000, 30000, 30000, 45000, 45000, 45000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34780, 66237, 67049, 67050, 67051, 40000, 40000, 40000, 40000, 90000, 90000, 40000, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(34780, 66242, 67060, 67060, 67060, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34780, 66264, 66264, 68405, 68405, 60000, 60000, 60000, 60000, 60000, 60000, 60000, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 1, 0, NULL),
(34780, 66528, 66528, 67029, 67029, 15000, 15000, 15000, 15000, 25000, 25000, 25000, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34780, 66532, 66963, 66964, 66965, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34780, 67108, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34780, 66255, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34780, 34825, 0, 0, 0, 60000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 0, 20.0, 80.0, 0, 0, 0, 0, 10, 0, 0, 0, NULL),
(34780, 34813, 0, 0, 0, 60000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 0, 20.0, 60.0, 0, 0, 0, 0, 10, 0, 0, 0, NULL);

	-- NPC Legion flame
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34784, 66199, 68127, 68126, 68128, 30000, 30000, 30000, 30000, 45000, 45000, 45000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL);

	-- Gormok
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34796, 34800, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 20.0, 80.0, 0, 0, 0, 0, 9, 0, 0, 0, NULL),
(34796, 66331, 67477, 67478, 67479, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34796, 66636, 0, 0, 0, 15000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 1, 0, NULL),
(34796, 67648, 0, 0, 0, 15000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

	-- Icehowl
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34797, 66683, 67660, 67661, 67662, 30000, 30000, 30000, 30000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34797, 66689, 67650, 67651, 67652, 25000, 25000, 25000, 25000, 40000, 40000, 40000, 40000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34797, 66734, 0, 0, 0, 4000, 4000, 3000, 3000, 4000, 4000, 3000, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(34797, 66770, 67654, 67655, 67656, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(34797, 66758, 0, 0, 0, 15000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34797, 68667, 0, 0, 0, 8000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 0, 200.0, 0, 0, 0, 0, 0, 12, 0, 1, 0, NULL),
(34797, 66759, 0, 0, 0, 300000, 0, 0, 0, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34797, 67345, 67663, 67664, 67665, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL);

	-- Dreadscale
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34799, 53421, 0, 0, 0, 40000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34799, 66794, 67644, 67645, 67646, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34799, 66796, 67632, 67633, 67634, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34799, 66821, 66821, 66821, 66821, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34799, 66879, 67624, 67625, 67626, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34799, 66902, 67627, 67628, 67629, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(34799, 66883, 67641, 67642, 67643, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(34799, 35176, 0, 0, 0, 30000, 30000, 45000, 60000, 30000, 30000, 45000, 60000, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 11, 0, 0, 0, NULL),
(34799, 68335, 68335, 68335, 68335, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

	-- Snobold vassal
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34800, 66313, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(34800, 66317, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(34800, 66318, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(34800, 66406, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, NULL),
(34800, 66407, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(34800, 66408, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(34800, 66636, 0, 0, 0, 15000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 1, 0, NULL);

	-- Infernal volcano
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34813, 66255, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(34813, 66258, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, NULL);

	-- Fel infernal
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34815, 66494, 66494, 66494, 66494, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34815, 67047, 67047, 67047, 67047, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

	-- Mistress of pain
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(34826, 66316, 66316, 66316, 66316, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(34826, 67098, 67098, 67098, 67098, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL);

	-- Acidmaw
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(35144, 53421, 0, 0, 0, 40000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, NULL),
(35144, 66794, 67644, 67645, 67646, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(35144, 66819, 66819, 66819, 66819, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(35144, 66824, 67612, 67613, 67614, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(35144, 66880, 67606, 67607, 67608, 15000, 15000, 15000, 15000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(35144, 66901, 0, 0, 0, 15000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(35144, 66883, 67641, 67642, 67643, 20000, 20000, 20000, 20000, 30000, 30000, 30000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL),
(35144, 35176, 0, 0, 0, 30000, 30000, 45000, 60000, 30000, 30000, 45000, 60000, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 11, 0, 0, 0, NULL),
(35144, 68335, 68335, 68335, 68335, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

	-- Slime pool
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(35176, 63084, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, NULL),
(35176, 66882, 0, 0, 0, 500, 0, 0, 0, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

	-- Retro Paladins
DELETE FROM `boss_spell_table` WHERE `entry` IN (34471,34456);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34471, 66011, 0, 180000, 180000, 3),
(34471, 66003, 0, 6000, 18000, 3),
(34471, 66010, 0, 0, 3600001, 1),
(34471, 66006, 0, 10000, 10000, 3),
(34471, 66007, 0, 40000, 40000, 3),
(34471, 66009, 0, 300000, 300000, 1),
(34471, 66005, 68018, 8000, 15000, 3),
(34471, 66008, 0, 60000, 60000, 4),
(34471, 66004, 68021, 10000, 15000, 1);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34456, 66011, 0, 180000, 180000, 3),
(34456, 66003, 0, 6000, 18000, 3),
(34456, 66010, 0, 0, 3600001, 1),
(34456, 66006, 0, 10000, 10000, 3),
(34456, 66007, 0, 40000, 40000, 3),
(34456, 66009, 0, 300000, 300000, 1),
(34456, 66005, 68018, 8000, 15000, 3),
(34456, 66008, 0, 60000, 60000, 4),
(34456, 66004, 68021, 10000, 15000, 1);

	-- Pet's
DELETE FROM `boss_spell_table` WHERE `entry` IN (35465,35610);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(35465, 67518, 0, 15000, 30000, 3),
(35465, 67519, 0, 15000, 30000, 3);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(35610, 67793, 67980, 67981, 67982, 5000, 10000, 3);

	-- Druids
DELETE FROM `boss_spell_table` WHERE `entry` IN (34460,34451);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34460, 66093, 67957, 5000, 15000, 14),
(34460, 66066, 67965, 10000, 20000, 14),
(34460, 66067, 67968, 10000, 20000, 14),
(34460, 66065, 67971, 10000, 20000, 14),
(34460, 66086, 67974, 40000, 90000, 1),
(34460, 65860, 0, 45000, 90000, 1),
(34460, 66068, 0, 15000, 30000, 6),
(34460, 66071, 0, 40000, 80000, 1);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34451, 66093, 67957, 10000, 20000, 14),
(34451, 66066, 67965, 10000, 20000, 14),
(34451, 66067, 67968, 10000, 20000, 14),
(34451, 66065, 67971, 10000, 20000, 14),
(34451, 66086, 67974, 40000, 90000, 1),
(34451, 65860, 0, 45000, 90000, 1),
(34451, 66068, 0, 15000, 30000, 6),
(34451, 66071, 0, 40000, 80000, 1);

	-- Warriors
DELETE FROM `boss_spell_table` WHERE `entry` IN (34475,34453);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34475, 65947, 0, 20000, 30000, 1),
(34475, 65930, 0, 10000, 60000, 3),
(34475, 65926, 0, 6000, 25000, 3),
(34475, 68764, 0, 3000, 25000, 3),
(34475, 65935, 0, 20000, 80000, 3),
(34475, 65924, 0, 30000, 90000, 1),
(34475, 65936, 0, 5000, 25000, 3),
(34475, 65940, 0, 10000, 25000, 3),
(34475, 65932, 0, 30000, 60000, 1);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34453, 65947, 0, 20000, 30000, 1),
(34453, 65930, 0, 10000, 60000, 3),
(34453, 65926, 0, 6000, 25000, 3),
(34453, 68764, 0, 3000, 25000, 3),
(34453, 65935, 0, 20000, 80000, 3),
(34453, 65924, 0, 30000, 90000, 1),
(34453, 65936, 0, 5000, 25000, 3),
(34453, 65940, 0, 10000, 25000, 3),
(34453, 65932, 0, 30000, 60000, 1);

	-- Mage
DELETE FROM `boss_spell_table` WHERE `entry` IN (34468,34449);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34468, 65799, 67995, 3000, 10000, 3),
(34468, 65791, 67998, 5000, 15000, 3),
(34468, 65800, 68001, 5000, 15000, 3),
(34468, 65793, 0, 7000, 25000, 1),
(34468, 65807, 68004, 5000, 15000, 4),
(34468, 65790, 0, 5000, 15000, 6),
(34468, 65792, 0, 7000, 15000, 1),
(34468, 65802, 0, 0, 3600001, 1),
(34468, 65801, 0, 15000, 40000, 4);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34449, 65799, 67995, 3000, 10000, 3),
(34449, 65791, 67998, 5000, 15000, 3),
(34449, 65800, 68001, 5000, 15000, 3),
(34449, 65793, 0, 7000, 25000, 1),
(34449, 65807, 68004, 5000, 15000, 4),
(34449, 65790, 0, 5000, 15000, 6),
(34449, 65792, 0, 7000, 15000, 1),
(34449, 65802, 0, 0, 3600001, 1),
(34449, 65801, 0, 15000, 40000, 4);

	-- Shaman
DELETE FROM `boss_spell_table` WHERE `entry` IN (34463,34455);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34463, 66055, 68115, 5000, 15000, 14),
(34463, 66053, 68118, 5000, 15000, 14),
(34463, 66056, 0, 5000, 15000, 14),
(34463, 65983, 0, 30000, 60000, 1),
(34463, 65980, 0, 5000, 15000, 6),
(34463, 66054, 0, 10000, 40000, 4),
(34463, 66063, 0, 5000, 15000, 14),
(34463, 65973, 68100, 5000, 15000, 4);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34455, 66055, 68115, 5000, 15000, 14),
(34455, 66053, 68118, 5000, 15000, 14),
(34455, 66056, 0, 5000, 15000, 14),
(34455, 65983, 0, 30000, 60000, 1),
(34455, 65980, 0, 5000, 15000, 6),
(34455, 66054, 0, 10000, 40000, 4),
(34455, 66063, 0, 5000, 15000, 14),
(34455, 65973, 68100, 5000, 15000, 4);

	-- Enh shaman
DELETE FROM `boss_spell_table` WHERE `entry` IN (34470,34444);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34470, 65973, 0, 5000, 8000, 4),
(34470, 65974, 0, 5000, 8000, 3),
(34470, 65983, 0, 25000, 600000, 1),
(34470, 65970, 0, 5000, 90000, 3);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34444, 65973, 0, 5000, 8000, 4),
(34444, 65974, 0, 5000, 8000, 3),
(34444, 65983, 0, 25000, 600000, 1),
(34444, 65970, 0, 5000, 90000, 3);

	-- Hunter
DELETE FROM `boss_spell_table` WHERE `entry` IN (34467,34448);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34467, 65583, 67978, 3000, 8000, 3),
(34467, 65871, 0, 20000, 120000, 1),
(34467, 65869, 0, 12000, 20000, 1),
(34467, 65866, 67984, 3000, 8000, 3),
(34467, 65880, 0, 12000, 30000, 1),
(34467, 65868, 67989, 4000, 8000, 3),
(34467, 65867, 0, 4000, 8000, 3),
(34467, 66207, 0, 4000, 8000, 3),
(34467, 65877, 0, 7000, 60000, 4);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34448, 65583, 67978, 3000, 8000, 3),
(34448, 65871, 0, 20000, 120000, 1),
(34448, 65869, 0, 12000, 20000, 1),
(34448, 65866, 67984, 3000, 8000, 3),
(34448, 65880, 0, 12000, 30000, 1),
(34448, 65868, 67989, 4000, 8000, 3),
(34448, 65867, 0, 4000, 8000, 3),
(34448, 66207, 0, 4000, 8000, 3),
(34448, 65877, 0, 7000, 60000, 4);

	-- Rogue
DELETE FROM `boss_spell_table` WHERE `entry` IN (34472,34454);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34472, 65955, 0, 8000, 10000, 3),
(34472, 65956, 0, 12000, 120000, 1),
(34472, 65960, 0, 7000, 8000, 6),
(34472, 65961, 0, 20000, 120000, 1),
(34472, 66178, 0, 10000, 8000, 3),
(34472, 65954, 0, 5000, 8000, 3),
(34472, 65957, 68095, 15000, 20000, 3);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34454, 65955, 0, 8000, 10000, 3),
(34454, 65956, 0, 12000, 120000, 1),
(34454, 65960, 0, 7000, 8000, 6),
(34454, 65961, 0, 20000, 120000, 1),
(34454, 66178, 0, 10000, 8000, 3),
(34454, 65954, 0, 5000, 8000, 3),
(34454, 65957, 68095, 15000, 20000, 3);

	-- Priest
DELETE FROM `boss_spell_table` WHERE `entry` IN (34466,34447);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34466, 66177, 68035, 3000, 8000, 14),
(34466, 66099, 68032, 3000, 8000, 14),
(34466, 66104, 68023, 3000, 8000, 14),
(34466, 66100, 68026, 3000, 8000, 4),
(34466, 65546, 0, 3000, 8000, 6),
(34466, 65543, 0, 5000, 25000, 1);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34447, 66177, 68035, 3000, 8000, 14),
(34447, 66099, 68032, 3000, 8000, 14),
(34447, 66104, 68023, 3000, 8000, 14),
(34447, 66100, 68026, 3000, 8000, 4),
(34447, 65546, 0, 3000, 8000, 6),
(34447, 65543, 0, 5000, 25000, 1);

	-- Shadow priest
DELETE FROM `boss_spell_table` WHERE `entry` IN (34473,34441);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34473, 65542, 0, 8000, 15000, 6),
(34473, 65490, 68091, 3000, 8000, 4),
(34473, 65541, 68088, 3000, 8000, 4),
(34473, 65488, 68042, 3000, 8000, 3),
(34473, 65492, 68038, 3000, 8000, 3),
(34473, 65545, 0, 3000, 8000, 3),
(34473, 65544, 0, 1000, 180000, 1),
(34473, 65546, 0, 3000, 8000, 4),
(34473, 65543, 0, 8000, 24000, 1),
(34473, 16592, 0, 3000, 8000, 1);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34441, 65542, 0, 8000, 15000, 6),
(34441, 65490, 68091, 3000, 8000, 4),
(34441, 65541, 68088, 3000, 8000, 4),
(34441, 65488, 68042, 3000, 8000, 3),
(34441, 65492, 68038, 3000, 8000, 3),
(34441, 65545, 0, 3000, 8000, 3),
(34441, 65544, 0, 1000, 180000, 1),
(34441, 65546, 0, 3000, 8000, 4),
(34441, 65543, 0, 8000, 24000, 1),
(34441, 16592, 0, 3000, 8000, 1);

	-- Death knight
DELETE FROM `boss_spell_table` WHERE `entry` IN (34461,34458);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34461, 66020, 0, 5000, 15000, 3),
(34461, 66019, 67930, 5000, 15000, 3),
(34461, 66017, 0, 5000, 15000, 3),
(34461, 66047, 67936, 5000, 15000, 3),
(34461, 66023, 0, 5000, 90000, 1),
(34461, 66021, 67939, 8000, 12000, 3),
(34461, 66018, 0, 10000, 90000, 6);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34458, 66020, 0, 5000, 15000, 3),
(34458, 66019, 67930, 5000, 15000, 3),
(34458, 66017, 0, 5000, 15000, 3),
(34458, 66047, 67936, 5000, 15000, 3),
(34458, 66023, 0, 5000, 90000, 1),
(34458, 66021, 67939, 8000, 12000, 3),
(34458, 66018, 0, 10000, 90000, 6);

	-- Paladin
DELETE FROM `boss_spell_table` WHERE `entry` IN (34465,34445);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34465, 68757, 0, 25000, 40000, 6),
(34465, 66010, 0, 0, 3600001, 14),
(34465, 66116, 0, 5000, 15000, 14),
(34465, 66113, 68008, 5000, 10000, 14),
(34465, 66112, 68011, 5000, 15000, 14),
(34465, 66009, 0, 0, 3600001, 6),
(34465, 66114, 68015, 6000, 15000, 14),
(34465, 66613, 0, 5000, 15000, 4);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34445, 68757, 0, 25000, 40000, 6),
(34445, 66010, 0, 0, 3600001, 14),
(34445, 66116, 0, 5000, 15000, 14),
(34445, 66113, 68008, 5000, 10000, 14),
(34445, 66112, 68011, 5000, 15000, 14),
(34445, 66009, 0, 0, 3600001, 6),
(34445, 66114, 68015, 6000, 15000, 14),
(34445, 66613, 0, 5000, 15000, 4);

	-- Boomkin (druid in moonkin form)
DELETE FROM `boss_spell_table` WHERE `entry` IN (34469,34459);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34469, 65859, 0, 5000, 40000, 4),
(34469, 65857, 0, 5000, 40000, 3),
(34469, 65863, 0, 10000, 40000, 4),
(34469, 65861, 0, 25000, 40000, 3),
(34469, 65855, 67942, 25000, 40000, 4),
(34469, 65856, 67945, 5000, 40000, 3),
(34469, 65854, 67948, 25000, 40000, 3),
(34469, 65860, 0, 5000, 120000, 1),
(34469, 65862, 67952, 25000, 40000, 3);

	-- Warlock
DELETE FROM `boss_spell_table` WHERE `entry` IN (34474,34450);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34474, 65816, 68146, 15000, 30000, 1),
(34474, 65810, 68134, 15000, 30000, 4),
(34474, 65814, 68137, 15000, 30000, 4),
(34474, 65815, 0, 15000, 30000, 4),
(34474, 65809, 0, 4000, 15000, 4),
(34474, 65819, 68149, 15000, 30000, 3),
(34474, 65821, 68152, 3000, 10000, 3),
(34474, 65812, 68155, 2000, 10000, 4);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_H10`, `timerMin_N10`, `timerMax_N10`, `CastType`) VALUES
(34450, 65816, 68146, 15000, 30000, 1),
(34450, 65810, 68134, 15000, 30000, 4),
(34450, 65814, 68137, 15000, 30000, 4),
(34450, 65815, 0, 15000, 30000, 4),
(34450, 65809, 0, 4000, 15000, 4),
(34450, 65819, 68149, 15000, 30000, 3),
(34450, 65821, 68152, 3000, 10000, 3),
(34450, 65812, 68155, 2000, 10000, 4);

-- 727_fishing_extravaganza_scriptdev2.sql
	-- add ai text for riggle
DELETE FROM `script_texts` WHERE `entry` IN (-1510356,-1510357,-1510358);
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1510356, 'Let the Fishing Tournament BEGIN!', 0, 6, 0, 0, 'riggle SAY_START'),
(-1510357, 'We have a winner! $N is the Master Angler!', 0, 6, 0, 0, 'riggle SAY_WINNER'),
(-1510358, 'And the Tastyfish have gone for the week! I will remain for another hour to allow you to turn in your fish!', 0, 6, 0, 0, 'riggle SAY_END');

-- 728_ruby_sanctum_scriptdev2.sql
	-- sound / text
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1666404 AND -1666000;

	-- xerestrasza
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1666000','Help! I am trapped within this tree! I require aid!','Спасите! Я под этим деревом. Мне нужна помощь!','17490','1','0','0','SAY_XERESTRASZA_YELL_1'),
('-1666001','Thank you! I could have not held out for much longer. A terrible thing has happened here.','','17491','1','0','0','SAY_XERESTRASZA_YELL_2'),
('-1666002','We believed that the Sanctum was well fortified, but we were not prepareted for the nature of this assault.','','17492','0','0','0','SAY_XERESTRASZA_SAY_1'),
('-1666003','The Black Dragonkin materialized from thin air, and set upon us before we could react.','','17493','0','0','0','SAY_XERESTRASZA_SAY_2'),
('-1666004','We did not stand a chance. As my brethren perished around me, I managed to retreat hear and bar the entrance.','','17494','0','0','0','SAY_XERESTRASZA_SAY_3'),
('-1666005','They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the sanctum.','','17495','0','0','0','SAY_XERESTRASZA_SAY_4'),
('-1666006','The commander of the forces on the ground here is a cruel brute named Zarithrian. But I fear there are greater powers at work.','','17496','0','0','0','SAY_XERESTRASZA_SAY_5'),
('-1666007','In their initial assault I caught a glimpse of their true leader, a fearsome full-grown Twilight Dragon.','','17497','0','0','0','SAY_XERESTRASZA_SAY_6'),
('-1666008','I know not the extent of their plans heroes, but I know this: they cannot be allowed to succeed!','','17498','0','0','0','SAY_XERESTRASZA_SAY_7'),

	-- Halion
('-1666100','Meddlesome insects, you\'re too late! The Ruby Sanctum is lost.','','17499','1','0','0','SAY_HALION_SPAWN'),
('-1666101','Your world teeters on the brink of annihilation. You will all bear witness to the coming of a new age of destruction!','','17500','1','0','0','SAY_HALION_AGGRO'),
('-1666102','Another hero falls.','','17501','1','0','0','SAY_HALION_SLAY_1'),
('-1666103','Ha Ha Ha!','','17502','1','0','0','SAY_HALION_SLAY_2'),
('-1666104','Relish this victory mortals, for it will be your last. This world will burn with the Master\'s return!','','17503','1','0','0','SAY_HALION_DEATH'),
('-1666105','Not good enough!','','17504','1','0','0','SAY_HALION_BERSERK'),
('-1666106','The heavens burn!','Небеса в огне!','17505','1','0','0','SAY_HALION_SPECIAL_1'),
('-1666107','Beware the shadow!','','17506','1','0','0','SAY_HALION_SPECIAL_2'),
('-1666108','You will find only suffering within the realm of Twilight. Enter if you dare.','','17507','1','0','0','SAY_HALION_PHASE_2'),
('-1666109','I am the light AND the darkness! Cower mortals before the Herald of Deathwing!','','17508','1','0','0','SAY_HALION_PHASE_3'),

	-- Zarthrian
('-1666200','Alexstrasza has chosen capable allies. A pity that I must end you!','','17512','1','0','0','SAY_ZARITHRIAN_AGGRO'),
('-1666201','You thought you stood a chance?','','17513','1','0','0','SAY_ZARITHRIAN_SLAY_1'),
('-1666202','It\'s for the best.','','17514','1','0','0','SAY_ZARITHRIAN_SLAY_2'),
('-1666203','Halion! I\'m...aah!','','17515','1','0','0','SAY_ZARITHRIAN_DEATH'),
('-1666204','Turn them to ash, minions!','','17516','1','0','0','SAY_ZARITHRIAN_SPECIAL_1'),

	-- baltharus
('-1666300','Ah, the entertainment has arrived...','','17520','1','0','0','SAY_BALTHARUS_AGGRO'),
('-1666301','Baltharus leaves no survivors!','','17521','1','0','0','SAY_BALTHARUS_SLAY_1'),
('-1666302','This world has enough heroes!','','17522','1','0','0','SAY_BALTHARUS_SLAY_2'),
('-1666303','I...didn\'t see that coming...','','17523','1','0','0','SAY_BALTHARUS_DEATH'),
('-1666304','Twice the pain and half the fun!','','17524','1','0','0','SAY_BALTHARUS_SPECIAL_1'),
('-1666305','Your power wanes, ancient one! Soon, you will join your friends!','','17525','1','0','0','SAY_BALTHARUS_YELL'),

	-- saviana
('-1666400','You will suffer for this intrusion...','','17528','1','0','0','SAY_SAVIANA_AGGRO'),
('-1666401','As it should be!','','17529','1','0','0','SAY_SAVIANA_SLAY_1'),
('-1666402','Halion will be pleased...','','17530','1','0','0','SAY_SAVIANA_SLAY_2'),
('-1666403','<screaming>','','17531','1','0','0','SAY_SAVIANA_DEATH'),
('-1666404','Burn in the master\'s flame!','','17532','1','0','0','SAY_SAVIANA_SPECIAL_1');

-- 728_ruby_sanctum_spelltable_scriptdev2.sql
	-- Ruby sanctum spelltable

	-- Boss Halion
DELETE FROM `boss_spell_table` WHERE `entry` = 39863;

	-- Boss Baltharus
DELETE FROM `boss_spell_table` WHERE `entry` = 39751;

	-- Boss Zarithian
DELETE FROM `boss_spell_table` WHERE `entry` = 39746;

	-- Boss Ragefire
DELETE FROM `boss_spell_table` WHERE `entry` = 39747;


####
# addition/wk_updates (author: selector)
####

-- alteracSD2.sql
/* ALTERAC VALLEY */
delete from custom_texts where comment in (11946,11948,11949,11947);

	-- Drek'thar
INSERT INTO `custom_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
(-2100000, 'Stormpike filth! In my keep?! Slay them all!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11946'),
(-2100001, 'You seek to draw the General of the Frostwolf legion out from his fortress? PREPOSTEROUS!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11946'),
(-2100002, 'Stormpike weaklings, face me in my fortress - if you dare!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11946'),
(-2100003, 'Your attacks are slowed by the cold, I think!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11946'),
(-2100004, 'Today, you will meet your ancestors!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11946'),
(-2100005, 'If you will not leave Alterac Valley on your own, then the Frostwolves will force you out!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11946'),
(-2100006, 'You cannot defeat the Frostwolf clan!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11946'),
(-2100007, 'You are no match for the strength of the Horde!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11946');

	-- Vanndar
INSERT INTO `custom_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
(-2100008, 'Soldiers of Stormpike, your General is under attack! I require aid! Come! Come! Slay these mangy Frostwolf dogs.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100009, 'You''ll never get me out of me bunker, heathens!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100010, 'Why don''t ya try again without yer cheap tactics, pansies! Or are you too chicken?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100011, 'Your attacks are weak! Go practice on some rabbits and come back when you''re stronger.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100012, 'I will tell you this much...Alterac Valley will be ours.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100013, 'We will not be swayed from our mission!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100014, 'It''ll take more than you rabble to bring me down!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100015, 'We, the Alliance, will prevail!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100016, 'The Stormpike clan bows to no one, especially the horde!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100017, 'Is that the best you can do?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948'),
(-2100018, 'Take no prisoners! Drive these heathens from our lands!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11948');

	-- Balinda
INSERT INTO `custom_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
(-2100019, 'Begone, uncouth scum! The Alliance will prevail in Alterac Valley!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11949'),
(-2100020, 'Filthy Frostwolf cowards! If you want a fight, you''ll have to come to me!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11949');

	-- Galvangar
INSERT INTO `custom_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
(-2100021, 'Die! Your kind has no place in Alterac Valley!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11947'),
(-2100022, 'I''ll never fall for that, fool! If you want a battle it will be on my terms and in my lair!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '11947');


####
# Custom (author: Janu)
####

-- [S14] Ebon_Hold_SD2.sql
-- -1 609 000 EBON HOLD
DELETE FROM script_texts WHERE entry BETWEEN -1609127 AND -1609101;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- How To Win Friends And Influence Enemies
   (-1609101, 'I\'ll tear the secrets from your soul! Tell me about the "Crimson Dawn" and your life may be spared!',0,0,0,0,'player SAY_PERSUADE1'),
   (-1609102, 'Tell me what you know about "Crimson Dawn" or the beatings will continue!',0,0,0,0,'player SAY_PERSUADE2'),
   (-1609103, 'I\'m through being courteous with your kind, human! What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE3'),
   (-1609104, 'Is your life worth so little? Just tell me what I need to know about "Crimson Dawn" and I\'ll end your suffering quickly.',0,0,0,0,'player SAY_PERSUADE4'),
   (-1609105, 'I can keep this up for a very long time, Scarlet dog! Tell me about the "Crimson Dawn!"',0,0,0,0,'player SAY_PERSUADE5'),
   (-1609106, 'What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE6'),
   (-1609107, '"Crimson Dawn!" What is it! Speak!',0,0,0,0,'player SAY_PERSUADE7'),
   (-1609108, 'You\'ll be hanging in the gallows shortly, Scourge fiend!',0,0,0,0,'crusader SAY_CRUSADER1'),
   (-1609109, 'You\'ll have to kill me, monster! I will tell you NOTHING!',0,0,0,0,'crusader SAY_CRUSADER2'),
   (-1609110, 'You hit like a girl. Honestly. Is that the best you can do?',0,0,0,0,'crusader SAY_CRUSADER3'),
   (-1609111, 'ARGH! You burned my last good tabard!',0,0,0,0,'crusader SAY_CRUSADER4'),
   (-1609112, 'Argh... The pain... The pain is almost as unbearable as the lashings I received in grammar school when I was but a child.',0,0,0,0,'crusader SAY_CRUSADER5'),
   (-1609113, 'I used to work for Grand Inquisitor Isillien! Your idea of pain is a normal mid-afternoon for me!',0,0,0,0,'crusader SAY_CRUSADER6'),
   (-1609114, 'I\'ll tell you everything! STOP! PLEASE!',0,0,0,20,'break crusader SAY_PERSUADED1'),
   (-1609115, 'We... We have only been told that the "Crimson Dawn" is an awakening. You see, the Light speaks to the High General. It is the Light...',0,0,0,20,'break crusader SAY_PERSUADED2'),
   (-1609116, 'The Light that guides us. The movement was set in motion before you came... We... We do as we are told. It is what must be done.',0,0,0,20,'break crusader SAY_PERSUADED3'),
   (-1609117, 'I know very little else... The High General chooses who may go and who must stay behind. There\'s nothing else... You must believe me!',0,0,0,20,'break crusader SAY_PERSUADED4'),
   (-1609118, 'LIES! The pain you are about to endure will be talked about for years to come!',0,0,0,0,'break crusader SAY_PERSUADED5'),
   (-1609119, 'NO! PLEASE! There is one more thing that I forgot to mention... A courier comes soon... From Hearthglen. It...',0,0,0,20,'break crusader SAY_PERSUADED6'),
-- Ambush At The Overlook
   (-1609120, 'Hrm, what a strange tree. I must investigate.',0,0,0,0,'Scarlet Courier SAY_TREE1'),
   (-1609121, 'What''s this!? This isn''t a tree at all! Guards! Guards!',0,0,0,0,'Scarlet Courier SAY_TREE2'),
-- Bloody Breakout
   (-1609122, 'The Crusade will purge your kind from this world!',0,1,0,0,'High Inquisitor Valroth start'),
   (-1609123, 'It seems that I\'ll need to deal with you myself. The High Inquisitor comes for you, Scourge!',0,1,0,0,'High Inquisitor Valroth aggro'),
   (-1609124, 'You have come seeking deliverance? I have come to deliver!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609125, 'LIGHT PURGE YOU!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609126, 'Coward!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609127, 'High Inquisitor Valroth\'s remains fall to the ground.',0,2,0,0,'High Inquisitor Valroth death');

DELETE FROM script_texts WHERE entry BETWEEN -1609286 AND -1609201;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
	-- The Light of Dawn
	-- pre text
   (-1609201, 'Soldiers of the Scourge, stand ready! You will soon be able to unleash your fury upon the Argent Dawn!',14677,1,0,0,'Highlord Darion Mograine'),
   (-1609202, 'The sky weeps at the devastation of sister earth! Soon, tears of blood will rain down upon us!',14678,1,0,0,'Highlord Darion Mograine'),
   (-1609203, 'Death knights of Acherus, the death march begins!',14681,1,0,0,'Highlord Darion Mograine'),
	-- intro
   (-1609204, 'Soldiers of the Scourge, death knights of Acherus, minions of the darkness: hear the call of the Highlord!',14679,1,0,22,'Highlord Darion Mograine'),
   (-1609205, 'RISE!',14680,1,0,15,'Highlord Darion Mograine'),
   (-1609206, 'The skies turn red with the blood of the fallen! The Lich King watches over us, minions! Onward! Leave only ashes and misery in your destructive wake!',14682,1,0,25,'Highlord Darion Mograine'),
	-- During the fight
   (-1609207, 'Scourge armies approach!',0,1,0,0,'Korfax, Champion of the Light'),
   (-1609208, 'Stand fast, brothers and sisters! The Light will prevail!',14487,1,0,0,'Lord Maxwell Tyrosus'),
   (-1609209, 'Kneel before the Highlord!',14683,0,0,0,'Highlord Darion Mograine'),
   (-1609210, 'You stand no chance!',14684,0,0,0,'Highlord Darion Mograine'),
   (-1609211, 'The Scourge will destroy this place!',14685,0,0,0,'Highlord Darion Mograine'),
   (-1609212, 'Your life is forfeit.',14686,0,0,0,'Highlord Darion Mograine'),
   (-1609213, 'Life is meaningless without suffering.',14687,0,0,0,'Highlord Darion Mograine'),
   (-1609214, 'How much longer will your forces hold out?',14688,0,0,0,'Highlord Darion Mograine'),
   (-1609215, 'The Argent Dawn is finished!"',14689,0,0,0,'Highlord Darion Mograine'),
   (-1609216, 'Spare no one!',14690,0,0,0,'Highlord Darion Mograine'),
   (-1609217, 'What is this?! My... I cannot strike...',14691,0,0,0,'Highlord Darion Mograine'),
   (-1609218, 'Obey me, blade!',14692,1,0,0,'Highlord Darion Mograine'),
   (-1609219, 'You will do as I command! I am in control here!',14693,0,0,0,'Highlord Darion Mograine'),
   (-1609220, 'I can not... the blade fights me.',14694,0,0,0,'Highlord Darion Mograine'),
   (-1609221, 'What is happening to me?',14695,0,0,0,'Highlord Darion Mograine'),
   (-1609222, 'Power...wanes...',14696,0,0,0,'Highlord Darion Mograine'),
   (-1609223, 'Ashbringer defies me...',14697,0,0,0,'Highlord Darion Mograine'),
   (-1609224, 'Minions, come to my aid!',14698,0,0,0,'Highlord Darion Mograine'),
	-- After the fight
   (-1609225, 'You cannot win, Darion!',14584,1,0,0,'Highlord Tirion Fordring'),
   (-1609226, 'Bring them before the chapel!',14585,1,0,0,'Highlord Tirion Fordring'),
   (-1609227, 'Stand down, death knights. We have lost... The Light... This place... No hope...',14699,0,0,68,'Highlord Darion Mograine'),
   (-1609228, 'Have you learned nothing, boy? You have become all that your father fought against! Like that coward, Arthas, you allowed yourself to be consumed by the darkness...the hate... Feeding upon the misery of those you tortured and killed!',14586,0,0,378,'Highlord Tirion Fordring'),
   (-1609229, 'Your master knows what lies beneath the chapel. It is why he dares not show his face! He\'s sent you and your death knights to meet their doom, Darion.',14587,0,0,25,'Highlord Tirion Fordring'),
   (-1609230, 'What you are feeling right now is the anguish of a thousand lost souls! Souls that you and your master brought here! The Light will tear you apart, Darion!',14588,0,0,1,'Highlord Tirion Fordring'),
   (-1609231, 'Save your breath, old man. It might be the last you ever draw.',14700,0,0,25,'Highlord Darion Mograine'),
   (-1609232, 'My son! My dear, beautiful boy!',14493,0,0,0,'Highlord Alexandros Mograine'),
   (-1609233, 'Father!',14701,0,0,5,'Highlord Darion Mograine'),
   (-1609234, 'Argh...what...is...',14702,0,0,68,'Highlord Darion Mograine'),
   (-1609235, 'Father, you have returned!',14703,0,0,0,'Darion Mograine'),
   (-1609236, 'You have been gone a long time, father. I thought...',14704,0,0,0,'Darion Mograine'),
   (-1609237, 'Nothing could have kept me away from here, Darion. Not from my home and family.',14494,0,0,1,'Highlord Alexandros Mograine'),
   (-1609238, 'Father, I wish to join you in the war against the undead. I want to fight! I can sit idle no longer!',14705,0,0,6,'Darion Mograine'),
   (-1609239, 'Darion Mograine, you are barely of age to hold a sword, let alone battle the undead hordes of Lordaeron! I couldn\'t bear losing you. Even the thought...',14495,0,0,1,'Highlord Alexandros Mograine'),
   (-1609240, 'If I die, father, I would rather it be on my feet, standing in defiance against the undead legions! If I die, father, I die with you!',14706,0,0,6,'Darion Mograine'),
   (-1609241, 'My son, there will come a day when you will command the Ashbringer and, with it, mete justice across this land. I have no doubt that when that day finally comes, you will bring pride to our people and that Lordaeron will be a better place because of you. But, my son, that day is not today.',14496,0,0,1,'Highlord Alexandros Mograine'),
   (-1609242, 'Do not forget...',14497,0,0,6,'Highlord Alexandros Mograine'),
   (-1609243, 'Touching...',14803,1,0,0,'The Lich King'),
   (-1609244, 'You have\'ve betrayed me! You betrayed us all you monster! Face the might of Mograine!',14707,1,0,0,'Highlord Darion Mograine'),
   (-1609245, 'He\'s mine now...',14805,0,0,0,'The Lich King'),
   (-1609246, 'Pathetic...',14804,0,0,0,'The Lich King'),
   (-1609247, 'You\'re a damned monster, Arthas!',14589,0,0,25,'Highlord Tirion Fordring'),
   (-1609248, 'You were right, Fordring. I did send them in to die. Their lives are meaningless, but yours...',14806,0,0,1,'The Lich King'),
   (-1609249, 'How simple it was to draw the great Tirion Fordring out of hiding. You\'ve left yourself exposed, paladin. Nothing will save you...',14807,0,0,1,'The Lich King'),
   (-1609250, 'ATTACK!!!',14488,1,0,0,'Lord Maxwell Tyrosus'),
   (-1609251, 'APOCALYPSE!',14808,1,0,0,'The Lich King'),
   (-1609252, 'That day is not today...',14708,0,0,0,'Highlord Darion Mograine'),
   (-1609253, 'Tirion!',14709,1,0,0,'Highlord Darion Mograine'),
   (-1609254, 'ARTHAS!!!!',14591,1,0,0,'Highlord Tirion Fordring'),
   (-1609255, 'What is this?',14809,1,0,0,'The Lich King'),
   (-1609256, 'Your end.',14592,1,0,0,'Highlord Tirion Fordring'),
   (-1609257, 'Impossible...',14810,1,0,0,'The Lich King'),
   (-1609258, 'This... isn\'t... over...',14811,1,0,25,'The Lich King'),
   (-1609259, 'When next we meet it won\'t be on holy ground, paladin.',14812,1,0,1,'The Lich King'),
   (-1609260, 'Rise, Darion, and listen...',14593,0,0,0,'Highlord Tirion Fordring'),
   (-1609261, 'We have all been witness to a terrible tragedy. The blood of good men has been shed upon this soil! Honorable knights, slain defending their lives - our lives!',14594,0,0,0,'Highlord Tirion Fordring'),
   (-1609262, 'And while such things can never be forgotten, we must remain vigilant in our cause!',14595,0,0,0,'Highlord Tirion Fordring'),
   (-1609263, 'The Lich King must answer for what he has done and must not be allowed to cause further destruction to our world.',14596,0,0,0,'Highlord Tirion Fordring'),
   (-1609264, 'I make a promise to you now, brothers and sisters: The Lich King will be defeated! On this day, I call for a union.',14597,0,0,0,'Highlord Tirion Fordring'),
   (-1609265, 'The Argent Dawn and the Order of the Silver Hand will come together as one! We will succeed where so many before us have failed!',14598,0,0,0,'Highlord Tirion Fordring'),
   (-1609266, 'We will take the fight to Arthas and tear down the walls of Icecrown!',14599,0,0,15,'Highlord Tirion Fordring'),
   (-1609267, 'The Argent Crusade comes for you, Arthas!',14600,1,0,15,'Highlord Tirion Fordring'),
   (-1609268, 'So too do the Knights of the Ebon Blade... While our kind has no place in your world, we will fight to bring an end to the Lich King. This I vow!',14710,0,0,1,'Highlord Darion Mograine'),
	-- Emotes
   (-1609269, 'Thousands of Scourge rise up at the Highlord\'s command.',0,2,0,0,''),
   (-1609270, 'The army marches towards Light\'s Hope Chapel.',0,2,0,0,''),
   (-1609271, 'After over a hundred Defenders of the Light fall, Highlord Tirion Fordring arrives.',0,2,0,0,''),
   (-1609272, 'flee',0,2,0,0,'Orbaz'),
   (-1609273, 'kneels in defeat before Tirion Fordring.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609274, 'arrives.',0,2,0,0,'Highlord Alexandros Mograine'),
   (-1609275, 'becomes a shade of his past, and walks up to his father.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609276, 'hugs his father.',0,2,0,0,'Darion Mograine'),
   (-1609277, 'disappears, and the Lich King appears.',0,2,0,0,'Alexandros'),
   (-1609278, 'becomes himself again...and is now angry.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609279, 'casts a spell on Tirion.',0,2,0,0,'The Lich King'),
   (-1609280, 'gasps for air.',0,2,0,0,'Highlord Tirion Fordring'),
   (-1609281, 'casts a powerful spell, killing the Defenders and knocking back the others.',0,2,0,0,'The Lich King'),
   (-1609282, 'throws the Corrupted Ashbringer to Tirion, who catches it. Tirion becomes awash with Light, and the Ashbringer is cleansed.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609283, 'collapses.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609284, 'charges towards the Lich King, Ashbringer in hand and strikes the Lich King.',0,2,0,0,'Highlord Tirion Fordring'),
   (-1609285, 'disappears. Tirion walks over to where Darion lay',0,2,0,0,'The Lich King'),
   (-1609286, 'Light washes over the chapel �X the Light of Dawn is uncovered.',0,2,0,0,'');


DELETE FROM script_waypoint WHERE entry=29173;
INSERT INTO script_waypoint VALUES
   (29173, 0, 2431.639, -5137.05, 83.843, 0, 'intro'),
   (29173, 1, 2319.242, -5266.486, 82.825, 0, 'summon & on hold'),
   (29173, 2, 2318.775, -5266.832, 82.783, 0, 'cast light of dawn'),
   (29173, 3, 2280.812, -5284.091, 82.608, 0, 'move to here and start'),
   (29173, 4, 2280.727, -5286.839, 82.930, 0, 'move forward to talk'),
   (29173, 5, 2280.812, -5284.091, 82.608, 0, 'when baba pop'),
   (29173, 6, 2281.461, -5263.014, 81.164, 0, 'charge to lich king'),
   (29173, 7, 2257.479, -5296.702, 82.165, 0, 'being kicked by Lich King'),
   (29173, 8, 2261.237, -5294.983, 82.167, 0, 'throw'),
   (29173, 9, 2259.34, -5294.379, 82.167, 0, 'event end');

-- [S27] Rite_of_Vision_scriptdev2.sql
	-- Rite of Vision

DELETE FROM script_waypoint WHERE entry=2983;

INSERT INTO script_waypoint
   (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`)
VALUES
   ( 2983, 1, -2226.32,  -408.095,   -9.36235, 0, 'Plains Vision Waypoint'),
   ( 2983, 2, -2203.04,  -437.212,   -5.72498, 0, 'Plains Vision Waypoint'),
   ( 2983, 3, -2163.91,  -457.851,   -7.09049, 0, 'Plains Vision Waypoint'),
   ( 2983, 4, -2123.87,  -448.137,   -9.29591, 0, 'Plains Vision Waypoint'),
   ( 2983, 5, -2104.66,  -427.166,   -6.49513, 0, 'Plains Vision Waypoint'),
   ( 2983, 6, -2101.48,  -422.826,   -5.3567, 0, 'Plains Vision Waypoint'),
   ( 2983, 7, -2097.56,  -417.083,   -7.16716, 0, 'Plains Vision Waypoint'),
   ( 2983, 8, -2084.87,  -398.626,   -9.88973, 0, 'Plains Vision Waypoint'),
   ( 2983, 9, -2072.71,  -382.324,   -10.2488, 0, 'Plains Vision Waypoint'),
   ( 2983, 10, -2054.05,  -356.728,   -6.22468, 0, 'Plains Vision Waypoint'),
   ( 2983, 11, -2051.8,   -353.645,   -5.35791, 0, 'Plains Vision Waypoint'),
   ( 2983, 12, -2049.08,  -349.912,   -6.15723, 0, 'Plains Vision Waypoint'),
   ( 2983, 13, -2030.6,   -310.724,   -9.59302, 0, 'Plains Vision Waypoint'),
   ( 2983, 14, -2002.15,  -249.308,   -10.8124, 0, 'Plains Vision Waypoint'),
   ( 2983, 15, -1972.85,  -195.811,   -10.6316, 0, 'Plains Vision Waypoint'),
   ( 2983, 16, -1940.93,  -147.652,   -11.7055, 0, 'Plains Vision Waypoint'),
   ( 2983, 17, -1888.06,  -81.943,    -11.4404, 0, 'Plains Vision Waypoint'),
   ( 2983, 18, -1837.05,  -34.0109,   -12.258, 0, 'Plains Vision Waypoint'),
   ( 2983, 19, -1796.12,  -14.6462,   -10.3581, 0, 'Plains Vision Waypoint'),
   ( 2983, 20, -1732.61,  -4.27746,   -10.0213, 0, 'Plains Vision Waypoint'),
   ( 2983, 21, -1688.94,  -0.829945,  -11.7103, 0, 'Plains Vision Waypoint'),
   ( 2983, 22, -1681.32,  13.0313,    -9.48056, 0, 'Plains Vision Waypoint'),
   ( 2983, 23, -1677.04,  36.8349,    -7.10318, 0, 'Plains Vision Waypoint'),
   ( 2983, 24, -1675.2,   68.559,     -8.95384, 0, 'Plains Vision Waypoint'),
   ( 2983, 25, -1676.57,  89.023,     -9.65104, 0, 'Plains Vision Waypoint'),
   ( 2983, 26, -1678.16,  110.939,    -10.1782, 0, 'Plains Vision Waypoint'),
   ( 2983, 27, -1677.86,  128.681,    -5.73869, 0, 'Plains Vision Waypoint'),
   ( 2983, 28, -1675.27,  144.324,    -3.47916, 0, 'Plains Vision Waypoint'),
   ( 2983, 29, -1671.7,   163.169,    -1.23098, 0, 'Plains Vision Waypoint'),
   ( 2983, 30, -1666.61,  181.584,    5.26145, 0, 'Plains Vision Waypoint'),
   ( 2983, 31, -1661.51,  196.154,    8.95252, 0, 'Plains Vision Waypoint'),
   ( 2983, 32, -1655.47,  210.811,    8.38727, 0, 'Plains Vision Waypoint'),
   ( 2983, 33, -1647.07,  226.947,    5.27755, 0, 'Plains Vision Waypoint'),
   ( 2983, 34, -1621.65,  232.91,     2.69579, 0, 'Plains Vision Waypoint'),
   ( 2983, 35, -1600.23,  237.641,    2.98539, 0, 'Plains Vision Waypoint'),
   ( 2983, 36, -1576.07,  242.546,    4.66541, 0, 'Plains Vision Waypoint'),
   ( 2983, 37, -1554.57,  248.494,    6.60377, 0, 'Plains Vision Waypoint'),
   ( 2983, 38, -1547.53,  259.302,    10.6741, 0, 'Plains Vision Waypoint'),
   ( 2983, 39, -1541.7,   269.847,    16.4418, 0, 'Plains Vision Waypoint'),
   ( 2983, 40, -1539.83,  278.989,    21.0597, 0, 'Plains Vision Waypoint'),
   ( 2983, 41, -1540.16,  290.219,    27.8247, 0, 'Plains Vision Waypoint'),
   ( 2983, 42, -1538.99,  298.983,    34.0032, 0, 'Plains Vision Waypoint'),
   ( 2983, 43, -1540.38,  307.337,    41.3557, 0, 'Plains Vision Waypoint'),
   ( 2983, 44, -1536.61,  314.884,    48.0179, 0, 'Plains Vision Waypoint'),
   ( 2983, 45, -1532.42,  323.277,    55.6667, 0, 'Plains Vision Waypoint'),
   ( 2983, 46, -1528.77,  329.774,    61.1525, 0, 'Plains Vision Waypoint'),
   ( 2983, 47, -1525.65,  333.18,     63.2161, 0, 'Plains Vision Waypoint'),
   ( 2983, 48, -1517.01,  350.713,    62.4286, 0, 'Plains Vision Waypoint'),
   ( 2983, 49, -1511.39,  362.537,    62.4539, 0, 'Plains Vision Waypoint'),
   ( 2983, 50, -1508.68,  366.822,    62.733, 0, 'Plains Vision Waypoint');
