/* vehicle accessory */
UPDATE creature_template_addon SET passengers = '33167 1' WHERE entry = 33109;
UPDATE creature_template_addon SET passengers = '33067 7' WHERE entry = 33060;
UPDATE creature_template_addon SET passengers = '33218 1' WHERE entry = 33214;
UPDATE creature_template_addon SET passengers = '33114 0 33114 1 33114 2 33114 3 33139 7' WHERE entry = 33113;
REPLACE INTO creature_template_addon (`entry`,`passengers`) values (27850,'27905 1');
REPLACE INTO creature_template_addon (`entry`,`passengers`) values (32930,'32933 1 32934 7');
REPLACE INTO creature_template_addon (`entry`,`passengers`) values (33114,'33142 1 33143 2');
/* unifieddb only! */
-- REPLACE INTO creature_template_addon (`entry`,`passengers`) values (33214,'33218 1'),(33113,'33114 0 33114 1 33114 2 33114 3 33139 7');