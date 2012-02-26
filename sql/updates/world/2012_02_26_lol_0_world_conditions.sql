DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62560;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,7,62560,0,0,31,0,3,32876,0,0,0,'',NULL),
(13,7,62560,0,1,31,0,3,32904,0,0,0,'',NULL),
(13,7,62560,0,2,31,0,3,32878,0,0,0,'',NULL),
(13,7,62560,0,3,31,0,3,32877,0,0,0,'',NULL),
(13,7,62560,0,4,31,0,3,32874,0,0,0,'',NULL),
(13,7,62560,0,5,31,0,3,32875,0,0,0,'',NULL),
(13,7,62560,0,6,31,0,3,33110,0,0,0,'',NULL);
