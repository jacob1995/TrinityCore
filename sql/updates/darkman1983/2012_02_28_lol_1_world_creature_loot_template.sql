UPDATE `creature_template` SET `lootid`=`entry` WHERE `entry` IN (32297,31702,31321,30921,32349);
DELETE FROM `creature_loot_template` WHERE `item` IN (44564,37331,44559,44565,44568);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
-- Recipe: Mighty Arcane Protection Potion
(32297,44564,1,1,0,1,1),
(31702,44564,1,1,0,1,1),
-- Formula: Enchant Cloak - Superior Fire Resistance
(31321,37331,1,1,0,1,1),
(30921,37331,1,1,0,1,1),
-- Pattern: Fur Lining - Fire Resist
(31321,44559,1,1,0,1,1),
(30921,44559,1,1,0,1,1),
-- Recipe: Mighty Fire Protection Potion
(31321,44565,1,1,0,1,1),
(30921,44565,1,1,0,1,1),
-- Recipe: Mighty Shadow Protection Potion
(32349,44568,1,1,0,1,1);
