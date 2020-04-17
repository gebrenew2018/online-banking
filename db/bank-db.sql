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

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionId` int NOT NULL AUTO_INCREMENT,
  `ownerAccount` varchar(45) DEFAULT NULL,
  `transactionType` varchar(45) DEFAULT NULL,
  `targetAccount` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `transactionDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (3,'100001','Checking','100001','1500.00','Gebre','Wed Apr 15 22:00:38 CDT 2020'),(4,'100001','Deposit','100001','1500.00','Gebre','Wed Apr 15 22:05:23 CDT 2020'),(5,'100001','Withdraw','100001','1500.00','Gebre','Wed Apr 15 22:23:03 CDT 2020'),(6,'100001','Withdraw','100001','4500','Gebre','Wed Apr 15 22:24:00 CDT 2020'),(7,'100001','Withdraw','100001','100','Gebre','Wed Apr 15 22:43:40 CDT 2020'),(8,'100001','Withdraw','100009','100','Gebre','Wed Apr 15 22:45:50 CDT 2020'),(9,'100001','Transfer','100009','100','Gebre','Wed Apr 15 22:46:42 CDT 2020'),(10,'100009','Transfer','100001','300.00','Gebre','Wed Apr 15 22:47:59 CDT 2020'),(11,'100001','Withdraw','100001','100.00','Gebre','Wed Apr 15 23:00:02 CDT 2020'),(12,'100001','Withdraw','100001','160.00','Gebre','Wed Apr 15 23:00:33 CDT 2020'),(13,'100001','Deposit','100001','100.00','Gebre','Wed Apr 15 23:28:54 CDT 2020'),(14,'100001','Withdraw','100001','50.00','Gebre','Wed Apr 15 23:38:23 CDT 2020'),(15,'100001','Transfer','100009','10',NULL,'Thu Apr 16 03:39:47 CDT 2020'),(16,'100001','Transfer','100009','10',NULL,'Thu Apr 16 03:42:12 CDT 2020'),(17,'100001','Transfer','100009','10',NULL,'Thu Apr 16 03:45:40 CDT 2020'),(18,'100001','Transfer','100009','5',NULL,'Thu Apr 16 03:51:09 CDT 2020'),(19,'100001','Transfer','100009','3',NULL,'Thu Apr 16 04:02:16 CDT 2020'),(20,'100001','Transfer','100009','1',NULL,'Thu Apr 16 04:04:51 CDT 2020'),(21,'100009','Transfer','100001','100.00',NULL,'Thu Apr 16 04:09:51 CDT 2020'),(22,'100009','Transfer','100001','100.00',NULL,'Thu Apr 16 04:10:58 CDT 2020'),(23,'100001','Transfer','100009','100.00','teller1','Thu Apr 16 10:26:24 CDT 2020'),(24,'100001','Withdraw','100001','100.00','teller1','Thu Apr 16 10:27:10 CDT 2020'),(25,'100009','Transfer','100001','100.00',NULL,'Thu Apr 16 10:29:13 CDT 2020'),(26,'100002','Transfer','100001','100.00',NULL,'Thu Apr 16 10:31:02 CDT 2020'),(27,'100001','Deposit','100001','100.00','teller1','Thu Apr 16 20:08:52 CDT 2020'),(28,'100001','Transfer','100001','100.00','teller1','Thu Apr 16 20:15:23 CDT 2020'),(29,'100001','Transfer','100002','200','teller1','Thu Apr 16 20:15:47 CDT 2020'),(30,'100001','Transfer','100009','100.00','teller1','16-04-2020'),(31,'100001','Deposit','100001','100.00','teller1','16-04-2020'),(32,'100001','Withdraw','100001','100.00','teller1','16-04-2020'),(33,'100009','Transfer','100001','100.00',NULL,'16-04-2020'),(34,'100009','Transfer','100001','100.00',NULL,'16-04-2020'),(35,'100009','Transfer','100001','100.00',NULL,'16-04-2020');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'teller1','1233'),(2,'teller2','1234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-16 21:08:11
