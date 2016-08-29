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
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (8,'Betting'),(1,'Big Mac'),(9,'Gaming'),(2,'McFlurry'),(10,'Vegas');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tasktype`
--

DROP TABLE IF EXISTS `tasktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasktype` (
  `tasktype_id` int(11) NOT NULL AUTO_INCREMENT,
  `tasktype_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tasktype_id`),
  UNIQUE KEY `tasktype_description` (`tasktype_description`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasktype`
--

LOCK TABLES `tasktype` WRITE;
/*!40000 ALTER TABLE `tasktype` DISABLE KEYS */;
INSERT INTO `tasktype` VALUES (1,'ate some food'),(4,'coding'),(2,'fried some chips'),(6,'squashed bugs'),(3,'sweeped floor'),(5,'testing');
/*!40000 ALTER TABLE `tasktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet` (
  `timesheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_first_day` date NOT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `authorized_on` datetime DEFAULT NULL,
  `authorized_by` int(11) DEFAULT NULL,
  `user_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`timesheet_id`),
  KEY `authorized_by` (`authorized_by`),
  KEY `user_number` (`user_number`),
  CONSTRAINT `authorized_by` FOREIGN KEY (`authorized_by`) REFERENCES `user` (`payroll_number`),
  CONSTRAINT `user_number` FOREIGN KEY (`user_number`) REFERENCES `user` (`payroll_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (1,'1995-03-23','1995-03-23 00:00:00','1995-03-24 00:00:00',1,2),(2,'1995-03-22','1995-03-22 00:00:00','1995-03-23 00:00:00',1,1),(3,'2016-03-22','2016-03-25 00:00:00','2016-03-26 00:00:00',2,3),(4,'2016-04-22','2016-04-30 00:00:00','2016-04-30 00:00:00',1,4);
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `payroll_number` int(11) NOT NULL,
  `forename` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`payroll_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Andrew','Prendergast','12345',1),(2,'Dave','Prendergast','12345',2),(3,'Alan','Bonham','al',1),(4,'Mo','Rashid','mo',1),(5,'Farrakh','Baig','fah',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-26 16:17:13
