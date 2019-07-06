-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema tailor
--

CREATE DATABASE IF NOT EXISTS tailor;
USE tailor;

--
-- Definition of table `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `areaid` int(11) NOT NULL auto_increment,
  `areaname` varchar(255) default NULL,
  `zoneid` int(11) NOT NULL,
  PRIMARY KEY  (`areaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;


--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `custid` int(10) unsigned NOT NULL auto_increment,
  `custname` varchar(45) NOT NULL,
  `zoneid` int(10) unsigned NOT NULL,
  `areaid` int(10) unsigned NOT NULL,
  `deliveryaddress` varchar(45) NOT NULL,
  `emailid` varchar(45) NOT NULL,
  PRIMARY KEY  (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `febric`
--

DROP TABLE IF EXISTS `febric`;
CREATE TABLE `febric` (
  `febricid` int(10) unsigned NOT NULL auto_increment,
  `itemid` int(10) unsigned NOT NULL,
  `tailorid` int(10) unsigned NOT NULL,
  `febricname` varchar(45) NOT NULL,
  `febriccost` int(10) unsigned NOT NULL,
  `photourl` varchar(45) NOT NULL,
  PRIMARY KEY  (`febricid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `febric`
--

/*!40000 ALTER TABLE `febric` DISABLE KEYS */;
/*!40000 ALTER TABLE `febric` ENABLE KEYS */;


--
-- Definition of table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `tailorid` int(10) unsigned NOT NULL,
  `itemname` varchar(45) NOT NULL,
  `makingcost` int(10) unsigned NOT NULL,
  `makingtime` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


--
-- Definition of table `measurement`
--

DROP TABLE IF EXISTS `measurement`;
CREATE TABLE `measurement` (
  `measurementid` int(10) unsigned NOT NULL auto_increment,
  `itemid` int(10) unsigned NOT NULL,
  `tailorid` int(10) unsigned NOT NULL,
  `measurementname` varchar(45) NOT NULL,
  PRIMARY KEY  (`measurementid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement`
--

/*!40000 ALTER TABLE `measurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `measurement` ENABLE KEYS */;


--
-- Definition of table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` int(10) unsigned NOT NULL auto_increment,
  `custid` int(10) unsigned NOT NULL,
  `tailorid` int(10) unsigned NOT NULL,
  `orderdate` varchar(45) NOT NULL,
  `deliverydate` varchar(45) NOT NULL,
  `bill` varchar(45) NOT NULL,
  `note` varchar(45) NOT NULL,
  `orderstatus` varchar(45) NOT NULL,
  `paytype` varchar(45) NOT NULL,
  `deliveryaddress` varchar(45) NOT NULL,
  PRIMARY KEY  (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


--
-- Definition of table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `detailid` int(10) unsigned NOT NULL auto_increment,
  `orderid` int(10) unsigned NOT NULL,
  `itemid` int(10) unsigned NOT NULL,
  `febricid` int(10) unsigned NOT NULL,
  `itemqty` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`detailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetail`
--

/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;


--
-- Definition of table `ordermeasurement`
--

DROP TABLE IF EXISTS `ordermeasurement`;
CREATE TABLE `ordermeasurement` (
  `ormeaid` int(10) unsigned NOT NULL auto_increment,
  `orderid` int(10) unsigned NOT NULL,
  `itemid` int(10) unsigned NOT NULL,
  `measurementid` int(10) unsigned NOT NULL,
  `measurementvalue` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ormeaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordermeasurement`
--

/*!40000 ALTER TABLE `ordermeasurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordermeasurement` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payid` int(10) unsigned NOT NULL auto_increment,
  `orderid` int(10) unsigned NOT NULL,
  `custid` int(10) unsigned NOT NULL,
  `tailorid` int(10) unsigned NOT NULL,
  `bill` int(10) unsigned NOT NULL,
  `paydate` varchar(45) NOT NULL,
  `paytype` varchar(45) NOT NULL,
  `paystatus` varchar(45) NOT NULL,
  PRIMARY KEY  (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `tailorinfo`
--

DROP TABLE IF EXISTS `tailorinfo`;
CREATE TABLE `tailorinfo` (
  `tailorid` int(11) NOT NULL auto_increment,
  `areaid` int(11) NOT NULL,
  `deliveryoption` varchar(255) default NULL,
  `emailid` varchar(255) default NULL,
  `payoption` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `tailoraddress` varchar(255) default NULL,
  `tailorname` varchar(255) default NULL,
  `zoneid` int(11) NOT NULL,
  PRIMARY KEY  (`tailorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tailorinfo`
--

/*!40000 ALTER TABLE `tailorinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailorinfo` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `emailid` varchar(255) NOT NULL,
  `phone` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `emailid` varchar(255) NOT NULL,
  `password` varchar(255) default NULL,
  `role` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrole`
--

/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;


--
-- Definition of table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `zoneid` int(11) NOT NULL auto_increment,
  `zonename` varchar(255) default NULL,
  PRIMARY KEY  (`zoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone`
--

/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
