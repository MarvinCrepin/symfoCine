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
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CF675F31B` (`author_id`),
  KEY `IDX_9474526C567F5183` (`film_id`),
  CONSTRAINT `FK_9474526C567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,4,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam convallis vel massa in rhoncus. Nam nec mauris vestibulum, maximus mi eu, dignissim est. Quisque viverra nulla ac augue suscipit, non porttitor nisi ornare. Suspendisse in justo vitae ante scelerisque porttitor. Sed pellentesque venenatis turpis non pretium. In non cursus nisl.','Thierry','Lorem'),(2,4,7,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam convallis vel massa in rhoncus. Nam nec mauris vestibulum, maximus mi eu, dignissim est. Quisque viverra nulla ac augue suscipit, non porttitor nisi ornare. Suspendisse in justo vitae ante scelerisque porttitor. Sed pellentesque venenatis turpis non pretium. In non cursus nisl.','Jules','Lorem'),(3,4,8,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam convallis vel massa in rhoncus. Nam nec mauris vestibulum, maximus mi eu, dignissim est. Quisque viverra nulla ac augue suscipit, non porttitor nisi ornare. Suspendisse in justo vitae ante scelerisque porttitor. Sed pellentesque venenatis turpis non pretium. In non cursus nisl.','Patrick','Lorem'),(4,4,10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam convallis vel massa in rhoncus. Nam nec mauris vestibulum, maximus mi eu, dignissim est. Quisque viverra nulla ac augue suscipit, non porttitor nisi ornare. Suspendisse in justo vitae ante scelerisque porttitor. Sed pellentesque venenatis turpis non pretium. In non cursus nisl.','Laure','Lorem'),(5,4,7,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam convallis vel massa in rhoncus. Nam nec mauris vestibulum, maximus mi eu, dignissim est. Quisque viverra nulla ac augue suscipit, non porttitor nisi ornare. Suspendisse in justo vitae ante scelerisque porttitor. Sed pellentesque venenatis turpis non pretium. In non cursus nisl.','Thomas','Lorem 2');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_film`
--

LOCK TABLES `favorite_film` WRITE;
/*!40000 ALTER TABLE `favorite_film` DISABLE KEYS */;
INSERT INTO `favorite_film` VALUES (1,4,7),(2,4,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (7,'Mourir peut attendre','https://picsum.photos/360','<div>James Bond n\'est plus en service et profite d\'une vie tranquille en Jama??que. Mais son r??pit est de courte dur??e car l\'agent de la CIA Felix Leiter fait son retour pour lui demander son aide.&nbsp;</div>','mourir-peut-attendre'),(8,'Matrix','https://picsum.photos/350','<div>Film de science fiction pr??curseur sur le hacking et la RA.</div>','matrix'),(9,'Matrix 2','https://fr.web.img3.acsta.net/medias/nmedia/00/02/53/34/affiche.jpg','<div>N??o est dans le monde virtuel (la matrice).</div>','matrix-2'),(10,'La Ligne Verte','https://fr.web.img4.acsta.net/medias/nmedia/18/66/15/78/19254683.jpg','<div>Paul Edgecomb, pensionnaire centenaire d\'une maison de retraite, est hant?? par ses souvenirs. Gardien-chef du p??nitencier de Cold Mountain.</div>','la-ligne-verte');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user@uuuser.com','[]','$2y$13$hBh1/X36.bfWXdqXTcC8e.hadbXlVyL1B81N8WSQJckKKrIGoAuxG'),(3,'user2@user.com','[\"ROLE_USER\"]','$2y$13$AUgik15zLx8dTOk40F6ExObpYpmGUni0owjLRXkPP/R2onTJPXZn2'),(4,'admin@admin.com','[\"ROLE_ADMIN\"]','$argon2id$v=19$m=65536,t=4,p=1$AEQlMSyyVQu+8quF+87pSg$UaUSjQWKvj8X6Q2xautjMROSIGdeekz4CYNEieQG6b0'),(5,'testuser@user.com','[]','$argon2id$v=19$m=65536,t=4,p=1$ldOpUDhv+KQ7La2lD3i4MA$IIkS/uFl91QUtIwi5n9gtE3nQAENBt4uqnl+GANeKLI'),(6,'usere@uuuser.com','[]','test'),(7,'root@root.com','[]','$argon2id$v=19$m=65536,t=4,p=1$zPaYMAhWCU+rbIt8iGdHsg$LUJU2i6UnTdJafDve4fn5ifA3S6usFy8E7tfSamLVh4'),(8,'testfav@fav.com','[]','$argon2id$v=19$m=65536,t=4,p=1$eLghXVGfemACjo4CO4BDGw$u+W7pg/RNLP0xJqU1QJWTFndFhAraAKbYDv7UtpgQoo');
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

-- Dump completed on 2021-10-17 21:13:16
