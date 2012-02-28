INSERT INTO `gameobject_template` (entry, type, displayId, name) VALUES(2000000, 5, 327, 'Targetmarker');
-- set scriptnames for quest #12644 (still at it)

UPDATE creature_template SET scriptname = 'npc_tipsy_mcmanus' where entry = 28566;
UPDATE gameobject_template SET scriptname = 'go_brew_event' where entry in (190635,190636,190637,190638,190639);
-- apply AI
UPDATE `creature_template` SET `ScriptName` = 'npc_quest_12851' WHERE `entry` IN (29358,29351);

-- set some target entrys
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 54798;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13,54798,18,1,29351),
(13,54798,18,1,29358);

-- set quest start script
UPDATE `quest_template` SET `StartScript` = 12851 WHERE `id` = 12851;

-- add icefang spell
UPDATE `creature_template` SET `spell1` = 54897 WHERE `entry` = 29602;

-- faster mob respawn
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `id` IN (29358,29351);

-- add start script
DELETE FROM `quest_start_scripts` WHERE `id` = 12851;
INSERT INTO `quest_start_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)
VALUES
(12851,0,15,54768,3,0,0,0,0,0);
-- faster captive protodrake respawn
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `id` = 29708;

-- add freed protodrake spell
UPDATE `creature_template` SET `spell1` = 55046, `faction_A` = 35, `faction_H` = 35, `InhabitType` = 4 WHERE `entry` = 29709;

UPDATE `creature_template` SET `InhabitType` = 4, `ScriptName` = 'npc_hyldsmeet_protodrake' WHERE `entry` = 29679;
UPDATE `creature_template` SET `ScriptName` = 'npc_freed_protodrake' WHERE `entry` = 29709;
UPDATE `creature_template` SET `ScriptName` = 'npc_captive_protodrake' WHERE `entry` = 29708;
UPDATE `creature_template` SET `ScriptName` = 'npc_brunnhildar_prisoner' WHERE `entry` = 29639; 
UPDATE `creature_template` SET `ScriptName` = 'npc_injured_icemaw' WHERE `entry` = 29563;
UPDATE `creature_template` SET `ScriptName` = 'npc_harnessed_icemaw' WHERE `entry` = 30468;
UPDATE `creature_template` SET `ScriptName` = 'npc_freed_protodrake' WHERE `entry` = 29709;

-- set quest 12886 start script
UPDATE `quest_template` SET `StartScript` = 12886 WHERE `id` = 12886;

DELETE FROM `quest_start_scripts` WHERE `id` = 12886;
INSERT INTO `quest_start_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)
VALUES
(12886,0,15,55253,0,0,0,0,0,0);

-- spawn anvil
DELETE FROM `gameobject` WHERE `id` = 192060;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)
VALUES
(192060, 571, 1, 1, 7220.96, -3650.65, 819.39, 2.59262, 0, 0, 0.962565, 0.271053, 300, 0, 1);

-- apply dun niffelem phase 4 area aura
DELETE FROM `spell_area` WHERE `spell` = 55858 AND `area` = 4438;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`)
VALUES 
(55858, 4438, 12924, 1, 0, 0, 0, 2, 1);

-- make lillehoff sell things
UPDATE `gossip_menu_option` SET `option_id` = 3 WHERE `menu_id` = 10281;

## The Warm-Up & Into the Pit & Back to the Pit
-- Spells taken from WoWWiki - http://www.wowwiki.com/Warbear_Matriarch
-- TODO: Need Spell for Melee (1)
UPDATE `creature_template` SET
 `spell4` = 54459, -- Maul
 `spell5` = 54458, -- Smash
 `spell6` = 54460, -- Charge
 `speed_run` = 3   -- old: 1,14286
WHERE `entry` = 29918;

## The Warm-Up
-- Give KillCredit at 10% HP
REPLACE INTO `creature_ai_scripts` VALUES (
-- id, creature_id
2935201, 29352,
-- event_type EVENT_T_HP, event_inverse_phase_mask, event_chance, event_flags EFLAG_REPEATABLE
2, 0, 100, 1,
-- event_param1 HPMax%, event_param2 HPMin%, event_param3 RepeatMin, event_param4 RepeatMax
10, 1, 1, 1,
-- action1_type ACTION_T_KILLED_MONSTER, action1_param1 Creature-ID, action1_param2 Target-Type TARGET_T_ACTION_INVOKER, action1_param3,
33, 30221, 1, 0,
-- action2_type, action2_param1, action2_param2, action2_param3
24, 0, 0, 0,
-- action3_type, action3_param1, action3_param2, action3_param3
0, 0, 0, 0,
-- comment
'Storm Peaks: The Warm-Up - KillCredit for Kirgaraak at 10% HP');

UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 29352;

-- prequest relations for 12924
UPDATE `quest_template` SET `NextQuestId` = 12924, `ExclusiveGroup` = -12915 WHERE `id` IN (12915, 12956);

-- drop item 41556 not only when on quest 12915
UPDATE `conditions` SET `ConditionTypeOrReference` = 8, `ConditionValue1` = 13064 
WHERE `SourceEntry` = 41556 AND `SourceGroup` = 29375;

-- set victorious challenger, agnetta tyrsdottar faction_id
UPDATE `creature_template` SET `faction_A` = 2109, `faction_H` = 2109 WHERE `entry` IN (30012, 30154);

-- make bear rider civillian
UPDATE `creature_template` SET `flags_extra` = 2, `unit_flags` = `unit_flags`|2|256|512 WHERE `entry` = 30175;

-- update spawntimes
UPDATE `creature` SET `spawntimesecs` = 60 WHERE `id` = 29518;
UPDATE `creature` SET `spawntimesecs` = 120 WHERE `id` IN (29427, 30146, 30147);
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `id` IN (30012, 30154, 30174, 29352);

-- set snorri spells and (bad) vehicle id
UPDATE `creature_template` SET `spell1` = 56750, `spell2` = 56753, `VehicleId` = 181 WHERE `entry` = 30124;

-- update seething revenants faction (phase 4)
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `flags_extra` = 268435456 WHERE `entry` = 30120;

DELETE FROM `creature_ai_scripts` WHERE `id` = 3012002;
INSERT INTO `creature_ai_scripts` 
VALUES (3012002,30120,6,0,100,1,0,0,0,0,33,30125,6,0,41,5000,0,0,0,0,0,0,'Seething Revenant - Kill Credit');

-- spell target restriction
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 56753;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(17, 56753, 19, 30120, 0);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 56753;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) 
VALUES (56753, -56750, 0, 'Snorri - Remove Gather Snow');

-- make snorri clickable
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 30123;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) 
VALUES (30123, 55957, 12967, 1, 12967, 3, 0, 55962, 0);

-- phase anvil and lake area (phase 4)
DELETE FROM `spell_area` WHERE `spell` = 55858 AND `area` IN (4439,4495);
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`)
VALUES 
(55858, 4439, 12924, 1, 12924, 0, 0, 2, 1),
(55858, 4495, 12924, 1, 12924, 0, 0, 2, 1);

-- phase anvil and lake area (phase 8)
DELETE FROM `spell_area` WHERE `spell` = 55952 AND `area` IN (4439,4495);
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`)
VALUES 
(55952, 4439, 12924, 0, 0, 0, 0, 2, 1),
(55952, 4495, 12924, 0, 0, 0, 0, 2, 1);

-- set tundra ram phasemask
UPDATE `creature` SET `phaseMask` = 13 WHERE `id` = 29958;

-- spawn njormeld related creatures
DELETE FROM `creature` WHERE `id` IN (30099, 30120, 30123);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
VALUES
(30099, 571, 1, 4, 0, 0, 7175.17, -3514.41, 832.257, 6.16378, 30,  0, 0, 50400, 0, 0, 0, 0, 0),
(30120, 571, 1, 4, 0, 0, 7211.01, -3663.32, 822.932, 1.06182, 30, 10, 0, 12600, 0, 1, 0, 0, 0),
(30120, 571, 1, 4, 0, 0, 7234.67, -3649.07, 823.685, 2.62084, 30, 10, 0, 12600, 0, 1, 0, 0, 0),
(30120, 571, 1, 4, 0, 0, 7240.39, -3678.53, 822.731, 1.94933, 30, 10, 0, 12600, 0, 1, 0, 0, 0),
(30120, 571, 1, 4, 0, 0, 7258.67, -3641.53, 823.251, 3.15098, 30, 10, 0, 12600, 0, 1, 0, 0, 0),
(30120, 571, 1, 4, 0, 0, 7215.29, -3623.86, 823.263, 2.5855,  30, 10, 0, 12600, 0, 1, 0, 0, 0),
(30120, 571, 1, 4, 0, 0, 7199.37, -3638.62, 823.401, 4.25839, 30, 10, 0, 12600, 0, 1, 0, 0, 0),
(30123, 571, 1, 4, 0, 0, 7167.15, -3543.37, 827.69,  6.25175, 30,  0, 0, 50400, 0, 0, 0, 0, 0);

-- spawn dun nifelem anvil
DELETE FROM `gameobject` WHERE `id` = 192071;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)
VALUES
(192071, 571, 1, 4, 7218.02, -2644.12, 809.814, 5.65174, 0, 0, 0.310502, -0.950573, 300, 0, 1);

-- anvil questrelations
INSERT IGNORE INTO `gameobject_questrelation` VALUES (192071, 12981);
INSERT IGNORE INTO `gameobject_involvedrelation` VALUES (192071, 12981);

##### more quest relations
-- "Hot and Cold" (daily)
UPDATE `quest_template` SET `PrevQuestId` = 12967, `NextQuestIdChain` = 0 WHERE `id` = 12981;
-- "The Reckoning" prequests
UPDATE `quest_template` SET `NextQuestId` = 13047, `ExclusiveGroup` = -13005 WHERE `id` IN (13005, 13035);
-- "Diametrically Opposed"
UPDATE `quest_template` SET `PrevQuestId` = 13047, `NextQuestIdChain` = 0 WHERE `id` = 13109;

-- dead iron giant looking dead
INSERT IGNORE INTO `creature_template_addon` VALUES (29914, 0, 0, 7, 0, 0, NULL);
-- spawntime and phasemask
UPDATE `creature` SET `spawntimesecs` = 120, `phaseMask` = 13 WHERE `guid` IN (116761, 116762, 116763);
-- make ignore aggro
UPDATE `creature_template` SET `flags_extra` = 268435458, `unit_flags` = `unit_flags`|2|256|512 WHERE `entry` = 29914;

DELETE FROM `creature` WHERE `id` = 29914 AND `phaseMask` = 12;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
VALUES 
('29914','571','1','12','0','0','7429.23','-3187.91','837.452','0.19249','120','0','0','50400','0','0','0','0','0'),
('29914','571','1','12','0','0','7359.28','-3176.45','837.452','1.31954','120','0','0','50400','0','0','0','0','0'),
('29914','571','1','12','0','0','7280.03','-3142.9','837.452','4.41243','120','0','0','50400','0','0','0','0','0'),
('29914','571','1','12','0','0','7515.58','-3137.05','837.452','5.47429','120','0','0','50400','0','0','0','0','0'),
('29914','571','1','12','0','0','7509.03','-3225.78','837.432','2.03661','120','0','0','50400','0','0','0','0','0'),
('29914','571','1','12','0','0','7259.32','-3221.84','837.452','1.06349','120','0','0','50400','0','0','0','0','0');

## quest: hot and cold
-- workaround
DELETE FROM `spell_scripts` WHERE `id` = 56099;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)
VALUES (56099, 0, 2, 15, 56101, 1, 0, 0, 0, 0, 0);

DELETE FROM `gameobject` WHERE `id` = 192124;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)
VALUES 
('192124','571','1','8','7209.07','-3596.18','825.86','1.74533','0','0','0.766046','0.642786','300','0','1'),
('192124','571','1','8','7157.87','-3556.37','828.47','0.45728','0','0','0.226653','0.973976','300','0','1'),
('192124','571','1','8','7190.29','-3485.87','834.72','0.45728','0','0','0.226653','0.973976','300','0','1'),
('192124','571','1','8','7226.67','-3441.92','837.543','1.91341','0','0','0.817297','0.576217','300','0','1'),
('192124','571','1','8','7199.65','-3553.19','828.189','4.97657','0','0','0.607814','-0.794079','300','0','1');

-- spawn brittle revenants (phase 8, lake area)
DELETE FROM `creature` WHERE `id` = 30160;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) 
VALUES
('30160','571','1','8','0','1831','7220.05','-3272.88','837.452','0.750886','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7452.03','-3081.92','837.452','5.68555','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7278.57','-3198.8','837.452','1.48602','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7266.87','-3109.61','837.451','3.05446','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7325.03','-3154.05','837.453','2.89895','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7385.27','-3100.49','837.457','4.75406','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7380.8','-3160.7','837.452','2.14418','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7432.12','-3202.25','837.452','2.19209','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7429.5','-3137.99','837.452','2.52197','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7493.77','-3132.1','837.465','4.20979','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7478.17','-3179.73','837.471','1.57163','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7528.51','-3189.26','837.448','2.75237','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7333.29','-3114.06','837.452','3.77953','90','10','0','12600','0','1','0','0','0'),
('30160','571','1','8','0','1831','7260.9','-3159.63','837.452','6.06896','90','10','0','12600','0','1','0','0','0');

-- spawn seething revenants (phase 8, anvil area)
DELETE FROM `creature` WHERE `id` = 30387;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
VALUES
('30387','571','1','8','0','0','7228.41','-3681.01','823.549','1.27883','180','7','0','12600','0','1','0','0','0'),
('30387','571','1','8','0','0','7223.79','-3653.33','823.259','2.24487','180','7','0','12600','0','1','0','0','0'),
('30387','571','1','8','0','0','7247.47','-3651.63','822.965','3.68215','180','7','0','12600','0','1','0','0','0'),
('30387','571','1','8','0','0','7231.88','-3623.4','823.628','5.62444','180','7','0','12600','0','1','0','0','0'),
('30387','571','1','8','0','0','7201.15','-3623.22','823.489','5.63229','180','7','0','12600','0','1','0','0','0'),
('30387','571','1','8','0','0','7186.92','-3537.98','826.927','1.20658','180','7','0','12600','0','1','0','0','0'),
('30387','571','1','8','0','0','7201.47','-3487.47','832.464','4.3843','180','7','0','12600','0','1','0','0','0'),
('30387','571','1','8','0','0','7207.03','-3375.13','845.052','4.94489','180','7','0','12600','0','1','0','0','0'),
('30387','571','1','8','0','0','7218.05','-3434.39','837.901','1.38016','180','7','0','12600','0','1','0','0','0');


## quest 12985
-- dead iron giant scriptname
UPDATE `creature_template` SET `unit_flags` = `unit_flags` &~2, `ScriptName` = 'npc_dead_irongiant' WHERE `entry` = 29914;

-- salvage corpse target entry
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 56227;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13,56227,18,1,29914);

-- stormforged ambusher basic loot
DELETE FROM `creature_loot_template` WHERE `entry` = 30208;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`)
VALUES
(30208, 42423, -50, 1, 0, 1, 1),
(30208, 42105, -33, 1, 0, 1, 1),
(30208, 42780,  40, 1, 0, 1, 1),
(30208, 33470,  30, 1, 0, 1, 4),
(30208, 43851,  20, 1, 0, 1, 1);


## quest 12987
-- give credit
DELETE FROM `spell_scripts` WHERE `id` = 56278;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) 
VALUES
(56278, 0, 3, 8, 30210, 0, 0, 0, 0, 0, 0);

-- "northern ice spike" in phase 4
UPDATE `gameobject` SET `phaseMask` = 4 WHERE `guid` = 99731;


## misc spell_area
-- lokrila buff im tal für immer (?)
UPDATE `spell_area` SET `quest_end` = 0 WHERE `area` = 4437 AND `quest_end` = 12983;

-- apply hibernal cavern phase 4 area aura
DELETE FROM `spell_area` WHERE `spell` = 55858 AND `area` = 4455;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`)
VALUES 
(55858, 4455, 12915, 0, 0, 0, 0, 2, 1);


## quest 13006
-- "polishing the helm" prequest condition
UPDATE `quest_template` SET `PrevQuestId` = 12987 WHERE `id` = 13006;

-- helm questrelations
INSERT IGNORE INTO `gameobject_questrelation` VALUES (192080, 13006);
INSERT IGNORE INTO `gameobject_involvedrelation` VALUES (192080, 13006);

-- spawn helm
DELETE FROM `gameobject` WHERE `id` = 192080;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)
VALUES (192080, 571, 1, 4, 7389.34, -2726.2, 875.227, 2.82985, 0, 0, 0.987876, 0.155243, 300, 0, 1);

-- oil faster respawn
UPDATE `creature` SET `phaseMask` = 4, `spawntimesecs` = 60 WHERE `id` = 30325;

-- oil loot
UPDATE `creature_template` SET `lootid` = 30325 WHERE `entry` = 30325;

DELETE FROM `creature_loot_template` WHERE `entry` = 30325;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`)
VALUES
(30325, 42640, -100, 1, 0, 1, 1),
(30325, 39551,   80, 1, 0, 1, 1),
(30325, 39552,   20, 1, 0, 1, 1);


## quest 13011
-- item target restriction
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceEntry` = 42732;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(18, 42732, 24, 1, 30292);

-- spell 56562 script
DELETE FROM `spell_scripts` WHERE `id` = 56562;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) 
VALUES
(56562, 0, 0, 18,     0, 0, 0, 0, 0, 0, 0),
(56562, 0, 0, 15, 56566, 1, 0, 0, 0, 0, 0);

-- "icy crater" in phase 4
UPDATE `gameobject` SET `phaseMask` = 4 WHERE `guid` = 99730;

-- lure jormuttar bunny
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 30366;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 30366;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
('3036601','30366','1','0','100','0','5000','10000','0','0','12','30340','0','120000','41','1000','0','0','0','0','0','0','Lure Jormuttar');
-- Quest(10974)/NPC (22919) Fix

-- Image of Commandant Ameer Quest Flag(22919)
DELETE FROM `creature_template` WHERE entry = '22919';
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`,`difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`,
`modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`,
`npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`,`dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`,
`rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`,`trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`,
`maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`,`pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`,
`resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`,`spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`,
`mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`,`Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`,
`questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`,`RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`,`ScriptName`, `WDBVerified`) VALUES

('22919', '0', '0', '0', '0', '0', '19661', '0', '0', '0', 'Image of Commander Ameer', 'The Protectorate', NULL, '0', '70', '70', '1', '1795', '1795',
 '2', '1.125', '1.14286', '1', '0', '252', '357', '0', '304', '1', '2000', '0', '1', '2', '8', '0', '0', '0', '0', '0', '215', '320', '44', '10', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '0', '0',
 '0', '0', '0', '0', '0', '0', '1', '2256', '0', '0', '', '12340');

-- Image of Commandant Ameer Spawn
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`,`equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`,
`spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`,`MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES

('22919', '530', '1', '1', '0', '2256', '3866.6', '5978.59', '291.792', '3.97902', '300', '0', '6986', '0', '0', '0', '0', '0', '0');

-- Fix Quests Image of Comanndant Ameer (20482)->(22919)
UPDATE `creature_involvedrelation` SET `id` = '22919' WHERE `quest` IN ( '10974', '10975', '10976', '10977', '10981' ,'10982');
UPDATE `creature_questrelation` SET `id` = '22919' WHERE `quest` IN ( '10975', '10976', '10977', '10981' ,'10982');
-- 11662 
UPDATE `quest_template` SET `NextQuestId` = 11613, `NextQuestIdChain` = 11613 WHERE `id` = 11662;

-- apple trap workaround
UPDATE `creature_template` SET `modelid1`=11686, `minlevel`=30, `maxlevel`=30, `faction_A`=35, `faction_H`=35, `ScriptName`='npc_apple_trap_bunny' WHERE `entry`=24263;
-- bark quests credits
UPDATE `creature_template` SET `modelid1`=11686, `minlevel`=30, `maxlevel`=30, `ScriptName`='npc_bark_bunny' WHERE `entry` IN (24202,24203,24204,24205);
-- apply ram mount spell on quest accept
UPDATE `quest_template` SET `SourceSpellid`=43883 WHERE `id` IN (11409,11412,11318,11122,11293,11294,11407,11408);
-- keg delivery npcs
UPDATE `creature_template` SET `ScriptName`='npc_keg_delivery' WHERE `entry` IN (24364,24527,24497,23558);
UPDATE `creature_template` SET `npcflag`=3 WHERE `entry` IN (24497,23558);
UPDATE `creature_template` SET `minlevel`=30, `maxlevel`=30 WHERE `entry`=24527;

-- threw keg (player) target condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=43662;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,43662,18,1,24468),
(13,43662,18,1,24510);

-- make quest 11122 completable
UPDATE `quest_template` SET `StartScript`=11122 WHERE `id`=11122;

DELETE FROM `quest_start_scripts` WHERE `id`=11122;
INSERT INTO `quest_start_scripts` (`id`, `command`, `datalong`) VALUES
(11122,15,51798);

-- remove ram fatigue debuff
DELETE FROM `spell_linked_spell` WHERE `spell_effect`=-43052;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-43883,-43052,0, 'Remove Ram Fatigue with Rental Racing Ram');

-- some spawns
SET @guid := 303065;
SET @go_guid := 400045;

DELETE FROM `creature` WHERE `id` IN (24202,24203,24204,24205,24527,24263);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid,24202,1,1,1,0,0,1652.82,-4425.6,16.7553,1.94068,180,0,0,42,0,0,0,0,0),
(@guid+1,24202,0,1,1,0,0,-4919.44,-941.245,501.562,5.38547,180,0,0,42,0,0,0,0,0),
(@guid+2,24203,1,1,1,0,0,1933.84,-4676.55,27.6472,2.16765,180,0,0,42,0,0,0,0,0),
(@guid+3,24203,0,1,1,0,0,-4959.34,-1199.69,501.659,0.735904,180,0,0,42,0,0,0,0,0),
(@guid+4,24204,1,1,1,0,0,1927.43,-4298.46,25.3459,0.375365,180,0,0,42,0,0,0,0,0),
(@guid+5,24204,0,1,1,0,0,-4690.26,-1235.04,501.66,2.25665,180,0,0,42,0,0,0,0,0),
(@guid+6,24205,1,1,1,0,0,1573.16,-4202.9,43.1776,5.43725,180,0,0,42,0,0,0,0,0),
(@guid+7,24205,0,1,1,0,0,-4679.16,-968.932,501.658,3.88478,180,0,0,42,0,0,0,0,0),
(@guid+8,24527,1,1,1,22508,0,841.342,-4511.96,5.63413,0.134843,10,0,0,44,0,0,0,0,0),
(@guid+9,24263,1,1,1,0,0,1290.72,-4433.38,28.9128,2.38741,180,0,0,102,0,0,0,0,0),
(@guid+10,24263,1,1,1,0,0,1096.47,-4427.09,21.9768,0.600628,180,0,0,102,0,0,0,0,0),
(@guid+11,24263,1,1,1,0,0,1004.37,-4479.23,12.6481,1.44494,180,0,0,102,0,0,0,0,0),
(@guid+12,24263,1,1,1,0,0,813.71,-4550.15,6.76704,0.526026,180,0,0,102,0,0,0,0,0),
(@guid+13,24263,0,1,1,0,0,-5189.01,-482.731,389.012,3.23857,180,0,0,102,0,0,0,0,0),
(@guid+14,24263,0,1,1,0,0,-5355.19,-527.227,393.217,0.866664,180,0,0,102,0,0,0,0,0),
(@guid+15,24263,0,1,1,0,0,-5621.26,-477.593,398.716,6.23093,180,0,0,102,0,0,0,0,0),
(@guid+16,24263,0,1,1,0,0,-5492.14,-528.144,399.901,1.56881,180,0,0,102,0,0,0,0,0);

DELETE FROM `gameobject` WHERE `guid` BETWEEN @go_guid AND @go_guid+3;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@go_guid,'186717','1','1','1','819.338','-4506.86','7.81105','5.85064','0','0','0.214592','-0.976704','300','0','1'),
(@go_guid+1,'186331','0','1','1','-5492.23','-528.114','398.163','1.502','0','0','0.68237','0.731007','300','0','1'),
(@go_guid+2,'186331','0','1','1','-5621.04','-477.656','396.981','6.13355','0','0','0.0747495','-0.997202','300','0','1'),
(@go_guid+3,'186331','1','1','1','813.684','-4550.35','4.98399','0.526033','0','0','0.259995','0.96561','300','0','1');

-- set scriptnames
UPDATE `creature_template` SET `ScriptName` = 'npc_coren_direbrew', `flags_extra` = 0, `dmg_multiplier` = 20, `lootid` = 23872 WHERE `entry` = 23872;
UPDATE `creature_template` SET `ScriptName` = 'npc_brewmaiden' WHERE `entry` IN (26822,26764);
UPDATE `gameobject_template` SET `ScriptName` = 'go_mole_machine_console' WHERE `entry` = 188498;

-- set some cast targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (47344,47310);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13, 47310, 18, 1, 0),                                 -- cast disarm as aoe
(13, 47344, 18, 1, 26764), (13, 47344, 18, 1, 26822);  -- select one of the barmaiden as target for "Request Second Mug"

-- spell scripts
DELETE FROM `spell_scripts` WHERE `id`=47344;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) 
VALUES 
(47344, 0, 0, 15, 47339, 3, 0, 0, 0, 0, 0); -- cast back "Send Second Mug" on "Request Second Mug" hit
  
-- linked spell to remove auras when drinking brew
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 47371;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) 
VALUES
(47371, -47376, 1, 'Remove Visual Buff'),
(47371, -47331, 1, 'Remove Has Brew Aura');

-- coren direbrew & brewmaiden immunitys
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (23872,26822,26764);

UPDATE `quest_template` SET `SpecialFlags`=9 WHERE `id`=25483;
UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=23872;

-- Set Scriptname
UPDATE creature_template SET scriptname = 'npc_alchemist_finklestein' WHERE entry = 28205;
-- Set Respawntime
UPDATE gameobject SET spawntimesecs = 10 WHERE id IN (190480,190482,190466,190478,190467,190477,190481,190476,190470,190479,190473,190468,190469,190459,190464,190472,191180,191182,190462,190474,190465,190463,191181,190471);
-- item Duration all to 30
UPDATE item_template SET Duration = 30 WHERE entry IN (38340,38335,38346,38336,38344,38345,38338,38341,38343,38370,38337,38342,38369,38339,38379,38381,38384,38386,38393,38396,38397,38398,39668,39669,39670);

UPDATE creature_template SET `flags_extra` = `flags_extra` | "262144" WHERE scriptname = "npc_training_dummy";
UPDATE creature_template SET `flags_extra` = `flags_extra` | "262144" WHERE scriptname = "npc_wyrm_training_dummy";

-- Quest "Keeping the Enemy at the Bay (11543) - Dawnblade Reservist (25087)
UPDATE `creature` SET `spawntimesecs` = '180' WHERE `spawntimesecs` > '180' AND `id` = '25087';

-- Quest "Maintaining the Sunwell Portal" (11514) - Smuggled Mana Cell (187039)
UPDATE `gameobject` SET `spawntimesecs` = '150' WHERE id = '187039';

-- Quest "Revenge of Gann" (849) - Flying Machine
UPDATE `gameobject` SET `spawntimesecs` = '60' WHERE `id` = '3644';

-- Quest "Crush the Dawnblade" (11540)
UPDATE `creature` SET `spawntimesecs` = '240' WHERE  `id` IN (24978, 24976, 24979);

-- Quest "Arm the Wards!" (11523)
UPDATE `creature` SET `spawntimesecs` = '240' WHERE `id` IN (25047, 24966, 24960);

-- Quest "Fields of Grief" (365) - Tirisfal Pumpkin (375)
UPDATE `gameobject` SET `spawntimesecs` = '60' WHERE `id` = '375';

-- quest fix 12326
UPDATE creature_template SET spell1 = 49315, spell2 = 49333, spell3 = 49109, spell4 = 49081 WHERE entry = 27587;
INSERT INTO spell_area (`spell`,`area`,`autocast`) VALUES (49081,4246,0);
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 27607;
UPDATE creature_template SET scriptname = 'npc_7th_legion_siege_engineer' WHERE entry = 27163;
UPDATE creature_template SET scriptname = 'vehicle_alliance_steamtank' WHERE entry IN (27587);
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` = 27587;

-- black temple
update creature_template set scriptname = 'npc_xiri' where entry = 18528;
UPDATE `creature_template` SET `modelid1` = 21349  , `modelid2` = 21349  , `minlevel` = 73  , `maxlevel` = 73  , `health_mod` = 500000  , `health_mod` = 500000  , `mindmg` = 3000  , `maxdmg` = 4000  , `attackpower` = 16125  , `baseattacktime` = 2000  , `faction_A` = 1866  , `faction_H` = 1866 , `armor_mod` = 6000 , `equipment_id` = 2182 , scriptname = 'npc_preeven_maiev' WHERE `entry` = 22989;


update creature_template set scriptname = 'npc_black_temple' where entry = 22878;
UPDATE `creature_template` SET `mechanic_immune_mask` = 648249343 WHERE `entry` = 22878;
update creature_template set scriptname = 'npc_black_temple' where entry = 22883;
update creature_template set scriptname = 'npc_black_temple' where entry = 22873;
UPDATE `creature_template` SET `mechanic_immune_mask` = 111362047 WHERE `entry` = 22873;
update creature_template set scriptname = 'npc_black_temple' where entry = 22877;
update creature_template set scriptname = 'npc_black_temple' where entry = 22884;
update creature_template set scriptname = 'npc_black_temple' where entry = 22875;
UPDATE `creature_template` SET `mechanic_immune_mask` = 33561923 WHERE `entry` = 22875;
update creature_template set minlevel = 73  , maxlevel = 73  , faction_A = 1813  , faction_H = 1813  , unit_flags = 33554434, scriptname = 'mob_coilskar_geyser' where entry = 23080;
update creature_template set scriptname = 'npc_black_temple' where entry = 22876;
update creature_template set scriptname = 'npc_black_temple' where entry = 22885;
update creature_template set scriptname = 'npc_black_temple' where entry = 22874;
update creature_template set scriptname = 'npc_black_temple' where entry = 23028;
update creature_template set scriptname = 'npc_black_temple' where entry = 22963;
update creature_template set scriptname = 'npc_black_temple' where entry = 23030;
update creature_template set scriptname = 'npc_black_temple' where entry = 23330;
update creature_template set scriptname = 'npc_black_temple' where entry = 22960;
UPDATE `creature_template` SET `mechanic_immune_mask` = 614678523 WHERE `entry` = 22960;
update creature_template set scriptname = 'npc_black_temple' where entry = 22954;
update creature_template set scriptname = 'npc_black_temple' where entry = 22855;
update creature_template set scriptname = 'npc_black_temple' where entry = 22844;
update creature_template set scriptname = 'npc_black_temple' where entry = 22849;
update creature_template set scriptname = 'npc_black_temple' where entry = 22847;
update creature_template set scriptname = 'npc_black_temple' where entry = 22845;
update creature_template set scriptname = 'npc_black_temple' where entry = 22896;
update creature_template set scriptname = 'npc_black_temple' where entry = 22894;
update creature_template set scriptname = 'npc_black_temple' where entry = 23374;
update creature_template set scriptname = 'npc_black_temple' where entry = 22846;
update creature_template set scriptname = 'npc_black_temple' where entry = 22848;
update creature_template set scriptname = 'npc_black_temple' where entry = 23337;
update creature_template set scriptname = 'npc_black_temple' where entry = 22853;
UPDATE `creature_template` SET `mechanic_immune_mask` = 33554689 WHERE `entry` = 22853;
update creature_template set scriptname = 'npc_black_temple' where entry = 23339;
update creature_template set scriptname = 'npc_black_temple' where entry = 22869;
update creature_template set scriptname = "npc_black_temple" where entry = 22957;
update `creature_template` SET `minlevel` = 72  , `maxlevel` = 72  , `faction_A` = 1813  , `faction_H` = 1813 WHERE `entry` = 23436;
update creature_template set scriptname = "npc_black_temple" where entry = 22962;
update creature_template set scriptname = 'npc_black_temple' where entry = 22956;
update creature_template set scriptname = 'npc_black_temple' where entry = 22964;
update creature_template set scriptname = 'npc_black_temple' where entry = 22955;
update creature_template set scriptname = 'npc_black_temple' where entry = 22939;
update creature_template set scriptname = 'npc_black_temple' where entry = 22965;
update creature_template set scriptname = 'npc_black_temple' where entry = 22959;

update creature_template set scriptname = 'npc_black_temple' where entry = 23399;
update creature_template set scriptname = 'npc_black_temple' where entry = 23398;
update creature_template set scriptname = 'npc_black_temple' where entry = 23401;

update creature_template set scriptname = 'npc_black_temple' where entry = 23402;
update creature_template set scriptname = 'npc_black_temple' where entry = 23397;
update creature_template set scriptname = 'npc_black_temple' where entry = 23403;
update creature_template set scriptname = 'npc_black_temple' where entry = 23400;
update creature_template set scriptname = 'npc_black_temple' where entry = 23394;
update creature_template set scriptname = 'npc_black_temple' where entry = 23429;
update `creature_template` SET `minlevel` = 72  , `maxlevel` = 72  , `faction_A` = 16  , `faction_H` = 16, `unit_flags` = 33554818 WHERE `entry` = 23429;

update creature_template set scriptname = 'npc_black_temple' where entry = 23172;
update creature_template set scriptname = 'npc_black_temple' where entry = 22945;
update creature_template set scriptname = 'npc_black_temple' where entry = 23047;
update creature_template set scriptname = 'npc_black_temple' where entry = 22879;
update spell_proc_event set procFlags = 131072, procEx = 0 where entry = 41034;
update creature_template set scriptname = 'npc_black_temple' where entry = 22882;
update creature_template set scriptname = 'npc_black_temple' where entry = 22880;
update creature_template set scriptname = 'npc_black_temple' where entry = 23369;
update `creature_template` SET `minlevel` = 72  , `maxlevel` = 72  , `faction_A` = 1813  , `faction_H` = 1813 WHERE `entry` = 23436;
update creature_template set scriptname = 'npc_black_temple' where entry = 23018;
update creature_template set scriptname = 'npc_black_temple' where entry = 23083;
update creature_template set scriptname = 'npc_black_temple' where entry = 22953;
update creature_template set scriptname = 'npc_black_temple' where entry = 23049;
delete from creature_loot_template where item in (32609,32592,32591,32590,32589,32526) and entry = 23147;
update creature_template set scriptname = 'npc_black_temple' where entry = 23196;
delete from spell_scripts where id = 41213;
insert into spell_scripts (id,delay,command,datalong) values (41213,0,15,41214);
update creature_template set scriptname = 'npc_black_temple' where entry = 23236;
update creature_template set scriptname = 'npc_black_temple' where entry = 23235;
update creature_template set scriptname = 'npc_black_temple' where entry = 23237;
update creature_template set scriptname = 'npc_black_temple' where entry = 23232;
update creature_template set scriptname = 'npc_black_temple' where entry = 23222;
update creature_template set scriptname = 'npc_black_temple' where entry = 23239;
update creature_template set scriptname = 'npc_black_temple' where entry = 23223;

-- Magtheridon
delete from creature_addon where guid in (select guid from creature where id = 17257);
delete from creature_addon where guid in (select guid from creature where id = 17256);
delete from creature where id = 17256;
delete from creature where id = 17376;
update creature_template set unit_flags = 0 and type_flags = 0 where entry = 17257;
update gameobject_template set flags = 0 where entry = 181713;

update creature_template set scriptname = "boss_magtheridon" where entry = 17257;
update creature_template set scriptname = "mob_hellfire_channeler" where entry = 17256;
update creature_template set scriptname = "go_manticron_cube" where entry = 181713;
update creature_template set scriptname = "mob_abyssal" where entry = 17454;

-- Sunwell
-- AI Scripts Trashmobs
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25367;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25363;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25371;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25370;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25369;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25867;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25368;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25507;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25372;

update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25484;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25506;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25483;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25373;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25486;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25837;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25485;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25508;

update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25593;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25599;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25595;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25592;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25948;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25597;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25591;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25509;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25851;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25598;

-- Felmyst spawn


insert into `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) 
values('580000','25038','580','1','1','0','0','1463.83','611.512','51.57','1.62316','604800','0','0','1000000','0','0');

-- ZulAman Scripts

update creature_template set scriptname = 'mob_amanishi_lookout'       where entry = 24175;
update creature_template set scriptname = 'mob_amanishi_warrior'       where entry = 24225;
update creature_template set scriptname = 'mob_amanishi_tempest'       where entry = 24549;
update creature_template set scriptname = 'mob_amani_eagle'            where entry = 24159;
update creature_template set scriptname = 'npc_zulaman_harrison_jones' where entry = 24358;
update creature_template set scriptname = 'mob_amanishi_scout'         where entry = 23586;
update creature_template set scriptname = 'mob_amani_protective_ward'  where entry = 23822;
update creature_template set scriptname = 'boss_akilzon'               where entry = 23574;
UPDATE creature_template SET scriptname = 'mob_amanishi_guardian' WHERE entry =23597;
UPDATE creature_template SET scriptname = 'mob_amanishi_wind_walker' WHERE entry =24179;
UPDATE creature_template SET scriptname = 'mob_amanishi_protector' WHERE entry =24180;
UPDATE creature_template SET scriptname = 'mob_amanishi_medicine_man' WHERE entry =23581;
UPDATE creature_template SET scriptname = 'mob_amanishi_warrior' WHERE entry =24225;
UPDATE creature_template SET scriptname = 'mob_amanishi_tribesman' WHERE entry =23582;
UPDATE creature_template SET scriptname = 'mob_amanishi_axe_thrower' WHERE entry =23542;
UPDATE creature_template SET scriptname = 'mob_amanishi_warbringer' WHERE entry =23580;
UPDATE creature_template SET scriptname = 'mob_amani_bear' WHERE entry =23584;
UPDATE creature_template SET scriptname = 'mob_amanishi_flame_caster' WHERE entry =23596;
UPDATE creature_template SET scriptname = 'mob_amanishi_trainer' WHERE entry =23774;
UPDATE creature_template SET scriptname = 'mob_amani_dragonhawk' WHERE entry =23834;
UPDATE creature_template SET scriptname = 'mob_amanishi_handler' WHERE entry =24065;
UPDATE creature_template SET scriptname = 'mob_amanishi_beast_tamer' WHERE entry =24059;
UPDATE creature_template SET scriptname = 'mob_amani_elder_lynx' WHERE entry =24530;
UPDATE creature_template SET scriptname = 'mob_amani_lynx' WHERE entry =24043;
UPDATE creature_template SET scriptname = 'mob_amani_lynx_cub' WHERE entry =24064;
UPDATE creature_template SET scriptname = 'mob_amani_crocolist' WHERE entry in (24138,24047);

-- Doors
delete from `gameobject` where id in (186728,186858,186859,186304,186303) and map = 568;
insert into `gameobject` 
(`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) 
values
('568000','186728','568','1','121.152','1605.26','61'     ,'3.1415' ,'0','0','1'       ,'0'       ,'25','0','1'), -- ZulAman Main Doors 
('568001','186858','568','1','337.056','1395.87','74.45'  ,'3.42177','0','0','0.990204','-0.13963','25','0','0'), -- AkilzonDoor
('568002','186859','568','1','120.435','733.884','45.1122','1.5707' ,'0','0','0.697245','0.716833','25','0','0'), -- ZulJin Door
('568003','186304','568','1','363.6'  ,'1057.5' ,'9.93311','1.55366','0','0','0.701021','0.71314' ,'25','0','0'), -- LynxEntrance
('568004','186303','568','1','307'    ,'1111.56','9.77776','3.1414' ,'0','0','1'       ,'0'       ,'25','0','1'); -- LynxExit

-- Sommerwendfest
update creature_template set scriptname = 'npc_midsummer_scorchling' where entry in (26520,26401);
update creature_template set scriptname = 'npc_ice_caller_briatha' where entry = 25949;
update gameobject_template set scriptname = 'go_ice_stone' where entry = 188049;

-- shadow_bite

DELETE FROM spell_script_names WHERE spell_id IN (-54049,54049,54050,54051,54052,54053);
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (-54049, 'spell_warl_shadow_bite');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62775,62680,63472);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES 
(62680, 'spell_ignis_flame_jets'),
(63472, 'spell_ignis_flame_jets');

-- Paladin (Def)
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pal_righteous_defense';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(31789, 'spell_pal_righteous_defense');

