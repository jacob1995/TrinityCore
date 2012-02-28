CREATE TABLE `chatticker` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(12) NOT NULL,
  `race` tinyint(3) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`)
);

CREATE TABLE `codes_item_loot` (
	`group_id` MEDIUMINT(10) NOT NULL DEFAULT '0' COMMENT 'Group that the items belong to',
	`item_id` MEDIUMINT(10) NOT NULL DEFAULT '0' COMMENT 'GUID of item',
	`name` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Name of Item',
	PRIMARY KEY (`group_id`, `item_id`)
);

DROP TABLE IF EXISTS `codes`;
CREATE TABLE `codes` (
  `npc_id` MEDIUMINT(10) NOT NULL,
  `code` VARCHAR(25) NOT NULL,
  `uses` TINYINT(3) NOT NULL,
  `item_id` MEDIUMINT(10) NOT NULL,
  `account_id` BIGINT(20) NOT NULL,
  `quantity` INT(20) NOT NULL,
  `char_guid` BIGINT(20) NOT NULL,
  `new_level` TINYINT(3) NOT NULL,
  PRIMARY KEY (`npc_id`,`code`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE `armory_character_stats` (
  `guid` int(11) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='World of Warcraft Armory table';

CREATE TABLE `character_feed_log` (
  `guid` int(11) NOT NULL,
  `type` smallint(1) NOT NULL,
  `data` int(11) NOT NULL,
  `date` int(11) default NULL,
  `counter` int(11) NOT NULL,
  `difficulty` smallint(6) default '-1',
  `item_guid` int(11) default '-1',
  PRIMARY KEY (`guid`,`type`,`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `armory_game_chart` (
  `gameid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `changeType` int(11) NOT NULL,
  `ratingChange` int(11) NOT NULL,
  `teamRating` int(11) NOT NULL,
  `damageDone` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `healingDone` int(11) NOT NULL,
  `damageTaken` int(11) NOT NULL,
  `healingTaken` int(11) NOT NULL,
  `killingBlows` int(11) NOT NULL,
  `mapId` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  PRIMARY KEY (`gameid`,`teamid`,`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='WoWArmory Game Chart';
