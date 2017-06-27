-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: xiaoman
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(4) NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1001,'三餐'),(2,1002,'交通'),(3,1003,'服装'),(4,1004,'还贷'),(5,1005,'数码'),(6,1006,'其他'),(37,1008,'测试2'),(38,1009,'AA');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_bak`
--

DROP TABLE IF EXISTS `category_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_bak` (
  `id` int(11) DEFAULT NULL,
  `category_id` int(4) NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_bak`
--

LOCK TABLES `category_bak` WRITE;
/*!40000 ALTER TABLE `category_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumption_detail`
--

DROP TABLE IF EXISTS `consumption_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumption_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `occur_date` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `amount` decimal(10,1) DEFAULT NULL,
  `category_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 KEY_BLOCK_SIZE=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumption_detail`
--

LOCK TABLES `consumption_detail` WRITE;
/*!40000 ALTER TABLE `consumption_detail` DISABLE KEYS */;
INSERT INTO `consumption_detail` VALUES (1,'2013-12-11','电脑',4000.0,1005),(2,'2015-05-23','晚饭',102.0,1001),(3,'2016-03-18','杂项',78.0,1004),(5,'2017-09-24','手机IHONE 6s土豪金',1999.0,1005),(6,'2017-04-18','添加测试',22.0,1002),(34,'2017-04-28','中文',100.0,1009),(38,'2017-05-02','dsa正在cf',21.0,1001),(39,'2017-05-02','21',3.0,1003),(41,'2017-05-02','s',22.0,1003),(42,'2017-05-02','dsa',2.0,1002),(43,'2017-05-02','s',2.0,1003),(44,'2017-05-02','sd',2.0,1002),(45,'2017-05-02','s',3.0,1001),(47,'2017-05-07','s',2.0,1001),(48,'2017-05-24','ssss',2.0,1002),(49,'2017-05-03','s',1.0,1001),(50,'2017-05-03','sssss',1.0,1001),(51,'2017-05-03','sssss',1.0,1001),(52,'2017-05-03','sssss',1.0,1001),(53,'2017-05-03','sssss',1.0,1001),(54,'2017-05-03','sssss',1.0,1001),(55,'2017-05-03','sssss',1999.0,1001),(56,'2017-05-03','sssss',1.0,1001),(57,'2017-05-03','sssss',1.0,1001),(58,'2017-05-03','sssss',1.0,1001),(59,'2017-05-03','sssss',12345.6,1008),(60,'2017-05-03','s',1.0,1001),(61,'2017-05-03','s',1.0,1001),(62,'2017-05-03','s',1.0,1001),(63,'2017-05-03','s',1.0,1001),(64,'2017-05-03','s',1.0,1001),(65,'2017-05-03','s',1.0,1001),(66,'2017-05-03','s',1.0,1001),(67,'2017-05-03','s',1.0,1001),(68,'2017-05-31','s',2.0,1002),(70,'2017-05-11','22222',222.0,1002),(73,'2017-05-03','22',1.0,1001),(77,'2016-06-09','s',2.0,1003),(78,'2016-06-09','s',2.0,1003),(79,'2016-06-09','s',2.0,1001),(85,'2017-06-02','ee',4.0,1005),(86,'2017-06-02','rr',5.0,1002),(87,'2017-06-02','tt',6.0,1004),(88,'2017-06-02','yy',7.0,1002),(89,'2017-06-02','uu',8.0,1001),(91,'2017-06-06','dsa',23.0,1005),(99,'2017-06-09','手机',1999.0,1005),(100,'2017-06-09','房贷',2300.0,1006),(101,'2017-06-09','dsa',2.0,1002),(103,'2017-06-14','但是',22.0,1001),(104,'2017-06-14','dsa',22.0,1004),(106,'2017-06-14','bbbbbbbbbbbbbb',33.9,1008),(107,'2017-06-14','dsa',2.3,1003),(108,'2017-06-14','测试1',2.9,1001),(109,'2017-06-14','测试2',999.9,1003),(110,'2017-06-14','测试3',3.0,1005),(111,'2017-06-14','测试4',22.0,1008),(112,'2017-06-20','dsa',23.0,1004),(113,'2017-06-20','cxz',221.0,1002),(114,'2017-06-20','fdrs',44.0,1005),(115,'2017-06-20','ewq',55.0,1008),(116,'2017-06-20','aaa',22221.0,1002),(117,'2017-06-20','dsa',1.0,1002),(118,'2017-06-22','aa',4322.0,1004),(119,'2017-06-22','aa',432.0,1002),(120,'2017-06-22','aa',54.0,1005),(121,'2017-06-22','aa',65.0,1004),(122,'2017-06-22','aa22222222222',876.0,1004),(125,'2017-06-23','正在',32.0,1008),(126,'2017-06-23','谢谢',5.0,1003),(127,'2017-06-23','出错',6.0,1004),(128,'2017-06-23','方法',7.0,1004),(129,'2017-06-23','嘎嘎嘎',8.0,1006),(130,'2017-06-27','ss',100.0,1001),(131,'2017-06-27','sancan',100.0,1009),(132,'2017-06-27','ss',11.0,1009),(133,'2017-06-27','z在',1.0,1002),(134,'2017-06-27','dsa',6.0,1002),(135,'2017-06-27','zcx',5.0,1002),(136,'2017-06-27','nvb',4.0,1005),(137,'2017-06-27','vcx',3.0,1005),(138,'2017-06-27','bv',2.0,1002),(139,'2017-06-27','jhg',5.0,1006),(140,'2017-06-27','mnb',34.0,1005),(141,'2017-06-27','x操作',7.0,1002),(143,'2017-06-27','dsa',11111.0,1009);
/*!40000 ALTER TABLE `consumption_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1001,'xm','0627',1),(2,1002,'test','test',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'xm','ROLE_ADMIN'),(2,'xm','ROLE_USER'),(3,'test','ROLE_USER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-27 16:03:27
