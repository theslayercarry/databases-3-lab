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