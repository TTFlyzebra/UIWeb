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
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edittime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
INSERT INTO `fly_cell` VALUES (1,75,'',198,195,'/myweb/ui/public/uploads/98/5da12c1afcb2b7bfdc386b7fb2ddbe.png','','',0,'',0,NULL,NULL,1,255,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-30 09:30:31','2017-10-30 09:30:31',0,'0.0.0.0'),(2,75,'',229,220,'/myweb/ui/public/uploads/1c/9bb05df498a27f2170a4f43f64b849.png','','',0,'',0,NULL,NULL,1,255,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-01 17:12:10','2017-11-01 17:12:10',0,'0.0.0.0'),(3,75,'',426,585,'/myweb/ui/public/uploads/2d/aabc960f1fca0996937cc634c0e0d4.png','','',0,'',0,NULL,NULL,1,255,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-02 11:39:35','2017-11-02 11:39:35',0,'0.0.0.0');
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
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edittime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
INSERT INTO `fly_celltype` VALUES (75,1,'图片文本','/myweb/ui/public/uploads/98/5da12c1afcb2b7bfdc386b7fb2ddbe.png','','','','','可以同时显示图片和文本的控件。','2017-10-24 09:34:19','2017-10-24 09:34:19',0,'0.0.0.0'),(76,2,'视频播放','/myweb/ui/public/uploads/9a/3826de18a58cdd7fcb5c0c42abd2d8.gif','播放地址','播放接口','循环播放','','小视频窗口控件，播放地址指定视频流位置，播放接口指定获取一组视频流的地址(接口数据格式为JSON{name:\"\";url:\"\";msg:\"\";ret:\"\"})。','2017-10-24 09:43:24','2017-10-24 09:43:24',0,'0.0.0.0'),(81,3,'轮播控件','/myweb/ui/public/uploads/39/5335689f562aeadff38c3b743f6960.png','图片列表','','','','','2017-10-24 09:53:11','2017-10-24 09:53:11',0,'0.0.0.0'),(86,4,'组合控件','/myweb/ui/public/uploads/2d/aabc960f1fca0996937cc634c0e0d4.png','','','','','周围可以弹出6个展示图片的控件。','2017-11-02 11:49:00','2017-11-02 11:49:00',0,'0.0.0.0');
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
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edittime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edittime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
INSERT INTO `fly_table` VALUES (2,'主页面','/myweb/ui/public/uploads/13/bb3a0260c78cba6b0cd071f39a5a9c.png','','2017-11-02 16:39:24','2017-11-02 16:39:24',0,'0.0.0.0'),(3,'陕西TV','','','2017-11-02 17:55:23','2017-11-02 17:55:23',0,'0.0.0.0');
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
  `remark` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly_tablecell`
--

LOCK TABLES `fly_tablecell` WRITE;
/*!40000 ALTER TABLE `fly_tablecell` DISABLE KEYS */;
INSERT INTO `fly_tablecell` VALUES (3,2,769,532,229,220,NULL),(3,1,1171,397,198,195,NULL),(3,3,214,183,426,585,NULL),(3,1,1171,397,198,195,NULL),(3,2,769,532,229,220,NULL),(2,2,1540,160,229,220,NULL),(2,1,1177,454,198,195,NULL),(2,2,1540,160,229,220,NULL),(2,2,454,460,229,220,NULL);
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
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edittime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edittime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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

-- Dump completed on 2017-11-03 13:56:11
