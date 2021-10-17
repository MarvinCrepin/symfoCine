-- MySQL dump 10.13  Distrib 8.0.26, for macos11.4 (arm64)
--
-- Host: localhost    Database: symfocine
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advice`
--

DROP TABLE IF EXISTS `advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `film_id` int NOT NULL,
  `state` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64820E8DA76ED395` (`user_id`),
  KEY `IDX_64820E8D567F5183` (`film_id`),
  CONSTRAINT `FK_64820E8D567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  CONSTRAINT `FK_64820E8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advice`
--

LOCK TABLES `advice` WRITE;
/*!40000 ALTER TABLE `advice` DISABLE KEYS */;
/*!40000 ALTER TABLE `advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `film_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CF675F31B` (`author_id`),
  KEY `IDX_9474526C567F5183` (`film_id`),
  CONSTRAINT `FK_9474526C567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20211014080230','2021-10-16 09:00:49',72);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_film`
--

DROP TABLE IF EXISTS `favorite_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `film_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6C42A71DA76ED395` (`user_id`),
  KEY `IDX_6C42A71D567F5183` (`film_id`),
  CONSTRAINT `FK_6C42A71D567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  CONSTRAINT `FK_6C42A71DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_film`
--

LOCK TABLES `favorite_film` WRITE;
/*!40000 ALTER TABLE `favorite_film` DISABLE KEYS */;
INSERT INTO `favorite_film` VALUES (1,4,7),(2,4,8),(3,5,9);
/*!40000 ALTER TABLE `favorite_film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_field` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (7,'Mourir peut attendre','https://picsum.photos/350','<div>James Bond n\'est plus en service et profite d\'une vie tranquille en Jamaïque. Mais son répit est de courte durée car l\'agent de la CIA Felix Leiter fait son retour pour lui demander son aide.&nbsp;</div>','mourir-peut-attendre'),(8,'Matrix','https://picsum.photos/350','<div>Film de science fiction précurseur sur le hacking et la RA.</div>','matrix'),(9,'Matrix 2','https://fr.web.img3.acsta.net/medias/nmedia/00/02/53/34/affiche.jpg','<div>Néo est dans le monde virtuel (la matrice).</div>','matrix-2');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_user`
--

DROP TABLE IF EXISTS `film_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_user` (
  `film_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`film_id`,`user_id`),
  KEY `IDX_E83C3C4A567F5183` (`film_id`),
  KEY `IDX_E83C3C4AA76ED395` (`user_id`),
  CONSTRAINT `FK_E83C3C4A567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E83C3C4AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_user`
--

LOCK TABLES `film_user` WRITE;
/*!40000 ALTER TABLE `film_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `film_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user@uuuser.com','[]','$2y$13$hBh1/X36.bfWXdqXTcC8e.hadbXlVyL1B81N8WSQJckKKrIGoAuxG'),(3,'user2@user.com','[\"ROLE_USER\"]','$2y$13$AUgik15zLx8dTOk40F6ExObpYpmGUni0owjLRXkPP/R2onTJPXZn2'),(4,'admin@admin.com','[\"ROLE_ADMIN\"]','$argon2id$v=19$m=65536,t=4,p=1$AEQlMSyyVQu+8quF+87pSg$UaUSjQWKvj8X6Q2xautjMROSIGdeekz4CYNEieQG6b0'),(5,'testuser@user.com','[]','$argon2id$v=19$m=65536,t=4,p=1$ldOpUDhv+KQ7La2lD3i4MA$IIkS/uFl91QUtIwi5n9gtE3nQAENBt4uqnl+GANeKLI'),(6,'usere@uuuser.com','[]','test'),(7,'root@root.com','[]','$argon2id$v=19$m=65536,t=4,p=1$zPaYMAhWCU+rbIt8iGdHsg$LUJU2i6UnTdJafDve4fn5ifA3S6usFy8E7tfSamLVh4');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-16 23:53:32
