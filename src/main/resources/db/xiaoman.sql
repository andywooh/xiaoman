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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1001,'三餐'),(2,1002,'交通'),(3,1003,'服装'),(4,1004,'其他'),(5,1005,'数码'),(6,1006,'还贷');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
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
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_catgory_id_idx` (`category_id`),
  CONSTRAINT `test` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 KEY_BLOCK_SIZE=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumption_detail`
--

LOCK TABLES `consumption_detail` WRITE;
/*!40000 ALTER TABLE `consumption_detail` DISABLE KEYS */;
INSERT INTO `consumption_detail` VALUES (1,'2013-12-11','电脑',4000.0,1005),(2,'2015-05-23','晚饭',102.0,1001),(3,'2016-03-18','杂项',78.0,1004),(5,'2017-09-24','手机IHONE 6s土豪金',1999.0,1005),(6,'2017-04-18','添加测试',22.0,1002),(27,'2017-04-28','测试2',23.0,1002),(28,'2017-04-78','中文明细and En111asd',9.9,1005),(34,'2017-04-28','中文',88.8,1004),(37,'2222','过的',43.0,1001),(38,'2017-05-02','dsa',21.0,1001),(39,'2017-05-02','21',3.0,1003),(40,'2017-05-02','das大ddd',213.0,1006),(41,'2017-05-02','s',22.0,1003),(42,'2017-05-02','dsa',2.0,1002),(43,'2017-05-02','s',2.0,1003),(44,'2017-05-02','sd',2.0,1002),(45,'2017-05-02','s',3.0,1001),(46,'2017-05-31','a',2.0,1001),(47,'2017-05-07','s',2.0,1001),(48,'2017-05-24','ssss',2.0,1002),(49,'2017-05-03','s',1.0,1001),(50,'2017-05-03','sssss',1.0,1001),(51,'2017-05-03','sssss',1.0,1001),(52,'2017-05-03','sssss',1.0,1001),(53,'2017-05-03','sssss',1.0,1001),(54,'2017-05-03','sssss',1.0,1001),(55,'2017-05-03','sssss',1.0,1001),(56,'2017-05-03','sssss',1.0,1001),(57,'2017-05-03','sssss',1.0,1001),(58,'2017-05-03','sssss',1.0,1001),(59,'2017-05-03','sssss',1.0,1001),(60,'2017-05-03','s',1.0,1001),(61,'2017-05-03','s',1.0,1001),(62,'2017-05-03','s',1.0,1001),(63,'2017-05-03','s',1.0,1001),(64,'2017-05-03','s',1.0,1001),(65,'2017-05-03','s',1.0,1001),(66,'2017-05-03','s',1.0,1001),(67,'2017-05-03','s',1.0,1001),(68,'2017-05-31','s',2.0,1002),(70,'2017-05-11','22222',222.0,1002),(73,'2017-05-03','22',1.0,1001),(75,'2017-06-01','s',2.0,1002),(77,'2016-06-09','s',2.0,1003),(78,'2016-06-09','s',2.0,1003),(79,'2016-06-09','s',2.0,1001),(80,'2017-06-30','sb',2.0,1002),(81,'2017-06-02','s',2.0,1001),(82,'2017-06-02','test',12.3,1006),(83,'2017-06-02','qq',2.0,1001),(85,'2017-06-02','ee',4.0,1005),(86,'2017-06-02','rr',5.0,1002),(87,'2017-06-02','tt',6.0,1004),(88,'2017-06-02','yy',7.0,1002),(89,'2017-06-02','uu',8.0,1001),(90,'2017-06-02','s222',2.0,1002),(91,'2017-06-06','dsa',23.0,1002),(92,'2017-06-06','321g',322.0,1006);
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
INSERT INTO `user` VALUES (1,1001,'admin','123',1);
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
INSERT INTO `user_role` VALUES (1,'admin','ROLE_ADMIN'),(2,'admin','ROLE_USER');
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

-- Dump completed on 2017-06-07 19:24:16
