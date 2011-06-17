SET @GUID := 302685;

DELETE FROM `creature` WHERE `id`=33089;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'33089','603','3','16','0','0','1607.99','-289.992','417.321','5.89086','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+1,'33089','603','3','16','0','0','1620.23','-280.533','417.321','5.6097','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+2,'33089','603','3','16','0','0','1638.33','-278.895','417.321','4.49364','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+3,'33089','603','3','16','0','0','1654.22','-288.583','417.321','4.0656','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+4,'33089','603','3','16','0','0','1661.51','-309.099','417.321','4.28944','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+5,'33089','603','3','16','0','0','1653.98','-327.001','417.321','3.5598','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+6,'33089','603','3','16','0','0','1640.12','-336.194','417.321','1.68663','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+7,'33089','603','3','16','0','0','1621.68','-333.91','417.321','2.40134','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+8,'33089','603','3','16','0','0','1605.45','-320.182','417.321','0.444129','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+9,'33089','603','3','16','0','0','1602.23','-303.377','417.321','6.13041','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+10,'33089','603','3','16','0','0','1617.7','-309.616','417.321','0.204581','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+11,'33089','603','3','16','0','0','1623.68','-295.429','417.321','5.30967','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+12,'33089','603','3','16','0','0','1641.17','-296.46','417.321','4.12137','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+13,'33089','603','3','16','0','0','1644.9','-313.288','417.321','2.7587','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+14,'33089','603','3','16','0','0','1630.54','-319.732','417.321','1.53034','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+15,'33089','603','3','16','0','0','1633.07','-306.294','417.321','1.53505','10','10','0','37800','0','0','1','0','0','0');

UPDATE `creature_template` SET `dmg_multiplier`=4 WHERE `entry`=33089;
UPDATE `creature_template` SET `dmg_multiplier`=7 WHERE `entry`=34221;
UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=34097;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=34222;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62168,64417);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62168, 'spell_algalon_phased'),
(64417, 'spell_algalon_phased');
