-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: case_management
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `borrow_transactions`
--

DROP TABLE IF EXISTS `borrow_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `officer_id` int DEFAULT NULL,
  `case_file_id` int DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `status` enum('borrowed','returned') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `officer_id` (`officer_id`),
  KEY `case_file_id` (`case_file_id`),
  CONSTRAINT `borrow_transactions_ibfk_1` FOREIGN KEY (`officer_id`) REFERENCES `officers` (`id`),
  CONSTRAINT `borrow_transactions_ibfk_2` FOREIGN KEY (`case_file_id`) REFERENCES `case_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_transactions`
--

LOCK TABLES `borrow_transactions` WRITE;
/*!40000 ALTER TABLE `borrow_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrow_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_files`
--

DROP TABLE IF EXISTS `case_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_number` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `case_type` varchar(50) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_files`
--

LOCK TABLES `case_files` WRITE;
/*!40000 ALTER TABLE `case_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officers`
--

DROP TABLE IF EXISTS `officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officers`
--

LOCK TABLES `officers` WRITE;
/*!40000 ALTER TABLE `officers` DISABLE KEYS */;
/*!40000 ALTER TABLE `officers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-13 13:03:52
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: police_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `borrowrequests`
--

DROP TABLE IF EXISTS `borrowrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowrequests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `case_id` int DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `status` enum('pending','approved','rejected','returned') DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `user_id` (`user_id`),
  KEY `case_id` (`case_id`),
  CONSTRAINT `borrowrequests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `borrowrequests_ibfk_2` FOREIGN KEY (`case_id`) REFERENCES `casefiles` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowrequests`
--

LOCK TABLES `borrowrequests` WRITE;
/*!40000 ALTER TABLE `borrowrequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casefiles`
--

DROP TABLE IF EXISTS `casefiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casefiles` (
  `case_id` int NOT NULL AUTO_INCREMENT,
  `case_number` varchar(50) DEFAULT NULL,
  `suspect_name` varchar(100) DEFAULT NULL,
  `case_year` int DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casefiles`
--

LOCK TABLES `casefiles` WRITE;
/*!40000 ALTER TABLE `casefiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `casefiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `role` enum('investigator','admin','supervisor') DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2025-06-13 13:03:53
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: police
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `borrow_transactions`
--

DROP TABLE IF EXISTS `borrow_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `officer_id` int DEFAULT NULL,
  `case_file_id` int DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `status` enum('borrowed','returned') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `officer_id` (`officer_id`),
  KEY `case_file_id` (`case_file_id`),
  CONSTRAINT `borrow_transactions_ibfk_1` FOREIGN KEY (`officer_id`) REFERENCES `officers` (`id`),
  CONSTRAINT `borrow_transactions_ibfk_2` FOREIGN KEY (`case_file_id`) REFERENCES `case_files` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_transactions`
--

LOCK TABLES `borrow_transactions` WRITE;
/*!40000 ALTER TABLE `borrow_transactions` DISABLE KEYS */;
INSERT INTO `borrow_transactions` VALUES (1,1,3,'2025-06-09','2025-06-09','returned');
/*!40000 ALTER TABLE `borrow_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowrequests`
--

DROP TABLE IF EXISTS `borrowrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowrequests` (
  `requests_id` int NOT NULL,
  `user_id` int NOT NULL,
  `case_id` int NOT NULL,
  `requestscol_date` datetime NOT NULL,
  `status` enum('pending','approved','rejected','returned') NOT NULL,
  `return_date` datetime NOT NULL,
  PRIMARY KEY (`requests_id`,`user_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowrequests`
--

LOCK TABLES `borrowrequests` WRITE;
/*!40000 ALTER TABLE `borrowrequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_files`
--

DROP TABLE IF EXISTS `case_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_number` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `case_type` varchar(50) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `suspect` varchar(255) DEFAULT NULL,
  `victim` varchar(255) DEFAULT NULL,
  `investigator` varchar(255) DEFAULT NULL,
  `officer` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `borrow_timestamp` datetime DEFAULT NULL,
  `return_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_officer_timestamp` (`officer`,`borrow_timestamp` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_files`
--

LOCK TABLES `case_files` WRITE;
/*!40000 ALTER TABLE `case_files` DISABLE KEYS */;
INSERT INTO `case_files` VALUES (1,'001','คดีลักทรัพย์ นายแดง','ลักทรัพย์','2024-06-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'002','คดีชิงทรัพย์ นางสาวขาว','ชิงทรัพย์','2024-07-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'123/2566','สำนวนยักยอกเงิน','อาญา','2024-06-01','นายสมชาย','น.ส.ใจดี','ส.ต.ต. พงษ์','ร.ต.ท. สมศักดิ์','returned','2025-06-06 10:36:19','2025-06-06 10:37:11');
/*!40000 ALTER TABLE `case_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casefiles`
--

DROP TABLE IF EXISTS `casefiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casefiles` (
  `case_id` int NOT NULL,
  `case_number` varchar(45) NOT NULL,
  `case_year` int NOT NULL,
  `suspect_name` varchar(45) NOT NULL,
  PRIMARY KEY (`suspect_name`,`case_year`,`case_number`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casefiles`
--

LOCK TABLES `casefiles` WRITE;
/*!40000 ALTER TABLE `casefiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `casefiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `login_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `login_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_logs`
--

LOCK TABLES `login_logs` WRITE;
/*!40000 ALTER TABLE `login_logs` DISABLE KEYS */;
INSERT INTO `login_logs` VALUES (1,'police001','2025-05-26 00:39:42','192.168.1.1','นายสมชาย สมบูรณ์','2025-05-26 00:43:48'),(2,'police002','2025-05-26 00:44:23','192.168.1.2','นางสาวดารารัตน์ ดีใจ','2025-05-26 00:44:23'),(3,NULL,'2025-05-26 00:45:46',NULL,'พลอย','2025-05-26 00:45:46'),(4,NULL,'2025-05-26 00:46:02',NULL,'admin','2025-05-26 00:46:02'),(5,NULL,'2025-05-26 00:49:45',NULL,'admin','2025-05-26 00:49:45'),(6,NULL,'2025-05-26 00:52:07',NULL,'พลอย','2025-05-26 00:52:07'),(7,NULL,'2025-05-26 01:02:02',NULL,'admin','2025-05-26 01:02:02'),(8,NULL,'2025-05-26 01:09:44',NULL,'admin','2025-05-26 01:09:44'),(9,NULL,'2025-05-26 01:23:54',NULL,'admin','2025-05-26 01:23:54'),(10,NULL,'2025-05-26 01:27:51',NULL,'admin','2025-05-26 01:27:51'),(11,NULL,'2025-05-26 01:28:05',NULL,'พลอย','2025-05-26 01:28:05'),(12,NULL,'2025-05-26 01:28:20',NULL,'admin','2025-05-26 01:28:20'),(13,NULL,'2025-05-26 01:30:23',NULL,'admin','2025-05-26 01:30:23'),(14,NULL,'2025-06-06 09:50:32',NULL,'admin','2025-06-06 09:50:32'),(15,NULL,'2025-06-06 09:50:56',NULL,'พลอย','2025-06-06 09:50:56'),(16,NULL,'2025-06-06 09:59:54',NULL,'พลอย','2025-06-06 09:59:54'),(17,NULL,'2025-06-06 10:14:22',NULL,'พลอย','2025-06-06 10:14:22'),(18,NULL,'2025-06-06 10:19:51',NULL,'พลอย','2025-06-06 10:19:51'),(19,NULL,'2025-06-06 10:24:21',NULL,'พลอย','2025-06-06 10:24:21'),(20,NULL,'2025-06-06 10:27:31',NULL,'admin','2025-06-06 10:27:31'),(21,NULL,'2025-06-06 10:27:40',NULL,'พลอย','2025-06-06 10:27:40'),(22,NULL,'2025-06-06 10:30:52',NULL,'admin','2025-06-06 10:30:52'),(23,NULL,'2025-06-06 10:30:59',NULL,'พลอย','2025-06-06 10:30:59'),(24,NULL,'2025-06-06 10:38:31',NULL,'admin','2025-06-06 10:38:31'),(25,NULL,'2025-06-06 10:38:39',NULL,'พลอย','2025-06-06 10:38:39'),(26,NULL,'2025-06-06 10:40:16',NULL,'admin','2025-06-06 10:40:16'),(27,NULL,'2025-06-06 10:52:56',NULL,'admin','2025-06-06 10:52:56'),(28,NULL,'2025-06-06 10:53:05',NULL,'พลอย','2025-06-06 10:53:05'),(29,NULL,'2025-06-06 10:53:58',NULL,'พลอย','2025-06-06 10:53:58');
/*!40000 ALTER TABLE `login_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officers`
--

DROP TABLE IF EXISTS `officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officers`
--

LOCK TABLES `officers` WRITE;
/*!40000 ALTER TABLE `officers` DISABLE KEYS */;
INSERT INTO `officers` VALUES (1,'ร.ต.อ. สมชาย',NULL);
/*!40000 ALTER TABLE `officers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'พลอย','แอดมิน'),(2,'เม','พนักงาน');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `role` enum('police','admin') NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ด.ต. สมชาย','police'),(2,'ร.ต.อ. นิรันดร์','admin'),(3,'ด.ต. สมชาย','police'),(4,'ร.ต.อ. นิรันดร์','admin'),(5,'ด.ต. สมชาย','police'),(6,'ร.ต.อ. นิรันดร์','admin'),(7,'ด.ต. สมชาย','police'),(8,'ร.ต.อ. นิรันดร์','admin'),(9,'ด.ต. สมชาย','police'),(10,'ร.ต.อ. นิรันดร์','admin'),(11,'ด.ต. สมชาย','police'),(12,'ร.ต.อ. นิรันดร์','admin'),(13,'ด.ต. สมชาย','police'),(14,'ร.ต.อ. นิรันดร์','admin'),(15,'ด.ต. สมชาย','police'),(16,'ร.ต.อ. นิรันดร์','admin'),(17,'ด.ต. สมชาย','police'),(18,'ร.ต.อ. นิรันดร์','admin');
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

-- Dump completed on 2025-06-13 13:03:53
