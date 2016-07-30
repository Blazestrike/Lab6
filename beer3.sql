-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: beer
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Current Database: `beer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `beer` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `beer`;

--
-- Table structure for table `beer`
--

DROP TABLE IF EXISTS `beer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beer` (
  `beerID` int(11) NOT NULL AUTO_INCREMENT,
  `beerName` varchar(255) DEFAULT NULL,
  `beerDescription` varchar(255) DEFAULT NULL,
  `beerLocationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`beerID`),
  KEY `beerLocationID` (`beerLocationID`),
  CONSTRAINT `beer_ibfk_1` FOREIGN KEY (`beerLocationID`) REFERENCES `location` (`beerLocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beer`
--

LOCK TABLES `beer` WRITE;
/*!40000 ALTER TABLE `beer` DISABLE KEYS */;
INSERT INTO `beer` VALUES (2,'Bear Republic Racer 5','IPA',1),(3,'Bells Oberon','wheat',2),(4,'Boddington\'s','Nitro',3);
/*!40000 ALTER TABLE `beer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funding`
--

DROP TABLE IF EXISTS `funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding` (
  `beerLocationID` int(11) DEFAULT NULL,
  `futureID` int(11) DEFAULT NULL,
  `fundingMetadata` blob,
  UNIQUE KEY `pkFunding` (`beerLocationID`,`futureID`),
  KEY `futureID` (`futureID`),
  CONSTRAINT `funding_ibfk_1` FOREIGN KEY (`beerLocationID`) REFERENCES `location` (`beerLocationID`),
  CONSTRAINT `funding_ibfk_2` FOREIGN KEY (`futureID`) REFERENCES `future` (`futureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funding`
--

LOCK TABLES `funding` WRITE;
/*!40000 ALTER TABLE `funding` DISABLE KEYS */;
/*!40000 ALTER TABLE `funding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `future`
--

DROP TABLE IF EXISTS `future`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `future` (
  `futureID` int(11) NOT NULL AUTO_INCREMENT,
  `futureName` varchar(55) DEFAULT NULL,
  `futureDescription` varchar(255) DEFAULT NULL,
  `futureExpireDate` date DEFAULT NULL,
  PRIMARY KEY (`futureID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `future`
--

LOCK TABLES `future` WRITE;
/*!40000 ALTER TABLE `future` DISABLE KEYS */;
INSERT INTO `future` VALUES (1,'\"Firestone Union Jack $147 1/2bbl\"','\" IPA\"','0000-00-00'),(2,'\"Russian River Pliney the Elder $354 1/2bbl\"','\" 2xIPA\"','0000-00-00'),(3,'\"Evil Genius I Love Lamp $154 1/2bbl\"','\" Pineapple Wheat\"','0000-00-00'),(4,'\"Oskar Blues Old Chubb $148 1/2bbl\"','\" Nitro Scotch Ale\"','0000-00-00');
/*!40000 ALTER TABLE `future` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `beerLocationID` int(11) NOT NULL AUTO_INCREMENT,
  `beerLocation` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`beerLocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'California'),(2,'Manchester'),(3,'Missouri');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-08 23:38:59
