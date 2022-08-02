UNLOCK TABLES;
CREATE DATABASE IF NOT EXISTS lab4;
use lab4;
SET GLOBAL time_zone = '+3:00';
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: lab4
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `postdatetime` timestamp NULL DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `songs_users_fk` (`uid`),
  CONSTRAINT `songs_users_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES 
(1,5,'2021-04-02 20:14:30','https://www.youtube.com/embed/LEbsx5sYZ3s'),
(2,4,'2021-04-02 20:15:49','https://www.youtube.com/embed/YVkUvmDQ3HY');
/*(2,4,'2019-05-02 20:15:49','Recuerdos de Vietnam'),
(3,4,'2020-03-02 20:15:49','Boom Boom el Tram');*/

/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`fid`),
  KEY `fid_users_fk` (`fid`),
  CONSTRAINT `fid_users_fk` FOREIGN KEY (`fid`) REFERENCES `users` (`id`),
  CONSTRAINT `uid_users_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
-- INSERT INTO `follows` VALUES (2,1),(1,2),(2,3),(1,4);
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `postdatetime` timestamp NULL DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `favs` int(11) DEFAULT 0,
  `retweets` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tweets_users_fk` (`uid`),
  KEY `tweets_tweets_fk` (`pid`),
  CONSTRAINT `tweets_tweets_fk` FOREIGN KEY (`pid`) REFERENCES `tweets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tweets_users_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES 
(1,1,'2021-06-02 20:15:49','Habeis oido la nueva canción de Lil Bokeron??',NULL,2,0),
(2,2,'2021-06-02 20:15:58','Si, INCREÍBLE TEMAZO',NULL,1,0),
(3,3,'2021-06-02 20:16:02','Pues a mi no me ha gustado la verdad',NULL,0,0),
(4,3,'2021-06-02 20:17:00','Escuchad No Hay Pan de Drake es brutal',NULL,4,0),
(5,4,'2021-06-02 20:18:30','Hola chicos alguna recomedación?',NULL,0,0),
(6,3,'2021-06-02 20:18:49','Acabo de ponerlo tonto',NULL,1,0),
(7,2,'2021-02-07 20:15:49','HOLA',NULL,0,0),
(8,1,'2021-02-07 20:15:50','pa ti mi cola',NULL,3,0),
(9,3,'2021-02-07 20:15:49','jaja salu2',NULL,0,0),
(10,5,'2021-06-02 20:14:30','HEY CHAVALES temita nuevo',NULL,4,0),
(11,5,'2021-06-02 20:14:32','Ya podeis escucharlo en mi perfil',NULL,4,0);

/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`name` varchar(255) NOT NULL,
        `typeUser` varchar(255),
        `fullname` varchar(255),
  		`mail` varchar(255) NOT NULL,
        `birthdate` varchar(255) NOT NULL,
        `pais` varchar(255),
        `city` varchar(255),
  		`pwd` varchar(255) NOT NULL,
        `followers` int(11) DEFAULT 0,
        `is_admin` bool DEFAULT false,
  		PRIMARY KEY (`id`),
  		UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adamdbouk','regular','Adam Dbouk','adam@gmail.com','13/12/2000','espana','barcelona','Adam131200',0,true), 
							(2,'jorditortosa','regular','jordi','jordi@gmail.com','11/11/2000','espana','barcelona','Jordi1111',0,true),
							(3,'joellamata','regular','joel','joel@gmail.com','27/09/2000','espana','barcelona','Lamata88',0,false),
							(4,'eliasasskali','artista','ilias','ilias@gmail.com','28/03/2000','espana','vic','Ilias123',0,false),
                            (5,'LiLBokeron','artista','Andres','bokeron@gmail.com','11/11/1995','espana','barcelona','Bokeron444',0,false);
                            
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 17:35:30

DROP TABLE IF EXISTS `favs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favs` (
		`uid` int(11) NOT NULL,
        `tid` int(11) NOT NULL,
  		PRIMARY KEY (`uid`, `tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- TRIGGERS

-- TRIGGER PER ELIMINAR TWEETS, FOLLOWS i FAVS D'UN USUARI QUAN ES ELIMINAT
DELIMITER $$
DROP TRIGGER IF EXISTS remove_user $$
CREATE TRIGGER remove_user
	BEFORE DELETE
    ON `users` FOR EACH ROW
BEGIN
	SET @disable_trigger = 1;
		DELETE FROM `follows` WHERE uid=old.id OR fid=old.id;
	SET @disable_trigger = NULL;
		DELETE FROM `tweets` WHERE uid=old.id;
        DELETE FROM `songs` WHERE uid=old.id;
END$$
DELIMITER ;

-- TRIGGER PER QUAN ES FA FOLLOW INCREMENTAR EL FOLLOWER COUNTER.
DELIMITER $$
DROP TRIGGER IF EXISTS add_follower $$
CREATE TRIGGER add_follower 
	AFTER INSERT
    ON `follows` FOR EACH ROW
BEGIN
	UPDATE `users` 
		SET followers = followers + 1
        WHERE id = new.fid;
END$$
DELIMITER ;

-- TRIGGER PER BAIXAR EL CONTADOR DE SEGUIDORS QUAN DEIXEN DE SEGUIRTE
DELIMITER $$
DROP TRIGGER IF EXISTS remove_follower $$
CREATE TRIGGER remove_follower
	AFTER DELETE
    ON `follows` FOR EACH ROW
BEGIN
	IF @disable_trigger IS NULL THEN
		UPDATE `users` 
			SET followers = followers - 1
			WHERE id = old.fid;
	END IF;
END$$
DELIMITER ;

-- TRIGGER PER QUAN ES FA fav INCREMENTAR EL favs COUNTER.
DELIMITER $$
DROP TRIGGER IF EXISTS add_fav $$
CREATE TRIGGER add_fav
	AFTER INSERT
    ON `favs` FOR EACH ROW
BEGIN
	UPDATE `tweets` 
		SET favs = favs + 1
        WHERE id = new.tid;
END$$
DELIMITER ;

-- TRIGGER PER BAIXAR EL CONTADOR DE favs QUAN ES TREU EL fav
DELIMITER $$
DROP TRIGGER IF EXISTS remove_favs $$
CREATE TRIGGER remove_favs
	AFTER DELETE
    ON `favs` FOR EACH ROW
BEGIN
	UPDATE `tweets`
		SET favs = favs - 1
        WHERE id = old.tid;
END$$
DELIMITER ;

-- TRIGGER PER ELIMINAR EL FAV QUAN S'ELIMINA UN TWEET
DELIMITER $$
DROP TRIGGER IF EXISTS remove_fav $$
CREATE TRIGGER remove_fav
	BEFORE DELETE
    ON `tweets` FOR EACH ROW
BEGIN
	DELETE FROM `favs` WHERE tid = old.id;
END$$
DELIMITER ;

-- TRIGGER PER AFEGIR ENLLAÇOS YOUTUBE CORRECTAMENT
DELIMITER $$
DROP TRIGGER IF EXISTS remove_fav $$
CREATE TRIGGER embedthevideo
BEFORE INSERT ON songs 	FOR EACH ROW
BEGIN
	SET NEW.content = SUBSTRING(REPLACE(NEW.content, "https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/"), 1, 41);
END$$
DELIMITER ;

-- PROCEDURE PER AFEGIR UN RETWEET 
DELIMITER $$
DROP PROCEDURE IF EXISTS RETWEET $$
CREATE PROCEDURE RETWEET(IN uid int, IN postdatetime datetime, IN content varchar(100), IN pid int)
BEGIN
	INSERT INTO tweets (uid, postdatetime, content,pid) VALUES (uid, postdatetime, content, pid);
    UPDATE `tweets` SET retweets = retweets + 1 WHERE id=pid;
END $$
DELIMITER ;