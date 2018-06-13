-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: elepig
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `eventLog`
--

DROP TABLE IF EXISTS `eventLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventLog` (
  `eventId` varbinary(16) NOT NULL,
  `eventType` varchar(64) NOT NULL,
  `eventJson` json NOT NULL,
  `dateTime` datetime NOT NULL,
  `googleEmail` varchar(64) NOT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventLog`
--

LOCK TABLES `eventLog` WRITE;
/*!40000 ALTER TABLE `eventLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `idlog` varbinary(16) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `userId` varbinary(16) DEFAULT NULL,
  `logType` varchar(16) DEFAULT NULL,
  `procedure` varchar(64) DEFAULT NULL,
  `text` varchar(256) DEFAULT NULL,
  `returnCode` int(11) DEFAULT NULL,
  `eventId` varbinary(16) DEFAULT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('v¨$ªnx\è¤C…*C\ÑP','2018-06-12 20:40:30',NULL,'success','createUser','User details inserted for supplied google account',0,'vžinx\è¤C…*C\ÑP');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_BEFORE_INSERT` BEFORE INSERT ON `log` FOR EACH ROW BEGIN
 IF new.idlog IS NULL THEN
    SET new.idlog = UUID_TO_BIN ( uuid() );
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `email` varchar(64) NOT NULL,
  `lastName` varchar(256) NOT NULL,
  `firstName` varchar(256) NOT NULL,
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateRegistered` datetime DEFAULT NULL,
  `dateLoggedIn` datetime DEFAULT NULL,
  `GDPRConsentRequired` tinyint(4) NOT NULL DEFAULT '1',
  `GDPRConsent` tinyint(4) NOT NULL DEFAULT '0',
  `GDPRConsentLastGiven` datetime DEFAULT NULL,
  `ipCountry` varchar(3) NOT NULL,
  `telephoneNumber` varchar(20) DEFAULT NULL,
  `telephoneCountry` varchar(3) DEFAULT NULL,
  `telephoneCountryCode` smallint(3) DEFAULT NULL,
  `registered` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `kyc` tinyint(4) NOT NULL DEFAULT '0',
  `profileName` varchar(32) NOT NULL,
  `userID` varbinary(16) NOT NULL,
  `referralLink` varchar(64) DEFAULT NULL,
  `lastJsonIn` json DEFAULT NULL,
  `googleEmail` varchar(64) DEFAULT NULL,
  `eligibilityStatus` tinyint(4) DEFAULT NULL,
  `eligibilityDate` datetime DEFAULT NULL,
  `termsAgreed` tinyint(4) DEFAULT NULL,
  `termsAgreedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('\"jbloggs@google.com\"','\"Bloggs\"','\"Jo\"','2018-06-12 20:37:44','2018-06-12 20:37:44','2018-06-12 20:37:44',1,1,'2018-06-12 20:37:44','3',NULL,NULL,NULL,1,1,0,'\"Jim\"','2nx\è¤C…*C\ÑP','','{\"eventId\": \"base64:type15:FAdX0G54EeikQ4UqQ9FQGw==\", \"wallets\": \"a wallet\", \"lastName\": \"Bloggs\", \"postDate\": \"20:37:44.000000\", \"eventType\": \"createUser\", \"firstName\": \"Jo\", \"googleEmail\": \"jbloggs@google.com\", \"profileName\": \"Jim\", \"termsAgreed\": true, \"referralLink\": \"asddffghjklkg57577343445-6yrfhgf\", \"eligibilityStatus\": true, \"GDPRInitialConsent\": true}','\"jbloggs@google.com\"',1,'2018-06-12 20:37:44',1,'2018-06-12 20:37:44'),('stephen.apps@sky.com','apps','stephen','2018-06-11 21:50:47','2018-06-11 21:50:47','2018-06-11 21:50:47',1,1,'2018-06-11 21:50:47','3','','',44,1,1,1,'appsie','\Ô]m¹\è¤C…*C\ÑP','','{}','appspix@gmail.com',1,'2018-06-11 21:50:47',1,'2018-06-11 21:50:47'),('\"jbloggs@google.com\"','\"Bloggs\"','\"Jo\"','2018-06-12 20:39:57','2018-06-12 20:39:57','2018-06-12 20:39:57',1,1,'2018-06-12 20:39:57','3',NULL,NULL,NULL,1,1,0,'\"Jim\"','bù\ênx\è¤C…*C\ÑP','','{\"eventId\": \"base64:type15:YvQ1Am54EeikQ4UqQ9FQGw==\", \"wallets\": \"a wallet\", \"lastName\": \"Bloggs\", \"postDate\": \"20:39:57.000000\", \"eventType\": \"createUser\", \"firstName\": \"Jo\", \"googleEmail\": \"jbloggs@google.com\", \"profileName\": \"Jim\", \"termsAgreed\": true, \"referralLink\": \"asddffghjklkg57577343445-6yrfhgf\", \"eligibilityStatus\": true, \"GDPRInitialConsent\": true}','\"jbloggs@google.com\"',1,'2018-06-12 20:39:57',1,'2018-06-12 20:39:57'),('\"jbloggs@google.com\"','\"Bloggs\"','\"Jo\"','2018-06-12 20:40:30','2018-06-12 20:40:30','2018-06-12 20:40:30',1,1,'2018-06-12 20:40:30','3',NULL,NULL,NULL,1,1,0,'\"Jim\"','v¨Rnx\è¤C…*C\ÑP','','{\"eventId\": \"base64:type15:dqNTbG54EeikQ4UqQ9FQGw==\", \"wallets\": \"a wallet\", \"lastName\": \"Bloggs\", \"postDate\": \"20:40:30.000000\", \"eventType\": \"createUser\", \"firstName\": \"Jo\", \"googleEmail\": \"jbloggs@google.com\", \"profileName\": \"Jim\", \"termsAgreed\": true, \"referralLink\": \"asddffghjklkg57577343445-6yrfhgf\", \"eligibilityStatus\": true, \"GDPRInitialConsent\": true}','\"jbloggs@google.com\"',1,'2018-06-12 20:40:30',1,'2018-06-12 20:40:30');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
 IF new.userId IS NULL THEN
    SET new.userId = UUID_TO_BIN ( uuid() );
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet` (
  `publicKey` varchar(64) NOT NULL,
  `accountName` varchar(256) DEFAULT NULL,
  `user` varbinary(16) DEFAULT NULL,
  `walletID` varbinary(16) NOT NULL,
  `accountType` varchar(64) DEFAULT NULL,
  `accountKYCVerified` tinyint(4) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`publicKey`,`walletID`),
  KEY `walletUser_idx` (`user`),
  CONSTRAINT `walletUser` FOREIGN KEY (`user`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `wallet_BEFORE_INSERT` BEFORE INSERT ON `wallet` FOR EACH ROW BEGIN
 IF new.walletId IS NULL THEN
    SET new.walletId = UUID_TO_BIN ( uuid() );
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'elepig'
--
/*!50003 DROP PROCEDURE IF EXISTS `createEventLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createEventLog`(IN p_eventId  varbinary(16),
																   IN p_eventJson  JSON,
                                                                   IN p_eventtype varchar(64),
                                                                   IN p_googleEmail varchar(64))
BEGIN


				INSERT INTO `elepig`.`eventLog`
				(`eventId`,
				`eventType`,
				`eventJson`,
				`dateTime`,
				`googleEmail`)
				VALUES
				(p_eventId,
				p_eventType,
				p_eventJson,
				sysdate,
               p_googleEmail);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createLog`(IN p_proc   varchar(64),
															IN p_text    varchar(256),
                                                            IN p_type    varchar(16),
                                                            IN p_code   int,
                                                            IN p_user     varbinary(16),
                                                            IN p_eventId varbinary(16))
BEGIN

							INSERT INTO `elepig`.`log`
							(
							`datetime`,
							`userId`,
							`logType`,
							`procedure`,
							`text`,
							`returnCode`,
                            eventId)
							VALUES
							(now(),
							p_user,
							p_type,
							p_proc,
							p_text,
							p_code,
                            p_eventId);

commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createProposedTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProposedTransaction`()
BEGIN





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`(IN p_userJSON   JSON,
															IN p_googleEmail  varchar(64),
                                                            IN p_ipCountry				varchar(3),
                                                            IN p_eventId                    varbinary(16),
                                                            OUT p_return_text       varchar(256),
                                                            OUT p_return_code    integer)
BEGIN

DECLARE v_email		varchar(64);
DECLARE v_cnt          integer;
DECLARE v_userId    varbinary(16);

set  p_return_code = 10;

-- check user
If JSON_EXTRACT(p_userJSON, "$.googleEmail") = p_googleEmail then

set  p_return_code = 20;
	-- continue	
        
	-- check if exists
	set v_cnt = (select count(googleEmail)
							from user
							where googleEmail = p_googleEmail);
	
	If v_cnt = 0 then
    -- insert new user
						INSERT INTO `elepig`.`user`
					(`email`,
					`lastName`,
					`firstName`,
					`dateCreated`,
					`dateRegistered`,
					`dateLoggedIn`,
					`GDPRConsent`,
					`GDPRConsentLastGiven`,
					`registered`,
					`active`,
					`kyc`,
					`profileName`,
					`referralLink`,
					`lastJsonIn`,
					`googleEmail`,
                    eligibilityStatus,
                    eligibilityDate,
                    termsAgreed,
                    termsAgreedDate,
                    ipCountry
                    )
					VALUES
					(JSON_EXTRACT(p_userJSON, "$.googleEmail") ,
					JSON_EXTRACT(p_userJSON, "$.lastName") ,
					JSON_EXTRACT(p_userJSON, "$.firstName") ,
					curtime(),
					curtime(),
					curtime(),
					JSON_EXTRACT(p_userJSON, "$.GDPRInitialConsent") ,
                    Case JSON_EXTRACT(p_userJSON, "$.GDPRInitialConsent") 
						When true then now()
						Else null
                    End,
					1,
                    1,
                    0,
                    JSON_EXTRACT(p_userJSON, "$.profileName") ,
                    '',
					p_userJSON,
					JSON_EXTRACT(p_userJSON, "$.googleEmail"),
                    JSON_EXTRACT(p_userJSON, "$.eligibilityStatus"),
                    Case JSON_EXTRACT(p_userJSON, "$.eligibilityStatus")
						When true then now()
						Else null
                    End,
                    JSON_EXTRACT(p_userJSON, "$.termsAgreed"),
                    Case JSON_EXTRACT(p_userJSON, "$.termsAgreed")
						When true then now()
						Else null
                    End,
                    p_ipCountry
                    );
                    
                    
                    -- check user and write log
                    Select userId into v_userId
                    from `elepig`.`user`
                    where googleEmail = p_googleEmail;
                    
                    

	   set p_return_text = 'User details inserted for supplied google account';
       set p_return_code = 0;
       
       CALL `elepig`.`createLog`('createUser', p_return_text, 'success', p_return_code, v_userId, p_eventId);


	Elseif v_cnt = 1 then
	-- update existing user
    
		 set v_userId = (select userId 
										from user
								where googleEmail = p_googleEmail);
                            
		UPDATE `elepig`.`user`
					SET
					`email` = JSON_EXTRACT(p_userJSON, "$.email") ,
					`lastName` = JSON_EXTRACT(p_userJSON, "$.lastName") ,
					`firstName` = JSON_EXTRACT(p_userJSON, "$.firstNamel") ,
					`dateLoggedIn` = now(),
					`GDPRConsent` = JSON_EXTRACT(p_userJSON, "$.GDPRInitialConsent") ,
					`GDPRConsentLastGiven` = now(),
					`registered` = 1,
					`active` = 1,
					`profileName` =JSON_EXTRACT(p_userJSON, "$.profileName") ,
					`lastJsonIn` = p_userJSON,
                    ipCountry = p_ipCountry
					WHERE `userID` = v_userId;

	   set p_return_text = 'User details updated for supplied google account';
       set p_return_code = 0;
       
       CALL `elepig`.`createLog`('createUser', p_return_text, 'success', p_return_code, v_userId, v_eventId);
       
    Else
    -- return error
	   set p_return_text = 'ERROR - Multiple user records found for supplied google account';
       set p_return_code = 99;
       
       CALL `elepig`.`createLog`('createUser', p_return_text, 'error', p_return_code, v_userId, v_eventId);
    
    End if;

End if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createWallet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createWallet`()
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generateReferralLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateReferralLink`()
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(IN p_googleEmail varchar(64),
																										OUT p_userJSON JSON)
BEGIN


/*{	
"email":"jbloggs@google.com",	
"lastName":"Bloggs",	
"firstName":"Joe",	
"GDPRConfirmedConsent":true,	
"kyc":true,	
"referralLink":"asddffghjklkg57577343445-6yrfhgf"	
wallets:[	
	{"accountName":"myFortune","publicKey:"12322abefâ€¦..f56d654a"},
	{"accountName":"myOtherFortune","publicKey:"45365abefâ€¦..f56d654a"}
]}	*/
/*
SELECT `user`.`email`,
    `user`.`lastNamer`,
    `user`.`firstName`,
    `user`.`dateCreated`,
    `user`.`GDPRConsent`,
    `user`.`GDPRConsentLastGiven`,
    `user`.`kyc`,
    `user`.`profileName`,
    `user`.`userID`,
    `user`.`referralLink`,
    `user`.`googleEmail`,
    `user`.`eligibilityStatus`,
    `user`.`termsAgreed`,
FROM `elepig`.`user`,
			elepig.wallet
where user.userID = wallet.user
;
*/

/*set @p_JSON = (SELECT
											CONCAT
											('[', REPLACE
											  (
												REPLACE
												(
												  GROUP_CONCAT
												  (
													JSON_ARRAY
													(	'email', `user`.`email`, 
														'lastName',`user`.`lastName`,
														'firstName', user`.`firstName,
											--  'dateCreated',`user`.`dateCreated,
											-- 'GDPRConfirmedConsent',`user`.`GDPRConsent`,
														'GDPRConsentLastGiven', `user`.`GDPRConsentLastGiven`,
														'KYC', `user`.`kyc`,
											-- 			`user`.`profileName`,
											-- 			`user`.`userID`,
														`user`.`referralLink`
											-- 			`user`.`googleEmail`,
											-- 			`user`.`eligibilityStatus`,
											-- 			`user`.`termsAgreed`
													) SEPARATOR ','
												  ), '[', '{'
												), ']', '}'
											  ), ']'
											) 
											AS best_result2 
											FROM `elepig`.`user`,
														elepig.wallet
											where user.userID = wallet.user);*/


set  @p_userJSON = (SELECT
													JSON_OBJECT
													(	'email', user.email, 
														'lastName', user.lastName,
														'firstName', user.firstName,
											--  'dateCreated',`user`.`dateCreated,
											-- 'GDPRConfirmedConsent',`user`.`GDPRConsent`,
														'GDPRConsentLastGiven', user.GDPRConsentLastGiven,
														'KYC', `user`.`kyc`,
											-- 			`user`.`profileName`,
											-- 			`user`.`userID`,
														'referralLink',user.referralLink,
											-- 			`user`.`googleEmail`,
											-- 			`user`.`eligibilityStatus`,
											-- 			`user`.`termsAgreed`
														'wallets', ''
											) 
											FROM elepig.user
											where user.googleEmail = p_googleEmail);
                                            
select @p_userJSON;

                                            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserTransactions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserTransactions`()
BEGIN


			-- get users transactions
            
            
            -- get user referral transactions
            
            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `importReferrals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `importReferrals`()
BEGIN


-- load data
-- into table elepigairdropresponses;


insert into referers 
SELECT  distinct  STR_TO_DATE (`elepigairdropresponses`.`Timestamp`,'%d/%m/%Y %T'),
								`elepigairdropresponses`.`emailAddress`,
								`elepigairdropresponses`.`firstName`,
								`elepigairdropresponses`.`lastName`,
								`elepigairdropresponses`.`ERC20WalletAddress`,
								null,
								`elepigairdropresponses`.`telegramHandle`,
								null,
								`elepigairdropresponses`.`yourTwitterURL`,
								null,
								`elepigairdropresponses`.`yourLevelOfAirdrop`,
								`elepigairdropresponses`.`confirmation`,
								null
FROM `elepig`.`elepigairdropresponses` 
where elepigairdropresponses.emailAddress not in (SELECT `referers`.`emailAddress` FROM  `elepig`.referers)
;

insert into referrals 
(select distinct  tmpreferrals.*, 0,0, 0, 0, 0, null, null
from 
(
SELECT distinct REPLACE(emailAddress, ' ','') as referringEmail,  REPLACE(friendEmailReferral1, ' ', '') as referredEmail
FROM elepig.elepigairdropresponses where friendEmailReferral1 != ''
union
SELECT distinct  REPLACE(emailAddress, ' ','') as referringEmail,  REPLACE(friendEmailReferral2, ' ', '')  as rreferredEmail
FROM elepig.elepigairdropresponses where friendEmailReferral2 != ''
union
SELECT distinct  REPLACE(emailAddress, ' ','') as referringEmail,  REPLACE(friendEmailReferral3, ' ', '')  as referredEmail
FROM elepig.elepigairdropresponses where friendEmailReferral3 != ''
union
SELECT distinct  REPLACE(emailAddress, ' ','') as referringEmail,  REPLACE(friendEmailReferral4, ' ', '')  as referredEmail
FROM elepig.elepigairdropresponses where friendEmailReferral4 != ''
union
SELECT distinct  REPLACE(emailAddress, ' ','') as referringEmail,  REPLACE(friendEmailReferral5, ' ', '')  as referredEmail
FROM elepig.elepigairdropresponses where friendEmailReferral5 != ''
) tmpreferrals
where  tmpreferrals.referringEmail||tmpreferrals.referredEmail not in (select referringEmail||referredEmail from referrals))
;

-- truncate elepigairdropresponses;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-12 20:47:51
