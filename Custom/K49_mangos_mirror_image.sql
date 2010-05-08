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
