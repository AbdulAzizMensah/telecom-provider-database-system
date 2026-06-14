-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: tele
-- ------------------------------------------------------
-- Server version	9.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '04eef5c5-6389-11f1-8e7a-14b31f118d1e:1-99';

--
-- Temporary view structure for view `activecustomersview`
--

DROP TABLE IF EXISTS `activecustomersview`;
/*!50001 DROP VIEW IF EXISTS `activecustomersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `activecustomersview` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Email`,
 1 AS `PhoneNumber`,
 1 AS `CustomerStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditlog` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `ActionType` varchar(50) DEFAULT NULL,
  `TableName` varchar(50) DEFAULT NULL,
  `ActionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,'INSERT','Complaint','2026-06-14 20:57:05');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `SubscriptionID` int NOT NULL,
  `BillDate` date NOT NULL,
  `AmountDue` decimal(10,2) NOT NULL,
  `DueDate` date NOT NULL,
  `Status` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`BillID`),
  KEY `SubscriptionID` (`SubscriptionID`),
  KEY `idx_bill_status` (`Status`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`SubscriptionID`) REFERENCES `subscription` (`SubscriptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,1,'2025-04-01',35.00,'2025-04-10','Paid'),(2,2,'2025-04-01',20.00,'2025-04-10','Paid'),(3,3,'2025-04-01',10.00,'2025-04-10','Paid'),(4,4,'2025-04-01',35.00,'2025-04-10','Unpaid'),(5,1,'2026-06-14',35.00,'2026-06-28','Pending');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `billingstatusview`
--

DROP TABLE IF EXISTS `billingstatusview`;
/*!50001 DROP VIEW IF EXISTS `billingstatusview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `billingstatusview` AS SELECT 
 1 AS `BillID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `AmountDue`,
 1 AS `Status`,
 1 AS `DueDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `callrecord`
--

DROP TABLE IF EXISTS `callrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `callrecord` (
  `CallID` int NOT NULL AUTO_INCREMENT,
  `SubscriptionID` int NOT NULL,
  `CallDate` datetime NOT NULL,
  `DurationMinutes` int NOT NULL,
  PRIMARY KEY (`CallID`),
  KEY `SubscriptionID` (`SubscriptionID`),
  CONSTRAINT `callrecord_ibfk_1` FOREIGN KEY (`SubscriptionID`) REFERENCES `subscription` (`SubscriptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callrecord`
--

LOCK TABLES `callrecord` WRITE;
/*!40000 ALTER TABLE `callrecord` DISABLE KEYS */;
INSERT INTO `callrecord` VALUES (1,1,'2025-04-02 10:00:00',15),(2,1,'2025-04-03 12:30:00',5),(3,2,'2025-04-02 09:00:00',30),(4,4,'2025-04-03 18:00:00',10),(5,1,'2025-04-02 10:00:00',15),(6,1,'2025-04-03 12:30:00',5),(7,2,'2025-04-02 09:00:00',30),(8,4,'2025-04-03 18:00:00',10);
/*!40000 ALTER TABLE `callrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint` (
  `ComplaintID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `ComplaintDate` date NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Status` varchar(20) DEFAULT 'Open',
  PRIMARY KEY (`ComplaintID`),
  KEY `FK_Complaint_Customer` (`CustomerID`),
  KEY `idx_complaint_status` (`Status`),
  CONSTRAINT `FK_Complaint_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,1,'2025-04-15','Network','Poor network coverage in Berlin','Open'),(2,2,'2025-04-18','Billing','Incorrect monthly bill amount','Resolved'),(3,4,'2025-04-20','Internet','Slow mobile data speed','In Progress'),(4,1,'2026-06-14','Network','Testing Audit Trigger','Open');
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `complaintsummaryview`
--

DROP TABLE IF EXISTS `complaintsummaryview`;
/*!50001 DROP VIEW IF EXISTS `complaintsummaryview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `complaintsummaryview` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `ComplaintID`,
 1 AS `Category`,
 1 AS `Description`,
 1 AS `Status`,
 1 AS `ComplaintDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `RegistrationDate` date NOT NULL,
  `CustomerStatus` varchar(20) DEFAULT 'Active',
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  KEY `idx_customer_phone` (`PhoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Mensah','john@mail.com','0201000001','Berlin','2025-01-10','Active'),(2,'Amina','Khan','amina@mail.com','0201000002','Hamburg','2025-02-15','Active'),(3,'Peter','Schmidt','peter@mail.com','0201000003','Munich','2025-03-01','Inactive'),(4,'Sarah','Owusu','sarah@mail.com','0201000004','Berlin','2025-03-20','Active');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer360view`
--

DROP TABLE IF EXISTS `customer360view`;
/*!50001 DROP VIEW IF EXISTS `customer360view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer360view` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Email`,
 1 AS `PhoneNumber`,
 1 AS `PlanName`,
 1 AS `SubscriptionStatus`,
 1 AS `BillID`,
 1 AS `AmountDue`,
 1 AS `BillStatus`,
 1 AS `ComplaintCategory`,
 1 AS `ComplaintStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerbackupview`
--

DROP TABLE IF EXISTS `customerbackupview`;
/*!50001 DROP VIEW IF EXISTS `customerbackupview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerbackupview` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Email`,
 1 AS `PhoneNumber`,
 1 AS `Address`,
 1 AS `RegistrationDate`,
 1 AS `CustomerStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `datausage`
--

DROP TABLE IF EXISTS `datausage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datausage` (
  `UsageID` int NOT NULL AUTO_INCREMENT,
  `SubscriptionID` int NOT NULL,
  `UsageDate` datetime NOT NULL,
  `DataUsedGB` decimal(8,2) NOT NULL,
  PRIMARY KEY (`UsageID`),
  KEY `SubscriptionID` (`SubscriptionID`),
  CONSTRAINT `datausage_ibfk_1` FOREIGN KEY (`SubscriptionID`) REFERENCES `subscription` (`SubscriptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datausage`
--

LOCK TABLES `datausage` WRITE;
/*!40000 ALTER TABLE `datausage` DISABLE KEYS */;
INSERT INTO `datausage` VALUES (1,1,'2025-04-02 23:00:00',1.50),(2,2,'2025-04-02 23:00:00',3.20),(3,4,'2025-04-03 23:00:00',2.10);
/*!40000 ALTER TABLE `datausage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `managementdashboard`
--

DROP TABLE IF EXISTS `managementdashboard`;
/*!50001 DROP VIEW IF EXISTS `managementdashboard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `managementdashboard` AS SELECT 
 1 AS `ActiveCustomers`,
 1 AS `ActiveSubscriptions`,
 1 AS `OpenComplaints`,
 1 AS `UnpaidBills`,
 1 AS `TotalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `monthlyrevenuereport`
--

DROP TABLE IF EXISTS `monthlyrevenuereport`;
/*!50001 DROP VIEW IF EXISTS `monthlyrevenuereport`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthlyrevenuereport` AS SELECT 
 1 AS `RevenueMonth`,
 1 AS `TotalPayments`,
 1 AS `TotalRevenue`,
 1 AS `AveragePayment`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `BillID` int NOT NULL,
  `PaymentDate` date NOT NULL,
  `AmountPaid` decimal(10,2) NOT NULL,
  `PaymentMethod` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `BillID` (`BillID`),
  KEY `idx_payment_date` (`PaymentDate`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BillID`) REFERENCES `bill` (`BillID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'2025-04-05',35.00,'Card'),(2,3,'2025-04-06',10.00,'Cash'),(3,2,'2026-06-14',20.00,'Card');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `revenuesummaryview`
--

DROP TABLE IF EXISTS `revenuesummaryview`;
/*!50001 DROP VIEW IF EXISTS `revenuesummaryview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `revenuesummaryview` AS SELECT 
 1 AS `Month`,
 1 AS `TotalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `serviceplan`
--

DROP TABLE IF EXISTS `serviceplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceplan` (
  `PlanID` int NOT NULL AUTO_INCREMENT,
  `PlanName` varchar(50) NOT NULL,
  `MonthlyFee` decimal(10,2) NOT NULL,
  `DataLimitGB` int DEFAULT NULL,
  `VoiceMinutes` int DEFAULT NULL,
  `SMSLimit` int DEFAULT NULL,
  PRIMARY KEY (`PlanID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceplan`
--

LOCK TABLES `serviceplan` WRITE;
/*!40000 ALTER TABLE `serviceplan` DISABLE KEYS */;
INSERT INTO `serviceplan` VALUES (1,'Basic',10.00,5,100,50),(2,'Standard',20.00,20,300,200),(3,'Premium',35.00,50,1000,500);
/*!40000 ALTER TABLE `serviceplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsrecord`
--

DROP TABLE IF EXISTS `smsrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smsrecord` (
  `SMSID` int NOT NULL AUTO_INCREMENT,
  `SubscriptionID` int NOT NULL,
  `SMSDate` datetime NOT NULL,
  `MessageCount` int DEFAULT '1',
  PRIMARY KEY (`SMSID`),
  KEY `SubscriptionID` (`SubscriptionID`),
  CONSTRAINT `smsrecord_ibfk_1` FOREIGN KEY (`SubscriptionID`) REFERENCES `subscription` (`SubscriptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsrecord`
--

LOCK TABLES `smsrecord` WRITE;
/*!40000 ALTER TABLE `smsrecord` DISABLE KEYS */;
INSERT INTO `smsrecord` VALUES (1,1,'2025-04-02 11:00:00',2),(2,2,'2025-04-02 11:30:00',5),(3,4,'2025-04-03 14:00:00',1);
/*!40000 ALTER TABLE `smsrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `SubscriptionID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `PlanID` int NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Active',
  PRIMARY KEY (`SubscriptionID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `PlanID` (`PlanID`),
  KEY `idx_subscription_status` (`Status`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`PlanID`) REFERENCES `serviceplan` (`PlanID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,1,3,'2025-01-10',NULL,'Active'),(2,2,2,'2025-02-15',NULL,'Active'),(3,3,1,'2025-03-01','2025-06-01','Cancelled'),(4,4,3,'2025-03-20',NULL,'Active');
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `subscriptionoverviewview`
--

DROP TABLE IF EXISTS `subscriptionoverviewview`;
/*!50001 DROP VIEW IF EXISTS `subscriptionoverviewview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subscriptionoverviewview` AS SELECT 
 1 AS `SubscriptionID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `PlanName`,
 1 AS `Status`,
 1 AS `StartDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usagesummaryview`
--

DROP TABLE IF EXISTS `usagesummaryview`;
/*!50001 DROP VIEW IF EXISTS `usagesummaryview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usagesummaryview` AS SELECT 
 1 AS `SubscriptionID`,
 1 AS `TotalCallMinutes`,
 1 AS `TotalSMS`,
 1 AS `TotalDataGB`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `activecustomersview`
--

/*!50001 DROP VIEW IF EXISTS `activecustomersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `activecustomersview` AS select `customer`.`CustomerID` AS `CustomerID`,`customer`.`FirstName` AS `FirstName`,`customer`.`LastName` AS `LastName`,`customer`.`Email` AS `Email`,`customer`.`PhoneNumber` AS `PhoneNumber`,`customer`.`CustomerStatus` AS `CustomerStatus` from `customer` where (`customer`.`CustomerStatus` = 'Active') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `billingstatusview`
--

/*!50001 DROP VIEW IF EXISTS `billingstatusview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `billingstatusview` AS select `b`.`BillID` AS `BillID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`b`.`AmountDue` AS `AmountDue`,`b`.`Status` AS `Status`,`b`.`DueDate` AS `DueDate` from ((`bill` `b` join `subscription` `s` on((`b`.`SubscriptionID` = `s`.`SubscriptionID`))) join `customer` `c` on((`s`.`CustomerID` = `c`.`CustomerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `complaintsummaryview`
--

/*!50001 DROP VIEW IF EXISTS `complaintsummaryview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `complaintsummaryview` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`cp`.`ComplaintID` AS `ComplaintID`,`cp`.`Category` AS `Category`,`cp`.`Description` AS `Description`,`cp`.`Status` AS `Status`,`cp`.`ComplaintDate` AS `ComplaintDate` from (`customer` `c` join `complaint` `cp` on((`c`.`CustomerID` = `cp`.`CustomerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer360view`
--

/*!50001 DROP VIEW IF EXISTS `customer360view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer360view` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`c`.`Email` AS `Email`,`c`.`PhoneNumber` AS `PhoneNumber`,`sp`.`PlanName` AS `PlanName`,`s`.`Status` AS `SubscriptionStatus`,`b`.`BillID` AS `BillID`,`b`.`AmountDue` AS `AmountDue`,`b`.`Status` AS `BillStatus`,`cp`.`Category` AS `ComplaintCategory`,`cp`.`Status` AS `ComplaintStatus` from ((((`customer` `c` left join `subscription` `s` on((`c`.`CustomerID` = `s`.`CustomerID`))) left join `serviceplan` `sp` on((`s`.`PlanID` = `sp`.`PlanID`))) left join `bill` `b` on((`s`.`SubscriptionID` = `b`.`SubscriptionID`))) left join `complaint` `cp` on((`c`.`CustomerID` = `cp`.`CustomerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerbackupview`
--

/*!50001 DROP VIEW IF EXISTS `customerbackupview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerbackupview` AS select `customer`.`CustomerID` AS `CustomerID`,`customer`.`FirstName` AS `FirstName`,`customer`.`LastName` AS `LastName`,`customer`.`Email` AS `Email`,`customer`.`PhoneNumber` AS `PhoneNumber`,`customer`.`Address` AS `Address`,`customer`.`RegistrationDate` AS `RegistrationDate`,`customer`.`CustomerStatus` AS `CustomerStatus` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `managementdashboard`
--

/*!50001 DROP VIEW IF EXISTS `managementdashboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `managementdashboard` AS select (select count(0) from `customer` where (`customer`.`CustomerStatus` = 'Active')) AS `ActiveCustomers`,(select count(0) from `subscription` where (`subscription`.`Status` = 'Active')) AS `ActiveSubscriptions`,(select count(0) from `complaint` where (`complaint`.`Status` = 'Open')) AS `OpenComplaints`,(select count(0) from `bill` where (`bill`.`Status` = 'Unpaid')) AS `UnpaidBills`,(select coalesce(sum(`payment`.`AmountPaid`),0) from `payment`) AS `TotalRevenue` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthlyrevenuereport`
--

/*!50001 DROP VIEW IF EXISTS `monthlyrevenuereport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthlyrevenuereport` AS select date_format(`payment`.`PaymentDate`,'%Y-%m') AS `RevenueMonth`,count(`payment`.`PaymentID`) AS `TotalPayments`,sum(`payment`.`AmountPaid`) AS `TotalRevenue`,avg(`payment`.`AmountPaid`) AS `AveragePayment` from `payment` group by date_format(`payment`.`PaymentDate`,'%Y-%m') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `revenuesummaryview`
--

/*!50001 DROP VIEW IF EXISTS `revenuesummaryview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `revenuesummaryview` AS select date_format(`p`.`PaymentDate`,'%Y-%m') AS `Month`,sum(`p`.`AmountPaid`) AS `TotalRevenue` from `payment` `p` group by date_format(`p`.`PaymentDate`,'%Y-%m') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subscriptionoverviewview`
--

/*!50001 DROP VIEW IF EXISTS `subscriptionoverviewview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subscriptionoverviewview` AS select `s`.`SubscriptionID` AS `SubscriptionID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`sp`.`PlanName` AS `PlanName`,`s`.`Status` AS `Status`,`s`.`StartDate` AS `StartDate` from ((`subscription` `s` join `customer` `c` on((`s`.`CustomerID` = `c`.`CustomerID`))) join `serviceplan` `sp` on((`s`.`PlanID` = `sp`.`PlanID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usagesummaryview`
--

/*!50001 DROP VIEW IF EXISTS `usagesummaryview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usagesummaryview` AS select `s`.`SubscriptionID` AS `SubscriptionID`,sum(`cr`.`DurationMinutes`) AS `TotalCallMinutes`,sum(`sm`.`MessageCount`) AS `TotalSMS`,sum(`du`.`DataUsedGB`) AS `TotalDataGB` from (((`subscription` `s` left join `callrecord` `cr` on((`s`.`SubscriptionID` = `cr`.`SubscriptionID`))) left join `smsrecord` `sm` on((`s`.`SubscriptionID` = `sm`.`SubscriptionID`))) left join `datausage` `du` on((`s`.`SubscriptionID` = `du`.`SubscriptionID`))) group by `s`.`SubscriptionID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-14 22:11:21
