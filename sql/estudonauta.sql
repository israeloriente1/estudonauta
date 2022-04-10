CREATE DATABASE  IF NOT EXISTS `estudonauta` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `estudonauta`;
-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: estudonauta
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Ação'),(2,'Aventura'),(8,'Corrida'),(7,'Esporte'),(5,'Estratégia'),(11,'Luta'),(12,'Musical'),(4,'Plataforma'),(10,'Puzzle'),(6,'RPG'),(9,'Tabuleiro'),(3,'Terror');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getjogos`
--

DROP TABLE IF EXISTS `getjogos`;
/*!50001 DROP VIEW IF EXISTS `getjogos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getjogos` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `genero`,
 1 AS `produtora`,
 1 AS `descricao`,
 1 AS `nota`,
 1 AS `capa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jogo`
--

DROP TABLE IF EXISTS `jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `genero` int(10) unsigned NOT NULL,
  `produtora` int(10) unsigned NOT NULL,
  `descricao` text NOT NULL,
  `nota` decimal(2,1) NOT NULL,
  `capa` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genero` (`genero`),
  KEY `produtora` (`produtora`),
  CONSTRAINT `jogo_ibfk_1` FOREIGN KEY (`genero`) REFERENCES `genero` (`id`),
  CONSTRAINT `jogo_ibfk_2` FOREIGN KEY (`produtora`) REFERENCES `produtora` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo`
--

LOCK TABLES `jogo` WRITE;
/*!40000 ALTER TABLE `jogo` DISABLE KEYS */;
INSERT INTO `jogo` VALUES (1,'Super Mario Odyssey',2,3,'Desenvolvido pela Nintendo\'s Entertainment Planning & Development, e começou a ser desenvolvido logo após o lançamento de Super Mario 3D World em 2013. Várias ideias foram sugeridas durante o desenvolvimento, e para incorporar todas elas, a equipe decidiu desenvolver um estilo de jogo sandbox. Ao contrário de episódios anteriores como New Super Mario Bros. e Super Mario 3D World, que eram voltados para um público casual, a equipe projetou Super Mario Odyssey para atrair os principais fãs da série. O jogo também apresenta uma música tema vocal, \'Jump Up, Super Star!\', a primeira da série.',9.5,'mario.png'),(2,'Call of Duty: Black Ops',1,5,'Um jogo eletrônico de tiro em primeira pessoa desenvolvido pela Treyarch, publicado pela Activision e lançado mundialmente em 9 de novembro de 2010 para as plataformas Microsoft Windows, Xbox 360, PlayStation 3, Wii e Nintendo DS. Anunciado em 30 de abril de 2010, o jogo é o sétimo capítulo da série Call of Duty, e o primeiro situado durante a Guerra Fria. É o terceiro da série a ser desenvolvido pela Treyarch, sendo uma sequência direta de Call of Duty: World at War.',3.5,'cod.png'),(3,'League of Legends',1,2,'League of Legends (abreviado como LoL e comumente referido como League) é um jogo eletrônico multiplayer online battle arena (MOBA) desenvolvido e publicado pela Riot Games. Foi lançado em outubro de 2009 para Microsoft Windows e em março de 2013 para macOS. Inspirado em Defense of the Ancients (DotA), uma modificação de Warcraft III, os fundadores da Riot buscaram desenvolver um jogo autônomo do mesmo gênero. Desde o seu lançamento, o título é gratuito para jogar e monetizado por meio de personalização de personagens, na qual é obtenível através de uma moeda virtual comprável com dinheiro real.',8.5,'lol.png'),(4,'Donkey Kong Thopical Freeze',2,3,'É um jogo eletrônico de plataforma side-scrolling desenvolvido pela Retro Studios que foi publicado pela Nintendo para o Wii U em 21 de fevereiro de 2014 nos Estados Unidos. O décimo-sétimo jogo da série, e o primeiro em alta definição, segue o jogo de 2010 Donkey Kong Country Returns, também pela Retro Studios. Foi anunciado durante a pre-conferência E3 2013 da Nintendo em 11 de junho de 2013.',8.0,'donkey.png'),(5,'Sonic the Hedgehog',2,7,'Uma série de jogos e uma franquia multimídia japonesa criada pelo Sonic Team e produzida pela Sega. A franquia segue Sonic, cuja vida pacífica é sempre interrompida pelo antagonista principal da série, Dr. Eggman (nome real : Dr. Ivo Robotnik). Sonic - normalmente junto de um de seus aliados, como Tails e Knuckles - se aventuram para parar o vilão insano e seus planos para dominação mundial. O primeiro jogo da série Sonic, lançado em 1991, foi concebido pela divisão da Sega, Sonic Team após um pedido para um novo mascote. O título foi um sucesso, e foi renovado para várias sequelas, que levaram a Sega a liderança no rumo dos consoles de video-game da era 16-bit do começo até a metade dos anos 90. Atualmente, é uma das franquias mais famosas e mais lucrativas da indústria dos videogames.',8.5,'sonic.png'),(6,'God of War',1,4,'God of War é uma série de jogos eletrônicos de ação-aventura criada por David Jaffe da Santa Monica Studio, da Sony. Iniciada em 2005 no console PlayStation 2 (PS2), tornou-se carro-chefe para a marca PlayStation, consistindo em oito jogos em várias plataformas, com um nono atualmente em desenvolvimento. Baseada em distintas mitologias, a história segue Kratos, um guerreiro espartano que foi levado a matar sua família por seu antigo mestre, o deus da guerra Ares. Isso desencadeia uma série de eventos que levam à guerras com os panteões mitológicos.',9.5,'gow.png'),(7,'Counter Striker',1,11,'Counter-Strike (também abreviado por CS) é um popular jogo eletrônico de tiro em primeira pessoa. Inicialmente criado como um \'mod\' de Half-Life para jogos online, foi desenvolvido por Minh Le e Jess Cliffe e depois adquirido pela Valve Corporation. Foi lançado em 1999, porém em 2000 ele começou a ser comercializado oficialmente, e posteriormente foram feitas versões para Xbox, Mac OS X e Linux. Atualmente o game é jogado na versão Counter-Strike: Global Offensive.',9.0,'cs.png'),(8,'Resident Evil 6',3,14,'Chamado no Japão de Biohazard 6 (バイオハザード 6 Baiohazādo Shikkusu), é um videojogo do gênero ação jogado em terceira pessoa desenvolvido e publicado pela Capcom. Apesar do nome é o nono jogo da série principal Resident Evil e foi lançado em 2 de outubro de 2012 para PlayStation 3 e Xbox 360. A versão para Microsoft Windows foi lançada no dia 22 de março de 2013. O game também ganhou uma versão completa com todas as DLC para PlayStation 4 e Xbox One em 29 de março de 2016.',7.5,'resident.png'),(9,'Grand Theft Auto V',2,13,'Jogo eletrônico de ação-aventura que pode ser jogado a partir de uma perspectiva em terceira pessoa ou primeira pessoa, porém esta última é disponível apenas nas plataformas PlayStation 4, Xbox One e Microsoft Windows. Os jogadores completam missões, que são cenários lineares com objetivos definidos, a fim de progredirem pela história principal. Os jogadores podem vagar livremente pelo mundo de jogo quando não estão dentro de missões. O mundo é composto pela área rural do estado de San Andreas e pela cidade ficcional de Los Santos, com sua área total sendo bem maior do que em títulos anteriores da série.',9.5,'gta.png'),(10,'Metal Gear Solid V',6,9,'Metal Gear Solid V: The Phantom Pain é um jogo eletrônico de ação-aventura furtiva desenvolvido pela Kojima Productions, co-produzido pela Kojima Productions Los Angeles e realizado, desenhado, co-produzido e co-escrito por Hideo Kojima.',8.5,'metal.png'),(11,'Assassins Creed III',1,10,'Assassin\'s Creed III é um jogo de ação-aventura produzido pela Ubisoft e publicado pela Ubisoft durante os meses de Outubro e Novembro de 2012 para Wii U, Xbox 360, PlayStation 3 e Microsoft Windows. É o quinto jogo principal da série Assassin\'s Creed e o seu terceiro título numerado.',7.5,'assassin.png');
/*!40000 ALTER TABLE `jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtora`
--

DROP TABLE IF EXISTS `produtora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtora` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtora`
--

LOCK TABLES `produtora` WRITE;
/*!40000 ALTER TABLE `produtora` DISABLE KEYS */;
INSERT INTO `produtora` VALUES (1,'Microsoft','EUA'),(2,'Tencent','China'),(3,'Nintendo','Japão'),(4,'Sony','Japão'),(5,'Activision','EUA'),(6,'EA','EUA'),(7,'Namco Bandai','Japão'),(8,'Konami','Japão'),(9,'Ubisoft','EUA'),(10,'Valve','EUA'),(11,'Square Enix','Japão'),(12,'Take Two','EUA'),(13,'Capcom','Japão'),(14,'Sega','Japão');
/*!40000 ALTER TABLE `produtora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(70) NOT NULL,
  `senha` varchar(70) NOT NULL,
  `tipo` enum('editor','adm') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'estudonauta'
--
/*!50003 DROP PROCEDURE IF EXISTS `getJogoInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getJogoInfo`(in idJogo int)
begin
	select j.id, j.nome, g.nome, p.nome, j.descricao, j.nota, j.capa from jogo as j
	join genero as g on g.id = j.genero
	join produtora as p on p.id = j.produtora
	where j.id = idJogo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `getjogos`
--

/*!50001 DROP VIEW IF EXISTS `getjogos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getjogos` AS select `j`.`id` AS `id`,`j`.`nome` AS `nome`,`g`.`nome` AS `genero`,`p`.`nome` AS `produtora`,`j`.`descricao` AS `descricao`,`j`.`nota` AS `nota`,`j`.`capa` AS `capa` from ((`jogo` `j` join `genero` `g` on(`g`.`id` = `j`.`genero`)) join `produtora` `p` on(`p`.`id` = `j`.`produtora`)) */;
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

-- Dump completed on 2022-04-10 16:11:04
