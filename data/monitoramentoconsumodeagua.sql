-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: monitoramentoconsumodeagua
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `alerta`
--

DROP TABLE IF EXISTS `alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta` (
  `cod_alerta` int NOT NULL AUTO_INCREMENT,
  `data_hora_alerta` datetime NOT NULL,
  `tipo_alerta` varchar(100) NOT NULL,
  `cod_leitura` int NOT NULL,
  PRIMARY KEY (`cod_alerta`),
  KEY `idx_alerta_leitura` (`cod_leitura`),
  KEY `idx_alerta_data` (`data_hora_alerta`),
  CONSTRAINT `fk_alerta_leitura` FOREIGN KEY (`cod_leitura`) REFERENCES `leitura` (`cod_leitura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta`
--

LOCK TABLES `alerta` WRITE;
/*!40000 ALTER TABLE `alerta` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_alerta_hora_alerta` BEFORE INSERT ON `alerta` FOR EACH ROW BEGIN SET NEW.data_hora_alerta = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `cod_contrato` int NOT NULL AUTO_INCREMENT,
  `cod_usuario` varchar(20) NOT NULL,
  `cod_imovel` varchar(20) NOT NULL,
  `num_serie_hidrometro` varchar(50) NOT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_contrato`),
  KEY `idx_contrato_usuario` (`cod_usuario`),
  KEY `idx_contrato_imovel` (`cod_imovel`),
  KEY `idx_contrato_hidrometro` (`num_serie_hidrometro`),
  CONSTRAINT `fk_contrato_hidrometro` FOREIGN KEY (`num_serie_hidrometro`) REFERENCES `hidrometro` (`num_serie_hidrometro`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_contrato_imovel` FOREIGN KEY (`cod_imovel`) REFERENCES `imovel` (`cod_imovel`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_contrato_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `cep` varchar(8) NOT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `cod_grupo` int NOT NULL AUTO_INCREMENT,
  `nome_grupo` varchar(100) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`cod_grupo`),
  UNIQUE KEY `nome_grupo` (`nome_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Técnico','Usuários responsáveis pela instalação, manutenção e monitoramento dos sistemas de medição.'),(2,'Cliente','Usuários consumidores que consultam seu consumo e relatórios.');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_usuarios`
--

DROP TABLE IF EXISTS `grupos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos_usuarios` (
  `cod_usuario` varchar(20) NOT NULL,
  `cod_grupo` int NOT NULL,
  `data_entrada` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_usuario`,`cod_grupo`),
  KEY `fk_grupousu_grupo` (`cod_grupo`),
  CONSTRAINT `fk_grupousu_grupo` FOREIGN KEY (`cod_grupo`) REFERENCES `grupo` (`cod_grupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_grupousu_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_usuarios`
--

LOCK TABLES `grupos_usuarios` WRITE;
/*!40000 ALTER TABLE `grupos_usuarios` DISABLE KEYS */;
INSERT INTO `grupos_usuarios` VALUES ('U_aPBUlANG17',1,'2025-11-17 14:10:12');
/*!40000 ALTER TABLE `grupos_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hidrometro`
--

DROP TABLE IF EXISTS `hidrometro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hidrometro` (
  `num_serie_hidrometro` varchar(50) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num_serie_hidrometro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hidrometro`
--

LOCK TABLES `hidrometro` WRITE;
/*!40000 ALTER TABLE `hidrometro` DISABLE KEYS */;
INSERT INTO `hidrometro` VALUES ('HIDRO-001','Marca Teste','Modelo-Y');
/*!40000 ALTER TABLE `hidrometro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imovel`
--

DROP TABLE IF EXISTS `imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imovel` (
  `cod_imovel` varchar(20) NOT NULL,
  `tipo_imovel` varchar(100) DEFAULT NULL,
  `cep_endereco` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`cod_imovel`),
  KEY `idx_imovel_cep` (`cep_endereco`),
  CONSTRAINT `fk_imovel_endereco` FOREIGN KEY (`cep_endereco`) REFERENCES `endereco` (`cep`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imovel`
--

LOCK TABLES `imovel` WRITE;
/*!40000 ALTER TABLE `imovel` DISABLE KEYS */;
/*!40000 ALTER TABLE `imovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitura`
--

DROP TABLE IF EXISTS `leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura` (
  `cod_leitura` int NOT NULL AUTO_INCREMENT,
  `valor_medido` decimal(10,3) NOT NULL,
  `data_hora_leitura` datetime NOT NULL,
  `num_serie_hidrometro` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_leitura`),
  KEY `idx_leitura_hidrometro` (`num_serie_hidrometro`),
  KEY `idx_leitura_data` (`data_hora_leitura`),
  CONSTRAINT `fk_leitura_hidrometro` FOREIGN KEY (`num_serie_hidrometro`) REFERENCES `hidrometro` (`num_serie_hidrometro`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura`
--

LOCK TABLES `leitura` WRITE;
/*!40000 ALTER TABLE `leitura` DISABLE KEYS */;
INSERT INTO `leitura` VALUES (1,99.900,'2025-11-17 20:38:04','HIDRO-001'),(2,84.245,'2025-11-17 20:42:45','HIDRO-001'),(3,85.467,'2025-11-17 20:42:55','HIDRO-001'),(4,79.664,'2025-11-17 20:43:05','HIDRO-001'),(5,104.353,'2025-11-17 20:43:15','HIDRO-001'),(6,34.732,'2025-11-17 20:43:25','HIDRO-001');
/*!40000 ALTER TABLE `leitura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_alerta_consumo_alto` AFTER INSERT ON `leitura` FOR EACH ROW BEGIN
    IF NEW.valor_medido > 500 THEN
        INSERT INTO Alerta (data_hora_alerta, tipo_alerta, cod_leitura)
        VALUES (NOW(), 'Consumo alto detectado', NEW.cod_leitura);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_alerta_valor_invalido` AFTER INSERT ON `leitura` FOR EACH ROW BEGIN
    IF NEW.valor_medido < 0 THEN
        INSERT INTO Alerta (data_hora_alerta, tipo_alerta, cod_leitura)
        VALUES (NOW(), 'Leitura inválida', NEW.cod_leitura);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_leitura` BEFORE UPDATE ON `leitura` FOR EACH ROW BEGIN  SET NEW.data_hora_leitura = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pessoa_fisica`
--

DROP TABLE IF EXISTS `pessoa_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_fisica` (
  `cod_usuario` varchar(20) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nasc` date NOT NULL,
  PRIMARY KEY (`cod_usuario`),
  UNIQUE KEY `cpf` (`cpf`),
  CONSTRAINT `fk_pf_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_fisica`
--

LOCK TABLES `pessoa_fisica` WRITE;
/*!40000 ALTER TABLE `pessoa_fisica` DISABLE KEYS */;
INSERT INTO `pessoa_fisica` VALUES ('U_aPBUlANG17','00000000000','1990-01-01');
/*!40000 ALTER TABLE `pessoa_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_juridica`
--

DROP TABLE IF EXISTS `pessoa_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_juridica` (
  `cod_usuario` varchar(20) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `razao_social` varchar(200) NOT NULL,
  PRIMARY KEY (`cod_usuario`),
  UNIQUE KEY `cnpj` (`cnpj`),
  CONSTRAINT `fk_pj_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_juridica`
--

LOCK TABLES `pessoa_juridica` WRITE;
/*!40000 ALTER TABLE `pessoa_juridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cod_usuario` varchar(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `tipo_p` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`),
  UNIQUE KEY `senha` (`senha`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('U_aPBUlANG17','Tecnico Master','$2a$12$DKC.nlEfvBarpuqk.CSSxevSj8rmENa9hnJHnbEgHw5IGPJQv5xdq','tecnico@agua.com',NULL,'FISICA');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_usuario_data_cadastro` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN SET NEW.data_cadastro = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_alertas_usuario`
--

DROP TABLE IF EXISTS `vw_alertas_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_alertas_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_alertas_usuario` AS SELECT 
 1 AS `nome`,
 1 AS `data_hora_alerta`,
 1 AS `tipo_alerta`,
 1 AS `cod_leitura`,
 1 AS `valor_medido`,
 1 AS `data_hora_leitura`,
 1 AS `num_serie_hidrometro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dados_usuario`
--

DROP TABLE IF EXISTS `vw_dados_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_dados_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dados_usuario` AS SELECT 
 1 AS `cod_usuario`,
 1 AS `nome`,
 1 AS `email`,
 1 AS `data_cadastro`,
 1 AS `tipo_p`,
 1 AS `cpf`,
 1 AS `cnpj`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_leituras_por_usuario`
--

DROP TABLE IF EXISTS `vw_leituras_por_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_leituras_por_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_leituras_por_usuario` AS SELECT 
 1 AS `nome`,
 1 AS `valor_medido`,
 1 AS `data_hora_leitura`,
 1 AS `num_serie_hidrometro`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'monitoramentoconsumodeagua'
--

--
-- Dumping routines for database 'monitoramentoconsumodeagua'
--
/*!50003 DROP FUNCTION IF EXISTS `consumo_medio_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `consumo_medio_usuario`(p_cod_usuario INT) RETURNS decimal(10,3)
    DETERMINISTIC
BEGIN
    DECLARE hidrometro_usuario VARCHAR(50);
    DECLARE media_consumo DECIMAL(10,3);

    SELECT num_serie_hidrometro INTO hidrometro_usuario
    FROM Contrato
    WHERE cod_usuario = p_cod_usuario
    LIMIT 1;

    SELECT AVG(valor_medido) INTO media_consumo
    FROM Leitura
    WHERE num_serie_hidrometro = hidrometro_usuario;

    RETURN media_consumo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `gerar_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `gerar_id`(tipo_prefixo VARCHAR(5), tamanho INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE chars_str VARCHAR(62) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    DECLARE result_str VARCHAR(255) DEFAULT '';
    DECLARE i INT DEFAULT 0;
    DECLARE rand_index INT;
    DECLARE prefixo VARCHAR(255) DEFAULT CONCAT(tipo_prefixo, '_');

    WHILE i < tamanho DO
        SET rand_index = FLOOR(1 + (RAND() * 62));
        SET result_str = CONCAT(result_str, SUBSTRING(chars_str, rand_index, 1));
        SET i = i + 1;
    END WHILE;

    RETURN CONCAT(prefixo, result_str);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criar_contrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_contrato`(
    IN p_cod_usuario INT,
    IN p_cod_imovel INT,
    IN p_num_serie_hidrometro VARCHAR(50),
    IN p_data_inicio DATETIME,
    IN p_status VARCHAR(50)
)
BEGIN
    DECLARE usuario_existente INT;
    DECLARE hidrometro_existente INT;

    SELECT COUNT(*) INTO usuario_existente
    FROM Usuario
    WHERE cod_usuario = p_cod_usuario;

    SELECT COUNT(*) INTO hidrometro_existente
    FROM Hidrometro
    WHERE num_serie_hidrometro = p_num_serie_hidrometro;

    IF usuario_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuário não existe';
    ELSEIF hidrometro_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hidrometro não existe';
    ELSE
    
        INSERT INTO Contrato (cod_usuario, cod_imovel, num_serie_hidrometro, data_inicio, status)
        VALUES (p_cod_usuario, p_cod_imovel, p_num_serie_hidrometro, p_data_inicio, p_status);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_alertas_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vw_alertas_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alertas_usuario` AS select `u`.`nome` AS `nome`,`a`.`data_hora_alerta` AS `data_hora_alerta`,`a`.`tipo_alerta` AS `tipo_alerta`,`l`.`cod_leitura` AS `cod_leitura`,`l`.`valor_medido` AS `valor_medido`,`l`.`data_hora_leitura` AS `data_hora_leitura`,`l`.`num_serie_hidrometro` AS `num_serie_hidrometro` from (((`usuario` `u` join `contrato` `c` on((`c`.`cod_usuario` = `u`.`cod_usuario`))) join `leitura` `l` on((`l`.`num_serie_hidrometro` = `c`.`num_serie_hidrometro`))) join `alerta` `a` on((`a`.`cod_leitura` = `l`.`cod_leitura`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dados_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vw_dados_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dados_usuario` AS select `u`.`cod_usuario` AS `cod_usuario`,`u`.`nome` AS `nome`,`u`.`email` AS `email`,`u`.`data_cadastro` AS `data_cadastro`,`u`.`tipo_p` AS `tipo_p`,`pf`.`cpf` AS `cpf`,`pj`.`cnpj` AS `cnpj` from ((`usuario` `u` left join `pessoa_fisica` `pf` on((`pf`.`cod_usuario` = `u`.`cod_usuario`))) left join `pessoa_juridica` `pj` on((`pj`.`cod_usuario` = `u`.`cod_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_leituras_por_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vw_leituras_por_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_leituras_por_usuario` AS select `u`.`nome` AS `nome`,`l`.`valor_medido` AS `valor_medido`,`l`.`data_hora_leitura` AS `data_hora_leitura`,`l`.`num_serie_hidrometro` AS `num_serie_hidrometro` from ((`usuario` `u` join `contrato` `c` on((`c`.`cod_usuario` = `u`.`cod_usuario`))) join `leitura` `l` on((`l`.`num_serie_hidrometro` = `c`.`num_serie_hidrometro`))) */;
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

-- Dump completed on 2025-11-17 20:55:45
