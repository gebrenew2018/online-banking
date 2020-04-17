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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-16 21:04:50
