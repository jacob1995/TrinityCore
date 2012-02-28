DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62400;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,62400,0,0,31,0,3,33060,0,0,0,'',NULL),
(13,1,62400,0,1,31,0,3,33062,0,0,0,'',NULL),
(13,1,62400,0,2,31,0,3,33109,0,0,0,'',NULL),
(13,1,62400,0,3,31,0,144,0,0,0,0,'',NULL);
