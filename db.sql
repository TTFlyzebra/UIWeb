-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: flyui
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `fly_cell`
--

DROP TABLE IF EXISTS `fly_cell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fly_cell` (
  `cellId` int(11) NOT NULL AUTO_INCREMENT,
  `celltypeId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `imageurl1` varchar(255) NOT NULL,
  `imageurl2` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `textsize` int(11) DEFAULT '24',
  `textcolor` char(9) DEFAULT '#FFFFFFFF',
  `textposition` int(8) DEFAULT '1',
  `textfont` varchar(255) DEFAULT NULL,
  `action` varchar(1024) DEFAULT NULL,
  `canfocus` tinyint(1) NOT NULL DEFAULT '1',
  `alpha` int(11) NOT NULL DEFAULT '255',
  `margintop` int(11) NOT NULL DEFAULT '0',
  `marginbottom` int(11) NOT NULL DEFAULT '0',
  `marginleft` int(11) NOT NULL DEFAULT '0',
  `marginright` int(11) NOT NULL DEFAULT '0',
  `issub` tinyint(1) NOT NULL DEFAULT '0',
  `subcelllist` text,
  `remark` text,
  `extend1` varchar(255) DEFAULT NULL,
  `extend2` varchar(255) DEFAULT NULL,
  `extend3` varchar(255) DEFAULT NULL,
  `extend4` varchar(255) DEFAULT NULL,
  `createtime` timestamp NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) DEFAULT NULL,
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`cellId`),
  KEY `id` (`cellId`),
  KEY `type` (`celltypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly_cell`
--

LOCK TABLES `fly_cell` WRITE;
/*!40000 ALTER TABLE `fly_cell` DISABLE KEYS */;
/*!40000 ALTER TABLE `fly_cell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fly_celltype`
--

DROP TABLE IF EXISTS `fly_celltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fly_celltype` (
  `celltypeId` int(11) NOT NULL AUTO_INCREMENT,
  `celltype` int(11) NOT NULL DEFAULT '0',
  `celltypename` varchar(255) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `extend1name` varchar(255) DEFAULT NULL,
  `extend2name` varchar(255) DEFAULT NULL,
  `extend3name` varchar(255) DEFAULT NULL,
  `extend4name` varchar(255) DEFAULT NULL,
  `remark` text,
  `createtime` timestamp NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`celltypeId`),
  UNIQUE KEY `celltype` (`celltype`),
  KEY `celltypeId` (`celltypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly_celltype`
--

LOCK TABLES `fly_celltype` WRITE;
/*!40000 ALTER TABLE `fly_celltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `fly_celltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fly_event`
--

DROP TABLE IF EXISTS `fly_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fly_event` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) NOT NULL,
  `packname` varchar(255) NOT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `data` text,
  `createtime` timestamp NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly_event`
--

LOCK TABLES `fly_event` WRITE;
/*!40000 ALTER TABLE `fly_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `fly_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fly_table`
--

DROP TABLE IF EXISTS `fly_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fly_table` (
  `tableId` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(255) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `remark` text,
  `createtime` timestamp NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) DEFAULT NULL,
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`tableId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly_table`
--

LOCK TABLES `fly_table` WRITE;
/*!40000 ALTER TABLE `fly_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `fly_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fly_tablecell`
--

DROP TABLE IF EXISTS `fly_tablecell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fly_tablecell` (
  `tableId` int(11) NOT NULL,
  `cellId` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `remark` text,
  KEY `tableId` (`tableId`),
  KEY `cellId` (`cellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly_tablecell`
--

LOCK TABLES `fly_tablecell` WRITE;
/*!40000 ALTER TABLE `fly_tablecell` DISABLE KEYS */;
/*!40000 ALTER TABLE `fly_tablecell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fly_template`
--

DROP TABLE IF EXISTS `fly_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fly_template` (
  `templateId` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(64) NOT NULL,
  `templatetype` int(11) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `remark` text,
  `createtime` timestamp NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`templateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly_template`
--

LOCK TABLES `fly_template` WRITE;
/*!40000 ALTER TABLE `fly_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `fly_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fly_user`
--

DROP TABLE IF EXISTS `fly_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fly_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` int(11) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remark` int(11) DEFAULT NULL,
  `createtime` timestamp NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly_user`
--

LOCK TABLES `fly_user` WRITE;
/*!40000 ALTER TABLE `fly_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `fly_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-03 16:59:57
