-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: games_v2
-- ------------------------------------------------------
-- Server version	8.0.32

create database games_v2;
use games_v2;

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `idaccounts` int NOT NULL AUTO_INCREMENT,
  `email` char(100) NOT NULL,
  `login` char(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` char(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `form_of_payment` varchar(100) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `account_creation_date` datetime NOT NULL,
  `account_deletion_date` datetime DEFAULT NULL,
  `id_recommend_list` int DEFAULT NULL,
  PRIMARY KEY (`idaccounts`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `id_recommend_list_UNIQUE` (`id_recommend_list`),
  KEY `fk_recommend_list_idrecommend_list_accounts_idx` (`id_recommend_list`),
  CONSTRAINT `fk_recommend_list_idrecommend_list_accounts` FOREIGN KEY (`id_recommend_list`) REFERENCES `recommendation_lists` (`id_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_to_supports`
--

DROP TABLE IF EXISTS `accounts_to_supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_to_supports` (
  `idaccounts_to_supports` int NOT NULL AUTO_INCREMENT,
  `time_of_appeal` datetime NOT NULL,
  `data_of_appeal` longtext NOT NULL,
  `id_support` int NOT NULL,
  `id_staff` int NOT NULL,
  `id_account` int NOT NULL,
  PRIMARY KEY (`idaccounts_to_supports`),
  KEY `fk_accounts_idaccounts_communication_tech_supp_idx` (`id_account`),
  KEY `fk_technical_supports_idtechnical_supports_communication_te_idx` (`id_support`),
  KEY `fk_staff_idstaff__acc_to_supp_idx` (`id_staff`),
  CONSTRAINT `fk_accounts_idaccounts_acc_to_supp` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`idaccounts`),
  CONSTRAINT `fk_staff_idstaff__acc_to_supp` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`idstaff`),
  CONSTRAINT `fk_supports_idsupports__acc_to_supp` FOREIGN KEY (`id_support`) REFERENCES `supports` (`idsupports`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_to_supports`
--

LOCK TABLES `accounts_to_supports` WRITE;
/*!40000 ALTER TABLE `accounts_to_supports` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_to_supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developers`
--

DROP TABLE IF EXISTS `developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developers` (
  `iddevelopers` int NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `rating` float NOT NULL,
  `number_of_products` int NOT NULL,
  `location` char(200) NOT NULL,
  `number_of_employees` int NOT NULL,
  PRIMARY KEY (`iddevelopers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developers`
--

LOCK TABLES `developers` WRITE;
/*!40000 ALTER TABLE `developers` DISABLE KEYS */;
/*!40000 ALTER TABLE `developers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_awards`
--

DROP TABLE IF EXISTS `game_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_awards` (
  `idgame_awards` int NOT NULL AUTO_INCREMENT,
  `title` char(200) NOT NULL,
  PRIMARY KEY (`idgame_awards`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_awards`
--

LOCK TABLES `game_awards` WRITE;
/*!40000 ALTER TABLE `game_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `idgames` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `reviews` longtext NOT NULL,
  `age_restriction` int DEFAULT NULL,
  `date_of_creation` date NOT NULL,
  `id_developer` int NOT NULL,
  `id_publisher` int NOT NULL,
  `id_game_series` int DEFAULT NULL,
  PRIMARY KEY (`idgames`),
  KEY `fk_developers_iddevelopers_games_idx` (`id_developer`),
  KEY `fk_publishers_idpublishers_games_idx` (`id_publisher`),
  KEY `fk_games_series_id_games_series_games_idx` (`id_game_series`),
  CONSTRAINT `fk_developers_iddevelopers_games` FOREIGN KEY (`id_developer`) REFERENCES `developers` (`iddevelopers`),
  CONSTRAINT `fk_games_series_id_games_series_games` FOREIGN KEY (`id_game_series`) REFERENCES `games_series` (`idgames_series`),
  CONSTRAINT `fk_publishers_idpublishers_games` FOREIGN KEY (`id_publisher`) REFERENCES `publishers` (`idpublishers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_purchase`
--

DROP TABLE IF EXISTS `games_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_purchase` (
  `idgames_purchase` int NOT NULL AUTO_INCREMENT,
  `id_account` int NOT NULL,
  `id_game` int NOT NULL,
  `time_of_purchase` datetime NOT NULL,
  PRIMARY KEY (`idgames_purchase`),
  KEY `fk_accounts_idaccounts_games_purchase_idx` (`id_account`),
  KEY `fk_games_idgames_games_purchase_idx` (`id_game`),
  CONSTRAINT `fk_accounts_idaccounts_games_purchase` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`idaccounts`),
  CONSTRAINT `fk_games_idgames_games_purchase` FOREIGN KEY (`id_game`) REFERENCES `games` (`idgames`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_purchase`
--

LOCK TABLES `games_purchase` WRITE;
/*!40000 ALTER TABLE `games_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_search`
--

DROP TABLE IF EXISTS `games_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_search` (
  `idgames_search` int NOT NULL AUTO_INCREMENT,
  `id_game` int NOT NULL,
  `id_account` int NOT NULL,
  `time_of_search` datetime NOT NULL,
  PRIMARY KEY (`idgames_search`),
  KEY `fk_games_idgames_games_search_idx` (`id_game`),
  KEY `fk_accounts_idaccounts_games_search_idx` (`id_account`),
  CONSTRAINT `fk_accounts_idaccounts_games_search` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`idaccounts`),
  CONSTRAINT `fk_games_idgames_games_search` FOREIGN KEY (`id_game`) REFERENCES `games` (`idgames`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_search`
--

LOCK TABLES `games_search` WRITE;
/*!40000 ALTER TABLE `games_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_series`
--

DROP TABLE IF EXISTS `games_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_series` (
  `idgames_series` int NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL,
  PRIMARY KEY (`idgames_series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_series`
--

LOCK TABLES `games_series` WRITE;
/*!40000 ALTER TABLE `games_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_to_awards`
--

DROP TABLE IF EXISTS `games_to_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_to_awards` (
  `id_game` int NOT NULL,
  `id_award` int NOT NULL,
  PRIMARY KEY (`id_game`,`id_award`),
  KEY `id_award` (`id_award`),
  CONSTRAINT `games_to_awards_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `games` (`idgames`),
  CONSTRAINT `games_to_awards_ibfk_2` FOREIGN KEY (`id_award`) REFERENCES `game_awards` (`idgame_awards`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_to_awards`
--

LOCK TABLES `games_to_awards` WRITE;
/*!40000 ALTER TABLE `games_to_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_to_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_to_genres`
--

DROP TABLE IF EXISTS `games_to_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_to_genres` (
  `id_game` int NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_game`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `games_to_genres_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `games` (`idgames`),
  CONSTRAINT `games_to_genres_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`idgenres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_to_genres`
--

LOCK TABLES `games_to_genres` WRITE;
/*!40000 ALTER TABLE `games_to_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_to_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_to_themes`
--

DROP TABLE IF EXISTS `games_to_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_to_themes` (
  `id_game` int NOT NULL,
  `id_theme` int NOT NULL,
  PRIMARY KEY (`id_game`,`id_theme`),
  KEY `id_theme` (`id_theme`),
  CONSTRAINT `games_to_themes_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `games` (`idgames`),
  CONSTRAINT `games_to_themes_ibfk_2` FOREIGN KEY (`id_theme`) REFERENCES `themes` (`idthemes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_to_themes`
--

LOCK TABLES `games_to_themes` WRITE;
/*!40000 ALTER TABLE `games_to_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_to_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_to_types`
--

DROP TABLE IF EXISTS `games_to_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_to_types` (
  `id_game` int NOT NULL,
  `id_type` int NOT NULL,
  PRIMARY KEY (`id_game`,`id_type`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `games_to_types_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `games` (`idgames`),
  CONSTRAINT `games_to_types_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `types` (`idtypes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_to_types`
--

LOCK TABLES `games_to_types` WRITE;
/*!40000 ALTER TABLE `games_to_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_to_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gaming_news`
--

DROP TABLE IF EXISTS `gaming_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaming_news` (
  `idgaming_news` int NOT NULL AUTO_INCREMENT,
  `type_of_news` char(100) NOT NULL,
  `heading` longtext NOT NULL,
  `date_of_creation` datetime NOT NULL,
  `id_developer` int NOT NULL,
  `id_game` int NOT NULL,
  PRIMARY KEY (`idgaming_news`),
  KEY `fk_developers_iddevelopers_gaming_news_idx` (`id_developer`),
  KEY `fk_games_idgames_gaming_news_idx` (`id_game`),
  CONSTRAINT `fk_developers_iddevelopers_gaming_news` FOREIGN KEY (`id_developer`) REFERENCES `developers` (`iddevelopers`),
  CONSTRAINT `fk_games_idgames_gaming_news` FOREIGN KEY (`id_game`) REFERENCES `games` (`idgames`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaming_news`
--

LOCK TABLES `gaming_news` WRITE;
/*!40000 ALTER TABLE `gaming_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `gaming_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `idgenres` int NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL,
  PRIMARY KEY (`idgenres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `idpublishers` int NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `rating` float NOT NULL,
  `number_of_products` int NOT NULL,
  `location` char(200) NOT NULL,
  `number_of_employees` int NOT NULL,
  PRIMARY KEY (`idpublishers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation_lists`
--

DROP TABLE IF EXISTS `recommendation_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_lists` (
  `id_account` int NOT NULL AUTO_INCREMENT,
  `date_of_creation` datetime NOT NULL,
  `game_counter` int NOT NULL,
  `id_game_search` int NOT NULL,
  `id_prevailing_genre` int NOT NULL,
  `id_proposed_game` int NOT NULL,
  PRIMARY KEY (`id_account`),
  KEY `fk_games_search_idgames_search_recomm_lists_idx` (`id_game_search`),
  KEY `fk_genres_idgenres_recomm_lists_idx` (`id_prevailing_genre`),
  KEY `fk_games_idgames_recomm_lists_idx` (`id_proposed_game`),
  CONSTRAINT `fk_accounts_idaccounts_recomm_lists` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`idaccounts`),
  CONSTRAINT `fk_games_idgames_recomm_lists` FOREIGN KEY (`id_proposed_game`) REFERENCES `games` (`idgames`),
  CONSTRAINT `fk_games_search_idgames_search_recomm_lists` FOREIGN KEY (`id_game_search`) REFERENCES `games_search` (`idgames_search`),
  CONSTRAINT `fk_genres_idgenres_recomm_lists` FOREIGN KEY (`id_prevailing_genre`) REFERENCES `genres` (`idgenres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation_lists`
--

LOCK TABLES `recommendation_lists` WRITE;
/*!40000 ALTER TABLE `recommendation_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendation_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `idstaff` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `post` char(100) NOT NULL,
  `salary` float unsigned NOT NULL,
  `factor_of_utility` float NOT NULL,
  `work_schedule_from` time NOT NULL,
  `work_schedule_to` time NOT NULL,
  `number_of_working_days` int NOT NULL,
  `id_account` int DEFAULT NULL,
  `id_staff_account` int DEFAULT NULL,
  `date_of_admission` datetime NOT NULL,
  `date_of_dismissal` datetime DEFAULT NULL,
  PRIMARY KEY (`idstaff`),
  UNIQUE KEY `id_staff_account_UNIQUE` (`id_staff_account`),
  KEY `fk_accounts_idaccounts_idx` (`id_account`),
  CONSTRAINT `fk_accounts_idaccounts_staff` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`idaccounts`),
  CONSTRAINT `fk_staff_accounts_idstaff_accounts_staff` FOREIGN KEY (`id_staff_account`) REFERENCES `staff_accounts` (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_accounts`
--

DROP TABLE IF EXISTS `staff_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_accounts` (
  `id_staff` int NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  PRIMARY KEY (`id_staff`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  CONSTRAINT `staff_accounts_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`idstaff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_accounts`
--

LOCK TABLES `staff_accounts` WRITE;
/*!40000 ALTER TABLE `staff_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `idsupports` int NOT NULL,
  `id_staff` int NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`idsupports`,`id_staff`),
  KEY `fk_staff_idstaff_idx` (`id_staff`),
  CONSTRAINT `fk_staff_idstaff_supports` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`idstaff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports_to_developers`
--

DROP TABLE IF EXISTS `supports_to_developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports_to_developers` (
  `idsupports_to_developers` int NOT NULL AUTO_INCREMENT,
  `id_developer` int NOT NULL,
  `id_support` int NOT NULL,
  `id_staff` int NOT NULL,
  `time_of_appeal` datetime NOT NULL,
  `data_of_appeal` longtext NOT NULL,
  PRIMARY KEY (`idsupports_to_developers`),
  KEY `fk_supports_idsupports_supp_to_devel_idx` (`id_support`),
  KEY `fk_developers_iddevelopers_supp_to_devel_idx` (`id_developer`),
  KEY `fk_staff_idstaff_supp_to_devel_idx` (`id_staff`),
  CONSTRAINT `fk_developers_iddevelopers_supp_to_devel` FOREIGN KEY (`id_developer`) REFERENCES `developers` (`iddevelopers`),
  CONSTRAINT `fk_staff_idstaff_supp_to_devel` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`idstaff`),
  CONSTRAINT `fk_supports_idsupports_supp_to_devel` FOREIGN KEY (`id_support`) REFERENCES `supports` (`idsupports`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports_to_developers`
--

LOCK TABLES `supports_to_developers` WRITE;
/*!40000 ALTER TABLE `supports_to_developers` DISABLE KEYS */;
/*!40000 ALTER TABLE `supports_to_developers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `idthemes` int NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL,
  PRIMARY KEY (`idthemes`)
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
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `idtypes` int NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL,
  PRIMARY KEY (`idtypes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `IPaddress` varchar(100) NOT NULL,
  `visit_time` datetime NOT NULL,
  `id_account` int DEFAULT NULL,
  `id_staff_account` int DEFAULT NULL,
  PRIMARY KEY (`idusers`),
  KEY `fk_accounts_idaccounts_idx` (`id_account`),
  KEY `fk_staff_idstaff_idx` (`id_staff_account`),
  CONSTRAINT `fk_accounts_idaccounts_users` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`idaccounts`),
  CONSTRAINT `fk_staff_account_idstaff_account_users` FOREIGN KEY (`id_staff_account`) REFERENCES `staff_accounts` (`id_staff`)
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

-- Dump completed on 2023-03-17 23:48:00
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

insert into genres (title) values
 ('Action'),
 ('Role-Playing'),
 ('Strategy'),
 ('Adventure'),
 ('Simulation'),
 ('Sports & Racing'),
 ('Shooters'),
 ('MOBA'),
 ('Survival & horror'),
 ('Platformer'),
 ('Card game');

 insert into themes (title) values
 ('Horror'),
 ('Mystery & Detective'),
 ('Open World'),
 ('Survival'),
 ('Zombies'),
 ('Supernatural'),
 ('Dark Fantasy'),
 ('Detective'),
 ('Great Soundtrack'),
 ('Atmospheric'),
 ('Story Rich'),
 ('Fantasy'),
 ('Crafting'),
 ('Building'),
 ('Sandbox'),
 ('Simulation'),
 ('Exploration'),
 ('Competitive'),
 ('Team-Based'),
 ('Tower Defense'),
 ('PvP'),
 ('Military'),
 ('Tactical'),
 ('eSports'),
 ('Chess'),
 ('Casual'),
 ('Stealth'),
 ('First-Person'),
 ('Psychological Horror'),
 ('Nudity'),
 ('Parkour'),
 ('Sci-fi'),
 ('Violent'),
 ('Sexual Content'),
 ('Mythology'),
 ('Combat'),
 ('Third Person'),
 ('Emotional'),
 ('Hack and Slash'),
 ('PVE'),
 ('Parkour'),
 ('Post-apocalyptic'),
 ('Choices Matter'),
 ('Crime'),
 ('Funny'),
 ('Racing'),
 ('Comedy'),
 ('Automobile Sim'),
 ('Medieval'),
 ('Magic'),
 ('Dark'),
 ('Character Customization'),
 ('Superhero'),
 ('Futuristic'),
 ('Immersive Sim'),
 ('Western'),
 ('Realistic'),
 ('Horses'),
 ('Beautiful'),
 ('Puzzle'),
 ('Remake'),
 ('Drama'),
 ('Emotional'),
 ('Comic Book'),
 ('Quick-Time Events'),
 ('Episodic'),
 ('Point & Click'),
 ('Dragons'),
 ('Moddable'),
 ('Walking Simulator'),
 ('Multiple Endings'),
 ('Cyberpunk');

 insert into `types` (title) values
 ('Single-player'),
 ('Online Co-op'),
 ('LAN Co-op'),
 ('Multiplayer'),
 ('Online Competitive'),
 ('Online PvP');
 
 insert into game_awards (title) values
 ('Most Anticipated Game'),
 ('Game of the Year'),
 ('Best Gaming Moment'),
 ('Best Storytelling'),
 ('Best Visual Design'),
 ('Best RPG'),
 ('The best survival games on PC'),
 ('Ultimate Game of the Year'),
 ('Outstanding Action/Adventure Game'),
 ('Role-Playing/Massively Multiplayer Game of the Year'),
 ('Golden Joystick Awards'),
 ('Best Soundtrack'),
 ('Best Technology'),
 ('Best International Game'),
 ('Special Commendation for Graphics'),
 ('Special Commendation for Innovation'),
 ('Most Wanted Game'),
 ('Best PC Game'),
 ('Critics Choice Award'),
 ('Best Audio'),
 ('Herman Melville Award for Best Writing'),
 ('Statue of Liberty Award for Best World'),
 ('Best of Show'),
 ('Award for Excellence'),
 ('Best Writing'),
 ('Best Story'),
 ('Artistic Achievement'),
 ('Best Game Design'),
 ('Esports Game of the Year'),
 ('The Game Award for Best ESports Game'),
 ('Most Promising New eSports Game'),
 ('Best Polish Game Art'),
 ('Downloadable Game of the Year'),
 ('Outstanding Character Performance'),
 ('Original Music'),
 ('The Game Award for Best Debut Indie Game'),
 ('Best Strategy Game'),
 ('Ultimate Game of All Time'),
 ('Outstanding Role Playing Game'),
 ('Best PC Game of 2013'),('Best PC Strategy & Tactics Game'), ('Best PC Multiplayer Game'), ('Best PC Exclusive'),('Best Competitive Multiplayer'),('Best Strategy of 2013'),('Love/Hate Relationship'),('Best MOBA'),
 ('Best Adapted Video Game'),('Best Performance By a Human Female'),('Best Performance by a Human Male'),('Best Character Design'),('Best Multi-Platform Game'),('Best Digitally Distributed Game'),('Adventure Game of the Year'),('Outstanding Achievement in Story'),('Best Narrative'),
 ('Best Online Multiplayer '),('Best Female Lead Vocal Performance in a Video Game'),('Best Male Vocal Performance in a Video Game in a Supporting Role'),('Best Female Vocal Performance in a Video Game in a Supporting Role'),('Best Vocal Ensemble in a Video Game'),('Outstanding Platform Action/Adventure Game'),('Best Role Playing Game'),('Best Online Experience'),
 ('Original Dramatic Score, Franchise'),
 ('Best Indie Game'),('Fans` Choice'),('Outstanding Performance in a Video Game'),('Best Male Lead Vocal Performance in a Video Game'),('Best Video Game'),
 ('Best Art Direction'),('Best Strategy/Simulation'),
 ('Audio Achievement'),('Best Game'),('Best Performer'),('Outstanding Achievement for Character Animation in a Video Game'),('Best Video Game'),('Best Achievement in Directing'),('Best Original Soundtrack'),('Best Performance in an Animation or a Video Game'),('Music of the Year'),('PlayStation Game of the Year'),('Best Original Score - Video Game'),('Best Voice'),('People`s Choice'),('Outstanding Achievement in Sound Editing - Sound Effects, Foley, Music, Dialogue and ADR for Computer Interactive Game Play '),('Outstanding Achievement in Sound Editing - Sound Effects, Foley, Music, Dialogue and ADR for Computer Cinematic'),('Outstanding Performance in a Drama, Lead'),('Original Dramatic Score, Franchise'),('Outstanding Visual Effects in a Real-Time Project'),
 ('Lighting/Texturing'),('Animation, Technical'),('Xbox Game of the Year'),
 ('Best British Game'),('Game Innovation'),('Outstanding Achievement in Sound Design'),('Best Male Lead Vocal Performance in a Video Game '),('Innovation of the Year'),('Best Music Supervision for a Video Game'),('Video Game of the Year'),('Song Collection'),
 ('Best Persistent Game'),
 ('Best Interactive Score'),('Best of Show'),('Best Console Game'),('Best Song, Original or Adapted'),('Song Collection'),('Costume Design'),('Art Direction, Contemporary'),
 ('Technical Achievement'),('Best Action Game'),
 ('Best In-Game Cinematic'),('Best New Character'),('Fans` Choice'),
 ('Performer in a Leading Role'),('Performer in a Supporting Role'),('Video Game Score of the Year'),('Most Wanted Award'),('Best Score & Music'),('Best Role Playing Game'),('Advertising, Media & PR - Best Use of Animation or Motion Graphics'),('Outstanding Visual Effects in a Real-Time Project'),('Outstanding Created Environment in an Episode, Commercial, or Real-Time Project'),
 ('Outstanding Technical Achievement'),('Best Soundtrack Album'),('Original Light Mix Score, Franchise'),('Trending Game of the Year'),('Sound Effects'),
 ('Game, Classic Revival'),('Sound Editing in a Game Cinema'),('Game, Franchise Action'),
 ('Best Story'),('Outstanding Achievement in Game Play Engineering'),('Outstanding Innovation in Gaming'),('Interactive Media'),('Best Visual Arts'),('Best VR/AR Game'),('Best Video Game Trailer'),('Studio of the Year');

 
 insert into games_series (title) values
 ('The Elder Scrolls'),
 ('The Witcher'),
 ('Dota'),
 ('Resident Evil'),
 ('Dark Souls'),
 ('Fallout'),
 ('Metro'),
 ('S.T.A.L.K.E.R.'),
 ('Red Dead'),
 ('Outlast'),
 ('God of War'),
 ('Grand Theft Auto'),
 ('Counter-Strike'),
 ('The Walking Dead'),
 ('Dying Light'),
 ('Prototype');
 
 insert into developers (`name`, rating, number_of_products, location, number_of_employees) values
 ('Valve', 4.6 , 32, 'Kirkland, Washington, US', 360),
 ('Bandai Namco Entertainment', 3.8, 85, 'Minato-ku, Tokyo, Japan', 900),
 ('Kinetic Games', 4.5, 1, 'Southampton, Hampshire, United Kingdom', 85),
 ('Endnight Games', 3.6, 2, 'Vancouver, Canada', 20),
 ('Red Barrels', 3.95, 3, 'Montreal, Quebec, Canada', 40),
 ('Hinterland Studio', 5, 1, 'Vancouver, British Columbia, Canada', 133),
 ('Bethesda Game Studios', 3.4, 12, 'Rockville, Maryland, US', 420),
 ('CD PROJEKT RED', 4, 11, 'Warsaw, Poland', 859),
 ('Capcom', 4, 100,'Chūō-ku, Osaka, Japan', 3206),
 ('4A Games', 3.7, 5, 'Sliema, Malta', 146),
 ('GSC Game World', 4, 19, 'Prague, Czech Republic', 300),
 ('Rockstar Games', 4.2, 30, 'New York City, US', 2300),
 ('Santa Monica Studio', 4.4, 7, 'Los Angeles, US', 400),
 ('Radical Entertainment', 3.85, 17, 'Vancouver, British Columbia, Canada', 118),
 ('Techland', 3.55, 39, 'Wrocław, Poland', 450),
 ('Telltale Games', 3.75 , 13, 'San Rafael, California, US', 230);
 
insert into publishers (`name`, rating, number_of_products, location, number_of_employees) values 
 ('Valve', 4.6 , 32, 'Kirkland, Washington, US', 360),
 ('Bandai Namco Entertainment', 3.8, 85, 'Minato-ku, Tokyo, Japan', 900),
 ('Kinetic Games', 4.5, 1, 'Southampton, Hampshire, United Kingdom', 85),
 ('Endnight Games', 3.6, 2, 'Vancouver, Canada', 20),
 ('Red Barrels', 3.95, 3, 'Montreal, Quebec, Canada', 40),
 ('Hinterland Studio', 5, 1, 'Vancouver, British Columbia, Canada', 133),
 ('Bethesda Softworks', 3.7, 102, 'Rockville, Maryland, US', 140),
 ('CD PROJEKT RED', 4, 11, 'Warsaw, Poland', 859),
 ('Capcom', 4, 100,'Chūō-ku, Osaka, Japan', 3206),
 ('Deep Silver', 3.35, 200, 'Höfen, Austria', 172),
 ('GSC Game World', 4, 19, 'Prague, Czech Republic', 300),
 ('Rockstar Games', 4.2, 30, 'New York City, US', 2300),
 ('Sony Interactive Entertainment', 4, 550, 'San Mateo, California, US', 12000),
 ('Activision', 3.55, 753, 'Santa Monica, California, US', 9800),
 ('Techland', 3.55, 39, 'Wrocław, Poland', 450),
 ('Newnight', 4.07, 1, 'Vancouver, Canada', 28),
 ('Skybound Games', 3.75 , 12, 'Beverly Hills, California, United States', 194);
 
 
 insert into games (title, reviews, age_restriction, date_of_creation, id_developer, id_publisher, id_game_series) values
 ('Dota 2','82 % of 1,936,812 reviews are positive', 13,'2013-07-09', 1, 1, 3),
 ('Counter-Strike: Global Offensive','88 % of 6,999,045 reviews are positive', 17,'2012-08-21', 1, 1, 13),
 ('GWENT: The Witcher Card Game','95 % of 19,745 reviews are positive', 16,'2017-05-24', 8, 8, 2),
 ('The Walking Dead','97 % of 36,497 reviews are positive', 18,'2012-04-24', 16, 17, 14),
 ('Phasmophobia','96 % of 437,204 reviews are positive', 13,'2020-09-18', 3, 3, null),
 ('DARK SOULS™: REMASTERED','89 % of 49,195 reviews are positive', 12,'2018-05-24', 2, 2, 5),
 ('DARK SOULS™ II: Scholar of the First Sin','85 % of 57,514 reviews are positive', 12,'2015-05-02', 2, 2, 5),
 ('DARK SOULS™ III','94 % of 223,271 reviews are positive', 16,'2016-04-11', 2, 2, 5),
 ('Outlast','96 % of 69,719 reviews are positive', 18,'2013-09-04', 5, 5, 10),
 ('Outlast 2','91 % of 34,870 reviews are positive', 18,'2017-04-25', 5, 5, 10),
 ('The Forest','95 % of 398,737 reviews are positive', 18,'2018-04-30', 4, 4, null),
 ('Sons Of The Forest','82 % of 94,898 reviews are positive', 18,'2023-02-23', 4, 16, null),
 ('The Long Dark','91 % of 84,162 reviews are positive', 16,'2017-08-01', 6, 6, null),
 ('God of War','98 % of 67,408 reviews are positive', 18,'2018-04-20', 13, 13, 11),
 ('Dying Light','98 % of ‎268,029 reviews are positive', 18,'2015-01-26', 15, 15, 15),
 ('Dying Light 2: Stay Human','79 % of 101,154 reviews are positive', 18,'2022-02-04', 15, 15, 15),
 ('Grand Theft Auto V','95 % of 1,379,891 reviews are positive', 18,'2013-09-17', 12, 12, 12),
 ('The Witcher 3: Wild Hunt','99 % of 644,607 reviews are positive', 17,'2015-05-18', 8, 8, 2),
 ('Fallout 4','95 % of 194,484 reviews are positive', 18,'2015-11-09', 7, 7, 6),
 ('Metro Exodus','96 % of ‎73,757 reviews are positive', 18,'2019-02-15', 10, 10, 7),
 ('Prototype','94 % of 8,337 reviews are positive', 17,'2009-06-10', 14, 14, 16),
 ('Prototype 2','79 % of ‎7,912 reviews are positive', 17,'2012-04-24', 14, 14, 16),
 ('Cyberpunk 2077','80 % of 524,380 reviews are positive', 18,'2020-12-10', 8, 8, null),
 ('Red Dead Redemption 2','95 % of 346,847 reviews are positive', 18,'2018-10-26', 12, 12, 9),
 ('Resident Evil 2','98 % of 82,419 reviews are positive', 17,'2019-01-25', 9, 9, 4),
 ('Resident Evil 3','77 % of 42,739 reviews are positive', 18,'2020-04-03', 9, 9, 4),
 ('The Elder Scrolls V: Skyrim Special Edition','97 % of 125,484 reviews are positive', 18,'2016-10-28', 7, 7, 1),
 ('S.T.A.L.K.E.R.: Shadow of Chernobyl','98 % of 26,393 reviews are positive', 17,'2007-03-20', 11, 11, 8),
 ('S.T.A.L.K.E.R.: Clear Sky','97 % of 12,709 reviews are positive', 17,'2008-08-22', 11, 11, 8),
 ('S.T.A.L.K.E.R.: Call of Pripyat','99 % of 18,717 reviews are positive', 17,'2009-10-02', 11, 11, 8);
 
 insert into accounts (email, login, `password`, nickname, country, form_of_payment, phone, account_creation_date) values
 ('Sl666vamp@gmail.com','Sleeping666','_H5udf4yjdfz666_','Sleeping','Russia', '9633213987074345', '79034789902', '2014-07-06 13:35:12'),
 ('SeatherS@yahoo.com','Seather_343','_S%kre432d2Klk-','Nacho','Australia', '4313987074345', '61480050217', '2014-07-06 13:40:27'),
 ('slayer@gmail.com','theslayercarry_','DM%#923lkkj_3021l','TheSlayerCarry','Russia', '7812357222412', '79060932851', '2015-02-18 06:02:11'),
 ('samurai@yandex.ru','V1rus','XMGA{n0w1o|~ox','samurai','Russia', '5496198584584769', '79057666894', '2015-07-04 18:19:45'),
 ('Al4kis@gmail.com','Deadlight_666','lYg8?hf9VFw5C9@b|Z{f','Kisik666','Belarus', '4111111111100023', '375255642170', '2015-07-04 20:59:23'),
 ('Inevlattes@mail.ru','Molllaleli','e0VRdUTdA*?Y','NosferatU','Kazakhstan', '5496111100588669', '77142931777', '2015-07-05 00:00:39'),
 ('badsapphire@gmail.com','badsapphire_','_#qA~JBcPwh9fyV|6_','badsapphire','Belarus', '9631213666074345', '375257834111', '2016-04-14 16:31:19'),
 ('fg7gfjgf@mail.ru','Dmtyfj411','~MhOuiD1R*','DUKAPb','Russia', null, '79038044661', '2016-12-31 02:48:04'),
 ('Zocker@GMX.com','Newinecalb','_eBGxIsFc1e%','BerufsZocker','Germany', '0532013000', '4917645890033', '2017-01-01 03:44:17'),
 ('K-miK@correo.mae.es','mierdatonta','sAg2kABFHP%%%#$','K-miK','Spain', null, '34603934666', '2017-01-02 19:37:00');
 
 insert into staff (`name`, post, salary, factor_of_utility, work_schedule_from, work_schedule_to, number_of_working_days, id_account, date_of_admission) values
 ('Paul Smith', 'Support specialist', 2100, 1, '8:00:00', '17:30:00', 27, null, '2021-11-16 14:42:31'),
 ('Sandra Hunter', 'Support specialist', 2300, 1.1, '8:00:00', '18:35:00', 27, null, '2021-01-26 15:45:09'),
 ('Robert Ward', 'Effects Artist', 2100, 1.05, '10:20:00', '16:30:00', 28, null, '2019-12-08 19:07:23'),
 ('Michelle Mcclure', 'Mechanical Engineer', 6500, 1.2, '11:00:00', '19:35:00', 24, null, '2017-06-13 17:02:14'),
 ('Brenda Bridges', 'Industrial Designer', 7300, 1.4, '11:20:00', '18:00:00', 24, null, '2018-03-18 04:37:57'),
 ('Jordan Nguyen', 'Support specialist', 2350, 1.32, '17:30:00', '02:35:00', 26, 9, '2022-05-27 08:08:56'),
 ('Judy Jacobson', 'Electrical Engineer', 7900, 1.35, '11:45:00', '20:30:00', 25, null, '2018-01-03 00:52:11'),
 ('Candice Blackwell', 'Support specialist', 2250, 1.45, '18:30:00', '03:35:00', 26, null, '2022-06-08 18:19:15'),
 ('Karla Buckley', 'Psychologist, Research/Experimental', 5600, 1.55, '10:00:00', '19:30:00', 28, null, '2019-09-14 11:28:36'),
 ('Krystal Stevenson', 'Support specialist', 2400, 1.3, '02:30:00', '11:30:00', 27, null, '2022-04-13 02:18:05'),
 ('Amanda Crawford', 'Game Development Software Engineer', 7248, 1.38, '10:30:00', '19:30:00', 24, null, '2018-01-16 06:34:14'),
 ('Jeffrey Jones', 'Support specialist', 2400, 1.25, '03:30:00', '12:30:00', 26, 2, '2021-09-28 08:01:58'),
 ('Gregory Watson', 'Game Design', 6166, 1.44, '11:40:00', '19:45:00', 24, null, '2019-10-11 19:39:22'),
 ('Tina Frederick', 'Level Designer', 4860, 1.36, '10:40:00', '18:25:00', 28, null, '2017-10-28 01:40:01'),
 ('Crystal Davis', 'Audio Software Engineer', 10442, 1.25, '9:30:00', '20:30:00', 26, 10, '2016-08-30 05:07:00'),
 ('Robert Hall', 'Computer Vision Software Engineer', 15030, 1.42, '8:30:00', '20:45:00', 27, null, '2017-07-15 23:10:17');
 
 insert into staff_accounts (id_staff, login, `password`, phone) values
 (1,20721145, '6C289VQ4IVJK', '18103456532'),
 (2,50297928, 'H1CHVGL4S1S2', '18102756660'),
 (3,17369058, '54TR2VS2QJ4R', '18101906531'),
 (4,73625896, '3CIXO0A93DOY', '18106400034'),
 (5,13280598, '77TPE31X4ERM', '18100426135'),
 (6,90150926, '11WF96HP5LV3', '18103786535'),
 (7,38324193, '16RS9PDM6IGL', '18106456996'),
 (8,19262777, 'Y26PEL299MO6', '18108458830'),
 (9,70604646, 'Q7BALRQ6W087', '18102117738'),
 (10,33500326, 'XW8KYHTIS8G7', '18102456539'),
 (11,61514031, '234EDVIW2VLZ', '18103333537'),
 (12,00865270, '804KXVM96EWU', '18101456599'),
 (13,24093097, '012Z1X9UWDHB', '18102161138'),
 (14,61284593, 'T45CNBI5I5ZD', '18102456009'),
 (15,56133845, '8GM1B3RIODMT', '18103449137'),
 (16,09568631, 'B2HYIYE6HQCB', '18101457339');
 
  insert into supports (idsupports, id_staff, `role`) values
  (1,1,'receipt/verification of the application'),
  (1,2,'transfer of the application'),
  (2,6,'receipt/verification of the application'),
  (2,8,'transfer of the application'),
  (3,10,'receipt/verification of the application'),
  (3,12,'transfer of the application');
  
   insert into `users` (IPaddress, visit_time, id_account, id_staff_account) values
   ('46.164.176.196','2021-07-04 04:21:39', 8, null),
   ('8.57.99.219','2021-07-12 09:12:49', 3, null),
   ('8.57.99.219','2021-07-12 16:03:21', 1, null),
   ('8.57.99.219','2021-07-13 00:33:08', 5, null),
   ('46.164.176.196','2022-08-06 10:27:41', 4, null),
   ('25.171.119.139','2022-08-17 05:10:23', null, null),
   ('99.206.240.218','2023-09-04 13:24:59', 9, 6),
   ('62.2.254.5','2023-10-13 17:00:04', 2, 12),
   ('231.206.54.13','2023-10-13 19:21:47', 10, 15),
   ('8.57.99.219','2023-11-14 07:27:17', 3, null);
   
   insert into accounts_to_supports (time_of_appeal, data_of_appeal, id_support, id_staff, id_account) values
   ('2022-08-12 05:00:09', 'Dota 2: In the match with the number 485842392392, there was a cheater on Techies at 30:23, his cursor moved without moving the card', 1, 1, 1),
   ('2022-08-12 22:30:23', 'Dota 2: I met a cheater again) This time with an autohex on the tinker 32:04, 38:03. Ban it **** Match number 485842492794', 1, 1, 1),
   ('2022-08-20 18:22:45', 'Hello, I have changed my country of residence and now I need to change my payment details.', 2, 6, 4),
   ('2022-08-21 10:27:30', 'CS:GO: I hope you die!!!', 1, 1, 3),
   ('2022-09-24 06:04:18', 'The Forest: Hello, I have fulfilled all the conditions, but for some reason I am not given the achievement of Bad father (Survive 100 days without finding your son). Please check and help me', 2, 6, 7),
   ('2022-10-05 19:46:51', 'Skyrim: I reached level 80, but Ebony Warrior never appeared (I was at all locations, rebooted several times and tried to change the quest code in the txt document, nothing helps( please help', 3, 10, 5),
   ('2022-10-14 00:00:15', 'I deposited money into my account yesterday at about 16:35 - 17:00, but they still haven`t reached, probably this is your mistake, because I received a notification that the payment was successful. Return my money', 3, 10, 6),
   ('2022-12-30 21:58:11', 'GWENT the card game: the Nilfgaard faction is an unbalanced ****, tell the fools on the developers to remove it', 2, 6, 1),
   ('2023-01-07 17:40:06', 'During my online session at 17:24, a cheater with the nickname Cray joined me, killed me, broke all the armor, weapons and threw endless flasks of estus. I attach a video recording', 1, 1, 4);
   
   insert into supports_to_developers (id_developer, id_support, id_staff, time_of_appeal, data_of_appeal) values
   ( 1, 1, 2, '2022-08-12 07:22:13', 'id match: 485842392392, 30:23, Techies cheater'),
   ( 1, 1, 2, '2022-08-13 00:45:58', 'id match: 485842492794, 32:04, 38:03, Tinker cheater'),
   ( 4, 2, 8, '2022-09-24 07:15:34', 'The inability to get the Bad father achievement. The complaint was received from a player with an account id 7'),
   ( 7, 3, 12, '2022-10-05 21:28:06', 'No quest with ID:DLC2EbonyWarriorQuest, all conditions have been met, the problem is with a player with id 5.'),
   ( 2, 1, 2, '2023-01-07 20:54:29', 'A cheater with the nickname Cray was discovered during an online session of a player with id 4. After joining, he killed the session host until he left the game. He broke all the armor from the inventory, the weapons in the slots and gave endless flasks with ordinary estus and ashen estus. Video with proof:');
   
   insert into games_to_themes (id_game, id_theme) values
   (1,19),
   (1,24),
   (1,18),
   (1,21),
   (1,20),
   (1,12),
   (1,52),
   (1,16), /**/
   (2,18),
   (2,19),
   (2,24),
   (2,23),
   (2,28),
   (2,21),
   (2,22),
   (2,57),
   (2,69), /**/
   (4,5),
   (4,11),
   (4,67),
   (4,66),
   (4,43),
   (4,62),
   (4,1),
   (4,38),
   (4,10),
   (4,64),
   (4,42),
   (4,4),
   (4,65),
   (4,37), /**/
   (5,1),
   (5,29),
   (5,6),
   (5,28),
   (5,51),
   (5,2),
   (5,23), /**/
   (6,7),
   (6,51),
   (6,12),
   (6,10),
   (6,9),
   (6,37),
   (6,11),
   (6,17),
   (6,52), /**/
   (7,7),
   (7,37),
   (7,10),
   (7,52),
   (7,12),
   (7,49),
   (7,51),
   (7,11),
   (7,61),
   (7,21), /**/
   (8,7),
   (8,10),
   (8,11),
   (8,37),
   (8,17),
   (8,9),
   (8,21),
   (8,3),
   (8,52), /**/
   (9,1), 
   (9,28),
   (9,10),
   (9,29),
   (9,4),
   (9,51),
   (9,27),
   (9,30),
   (9,31),
   (9,70),
   (9,32), /**/
   (10,1),
   (10,29),
   (10,4),
   (10,28),
   (10,51),
   (10,10),
   (10,33),
   (10,30),
   (10,11),
   (10,34),
   (10,31), /**/
   (11,3),
   (11,4),
   (11,1),
   (11,13),
   (11,14),
   (11,28),
   (11,17),
   (11,15),
   (11,10),
   (11,16),
   (11,57),
   (11,5), /**/
   (12,1),
   (12,4),
   (12,3),
   (12,13),
   (12,28),
   (12,17),
   (12,14),
   (12,10),
   (12,15),
   (12,16),
   (12,55),/**/
   (13,4),
   (13,3),
   (13,17),
   (13,10),
   (13,28),
   (13,13),
   (13,15),
   (13,16),
   (13,42),
   (13,70),
   (13,1), /**/
   (14,11),
   (14,35),
   (14,36),
   (14,37),
   (14,33),
   (14,12),
   (14,39),
   (14,17),
   (14,10),
   (14,3),
   (14,38),
   (14,40), /**/
   (15,5),
   (15,4),
   (15,1),
   (15,3),
   (15,31),
   (15,28),
   (15,21),
   (15,40),
   (15,27),
   (15,42),
   (15,11),
   (15,39), /**/
   (16,3),
   (16,5),
   (16,31),
   (16,17),
   (16,36),
   (16,1),
   (16,42),
   (16,28),
   (16,4),
   (16,33),
   (16,43), /**/
   (17,3),
   (17,44),
   (17,48),
   (17,37),
   (17,28),
   (17,46),
   (17,10),
   (17,15),
   (17,45),
   (17,9),
   (17,16),
   (17,47),
   (17,69),
   (17,52), /**/
   (18,3),
   (18,11),
   (18,10),
   (18,12),
   (18,43),
   (18,30),
   (18,9),
   (18,37),
   (18,49),
   (18,50),
   (18,7),
   (18,51),
   (18,15),
   (18,71), /**/
   (19,3),
   (19,42),
   (19,17),
   (19,10),
   (19,28),
   (19,11),
   (19,32),
   (19,15),
   (19,9),
   (19,37),
   (19,4),
   (19,52), /**/
   (20,42),
   (20,3),
   (20,11),
   (20,10),
   (20,28),
   (20,4),
   (20,1),
   (20,27),
   (20,17),
   (20,9),
   (20,33),
   (20,29),
   (20,32),/**/
   (21,3),
   (21,53),
   (21,33),
   (21,37),
   (21,5),
   (21,31),
   (21,15),
   (21,39),
   (21,32),
   (21,11),
   (21,10),
   (21,27),
   (21,1), /**/
   (22,3),
   (22,53),
   (22,33),
   (22,37),
   (22,5),
   (22,31),
   (22,15),
   (22,39),
   (22,32),
   (22,11),
   (22,10),
   (22,27),
   (22,1), /**/
   (23,72),
   (23,3),
   (23,30),
   (23,32),
   (23,54),
   (23,28),
   (23,11),
   (23,10),
   (23,17),
   (23,33),
   (23,9),
   (23,52),
   (23,55), /**/
   (24,3),
   (24,11),
   (24,56),
   (24,57),
   (24,10),
   (24,58),
   (24,37),
   (24,59),
   (24,9),
   (24,15),
   (24,28),
   (24,43), /**/
   (25,5),
   (25,4),
   (25,1),
   (25,61),
   (25,37),
   (25,10),
   (25,60),
   (25,33),
   (25,11),
   (25,51), /**/
   (26,5),
   (26,1),
   (26,4),
   (26,61),
   (26,37),
   (26,33),
   (26,11),
   (26,10),
   (26,34),
   (26,9), /**/
   (27,3),
   (27,12),
   (27,52),
   (27,68),
   (27,69),
   (27,11),
   (27,50),
   (27,28),
   (27,10),
   (27,9),
   (27,37),
   (27,27),
   (27,61),
   (27,70); /**/ /*Нет сталкера и гвинта*/
   
   insert into games_to_genres (id_game, id_genre) values
   (1,1),
   (1,3), 
   (1,8),/**/
   (2,1),
   (2,7), /**/
   (3,3),
   (3,11), /**/
   (4,4), /**/
   (5,1),
   (5,4),
   (5,9), /**/
   (6,1),
   (6,2),
   (6,4), /**/
   (7,1),
   (7,2),
   (7,4), /**/
   (8,1), 
   (8,2),
   (8,4), /**/
   (9,1),
   (9,4),
   (9,9), /**/
   (10,1),
   (10,4),
   (10,9), /**/
   (11,4),
   (11,5),
   (11,9),
   (11,1), /**/
   (12,1),
   (12,4),
   (12,5),
   (12,9), /**/
   (13,4),
   (13,5),
   (13,3), /**/
   (14,1),
   (14,4),
   (14,2), /**/
   (15,1),
   (15,2),
   (15,4),
   (15,9), /**/
   (16,1),
   (16,2),
   (16,4),
   (16,9), /**/
   (17,1),
   (17,4),
   (17,5),
   (17,7), /**/
   (18,1),
   (18,2),
   (18,4), /**/
   (19,1),
   (19,2),
   (19,4),
   (19,7), /**/
   (20,1),
   (20,4),
   (20,7), /**/
   (21,1),
   (21,2),
   (21,4), /**/
   (22,1),
   (22,2),
   (22,4), /**/
   (23,1),
   (23,2),
   (23,4),/**/
   (24,1),
   (24,4),
   (24,7), /**/
   (25,1),
   (25,7),
   (25,9), 
   (25,4), /**/
   (26,1),
   (26,4),
   (26,7),
   (26,9), /**/
   (27,2),
   (27,4), /**/
   (28,1),
   (28,4),
   (28,7),
   (28,9), /**/
   (29,1),
   (29,4),
   (29,7),
   (29,9), /**/
   (30,1),
   (30,4),
   (30,7),
   (30,9); /**/

insert into games_to_types (id_game, id_type) values
(1,4),
(1,5), 
(1,2), /**/
(2,4),
(2,5),
(2,2), /**/
(3,4), /**/
(4,1), /**/
(5,1),
(5,2), /**/
(6,1),
(6,2), /**/
(7,1),
(7,2), /**/
(8,1),
(8,2), /**/
(9,1), /**/
(10,1), /**/
(11,1),
(11,2),
(11,3), /**/
(12,1),
(12,2),
(12,3), /**/
(13,1), /**/
(14,1), /**/
(15,1),
(15,2),
(15,4), /**/
(16,1),
(16,2),
(16,4), /**/
(17,1),
(17,2),
(17,3),
(17,4),
(17,6), /**/
(18,1), /**/
(19,1), /**/
(20,1), /**/
(21,1), /**/
(22,1), /**/
(23,1), /**/
(24,1),
(24,4), /**/
(25,1), /**/
(26,1), /**/
(27,1), /**/
(28,1), /**/
(29,1), /**/
(30,1); /**/

insert into games_to_awards (id_game, id_award) values
(1,2),
(1,29),
(1,40),
(1,41),
(1,42),
(1,85),
(1,43),
(1,44),
(1,45),
(1,47),
(1,46), /**/
(2,29),
(2,30), /**/
(3,31),
(3,32), /**/
(4,2),
(4,48),
(4,33),
(4,49),
(4,50),
(4,139),
(4,51),
(4,52),
(4,25),
(4,53),
(4,54),
(4,55),
(4,34),
(4,56),
(4,74),
(4,28),
(4,35), /**/
(5,36), /**/
(6,37),
(6,57),
(6,38),
(6,39), /**/
(7,58),
(7,59),
(7,60),
(7,61),
(7,62),
(7,2),
(7,63),
(7,64), /**/
(8,14),
(8,8),
(8,118),
(8,2),
(8,65), /**/
(9,68),
(9,67),
(9,33),
(9,2),
(9,66), /**/
(10,68),
(10,69),
(10,70), /**/
(11,7), /**/
(13,71),
(13,28),
(13,96),
(13,25),
(13,72), /**/
(14,73),
(14,74),
(14,81),
(14,56),
(14,75),
(14,27),
(14,76),
(14,70),
(14,78),
(14,79),
(14,80),
(14,2),
(14,13),
(14,4),
(14,28),
(14,20),
(14,82),
(14,83),
(14,84),
(14,85),
(14,86),
(14,87),
(14,88),
(14,91),
(14,89),
(14,51),
(14,130),
(14,128),
(14,92),
(14,9),
(14,71),
(14,1),
(14,90), /**/
(15,20),
(15,3),
(15,91),
(15,92), /**/
(16,11),
(16,93), /**/
(17,57),
(17,28),
(17,94),
(17,73),
(17,74),
(17,75),
(17,9),
(17,26),
(17,95),
(17,96),
(17,2),
(17,69),
(17,61),
(17,13),
(17,20),
(17,18),
(17,98),
(17,99),
(17,100),
(17,101),
(17,131),
(17,51),
(17,12),
(17,139),
(17,93),
(17,82),
(17,1), /**/
(18,27),
(18,74),
(18,28),
(18,75),
(18,102),
(18,26),
(18,58),
(18,60),
(18,61),
(18,14),
(18,77),
(18,2),
(18,4),
(18,5),
(18,3),
(18,8),
(18,83),
(18,100),
(18,130),
(18,88),
(18,65),
(18,108),
(18,92),
(18,1), /**/
(19,74),
(19,81),
(19,69),
(19,58),
(19,60),
(19,61),
(19,14),
(19,70),
(19,103),
(19,23),
(19,18),
(19,63),
(19,105),
(19,20),
(19,118),
(19,128),
(19,130),
(19,106),
(19,101),
(19,2),
(19,108),
(19,51),
(19,109),
(19,88), /**/
(20,110),
(20,4),
(20,111),
(20,92), /**/
(21,13),
(21,28),
(21,25),
(21,112),
(21,105), /**/
(22,113),
(22,92),
(22,13),
(22,67), /**/
(23,27),
(23,56),
(23,115),
(23,116),
(23,117),
(23,118),
(23,99),
(23,51),
(23,71),
(23,119),
(23,63),
(23,121),
(23,90),
(23,123), /**/
(24,27),
(24,74),
(24,94),
(24,56),
(24,75),
(24,124),
(24,77),
(24,12),
(24,2),
(24,28),
(24,13),
(24,19),
(24,99),
(24,125),
(24,100),
(24,71),
(24,20),
(24,108),
(24,54),
(24,91),
(24,126),
(24,88),
(24,128),
(24,127),
(24,9),
(24,1), /**/
(25,70),
(25,106),
(25,20),
(25,8),
(25,84),
(25,129),
(25,2),
(25,9),
(25,130), /**/
(26,131),
(26,73), /**/
(27,35),
(27,27),
(27,28),
(27,26),
(27,74),
(27,55),
(27,10),
(27,133),
(27,2),
(27,134),
(27,135),
(27,81),
(27,125),
(27,105),
(27,63),
(27,23),
(27,13),
(27,136),
(27,20),
(27,137),
(27,138),
(27,39),
(27,139),
(27,6);

insert into gaming_news (type_of_news, heading, date_of_creation, id_developer, id_game) values
('Update','Fixed a bug that caused some players to be unable to open fantasy card sets. Since it was impossible to participate in the first week of the fantasy league because of this, we gave 2 fantasy levels to all players who faced this problem.','2023-03-15 20:58:36', 1, 1),
('News','Today we are pleased to present the case "Revolution", which contains 17 colorings of weapons from the community and rare awards in the form of gloves from the case "Decisive Moment". We also release a capsule with stickers "Espionage", which contains 21 unique stickers from the artists of the Steam Workshop.To top it off, we have also prepared a set of Denzel Curry — ULTIMATE music, which contains Walkin, ULTIMATE and other hits from Denzel`s album Melt My Eyez See Your Future 2022.All three new items are already available in the game!','2023-02-10 21:29:04', 1, 2),
('Simple update','Firstly we`d like to announce that Progression part 1; v9.0, will be the next major update, coming shortly after v8.1. The plan is to have this out as soon as possible and will include the new leveling system for players, as well as the long-awaited equipment upgrades for your investigations! We`ve seen a lot of players` concerns about why we`re doing a wipe, and what will happen to their current progression, so here are a few quick insights: The wipe is needed to make way for the new leveling system, including prestiges, and will fundamentally change how you progress through the game. You`ll unlock equipment and upgrades in a specific order, and that needs to work from the start. Sadly we cannot translate the new system to the current one, so a reset is the only way to go! Money and experience numbers will be adjusted, you will no longer level up every 100xp. Now, each level will require more XP as you progress and upon reaching the end of level 100, you will unlock the option to prestige and reset your progress, with the reward of a new badge and title for your ID card. Your current level will be saved and in the future, we will give you a unique badge for your player character to show off how far you made it pre-wipe. These will have different colors and materials depending on how high your level was. This will be the only way to unlock this specific badge, so get going!','2023-01-19 16:00:52', 3, 5),
('A small update','Online features for the PC version of Dark Souls: Remastered have been reactivated.','2022-11-09 16:20:00', 2, 6),
('In-game event','Good news! The airdrops are coming in with 2X drop bonuses. Inside, you will find rare weapons (any rarity, including gold), medkits, jewels and weapon upgrades. You can even get blades the likes of the Wolfclaw machete. There’s a catch, though. Rais’ goon squads have crawled out of their holes, and they’ll be looking to get their hands on the loot as well.','2022-12-09 18:16:45', 15, 15),
('Patch notes','A new update file for the PC version of "DARK SOULS III" has been released to fix some bugs. We apologize for the inconvenience, but please apply the latest update file before enjoying the game. Items included in the latest update Fixed some bugs in the recently released update file (1.15.1). The version number in the upper left corner of the title screen when this update file is applied is as follows.','2023-01-12 13:15:28', 2, 8),
('Discount','Experience Kratos and Arteus` journey as they venture into the brutal Norse wilds and fight to fulfill a deeply personal quest. With an emphasis on discovery and exploration, God of War™ invites you to discover a breathtaking but threatening landscape full of secrets, lore, and fearsome creatures. Engage in visceral combat with an over-the-shoulder camera that brings you closer to the action than ever before!','2022-09-15 20:30:58', 13, 14),
('A small update','Fixed an issue causing PC players (Steam and Microsoft Store) to crash when entering Kolbjorn Barrow and the Dawnstar Museum.','2022-01-06 18:04:13', 7, 27),
('A small update','Hey everyone, This patch updates The Forest VR to include support for the new index controllers as well as fixing and improving a ton of VR specific issues.','2019-09-10 23:04:17', 4, 11),
('Hotfix','The hotfix for the game "The Witcher 3: Wild Hunt" is already available! It is designed to fix performance issues that appeared after patch 4.01. The version of the game will not change.','2022-02-14 15:04:32', 8, 18);

insert into games_purchase (id_account, id_game, time_of_purchase) values
(1, 18,'2023-03-17 02:21:46'),
(1, 20,'2023-03-17 03:04:18'),
(3, 6,'2023-03-17 10:34:21'),
(3, 7,'2023-03-17 10:58:59'),
(3, 8,'2023-03-17 11:12:34'),
(8, 9,'2023-03-17 05:31:09'),
(8, 10,'2023-03-17 07:22:29'),
(5, 15,'2022-03-17 07:25:12'),
(7, 12,'2022-03-17 09:45:04'),
(4, 23,'2022-03-17 18:01:55');

insert into games_search (id_game, id_account, time_of_search) values
(18, 1,'2023-03-17 02:19:21'),
(20, 1,'2023-03-17 03:01:30'),
(6, 3,'2023-03-17 10:33:00'),
(7, 3,'2023-03-17 10:54:15'),
(8, 3,'2023-03-17 10:58:06'),
(9, 8,'2023-03-17 05:24:59'),
(10, 8,'2023-03-17 07:09:04'),
(15, 5,'2022-03-17 07:14:37'),
(12, 7,'2022-03-17 09:33:13'),
(23, 4,'2022-03-17 17:41:19');

insert into recommendation_lists (id_account, date_of_creation, game_counter, id_game_search, id_prevailing_genre, id_proposed_game) values
(1,'2023-03-17 03:01:30', 2, 2, 4, 24),
(3,'2023-03-17 10:58:06', 3, 5, 2, 14),
(8,'2023-03-17 05:24:59', 2, 7, 9, 25),
(5,'2022-03-17 07:14:37', 1, 8, 9, 16),
(7,'2022-03-17 09:33:13', 1, 9, 5, 13),
(4,'2022-03-17 17:41:19', 1, 10, 4, 18);
