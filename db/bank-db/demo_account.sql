-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountNumber` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `accountType` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `registrationDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`accountNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=100013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (100000,'john','Gebre','1000 N 4th','FairField','Alaska ','12345','john','John1234','641-233-2222','checking ','test@bank.com',500,'Wed Apr 15 15:15:54 CDT 2020'),(100001,'Gebre','Haile','1000 N 4th st','Fairfield','Iowa','52557','gebre','12345','6414513245','Checking','gebreonline@gmail.com',351,'2020-02-10'),(100002,'Yosef','Birhane','1000 N 4th st','Fairfield','Chicago','52557','yosef','12345','6565626266','Checking','gebreonline@gmail.com',650,'2020-02-15'),(100003,'john','smith','1000 N 4th','FairField','Alaska ','12345','john','John1234','641-233-2222','checking ','test@bank.com',500,'Wed Apr 15 15:48:46 CDT 2020'),(100004,'john','Gebreegziyabher','1000 N 4th','FairField','Alaska ','12345','john','John1234','641-233-2222','checking ','test@bank.com',500,'Wed Apr 15 15:50:53 CDT 2020'),(100005,'Joe','Gebreegziyabher','1000 N 4th','FairField','Alaska ','12345','john','John1234','641-233-2222','checking ','test@bank.com',500,'Wed Apr 15 15:54:25 CDT 2020'),(100006,'smith','Gebre','1000 N 4th','FairField','Alaska ','12345','johny','John1234','641-233-2222','checking ','test@bank.com',500,'Wed Apr 15 16:08:24 CDT 2020'),(100007,'myname','Gebre','1000 N 4th','FairField','Alaska ','12345','mynGe914','Gemyn914','641-233-2222','checking ','test@bank.com',500,'Wed Apr 15 16:13:38 CDT 2020'),(100008,'Joe','Gebreegziyabher','1000 N 4th','FairField','Alaska ','12345','JoeGe876','GeJoe1050','641-233-2222','checking ','test@bank.com',500,'Wed Apr 15 16:17:51 CDT 2020'),(100009,'Birhane','Gebreegziyabher','1000 N 4th','FairField','Alaska ','12345','BirGe245','GeBir522','641-233-2222','checking ','test@bank.com',139,'Wed Apr 15 16:21:56 CDT 2020'),(100010,'Birhaneeee','Gebreegziyabher','1000 N 4th','FairField','Alaska ','12345','BirGe209','GeBir567','641-233-2222','checking ','test@bank.com',500,'Wed Apr 15 16:24:58 CDT 2020'),(100011,'my account','Gebre','1000 N 4th','FairField','Alaska ','12345','my Ge429','Gemy 955','641-233-2222','checking ','test@bank.com',500,'2020/04/15'),(100012,'Gebreegziyahbher','Gebre','1000 N 4th','FairField','Alaska ','12345','GebGe810','GeGeb448','641-233-2222','saving ','test@bank.com',500,'16-04-2020');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-16 21:04:50
