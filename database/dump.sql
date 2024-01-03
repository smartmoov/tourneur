-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tourneur
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `adresse_id` int(11) NOT NULL AUTO_INCREMENT,
  `rue` varchar(39) DEFAULT NULL,
  `ville` varchar(39) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `complement` varchar(39) DEFAULT NULL,
  PRIMARY KEY (`adresse_id`),
  UNIQUE KEY `ville` (`ville`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES
(1,'rue uimm','Bruz',35000,'Ker Lann'),
(2,'Boulevard de la Vilette','Paris',75018,'');
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artiste` (
  `artiste_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adresse_id` int(11) NOT NULL,
  `id_instrument` int(11) DEFAULT NULL,
  `id_orchestre` int(11) DEFAULT NULL,
  PRIMARY KEY (`artiste_id`),
  UNIQUE KEY `email` (`email`),
  KEY `id_adresse` (`adresse_id`),
  KEY `id_instrument` (`id_instrument`),
  KEY `id_orchestre` (`id_orchestre`),
  CONSTRAINT `artiste_ibfk_1` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`adresse_id`),
  CONSTRAINT `artiste_ibfk_2` FOREIGN KEY (`id_instrument`) REFERENCES `instrument` (`id_instrument`),
  CONSTRAINT `artiste_ibfk_3` FOREIGN KEY (`id_orchestre`) REFERENCES `orchestre` (`id_orchestre`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artiste`
--

LOCK TABLES `artiste` WRITE;
/*!40000 ALTER TABLE `artiste` DISABLE KEYS */;
INSERT INTO `artiste` VALUES
(1,'simon','leo','leo@gmail.com',1,3,1),
(2,'Mathieu','Brinet','mathieu@gmail.com',1,2,1),
(3,'Fraboulet','Samuel','samuel@gmail.com',1,1,3),
(4,'Pierre','Garnier','pierre@gmail.com',1,4,4),
(5,'Gabriel','Guérin','gabriel@gmail.com',1,4,3),
(7,'PAU','stephane@lery.cc',NULL,2,NULL,NULL),
(8,'Pau','Stéphane',NULL,2,NULL,NULL),
(13,'Pau','Stephane',NULL,2,NULL,NULL),
(14,'Pau','Stephane\'); DELETE FROM representation; -- ',NULL,2,NULL,NULL),
(17,'Stephane',NULL,'stephane@lery.cc',1,NULL,NULL),
/*!40000 ALTER TABLE `artiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrument` (
  `id_instrument` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `poids` int(11) DEFAULT NULL,
  `dimension` decimal(8,3) DEFAULT NULL,
  PRIMARY KEY (`id_instrument`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument`
--

LOCK TABLES `instrument` WRITE;
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `instrument` VALUES
(1,'Guitare',10,4.000),
(2,'Basse',12,4.000),
(3,'Violon',8,3.000),
(4,'Piano',145,8.000),
(5,'Guitare',9,9.000);
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orchestre`
--

DROP TABLE IF EXISTS `orchestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orchestre` (
  `id_orchestre` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_orchestre`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orchestre`
--

LOCK TABLES `orchestre` WRITE;
/*!40000 ALTER TABLE `orchestre` DISABLE KEYS */;
INSERT INTO `orchestre` VALUES
(1,'Daft Punk'),
(2,'Rolling Stones'),
(4,'Roxy Music'),
(3,'The Who');
/*!40000 ALTER TABLE `orchestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orchestre_tournee`
--

DROP TABLE IF EXISTS `orchestre_tournee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orchestre_tournee` (
  `id_tournee` int(11) NOT NULL,
  `id_orchestre` int(11) NOT NULL,
  PRIMARY KEY (`id_tournee`,`id_orchestre`),
  KEY `id_orchestre` (`id_orchestre`),
  CONSTRAINT `orchestre_tournee_ibfk_1` FOREIGN KEY (`id_tournee`) REFERENCES `tournee` (`id_tournee`),
  CONSTRAINT `orchestre_tournee_ibfk_2` FOREIGN KEY (`id_orchestre`) REFERENCES `orchestre` (`id_orchestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orchestre_tournee`
--

LOCK TABLES `orchestre_tournee` WRITE;
/*!40000 ALTER TABLE `orchestre_tournee` DISABLE KEYS */;
INSERT INTO `orchestre_tournee` VALUES
(1,1),
(3,3);
/*!40000 ALTER TABLE `orchestre_tournee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representation`
--

DROP TABLE IF EXISTS `representation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `representation` (
  `id_representation` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `date_representation` datetime DEFAULT NULL,
  `transport` varchar(50) DEFAULT NULL,
  `id_adresse` int(11) NOT NULL,
  `id_tournee` int(11) NOT NULL,
  PRIMARY KEY (`id_representation`),
  KEY `id_adresse` (`id_adresse`),
  KEY `id_tournee` (`id_tournee`),
  CONSTRAINT `representation_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`adresse_id`),
  CONSTRAINT `representation_ibfk_2` FOREIGN KEY (`id_tournee`) REFERENCES `tournee` (`id_tournee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representation`
--

LOCK TABLES `representation` WRITE;
/*!40000 ALTER TABLE `representation` DISABLE KEYS */;
INSERT INTO `representation` VALUES
(3,'Alive Journée 2','2023-01-01 00:00:00','Bus',2,1);
/*!40000 ALTER TABLE `representation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES
(1,'admin'),
(2,'commercial');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournee`
--

DROP TABLE IF EXISTS `tournee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournee` (
  `id_tournee` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_tournee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournee`
--

LOCK TABLES `tournee` WRITE;
/*!40000 ALTER TABLE `tournee` DISABLE KEYS */;
INSERT INTO `tournee` VALUES
(1,'Alive','2022-12-15','2023-03-13'),
(2,'Hackney Diamonds','2021-08-15','2022-12-31'),
(3,'Rock tour','2023-10-01','2024-04-30');
/*!40000 ALTER TABLE `tournee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nom` varchar(75) NOT NULL,
  `role_id` int(11) DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `fs_uniquifier` varchar(200) NOT NULL,
  PRIMARY KEY (`utilisateur_id`),
  UNIQUE KEY `utilisateur_UN` (`email`),
  KEY `utilisateur_role_FK` (`role_id`),
  CONSTRAINT `utilisateur_role_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES
(4,'stephane+test@gmail.com','scrypt:32768:8:1$Hognld8sdopw5uXd$397cf177f4ee9db95f1bad4571085b208569c151dff09148c1709e1497d6804cb8a61da791240b5a775099ae6c7e29bc1d461c59d301d76b7e210cf21fd04309','blabla',1,1,'gelkgekgemkegmkeg'),
(5,'stephane+te@gmail.com','scrypt:32768:8:1$Hognld8sdopw5uXd$397cf177f4ee9db95f1bad4571085b208569c151dff09148c1709e1497d6804cb8a61da791240b5a775099ae6c7e29bc1d461c59d301d76b7e210cf21fd04309','blabla',1,1,'gejgeoegnkgnbder34'),
(6,'steph+test@gmail.com','scrypt:32768:8:1$eVSOcmkJzSdNFIsK$fe0bef7783a63ce790feb9ebe20508db1b2d3d1c09881662620bbbc78937284a0396d1c2515844609e2f44a2eef8a3e0eb212773cb4727dc15e50cbaa42770d7','blabla',1,1,'');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-03 13:17:14
