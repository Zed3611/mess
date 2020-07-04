-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: newschema
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `lastSessionId` varchar(40) DEFAULT NULL,
  `contacts` json DEFAULT NULL,
  PRIMARY KEY (`userId`,`login`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','pgjbp40cmm3g69g79rcvfqd3qq2mgete','[\"notAdmin\"]'),(2,'notAdmin','7ca6f163aefdcf5a09c74c43c6e72535','qsh8j09faoum2jrd0lskk93m1nchs9ut','[\"admin\"]');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `contentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`contentId`),
  UNIQUE KEY `contentId_UNIQUE` (`contentId`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,'123'),(2,'q'),(3,'w'),(4,'e'),(5,'r'),(6,'t'),(7,'y'),(8,'u'),(9,'i'),(10,'o'),(11,'p'),(12,'['),(13,']'),(14,'a'),(15,'s'),(16,'d'),(17,'f'),(18,'g'),(19,'h'),(20,'j'),(21,'k'),(22,'l'),(23,';'),(24,'z'),(25,'x'),(26,'c'),(27,'v'),(28,'b'),(29,'n'),(30,'m'),(31,','),(32,'.'),(33,'/'),(34,'1'),(35,'2'),(36,'3'),(37,'4'),(38,'5'),(39,'6'),(40,'7'),(41,'8'),(42,'9'),(43,'0'),(44,'-'),(45,'='),(46,'й'),(47,'ц'),(48,'у'),(49,'к'),(50,'е'),(51,'н'),(52,'г'),(53,'ш'),(54,'щ'),(55,'з'),(56,'х'),(57,'ъ'),(58,'ф'),(59,'ы'),(60,'в'),(61,'а'),(62,'п'),(63,'р'),(64,'о'),(65,'л'),(66,'д'),(67,'ж'),(68,'э'),(69,'я'),(70,'ч'),(71,'с'),(72,'м'),(73,'и'),(74,'т'),(75,'ь'),(76,'б'),(77,'ю'),(78,'.'),(79,'ооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооочень длиииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииииинное соооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооообщение'),(80,'не очень длинное сообщение');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `messageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `toLogin` varchar(45) NOT NULL,
  `fromLogin` varchar(45) NOT NULL,
  `contentId` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`messageId`),
  UNIQUE KEY `messageId_UNIQUE` (`messageId`),
  UNIQUE KEY `contentId_UNIQUE` (`contentId`),
  CONSTRAINT `contentId` FOREIGN KEY (`contentId`) REFERENCES `contents` (`contentId`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'notAdmin','admin',1,'2020-07-04 13:23:41'),(2,'notAdmin','admin',2,'2020-07-04 13:24:00'),(3,'notAdmin','admin',3,'2020-07-04 13:24:01'),(4,'notAdmin','admin',4,'2020-07-04 13:24:01'),(5,'notAdmin','admin',5,'2020-07-04 13:24:01'),(6,'notAdmin','admin',6,'2020-07-04 13:24:02'),(7,'notAdmin','admin',7,'2020-07-04 13:24:02'),(8,'notAdmin','admin',8,'2020-07-04 13:24:02'),(9,'notAdmin','admin',9,'2020-07-04 13:24:03'),(10,'notAdmin','admin',10,'2020-07-04 13:24:03'),(11,'notAdmin','admin',11,'2020-07-04 13:24:03'),(12,'notAdmin','admin',12,'2020-07-04 13:24:03'),(13,'notAdmin','admin',13,'2020-07-04 13:24:04'),(14,'notAdmin','admin',14,'2020-07-04 13:24:04'),(15,'notAdmin','admin',15,'2020-07-04 13:24:05'),(16,'notAdmin','admin',16,'2020-07-04 13:24:05'),(17,'notAdmin','admin',17,'2020-07-04 13:24:05'),(18,'notAdmin','admin',18,'2020-07-04 13:24:05'),(19,'notAdmin','admin',19,'2020-07-04 13:24:06'),(20,'notAdmin','admin',20,'2020-07-04 13:24:06'),(21,'notAdmin','admin',21,'2020-07-04 13:24:06'),(22,'notAdmin','admin',22,'2020-07-04 13:24:06'),(23,'notAdmin','admin',23,'2020-07-04 13:24:07'),(24,'notAdmin','admin',24,'2020-07-04 13:24:08'),(25,'notAdmin','admin',25,'2020-07-04 13:24:08'),(26,'notAdmin','admin',26,'2020-07-04 13:24:08'),(27,'notAdmin','admin',27,'2020-07-04 13:24:09'),(28,'notAdmin','admin',28,'2020-07-04 13:24:09'),(29,'notAdmin','admin',29,'2020-07-04 13:24:09'),(30,'notAdmin','admin',30,'2020-07-04 13:24:09'),(31,'notAdmin','admin',31,'2020-07-04 13:24:10'),(32,'notAdmin','admin',32,'2020-07-04 13:24:10'),(33,'notAdmin','admin',33,'2020-07-04 13:24:10'),(34,'notAdmin','admin',34,'2020-07-04 13:24:20'),(35,'notAdmin','admin',35,'2020-07-04 13:24:20'),(36,'notAdmin','admin',36,'2020-07-04 13:24:21'),(37,'notAdmin','admin',37,'2020-07-04 13:24:21'),(38,'notAdmin','admin',38,'2020-07-04 13:24:21'),(39,'notAdmin','admin',39,'2020-07-04 13:24:22'),(40,'notAdmin','admin',40,'2020-07-04 13:24:22'),(41,'notAdmin','admin',41,'2020-07-04 13:24:22'),(42,'notAdmin','admin',42,'2020-07-04 13:24:22'),(43,'notAdmin','admin',43,'2020-07-04 13:24:23'),(44,'notAdmin','admin',44,'2020-07-04 13:24:24'),(45,'notAdmin','admin',45,'2020-07-04 13:24:24'),(46,'notAdmin','admin',46,'2020-07-04 13:24:27'),(47,'notAdmin','admin',47,'2020-07-04 13:24:27'),(48,'notAdmin','admin',48,'2020-07-04 13:24:27'),(49,'notAdmin','admin',49,'2020-07-04 13:24:28'),(50,'notAdmin','admin',50,'2020-07-04 13:24:28'),(51,'notAdmin','admin',51,'2020-07-04 13:24:28'),(52,'notAdmin','admin',52,'2020-07-04 13:24:29'),(53,'notAdmin','admin',53,'2020-07-04 13:24:29'),(54,'notAdmin','admin',54,'2020-07-04 13:24:29'),(55,'notAdmin','admin',55,'2020-07-04 13:24:30'),(56,'notAdmin','admin',56,'2020-07-04 13:24:30'),(57,'notAdmin','admin',57,'2020-07-04 13:24:30'),(58,'notAdmin','admin',58,'2020-07-04 13:24:31'),(59,'notAdmin','admin',59,'2020-07-04 13:24:31'),(60,'notAdmin','admin',60,'2020-07-04 13:24:31'),(61,'notAdmin','admin',61,'2020-07-04 13:24:32'),(62,'notAdmin','admin',62,'2020-07-04 13:24:32'),(63,'notAdmin','admin',63,'2020-07-04 13:24:32'),(64,'notAdmin','admin',64,'2020-07-04 13:24:33'),(65,'notAdmin','admin',65,'2020-07-04 13:24:33'),(66,'notAdmin','admin',66,'2020-07-04 13:24:33'),(67,'notAdmin','admin',67,'2020-07-04 13:24:34'),(68,'notAdmin','admin',68,'2020-07-04 13:24:34'),(69,'notAdmin','admin',69,'2020-07-04 13:24:34'),(70,'notAdmin','admin',70,'2020-07-04 13:24:35'),(71,'notAdmin','admin',71,'2020-07-04 13:24:35'),(72,'notAdmin','admin',72,'2020-07-04 13:24:35'),(73,'notAdmin','admin',73,'2020-07-04 13:24:36'),(74,'notAdmin','admin',74,'2020-07-04 13:24:36'),(75,'notAdmin','admin',75,'2020-07-04 13:24:37'),(76,'notAdmin','admin',76,'2020-07-04 13:24:37'),(77,'notAdmin','admin',77,'2020-07-04 13:24:37'),(78,'notAdmin','admin',78,'2020-07-04 13:24:40'),(79,'notAdmin','admin',79,'2020-07-04 13:51:02'),(80,'admin','notAdmin',80,'2020-07-04 13:51:32');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'newschema'
--
/*!50003 DROP PROCEDURE IF EXISTS `addMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `addMessage`($msg varchar(1000), $fromLogin varchar(45), $toLogin varchar(45))
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    START TRANSACTION;
    insert contents (content) values ($msg);
	insert messages (toLogin, fromLogin, contentId, date) 
		values ($toLogin, $fromLogin, (select max(contentId) from contents), now());
    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
        select date from messages where(messageId = LAST_INSERT_ID());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `addUser`($toWhom varchar(45), $Whom varchar(45))
update accounts set contacts=
JSON_ARRAY_INSERT((select contacts from accounts where login=$toWhom), '$', $Whom) where (login=$toWhom) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMessages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getMessages`($userId1 int, $userId2 int, $lim int)
select toId, fromId, date, content from messages as mes
left outer join contents as con on mes.contentId=con.contentId
where ((toId=$userId1 or fromId=$userId1) and (toId=$userId2 or fromId=$userId2))
order by mes.messageId desc
limit $lim ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMessagesLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getMessagesLogin`($login1 varchar(45), $login2 varchar(45), $lim int)
select toLogin, fromLogin, date, content from messages as mes
left outer join contents as con on mes.contentId=con.contentId
where ((toLogin=$login1 or fromLogin=$login1) and (toLogin=$login2 or fromLogin=$login2))
order by mes.messageId desc
limit $lim ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMessagesNewer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getMessagesNewer`($login1 varchar(45), $login2 varchar(45), $date datetime, $lim int)
select toLogin, fromLogin, date, content from messages as mes
left outer join contents as con on mes.contentId=con.contentId
where ((toLogin=$login1 or fromLogin=$login1) and (toLogin=$login2 or fromLogin=$login2)
and (mes.date > $date))
order by mes.messageId desc
limit $lim ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMessagesOlder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getMessagesOlder`($login1 varchar(45), $login2 varchar(45), $date datetime, $lim int)
select toLogin, fromLogin, date, content from messages as mes
left outer join contents as con on mes.contentId=con.contentId
where ((toLogin=$login1 or fromLogin=$login1) and (toLogin=$login2 or fromLogin=$login2)
and (mes.date < $date))
order by mes.messageId desc
limit $lim ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getUsers`($login varchar(45))
select login from accounts where(login like concat($login, '%')) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-04 13:52:16
