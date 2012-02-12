DROP TABLE IF EXISTS `account_authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_authenticator` (
  /* Account.ID */
  `id` int(11) unsigned NOT NULL,
  /*                                        D83C6E08FFE5675B59EACBB14BEEFFAC952F4448 */
  `secretkey` VARCHAR(40) NOT NULL DEFAULT '---------SecretKeyFromBlizzard----------',
  /*                                     EU-1201-1949-9414 */
  `serial` VARCHAR(17) NOT NULL DEFAULT '12-3456-7890-1234',
  /*                                          E435799JH3 -- uppercase */
  `restorecode` VARCHAR(10) NOT NULL DEFAULT '1234567890',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
