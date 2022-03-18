-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: db_faculdade
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `ra` smallint NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(20) NOT NULL,
  `sobrenome_aluno` varchar(50) NOT NULL,
  `status` tinyint NOT NULL,
  `nome_mae` varchar(80) NOT NULL,
  `nome_pai` varchar(80) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `whatsapp` varchar(11) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `id_curso` smallint DEFAULT NULL,
  PRIMARY KEY (`ra`),
  KEY `fk_id_curso_aluno` (`id_curso`),
  CONSTRAINT `fk_id_curso_aluno` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Marcos','Aurelio Martins',1,'Maria Aparecida','Marcio Aurelio','M','946231249','marcosaurelio@gmail.com','14278914536',3),(2,'Gabriel','Fernando de ALmeida',1,'Fernanda Almeida','Adão Almeida','M','941741247','gabrielalmeida@yahoo.com','14470954536',1),(3,'Beatriz','Sonia Meneguel',1,'Gabriela Meneguel','Samuel Meneguel','F','945781412','beatrizmene@hotmail.com','1520984537',3),(4,'Jorge','Soares',1,'Maria Richtzer','João Soares','M','925637857','jorgesoares@gmail.com','14223651562',4),(5,'Ana Paula','Ferretti',1,'Ana Hoffbahn','Marcio Ferretti','M','974267423','anapaulaferretti@hotmail','32968914522',5),(6,'Mônica','Yamaguti',1,'Fernanda Yamaguti','Wilson Oliveira','F','932619560','monyamaguti@outlook.com','32988914510',6);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18 16:47:07
