-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dsi_sensibilisation
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id_answer` int NOT NULL AUTO_INCREMENT,
  `contact_answer` varchar(70) NOT NULL,
  `date_answer` date NOT NULL,
  `alert_answer` varchar(50) NOT NULL,
  `id_blog` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_answer`),
  KEY `fk_id_blog` (`id_blog`),
  KEY `fk_id_user` (`id_user`),
  CONSTRAINT `fk_answer_blog` FOREIGN KEY (`id_blog`) REFERENCES `blogs` (`id_blog`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_answer_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id_blog` int NOT NULL AUTO_INCREMENT,
  `title_blog` varchar(70) NOT NULL,
  `picture_path_blog` varchar(255) NOT NULL,
  `content_blog` varchar(70) NOT NULL,
  `date_blog` date NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_blog`),
  KEY `fk_id_user` (`id_user`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commands` (
  `id_command` int NOT NULL AUTO_INCREMENT,
  `modality_command` varchar(70) NOT NULL,
  `date_start_command` date NOT NULL,
  `date_end_command` date NOT NULL,
  `id_sensi_theme` int NOT NULL,
  `id_contact` int NOT NULL,
  PRIMARY KEY (`id_command`),
  KEY `fk_id_sensi_theme` (`id_sensi_theme`),
  KEY `fk_id_contact` (`id_contact`),
  CONSTRAINT `fk_command_contact` FOREIGN KEY (`id_contact`) REFERENCES `contacts` (`id_contact`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_command_sensi_theme` FOREIGN KEY (`id_sensi_theme`) REFERENCES `sensi_themes` (`id_sensi_theme`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id_coment` int NOT NULL AUTO_INCREMENT,
  `content_coment` varchar(70) NOT NULL,
  `alert_coment` varchar(50) NOT NULL,
  `date_coment` date NOT NULL,
  `id_user` int NOT NULL,
  `id_blog` int NOT NULL,
  PRIMARY KEY (`id_coment`),
  KEY `fk_id_user` (`id_user`),
  KEY `fk_id_blog` (`id_blog`),
  CONSTRAINT `fk_blog` FOREIGN KEY (`id_blog`) REFERENCES `blogs` (`id_blog`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_coment_user_` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id_contact` int NOT NULL AUTO_INCREMENT,
  `function_contact` varchar(70) NOT NULL,
  `service_contact` date NOT NULL,
  `id_user_contact` int NOT NULL,
  `id_enterprise` int NOT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `fk_id_user_contact` (`id_user_contact`),
  KEY `fk_id_enterprise` (`id_enterprise`),
  CONSTRAINT `fk_contact_enterprise` FOREIGN KEY (`id_enterprise`) REFERENCES `enterprises` (`id_enterprise`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_contact_user_contact` FOREIGN KEY (`id_user_contact`) REFERENCES `user_contacts` (`id_user_contact`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprises`
--

DROP TABLE IF EXISTS `enterprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprises` (
  `id_enterprise` int NOT NULL AUTO_INCREMENT,
  `siren_enterprise` int NOT NULL,
  `adress_enterprise` varchar(150) NOT NULL,
  `referent_handicap_enterprise` varchar(70) NOT NULL,
  PRIMARY KEY (`id_enterprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprises`
--

LOCK TABLES `enterprises` WRITE;
/*!40000 ALTER TABLE `enterprises` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensi_themes`
--

DROP TABLE IF EXISTS `sensi_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensi_themes` (
  `id_sensi_theme` int NOT NULL AUTO_INCREMENT,
  `id_sensi` int NOT NULL,
  `id_theme` int NOT NULL,
  `id_status` int NOT NULL,
  PRIMARY KEY (`id_sensi_theme`),
  KEY `fk_id_sensi` (`id_sensi`),
  KEY `fk_id_theme` (`id_theme`),
  KEY `fk_id_status` (`id_status`),
  CONSTRAINT `fk_sensi_theme_sensi` FOREIGN KEY (`id_sensi`) REFERENCES `sensis` (`id_sensi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sensi_theme_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sensi_theme_theme` FOREIGN KEY (`id_theme`) REFERENCES `themes` (`id_theme`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensi_themes`
--

LOCK TABLES `sensi_themes` WRITE;
/*!40000 ALTER TABLE `sensi_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensi_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensis`
--

DROP TABLE IF EXISTS `sensis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensis` (
  `id_sensi` int NOT NULL AUTO_INCREMENT,
  `price_sensi` decimal(5,2) NOT NULL,
  `name_sensi` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sensi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensis`
--

LOCK TABLES `sensis` WRITE;
/*!40000 ALTER TABLE `sensis` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `name_status` varchar(100) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id_theme` int NOT NULL AUTO_INCREMENT,
  `name_theme` varchar(100) NOT NULL,
  PRIMARY KEY (`id_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contacts`
--

DROP TABLE IF EXISTS `user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_contacts` (
  `id_user_contact` int NOT NULL AUTO_INCREMENT,
  `first_name_user_contact` varchar(70) NOT NULL,
  `last_name_user_contact` varchar(70) NOT NULL,
  `phone_number_user_contact` varchar(70) NOT NULL,
  `email_user_contact` varchar(70) NOT NULL,
  PRIMARY KEY (`id_user_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contacts`
--

LOCK TABLES `user_contacts` WRITE;
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `role_user` varchar(70) NOT NULL,
  `password_user` varchar(150) NOT NULL,
  `id_user_contact` int NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_id_user_contact` (`id_user_contact`),
  CONSTRAINT `fk_user_contact` FOREIGN KEY (`id_user_contact`) REFERENCES `user_contacts` (`id_user_contact`) ON DELETE CASCADE ON UPDATE CASCADE
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

-- Dump completed on 2023-07-05 11:35:21
