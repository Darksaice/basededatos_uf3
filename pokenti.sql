-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pokenti
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

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
-- Table structure for table `evolutions`
--

DROP TABLE IF EXISTS `evolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evolutions` (
  `id_evolution` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `at_level` int(11) NOT NULL,
  `id_pokemon` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_evolution`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `evolutions_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolutions`
--

LOCK TABLES `evolutions` WRITE;
/*!40000 ALTER TABLE `evolutions` DISABLE KEYS */;
INSERT INTO `evolutions` VALUES (1,25,3),(2,25,4),(3,40,4),(4,50,5),(5,60,11),(6,20,12),(7,29,15),(8,40,15);
/*!40000 ALTER TABLE `evolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moves`
--

DROP TABLE IF EXISTS `moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moves` (
  `id_move` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `id_pokemon` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_move`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `moves_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moves`
--

LOCK TABLES `moves` WRITE;
/*!40000 ALTER TABLE `moves` DISABLE KEYS */;
INSERT INTO `moves` VALUES (1,'Draco Meteor',1),(2,'Fly',16),(3,'Cut',15),(4,'Nightmare',2),(5,'Double Team',12),(6,'Haze',8),(7,'Focus Punch',5),(8,'Swagger',9),(9,'Disable',13),(10,'Ember',3),(11,'Psybeam',4),(12,'Surf',6),(13,'Lick',7),(14,'Thunder',10),(15,'Fissure',11),(16,'Sandstrom',14);
/*!40000 ALTER TABLE `moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_pokemons`
--

DROP TABLE IF EXISTS `party_pokemons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_pokemons` (
  `id_party_pokemon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokemon` int(10) unsigned NOT NULL,
  `id_stat` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_party_pokemon`),
  KEY `id_pokemon` (`id_pokemon`),
  KEY `id_stat` (`id_stat`),
  CONSTRAINT `party_pokemons_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`),
  CONSTRAINT `party_pokemons_ibfk_2` FOREIGN KEY (`id_stat`) REFERENCES `stats` (`id_stat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_pokemons`
--

LOCK TABLES `party_pokemons` WRITE;
/*!40000 ALTER TABLE `party_pokemons` DISABLE KEYS */;
INSERT INTO `party_pokemons` VALUES (1,1,1),(2,2,2),(3,7,7),(4,16,16),(5,13,13),(6,6,6);
/*!40000 ALTER TABLE `party_pokemons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_boxs`
--

DROP TABLE IF EXISTS `pc_boxs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_boxs` (
  `id_pc_box` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokemon` int(10) unsigned NOT NULL,
  `id_stat` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_pc_box`),
  KEY `id_pokemon` (`id_pokemon`),
  KEY `id_stat` (`id_stat`),
  CONSTRAINT `pc_boxs_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`),
  CONSTRAINT `pc_boxs_ibfk_2` FOREIGN KEY (`id_stat`) REFERENCES `stats` (`id_stat`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_boxs`
--

LOCK TABLES `pc_boxs` WRITE;
/*!40000 ALTER TABLE `pc_boxs` DISABLE KEYS */;
INSERT INTO `pc_boxs` VALUES (1,3,3),(2,4,4),(3,5,5),(4,8,8),(5,9,9),(6,10,10),(7,11,11),(8,12,12),(9,14,14),(10,15,15);
/*!40000 ALTER TABLE `pc_boxs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemons`
--

DROP TABLE IF EXISTS `pokemons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemons` (
  `id_pokemon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `gender` char(1) NOT NULL,
  `description` text DEFAULT NULL,
  `ot` varchar(8) NOT NULL,
  `evolution` tinyint(1) NOT NULL,
  `shiny` tinyint(1) NOT NULL,
  `image` varchar(24) NOT NULL,
  `id_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_pokemon`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `pokemons_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `types` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemons`
--

LOCK TABLES `pokemons` WRITE;
/*!40000 ALTER TABLE `pokemons` DISABLE KEYS */;
INSERT INTO `pokemons` VALUES (1,'Garchomp','M','mach','Sara',0,1,'garchomp.png',3),(2,'Darkrai','M','darkness','Sara',0,0,'darkrai.png',2),(3,'Vulpix','F','fox','Sara',1,0,'vulpix.png',7),(4,'Togepi','M','ball','Sara',1,0,'togepi.png',5),(5,'Riolu','M','aura','Sara',1,0,'riolu.png',6),(6,'Milotic','F','tender','Sara',0,0,'milotic.png',18),(7,'Spiritomb','F','forbidden','Sara',0,1,'spiritomb.png',9),(8,'Glalie','M','face','Sara',0,0,'glalie.png',12),(9,'Volbeat','M','firefly','Sara',0,0,'volbeat.png',1),(10,'Luxray','M','gleameyes','Sara',0,0,'luxray.png',4),(11,'Nosepass','F','compass','Sara',1,0,'nosepass.png',16),(12,'Skitty','F','cat','Sara',1,0,'skitty.png',13),(13,'Roserade','F','flower','Sara',0,0,'roserade.png',10),(14,'Durant','M','ant','Sara',0,0,'durant.png',17),(15,'Sandile','M','crocodile','Sara',1,0,'crocodile.png',11),(16,'Staraptor','M','predator','Sara',0,0,'staraptor.png',8);
/*!40000 ALTER TABLE `pokemons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id_stat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `sp_atk` int(11) NOT NULL,
  `sp_def` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `ability` varchar(10) NOT NULL,
  `id_pokemon` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_stat`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,85,15000,300,250,200,255,215,195,'Pressure',1),(2,100,25000,400,350,310,300,315,295,'Bad Dreams',2),(3,25,100,35,28,31,25,31,31,'Intimidate',3),(4,10,15,20,19,20,20,20,19,'Cute',4),(5,39,60,45,36,40,43,40,60,'Pressure',5),(6,50,100,170,100,99,108,100,120,'Cure',6),(7,60,400,298,160,152,165,160,201,'Pressure',7),(8,40,61,45,38,44,44,44,65,'Intimidate',8),(9,20,20,30,21,19,22,20,25,'Static',9),(10,49,99,171,103,99,100,100,120,'Static',10),(11,57,200,199,150,180,151,181,100,'Steadfast',11),(12,15,30,20,19,19,19,19,25,'Cure',12),(13,60,300,230,210,203,211,205,215,'Cure',13),(14,31,80,33,30,29,31,31,29,'Steadfast',14),(15,25,45,49,35,38,37,40,33,'Steadfast',15),(16,70,400,220,168,160,170,156,200,'Intimidate',16);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Bug'),(2,'Dark'),(3,'Dragon'),(4,'Electric'),(5,'Fairy'),(6,'Fighting'),(7,'Fire'),(8,'Flying'),(9,'Ghost'),(10,'Grass'),(11,'Ground'),(12,'Ice'),(13,'Normal'),(14,'Poison'),(15,'Psychic'),(16,'Rock'),(17,'Steel'),(18,'Water');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_pokemons_moves`
--

DROP TABLE IF EXISTS `view_pokemons_moves`;
/*!50001 DROP VIEW IF EXISTS `view_pokemons_moves`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pokemons_moves` (
  `id_pokemon` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `id_move` tinyint NOT NULL,
  `move` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_pokemons_skills`
--

DROP TABLE IF EXISTS `view_pokemons_skills`;
/*!50001 DROP VIEW IF EXISTS `view_pokemons_skills`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pokemons_skills` (
  `id_pokemon` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `ability` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_pokemons_moves`
--

/*!50001 DROP TABLE IF EXISTS `view_pokemons_moves`*/;
/*!50001 DROP VIEW IF EXISTS `view_pokemons_moves`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`enti`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pokemons_moves` AS select `pokemons`.`id_pokemon` AS `id_pokemon`,`pokemons`.`name` AS `name`,`moves`.`id_move` AS `id_move`,`moves`.`name` AS `move` from (`pokemons` left join `moves` on(`pokemons`.`id_pokemon` = `moves`.`id_pokemon`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pokemons_skills`
--

/*!50001 DROP TABLE IF EXISTS `view_pokemons_skills`*/;
/*!50001 DROP VIEW IF EXISTS `view_pokemons_skills`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`enti`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pokemons_skills` AS select `pokemons`.`id_pokemon` AS `id_pokemon`,`pokemons`.`name` AS `name`,`stats`.`ability` AS `ability` from (`pokemons` left join `stats` on(`pokemons`.`id_pokemon` = `stats`.`id_pokemon`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-21 20:13:55
