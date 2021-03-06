DELETE FROM `gameobject_loot_template` WHERE `entry`=27079 AND `item`=1;
UPDATE `gameobject_loot_template` SET `lootmode`=1 WHERE `entry`=26962 AND `lootmode`=2;

-- leviathan workaround
DELETE FROM `gameobject_template` WHERE `entry` IN (500005,500006);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
('500005','3','8686','Cache of Safe Loot','','','','0','0','5','0','0','0','0','0','0','1634','40001','0','1','0','0','0','0','0','0','1','1','1','1','0','1','0','0','0','0','0','0','0','0','','','1'),
('500006','3','8686','Cache of Safe Loot','','','','0','0','5','0','0','0','0','0','0','1634','40002','0','1','0','0','0','0','0','0','1','1','1','1','0','1','0','0','0','0','0','0','0','0','','','1');

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (40001,40002);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- 10
('40001','1','100','1','0','-34116','2'),
('40001','2','100','2','0','-34116','1'),
('40001','3','100','4','0','-34117','1'),
('40001','4','100','8','0','-34118','1'),
('40001','5','100','16','0','-34116','1'),
('40001','40753','100','1','0','1','1'),
('40001','45912','0.1','1','0','1','1'),
-- 25
('40002','1','100','1','0','-34157','3'),
('40002','2','100','2','0','-34157','1'),
('40002','3','100','4','0','-34158','1'),
('40002','4','100','8','0','-34159','1'),
('40002','5','10','1','0','-34154','1'),
('40002','45038','8','1','0','1','1'),
('40002','45087','75','1','0','1','1'),
('40002','45132','0','16','1','1','1'),
('40002','45133','0','16','1','1','1'),
('40002','45134','0','16','1','1','1'),
('40002','45135','0','16','1','1','1'),
('40002','45136','0','16','1','1','1'),
('40002','45624','100','1','0','1','1'),
('40002','45912','0.1','1','0','1','1');
