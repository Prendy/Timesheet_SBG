-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: work_time
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `taskrow`
--

DROP TABLE IF EXISTS `taskrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskrow` (
  `project_id` int(11) NOT NULL,
  `tasktype_id` int(11) NOT NULL,
  `timesheet_id` int(11) NOT NULL,
  `mon_hours` float DEFAULT '0',
  `tue_hours` float DEFAULT '0',
  `wed_hours` float DEFAULT '0',
  `thu_hours` float DEFAULT '0',
  `fri_hours` float DEFAULT '0',
  `sat_hours` float DEFAULT '0',
  `sun_hours` float DEFAULT '0',
  PRIMARY KEY (`project_id`,`tasktype_id`,`timesheet_id`),
  KEY `tasktype_id` (`tasktype_id`),
  KEY `timesheet_id` (`timesheet_id`),
  CONSTRAINT `project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `tasktype_id` FOREIGN KEY (`tasktype_id`) REFERENCES `tasktype` (`tasktype_id`),
  CONSTRAINT `timesheet_id` FOREIGN KEY (`timesheet_id`) REFERENCES `timesheet` (`timesheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskrow`
--

LOCK TABLES `taskrow` WRITE;
/*!40000 ALTER TABLE `taskrow` DISABLE KEYS */;
INSERT INTO `taskrow` VALUES (1,1,1,6,6,6,6,6,0,0),(2,2,2,7,7,7,7,7,0,0),(8,5,3,5,5,5,5,5,1,1),(10,5,3,3,5,7,8,3,2,2);
/*!40000 ALTER TABLE `taskrow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-26 16:12:28
