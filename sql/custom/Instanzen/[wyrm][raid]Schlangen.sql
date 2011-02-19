-- update creature_template set dmgschool = 4,  mechanic_immune_mask = 650854235 where entry = 21216;
-- update creature_template set dmgschool = 4 where entry = 22035;
-- update creature_template set dmgschool = 3 where entry = 22036;

-- ++++ Hydross ++++
-- ***********
-- Erh�he den Schaden von Hydross um ~50%
-- Org:
-- UPDATE creature_template SET mindmg = 2369  , maxdmg = 4842, attackpower = 25237 WHERE entry = 21216;
-- UPDATE creature_template SET mindmg = 1222, maxdmg = 2498, attackpower = 13016 WHERE entry = 22035;
-- UPDATE creature_template SET mindmg = 1222, maxdmg = 2498, attackpower = 13016 WHERE entry = 22036;
-- ***********
UPDATE creature_template SET mindmg = 5974, maxdmg = 8447, attackpower = 25237 WHERE entry = 21216;
UPDATE creature_template SET mindmg = 3081, maxdmg = 4357, attackpower = 13016 WHERE entry = 22035;
UPDATE creature_template SET mindmg = 3081, maxdmg = 4357, attackpower = 13016 WHERE entry = 22036;

UPDATE creature_template set dmgschool = 4 WHERE entry = 22035;
UPDATE creature_template set dmgschool = 3 WHERE entry = 22036;

-- ***********
-- F�ge fehlenden Script hinzu
-- Vorher 617299803
-- ***********
update creature_template SET mechanic_immune_mask = 650854235 where entry = 21216;


-- ++++ Leothedas ++++

-- ***********
-- F�ge fehlenden Script hinzu
-- ***********
UPDATE creature_template SET scriptname = 'boss_leotheras_the_blind_demonform' WHERE entry = 21875;
UPDATE creature_template SET scriptname = 'mob_inner_demon' where entry = 21857;
UPDATE creature_template SET scriptname = 'mob_greyheart_spellbinder' where entry = 21806;
delete from creature where id = 21806;
-- ***********
-- Fehlende Immunit�t
-- ***********
update creature_template set  mechanic_immune_mask = 650854235  where entry = 21215;
update creature_template set  mechanic_immune_mask = 650854235  where entry = 21875;
-- ***********
-- Damage
-- Vorher:
-- UPDATE creature_template SET mindmg = 2843, maxdmg = 5810, attackpower = 30284 WHERE entry = 21215;
-- ***********
UPDATE creature_template SET mindmg = 7169, maxdmg = 10136, attackpower = 45426 WHERE entry = 21215;

-- ++++ Karathress ++++

-- ***********
-- F�ge fehlenden Script hinzu
-- ***********
update creature_template set scriptname = 'mob_caribdis_cyclon' where entry = 22104;
update creature_template set mechanic_immune_mask = 652951551 where entry = 21964;
update creature_template set mechanic_immune_mask = 650854235 where entry = 21214;
-- ***********
-- Damage
-- Vorher:
-- UPDATE creature_template SET mindmg = 3519, maxdmg = 7175, attackpower = 37429 WHERE entry = 21214;
-- UPDATE creature_template SET mindmg = 2363, maxdmg = 4823, attackpower = 25151 WHERE entry = 21966;
-- UPDATE creature_template SET mindmg = 3969, maxdmg = 8102, attackpower = 42250 WHERE entry = 21965;
-- UPDATE creature_template SET mindmg = 2363, maxdmg = 4823, attackpower = 25151 WHERE entry = 21964;
-- ***********
UPDATE creature_template SET mindmg = 8866, maxdmg = 12522, attackpower = 56144 WHERE entry = 21214;
UPDATE creature_template SET mindmg = 5956, maxdmg = 8416,  attackpower = 37726 WHERE entry = 21966;
UPDATE creature_template SET mindmg = 10005,maxdmg = 14452, attackpower = 63375 WHERE entry = 21965;
UPDATE creature_template SET mindmg = 5956, maxdmg = 8416,  attackpower = 37726 WHERE entry = 21964;


-- ++++ Morogrim +++

-- ***********
-- Fehlende Immunit�t
-- ***********
update creature_template set  mechanic_immune_mask = 650854235 where entry = 21213;
-- ***********
-- Damage
-- Vorher:
-- UPDATE creature_template SET mindmg = 5054, maxdmg = 10330, attackpower = 53840 WHERE entry = 21213;
-- UPDATE creature_template SET mindmg = 611,  maxdmg = 1249,  attackpower = 6506  WHERE entry = 21920;
-- ***********
UPDATE creature_template SET mindmg = 7581, maxdmg = 15495, attackpower = 80760 WHERE entry = 21213;
UPDATE creature_template SET mindmg = 1540, maxdmg = 2178,  attackpower = 9765 WHERE  entry = 21920;

-- ++++ Lurker +++

-- ***********
-- Fehlende Immunit�t
-- ***********
update creature_template set  mechanic_immune_mask = 650854235 where entry = 21217;
-- ***********
-- Tempfix: Faction auf 7 gestellt
-- vorher 14
-- ***********
update creature_template set  faction_a = 7, faction_h = 7 where entry = 21217;


-- ++++ Vashj +++

-- ***********
-- Fehlende Immunit�t
-- ***********
update creature_template set  mechanic_immune_mask = 650854235 where entry = 21212;
-- ***********
-- Damage
-- Vorher:
-- UPDATE creature_template SET mindmg = 4398, maxdmg = 8969, attackpower = 46786 WHERE entry = 21212;
-- ***********
-- UPDATE creature_template SET mindmg = 22336, maxdmg = 26907, attackpower = 86786 WHERE entry = 21212;
UPDATE creature_template SET mindmg = 11081, maxdmg = 15652, attackpower = 70179 WHERE entry = 21212;



-- ++++ Door to Vashj +++
update gameobject_template SET Faction = 14 where entry = 184568


-- ++++ Trash ++++
-- Org Daten:
--
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21217','0','20216','0','20216','0','The Lurker Below',NULL,NULL,'73','73','2655000','3794000','0','0','7684','7','7','0','1','1','3','4738','9684','0','50477','2000','0','0','0','0','0','0','0','0','0','0','0','1','76','21217','0','0','0','0','0','0','0','0','0','0','0','0','0','1340096','1654440','','0','3','0','1','0','650854235','1','boss_the_lurker_below');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21218','0','20200','0','20200','0','Vashj\'ir Honor Guard',NULL,NULL,'71','71','250000','250000','0','0','0','14','14','0','1','1','1','2778','5000','0','27219','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21218','0','0','0','0','0','0','0','0','0','0','0','0','0','3538','17905','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21220','0','20212','0','20212','0','Coilfang Priestess',NULL,NULL,'71','71','143600','143600','48465','48465','5714','14','14','0','1','1','1','1513','3087','0','16096','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21220','0','0','0','0','0','0','0','0','38580','38582','38585','0','0','3590','18171','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21221','0','20201','0','20201','0','Coilfang Beast-Tamer',NULL,NULL,'71','71','251335','251335','0','0','7089','14','14','0','1','1','1','2850','5828','0','30369','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21221','0','0','0','0','0','0','0','0','38904','38474','38484','0','0','3665','18552','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21246','0','18030','0','18030','0','Serpentshrine Sporebat',NULL,NULL,'71','71','107150','107150','0','0','7089','14','14','0','1','1','1','1374','2809','0','14642','2000','0','1','0','33','0','0','0','0','0','0','0','1','73','21246','0','0','0','0','0','0','0','0','38461','5100','0','0','0','0','0','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21251','0','20812','0','20812','0','Underbog Colossus',NULL,NULL,'72','72','553500','553500','0','0','7387','14','14','0','1','1','1','3109','6357','0','33131','2000','0','1','0','0','0','0','0','0','0','0','0','5','328','21251','0','80002','0','0','0','0','0','0','38971','39031','39032','39044','0','3590','18169','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21253','0','11172','0','11172','0','Tainted Water Elemental',NULL,NULL,'71','71','10772','10772','0','0','7089','14','14','0','1','1','1','305','624','0','3253','2000','0','1','0','0','0','0','0','0','0','0','0','4','72','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0','1','0','0','0','');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21263','0','20639','0','20639','0','Greyheart Technician',NULL,NULL,'71','71','14362','14362','0','0','7089','14','14','0','1','1','1','407','832','0','4338','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21263','0','0','0','0','0','0','0','0','38995','0','0','0','0','3558','18009','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21301','0','20205','0','20205','0','Coilfang Shatterer',NULL,NULL,'71','71','179525','179525','0','0','7089','14','14','0','1','1','1','2646','5411','0','28201','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21301','0','0','0','0','0','0','0','0','38591','0','0','0','0','3668','18567','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21339','0','20642','0','20642','0','Coilfang Hate-Screamer',NULL,NULL,'71','71','143600','143600','48465','48465','5714','14','14','0','1','1','1','1513','3087','0','16096','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21339','0','0','0','0','0','0','0','0','38491','38496','0','0','0','3629','18366','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21224','0','5293','0','5293','0','Tidewalker Depth-Seer',NULL,NULL,'71','71','143600','143600','48465','48465','5714','14','14','0','2','1','1','1701','3472','0','18107','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21224','0','0','0','0','0','0','0','0','38657','38658','38659','0','0','3716','18807','','0','3','0','1','0','619397115','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21226','0','1773','0','1773','0','Tidewalker Shaman',NULL,NULL,'71','71','143600','143699','48465','48465','5714','14','14','0','2','1','1','1513','3087','0','16096','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21226','0','0','0','0','0','0','0','0','39065','39066','39067','0','0','3627','18356','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21227','0','391','0','391','0','Tidewalker Harpooner',NULL,NULL,'71','71','179525','179525','0','0','7089','14','14','0','2','1','1','1832','3746','0','19523','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21227','0','0','0','0','0','0','0','0','38661','39060','39061','0','0','3606','18253','','0','3','0','1','0','619397115','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21228','0','5286','0','5286','0','Tidewalker Hydromancer',NULL,NULL,'71','71','143600','143600','48465','48465','5714','14','14','0','2','1','1','1513','3087','0','16096','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21228','0','0','0','0','0','0','0','0','39062','39063','39064','0','0','3630','18370','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21229','0','20640','0','20640','0','Greyheart Tidecaller',NULL,NULL,'71','71','143600','143600','48465','48465','5714','14','14','0','1','1','1','1890','3858','0','20118','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21229','0','0','0','0','0','0','0','0','39027','38624','0','0','0','3629','18364','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21230','0','20635','0','20635','0','Greyheart Nether-Mage',NULL,NULL,'71','71','143600','143600','48465','48465','5714','14','14','0','1','1','1','1513','3087','0','16096','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21230','0','0','0','0','0','0','0','0','38647','38634','38633','38642','0','3573','18084','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21231','0','20636','0','20636','0','Greyheart Shield-Bearer',NULL,NULL,'71','71','179525','179525','0','0','7089','14','14','0','1','1','1','2544','5203','0','27116','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21231','0','0','0','0','0','0','0','0','38631','38630','0','0','0','3693','18688','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21232','0','20637','0','20637','0','Greyheart Skulker',NULL,NULL,'71','71','179525','179525','0','0','5349','14','14','0','1','1','1','3562','7284','0','37961','2000','0','1','0','0','0','0','0','0','0','0','0','7','72','21232','0','0','0','0','0','0','0','0','38625','30798','0','0','0','3659','18518','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21260','0','5564','0','5564','0','Purified Water Elemental',NULL,NULL,'71','71','10772','10772','0','0','7089','14','14','0','1','1','1','305','624','0','3253','2000','0','1','0','0','0','0','0','0','0','0','0','4','72','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0','1','0','0','0','');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21863','0','20560','0','20560','0','Serpentshrine Lurker','',NULL,'70','70','104790','104790','0','0','6792','14','14','0','1','1','1','3003','6139','0','31997','2000','0','1','0','0','0','0','0','0','0','0','0','4','328','21863','0','80001','0','0','0','0','0','0','38655','38650','0','0','0','0','0','','0','3','0','1','0','0','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('21873','0','18384','0','18384','0','Coilfang Guardian',NULL,NULL,'70','70','69860','69860','0','0','6792','14','14','0','1','1','1','3003','6139','0','31997','2000','0','1','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','28168','9080','0','0','0','0','0','','0','3','0','1','0','0','0','mob_coilfang_guardian');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('22119','0','17754','0','17754','0','Fathom Lurker',NULL,NULL,'71','71','179525','179525','0','0','7089','14','14','0','1','1','1','2687','5495','0','28633','2000','0','1','0','0','0','0','0','0','0','0','0','4','64','0','0','0','0','0','0','0','0','0','25778','0','0','0','0','0','0','','0','3','0','1','0','648495103','0','mob_eventai');
-- insert into `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) values('22120','0','20833','0','20833','0','Fathom Sporebat',NULL,NULL,'71','71','179525','179525','0','0','7089','14','14','0','1','1','1','814','1665','0','8678','2000','0','1','0','33','0','0','0','0','0','0','0','1','73','0','0','0','0','0','0','0','0','0','25778','0','0','0','0','0','0','','0','3','0','1','0','648495103','0','');

--
-- WICHTIG DIESEN SCRIPT NUR EINMAL AUSF�HREN
--
-- UPDATE creature_template SET
-- mindmg = mindmg + (attackpower / 7),
-- maxdmg = maxdmg + (attackpower / 7),
-- attackpower = attackpower * 1.5
-- WHERE entry not in (21216,22035,22036,21215,21214,21966,21965,21964,21213,21920,21212) and entry in (SELECT id FROM creature WHERE map = 548);
--
-- UPDATE creature_template SET
-- mindmg = mindmg + (attackpower / 7),
-- maxdmg = maxdmg + (attackpower / 7),
-- attackpower = attackpower * 1.5
-- WHERE entry in (22119,22120) ;

