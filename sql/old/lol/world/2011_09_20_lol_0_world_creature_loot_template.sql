UPDATE `creature_template` SET `lootid`=34920 WHERE `entry`=34920;

DELETE FROM `creature_loot_template` WHERE `entry`=34920 AND `item`=46889;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(34920,46889,-100,1,0,1,1); -- Jormungar Egg Sac
