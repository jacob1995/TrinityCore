DELETE FROM `npc_vendor` WHERE `entry` IN (33963,33964) AND `item`=40864;
INSERT INTO `npc_vendor` (`entry`,`item`,`ExtendedCost`) VALUES 
(33963,40864,2631),
(33964,40864,2631);

UPDATE `creature_template` SET `faction_A`=2027,`faction_H`=2027 WHERE `entry` IN (33964,35494,31579,31580,35507);
