CREATE DATABASE  IF NOT EXISTS `a3waste` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `a3waste`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: a3waste
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1

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
-- Table structure for table `AdminLog`
--

DROP TABLE IF EXISTS `AdminLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminLog` (
  `ServerID` int(10) unsigned NOT NULL,
  `Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayerName` varchar(128) NOT NULL,
  `PlayerUID` varchar(32) NOT NULL,
  `BattlEyeGUID` varchar(32) DEFAULT NULL,
  `ActionType` varchar(32) NOT NULL,
  `ActionValue` varchar(128) NOT NULL,
  KEY `fk_AdminLog_Server1_idx` (`ServerID`),
  CONSTRAINT `fk_AdminLog_Server1` FOREIGN KEY (`ServerID`) REFERENCES `ServerInstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminLog`
--

LOCK TABLES `AdminLog` WRITE;
/*!40000 ALTER TABLE `AdminLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdminLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AntihackLog`
--

DROP TABLE IF EXISTS `AntihackLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AntihackLog` (
  `ServerID` int(10) unsigned NOT NULL,
  `Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayerName` varchar(128) NOT NULL,
  `PlayerUID` varchar(34) NOT NULL,
  `BattleEyeGUID` varchar(32) DEFAULT NULL,
  `HackType` varchar(32) NOT NULL,
  `HackValue` varchar(128) NOT NULL,
  KEY `fk_AntihackLog_Server1_idx` (`ServerID`),
  CONSTRAINT `fk_AntihackLog_Server1` FOREIGN KEY (`ServerID`) REFERENCES `ServerInstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AntihackLog`
--

LOCK TABLES `AntihackLog` WRITE;
/*!40000 ALTER TABLE `AntihackLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `AntihackLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DBInfo`
--

DROP TABLE IF EXISTS `DBInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBInfo` (
  `Name` varchar(64) NOT NULL,
  `Value` varchar(64) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DBInfo`
--

LOCK TABLES `DBInfo` WRITE;
/*!40000 ALTER TABLE `DBInfo` DISABLE KEYS */;
INSERT INTO `DBInfo` VALUES ('Version','7');
/*!40000 ALTER TABLE `DBInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerInfo`
--

DROP TABLE IF EXISTS `PlayerInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerInfo` (
  `UID` varchar(32) NOT NULL,
  `BattlEyeGUID` varchar(34) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `LastSide` varchar(8) DEFAULT NULL,
  `BankMoney` float DEFAULT NULL,
  `Unlocks` varchar(4096) DEFAULT NULL,
  `Perks` varchar(4096) DEFAULT NULL,
  `Variables` text,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerInfo`
--

LOCK TABLES `PlayerInfo` WRITE;
/*!40000 ALTER TABLE `PlayerInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlayerInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerSave`
--

DROP TABLE IF EXISTS `PlayerSave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerSave` (
  `PlayerUID` varchar(32) NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Damage` float DEFAULT NULL,
  `HitPoints` varchar(256) DEFAULT NULL,
  `Position` varchar(64) DEFAULT NULL,
  `Direction` float DEFAULT NULL,
  `Hunger` float DEFAULT NULL,
  `Thirst` float DEFAULT NULL,
  `Money` float DEFAULT NULL,
  `CurrentWeapon` varchar(64) DEFAULT NULL,
  `Stance` varchar(64) DEFAULT NULL,
  `Headgear` varchar(64) DEFAULT NULL,
  `Goggles` varchar(64) DEFAULT NULL,
  `Uniform` varchar(64) DEFAULT NULL,
  `Vest` varchar(64) DEFAULT NULL,
  `Backpack` varchar(64) DEFAULT NULL,
  `UniformWeapons` text,
  `UniformItems` text,
  `UniformMagazines` text,
  `VestWeapons` text,
  `VestItems` text,
  `VestMagazines` text,
  `BackpackWeapons` text,
  `BackpackItems` text,
  `BackpackMagazines` text,
  `PrimaryWeapon` varchar(64) DEFAULT NULL,
  `SecondaryWeapon` varchar(64) DEFAULT NULL,
  `HandgunWeapon` varchar(64) DEFAULT NULL,
  `PrimaryWeaponItems` varchar(128) DEFAULT NULL,
  `SecondaryWeaponItems` varchar(128) DEFAULT NULL,
  `HandgunItems` varchar(128) DEFAULT NULL,
  `AssignedItems` varchar(256) DEFAULT NULL,
  `LoadedMagazines` varchar(1024) DEFAULT NULL,
  `WasteItems` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`PlayerUID`,`MapID`),
  KEY `fk_PlayerSave_ServerMap1_idx` (`MapID`),
  CONSTRAINT `fk_PlayerSave_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `PlayerInfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerSave_ServerMap1` FOREIGN KEY (`MapID`) REFERENCES `ServerMap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerSave`
--

LOCK TABLES `PlayerSave` WRITE;
/*!40000 ALTER TABLE `PlayerSave` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlayerSave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServerInstance`
--

DROP TABLE IF EXISTS `ServerInstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServerInstance` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MapID` int(10) unsigned NOT NULL,
  `WarchestMoneyBLUFOR` float DEFAULT '0',
  `WarchestMoneyOPFOR` float DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_ServerInstance_ServerMap1_idx` (`MapID`),
  CONSTRAINT `fk_ServerInstance_ServerMap1` FOREIGN KEY (`MapID`) REFERENCES `ServerMap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServerInstance`
--

LOCK TABLES `ServerInstance` WRITE;
/*!40000 ALTER TABLE `ServerInstance` DISABLE KEYS */;
INSERT INTO `ServerInstance` VALUES (1,1,0,0);
/*!40000 ALTER TABLE `ServerInstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServerMap`
--

DROP TABLE IF EXISTS `ServerMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServerMap` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WorldName` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServerMap`
--

LOCK TABLES `ServerMap` WRITE;
/*!40000 ALTER TABLE `ServerMap` DISABLE KEYS */;
INSERT INTO `ServerMap` VALUES (1,'');
/*!40000 ALTER TABLE `ServerMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServerObjects`
--

DROP TABLE IF EXISTS `ServerObjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServerObjects` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerID` int(10) unsigned NOT NULL,
  `MapID` int(10) unsigned NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Class` varchar(64) DEFAULT NULL,
  `Position` varchar(64) DEFAULT NULL,
  `Direction` varchar(128) DEFAULT NULL,
  `HoursAlive` float DEFAULT NULL,
  `Damage` float DEFAULT NULL,
  `AllowDamage` tinyint(1) DEFAULT NULL,
  `Variables` varchar(4096) DEFAULT NULL,
  `Weapons` text,
  `Magazines` text,
  `Items` text,
  `Backpacks` text,
  `TurretMagazines` text,
  `AmmoCargo` float DEFAULT NULL,
  `FuelCargo` float DEFAULT NULL,
  `RepairCargo` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_ServerObjects_ServerMap1_idx` (`ServerID`),
  KEY `fk_ServerObjects_ServerMap2_idx` (`MapID`),
  CONSTRAINT `fk_ServerObjects_ServerMap1` FOREIGN KEY (`ServerID`) REFERENCES `ServerInstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerObjects_ServerMap2` FOREIGN KEY (`MapID`) REFERENCES `ServerMap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServerObjects`
--

LOCK TABLES `ServerObjects` WRITE;
/*!40000 ALTER TABLE `ServerObjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServerObjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-17 14:15:32
