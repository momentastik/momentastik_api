-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: localhost    Database: momentastik
-- ------------------------------------------------------
-- Server version	5.7.12-0ubuntu1.1

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
-- Table structure for table `Card`
--

DROP TABLE IF EXISTS `Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `urlImage` varchar(100) DEFAULT NULL,
  `idFather` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card`
--

LOCK TABLES `Card` WRITE;
/*!40000 ALTER TABLE `Card` DISABLE KEYS */;
INSERT INTO `Card` VALUES (1,'restaurant','/home/jaimescript/Escritorio/Blog/view/images/me.jpg',NULL),(2,'asiat','/home/jaimescript/Escritorio/Blog/view/images/love.png',1),(3,'playa','/home/jaimescript/Escritorio/Blog/view/images/favicon.png',NULL);
/*!40000 ALTER TABLE `Card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `subtitle` varchar(30) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `date` datetime NOT NULL,
  `longi` float(10,6) DEFAULT NULL,
  `lati` float(10,6) DEFAULT NULL,
  `scoreGlobal` float(2,1) DEFAULT NULL,
  `tlf` int(12) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `price` int(4) DEFAULT NULL,
  `maxUsers` int(3) DEFAULT NULL,
  `idPlace` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPlace` (`idPlace`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `Event_ibfk_1` FOREIGN KEY (`idPlace`) REFERENCES `Place` (`id`),
  CONSTRAINT `Event_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (1,'FIESHHHTA',NULL,NULL,'2016-07-13 13:10:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FavouriteEvent`
--

DROP TABLE IF EXISTS `FavouriteEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FavouriteEvent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUser` int(11) DEFAULT NULL,
  `idEvent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idEvent` (`idEvent`),
  CONSTRAINT `FavouriteEvent_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `User` (`id`),
  CONSTRAINT `FavouriteEvent_ibfk_2` FOREIGN KEY (`idEvent`) REFERENCES `Event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FavouriteEvent`
--

LOCK TABLES `FavouriteEvent` WRITE;
/*!40000 ALTER TABLE `FavouriteEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `FavouriteEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FavouritePlace`
--

DROP TABLE IF EXISTS `FavouritePlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FavouritePlace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUser` int(11) DEFAULT NULL,
  `idPlace` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idPlace` (`idPlace`),
  CONSTRAINT `FavouritePlace_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `User` (`id`),
  CONSTRAINT `FavouritePlace_ibfk_2` FOREIGN KEY (`idPlace`) REFERENCES `Place` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FavouritePlace`
--

LOCK TABLES `FavouritePlace` WRITE;
/*!40000 ALTER TABLE `FavouritePlace` DISABLE KEYS */;
/*!40000 ALTER TABLE `FavouritePlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageEvent`
--

DROP TABLE IF EXISTS `ImageEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageEvent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urlImage` varchar(100) NOT NULL,
  `idEvent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idEvent` (`idEvent`),
  CONSTRAINT `ImageEvent_ibfk_1` FOREIGN KEY (`idEvent`) REFERENCES `Event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageEvent`
--

LOCK TABLES `ImageEvent` WRITE;
/*!40000 ALTER TABLE `ImageEvent` DISABLE KEYS */;
INSERT INTO `ImageEvent` VALUES (1,'url:123',1);
/*!40000 ALTER TABLE `ImageEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImagePlace`
--

DROP TABLE IF EXISTS `ImagePlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImagePlace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urlImage` varchar(100) NOT NULL,
  `idPlace` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPlace` (`idPlace`),
  CONSTRAINT `ImagePlace_ibfk_1` FOREIGN KEY (`idPlace`) REFERENCES `Place` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImagePlace`
--

LOCK TABLES `ImagePlace` WRITE;
/*!40000 ALTER TABLE `ImagePlace` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImagePlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Place`
--

DROP TABLE IF EXISTS `Place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `longi` float(10,6) DEFAULT NULL,
  `lati` float(10,6) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Place`
--

LOCK TABLES `Place` WRITE;
/*!40000 ALTER TABLE `Place` DISABLE KEYS */;
INSERT INTO `Place` VALUES (1,'Mallorca',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R_CARD_EVENT`
--

DROP TABLE IF EXISTS `R_CARD_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_CARD_EVENT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEvent` int(11) DEFAULT NULL,
  `idCard` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idEvent` (`idEvent`),
  KEY `idCard` (`idCard`),
  CONSTRAINT `R_CARD_EVENT_ibfk_1` FOREIGN KEY (`idEvent`) REFERENCES `Event` (`id`),
  CONSTRAINT `R_CARD_EVENT_ibfk_2` FOREIGN KEY (`idCard`) REFERENCES `Card` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R_CARD_EVENT`
--

LOCK TABLES `R_CARD_EVENT` WRITE;
/*!40000 ALTER TABLE `R_CARD_EVENT` DISABLE KEYS */;
INSERT INTO `R_CARD_EVENT` VALUES (1,1,1);
/*!40000 ALTER TABLE `R_CARD_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R_CARD_PLACE`
--

DROP TABLE IF EXISTS `R_CARD_PLACE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_CARD_PLACE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPlace` int(11) DEFAULT NULL,
  `idCard` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPlace` (`idPlace`),
  KEY `idCard` (`idCard`),
  CONSTRAINT `R_CARD_PLACE_ibfk_1` FOREIGN KEY (`idPlace`) REFERENCES `Place` (`id`),
  CONSTRAINT `R_CARD_PLACE_ibfk_2` FOREIGN KEY (`idCard`) REFERENCES `Card` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R_CARD_PLACE`
--

LOCK TABLES `R_CARD_PLACE` WRITE;
/*!40000 ALTER TABLE `R_CARD_PLACE` DISABLE KEYS */;
INSERT INTO `R_CARD_PLACE` VALUES (1,1,1);
/*!40000 ALTER TABLE `R_CARD_PLACE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R_Card_User`
--

DROP TABLE IF EXISTS `R_Card_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_Card_User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCard` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCard` (`idCard`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `R_Card_User_ibfk_1` FOREIGN KEY (`idCard`) REFERENCES `Event` (`id`),
  CONSTRAINT `R_Card_User_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R_Card_User`
--

LOCK TABLES `R_Card_User` WRITE;
/*!40000 ALTER TABLE `R_Card_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `R_Card_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R_USER_EVENT_2`
--

DROP TABLE IF EXISTS `R_USER_EVENT_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R_USER_EVENT_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEvent` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idEvent` (`idEvent`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `R_USER_EVENT_2_ibfk_1` FOREIGN KEY (`idEvent`) REFERENCES `Event` (`id`),
  CONSTRAINT `R_USER_EVENT_2_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R_USER_EVENT_2`
--

LOCK TABLES `R_USER_EVENT_2` WRITE;
/*!40000 ALTER TABLE `R_USER_EVENT_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `R_USER_EVENT_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScoreCommentEvent`
--

DROP TABLE IF EXISTS `ScoreCommentEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScoreCommentEvent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` tinyint(5) DEFAULT NULL,
  `text` text,
  `idUser` int(11) DEFAULT NULL,
  `idEvent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idEvent` (`idEvent`),
  CONSTRAINT `ScoreCommentEvent_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `User` (`id`),
  CONSTRAINT `ScoreCommentEvent_ibfk_2` FOREIGN KEY (`idEvent`) REFERENCES `Event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScoreCommentEvent`
--

LOCK TABLES `ScoreCommentEvent` WRITE;
/*!40000 ALTER TABLE `ScoreCommentEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScoreCommentEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScoreCommentPlace`
--

DROP TABLE IF EXISTS `ScoreCommentPlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScoreCommentPlace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` tinyint(5) DEFAULT NULL,
  `text` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUser` int(11) DEFAULT NULL,
  `idPlace` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idPlace` (`idPlace`),
  CONSTRAINT `ScoreCommentPlace_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `User` (`id`),
  CONSTRAINT `ScoreCommentPlace_ibfk_2` FOREIGN KEY (`idPlace`) REFERENCES `Place` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScoreCommentPlace`
--

LOCK TABLES `ScoreCommentPlace` WRITE;
/*!40000 ALTER TABLE `ScoreCommentPlace` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScoreCommentPlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TypeUser`
--

DROP TABLE IF EXISTS `TypeUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TypeUser` (
  `type` enum('Admin','Moderator','User','Town_hall') NOT NULL DEFAULT 'User',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TypeUser`
--

LOCK TABLES `TypeUser` WRITE;
/*!40000 ALTER TABLE `TypeUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `TypeUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `userConfirmed` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(30) NOT NULL,
  `accountEnable` tinyint(1) NOT NULL DEFAULT '1',
  `typeUser` enum('Admin','Moderator','User','Town_hall') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeUser` (`typeUser`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`typeUser`) REFERENCES `TypeUser` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-15  9:57:18
