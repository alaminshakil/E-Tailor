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
INSERT INTO `area` (`areaid`,`areaname`,`zoneid`) VALUES 
 (1,'Mirpur',1),
 (2,'Uttara',1),
 (3,'Jatrabari',1),
 (4,'CoxBazar',2),
 (5,'Patia',2),
 (6,'Halisahor',2),
 (7,'Barura',3),
 (8,'Chandina',3),
 (9,'Chandpur',3);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;


--
-- Definition of table `customerinfo`
--

DROP TABLE IF EXISTS `customerinfo`;
CREATE TABLE `customerinfo` (
  `custid` int(11) NOT NULL auto_increment,
  `areaid` int(11) default NULL,
  `custname` varchar(255) default NULL,
  `deliveryaddress` varchar(255) default NULL,
  `emailid` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `zoneid` int(11) default NULL,
  PRIMARY KEY  (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerinfo`
--

/*!40000 ALTER TABLE `customerinfo` DISABLE KEYS */;
INSERT INTO `customerinfo` (`custid`,`areaid`,`custname`,`deliveryaddress`,`emailid`,`phone`,`zoneid`) VALUES 
 (1,3,'Harun','1/A, Uttar Badda','Harun@gmail.com','018124598741',1),
 (2,3,'Al Amin Khan','Polashpur, Dhaka','customer@gmail.com','01515261234',1),
 (3,1,'customer','Shahali, Dhaka','cust@gmail.com','01578945678',1);
/*!40000 ALTER TABLE `customerinfo` ENABLE KEYS */;


--
-- Definition of table `custorder`
--

DROP TABLE IF EXISTS `custorder`;
CREATE TABLE `custorder` (
  `orderid` int(11) NOT NULL auto_increment,
  `bill` varchar(255) default NULL,
  `custid` int(11) NOT NULL,
  `deliveryaddress` varchar(255) default NULL,
  `deliverydate` varchar(255) default NULL,
  `note` varchar(255) default NULL,
  `orderdate` varchar(255) default NULL,
  `orderstatus` varchar(255) NOT NULL default 'Booked',
  `paytype` varchar(255) default NULL,
  `tailorid` int(11) NOT NULL,
  PRIMARY KEY  (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custorder`
--

/*!40000 ALTER TABLE `custorder` DISABLE KEYS */;
INSERT INTO `custorder` (`orderid`,`bill`,`custid`,`deliveryaddress`,`deliverydate`,`note`,`orderdate`,`orderstatus`,`paytype`,`tailorid`) VALUES 
 (1,'1500',1,'Mohakhali, Dhaka','2019-06-19','','2019-05-29','Delivered','Cash',1),
 (2,'500',1,'Donia, Dhaka','2019-05-31','Nope','2019-05-30','Booked','Cash',1),
 (3,'500',2,'Donia, Dhaka','2019-06-28','Nope','2019-06-06','Delivered','Online',2),
 (4,'500',3,'Donia, Dhaka','2019-06-28','Nope','2019-06-06','Delivered','Online',2),
 (5,'1000',10,'Chandina, Comilla','2019-07-06','Double pocket','2019-07-02','Booked','Cash',3),
 (6,'3500',15,'Badda, Dhaka','2019-07-11','Double Selai','2019-07-04','Booked','Cash',5),
 (7,'2500',24,'Chandina, Comilla','2019-07-18','Meggi Hata','2018-06-14','Delivered','Cash',5),
 (8,'1500',35,'Uttar Badda, Dhaka','2019-07-06','','2019-07-01','Booked','Cash',1),
 (9,'1000',3,'Shahali, Dhaka','2019-05-16','Double pocket','2019-05-09','Booked','Online',1),
 (10,'2500',4,'Mirpur, Dhaka','2019-05-16','Steel Button','2019-05-20','Booked','Cash',1);
/*!40000 ALTER TABLE `custorder` ENABLE KEYS */;


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
INSERT INTO `febric` (`febricid`,`itemid`,`tailorid`,`febricname`,`febriccost`,`photourl`) VALUES 
 (2,1,1,'Tor',100,'Hello'),
 (3,5,1,'Panjabi-Indian-Tor',500,'None'),
 (4,6,1,'Soft-Paki',350,'no'),
 (5,2,1,'Katan',450,'nne'),
 (6,2,3,'Haha',540,'n'),
 (7,9,6,'Suti',300,'None'),
 (8,10,7,'China',250,'None');
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
INSERT INTO `item` (`itemid`,`tailorid`,`itemname`,`makingcost`,`makingtime`) VALUES 
 (1,1,'Shirt',250,3),
 (2,1,'Panjabi',450,5),
 (3,1,'Pant',400,6),
 (4,2,'Shirt',220,4),
 (5,2,'Panjabi',420,8),
 (6,2,'Pant',600,2),
 (7,3,'Shirt',550,1),
 (8,3,'Panjabi',300,10),
 (9,4,'T-Shirt',200,5),
 (10,4,'Fatua',320,2);
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
INSERT INTO `measurement` (`measurementid`,`itemid`,`tailorid`,`measurementname`) VALUES 
 (1,2,1,'Long'),
 (2,5,2,'Height'),
 (3,1,1,'Width'),
 (4,3,1,'Hip'),
 (5,3,1,'Length');
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
  `note` varchar(45) default NULL,
  `orderstatus` varchar(45) default NULL,
  `paytype` varchar(45) default NULL,
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
INSERT INTO `orderdetail` (`detailid`,`orderid`,`itemid`,`febricid`,`itemqty`) VALUES 
 (1,1,2,2,3),
 (2,1,3,2,1),
 (3,2,3,2,1);
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
INSERT INTO `ordermeasurement` (`ormeaid`,`orderid`,`itemid`,`measurementid`,`measurementvalue`) VALUES 
 (1,1,2,1,55),
 (2,1,3,5,25),
 (3,1,3,4,30),
 (4,1,3,3,12);
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
INSERT INTO `payment` (`payid`,`orderid`,`custid`,`tailorid`,`bill`,`paydate`,`paytype`,`paystatus`) VALUES 
 (1,1,1,1,500,'2019-05-27','Cash','Paid'),
 (2,1,1,1,1500,'2019-07-03','Cash','Paid'),
 (3,2,2,2,1200,'2019-07-31','Online','Due'),
 (4,3,1,2,200,'2019-07-14','Cash','Paid'),
 (5,4,1,3,20,'2019-07-18','Online','Paid');
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
INSERT INTO `tailorinfo` (`tailorid`,`areaid`,`deliveryoption`,`emailid`,`payoption`,`phone`,`tailoraddress`,`tailorname`,`zoneid`) VALUES 
 (1,2,'Home','tailor@gmail.com','Cash','01845798745','Jashimuddin Road, Dhaka','Top Ten Limited',1),
 (2,1,'Home','fgjhuj@gmail.com','Cash','0157578945','Dhaka','Belmond',1),
 (3,1,'Home','ten.mirpur@gmail.com','Cash','01845796575','Mirpur 10, Dhaka','Top Ten Limited',1),
 (4,1,'Pick','ten.barura@gmail.com','Online','01879656554','Barura Bazar','Top Ten Limited',2),
 (5,7,'Pick','tailor2@gmail.com','Cash','01879654879','Chandina, Comilla','Belmond Private Limited (Chandina)',2),
 (6,7,'Home','tencandina@gmail.com','Cash','01879684879','Chandina, Comilla','Top Ten Limited',2),
 (7,1,'Home','mirpur@ten.com','Cash','01686139665','Golchattar, Mirpur-10','Top Ten Limited',1),
 (8,1,'Pick','new@ten.com','Online','01845794575','Golchattar, Mirpur-11','New Style Tailors',1),
 (9,1,'Home','modern@ten.com','Cash','01879654879','Mirpur 10, Dhaka','Modern Tailor\'s Limited',1),
 (10,2,'Pick','Uttara@ten.com','Cash','01879684879','Dia Bari, Uttara','Top Ten Limited',1),
 (11,2,'Home','uttarabel@ten.com','Cash','01515261236','Housebuilding, Uttara','Belmond Tailor\'s',1),
 (12,7,'Home','barura@ten.com','Cash','01578947895','Barura Bazar','Top Ten Limited',3),
 (13,7,'Pick','modernbarura@gmail.com','Online','0165477895','Barura Road','Modern Tailor\'s Limited',3);
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
INSERT INTO `user` (`emailid`,`phone`,`username`) VALUES 
 ('admin@gmail.com','0187954545','Admin'),
 ('alamin@gmail.com','01515261234','Al Amin Shakil'),
 ('barura@ten.com','01578947895','Top Ten Limited'),
 ('bel@gmail.com','01879654879','Belmond Private Limited (Chandina)'),
 ('cust@gmail.com','01578945678','customer'),
 ('customer@gmail.com','01812459874','Al Amin Khan'),
 ('fgjhuj@gmail.com','0157578945','Belmond'),
 ('lata.jnu6@gmail.com','01686139665','Lutfun Nahar'),
 ('mirpur@ten.com','01686139665','Top Ten Limited'),
 ('modern@ten.com','01879654879','Modern Tailor\'s Limited'),
 ('modernbarura@gmail.com','0165477895','Modern Tailor\'s Limited'),
 ('new@ten.com','01845794575','New Style Tailors'),
 ('tailor@gmail.com','01845798745','Top Ten Limited'),
 ('ten.barura@gmail.com','01879656554','Top Ten Limited'),
 ('ten.mirpur@gmail.com','01845796575','Top Ten Limited'),
 ('tencandina@gmail.com','01879684879','Top Ten Limited'),
 ('Uttara@ten.com','01879684879','Top Ten Limited'),
 ('uttarabel@ten.com','01515261236','Belmond Tailor\'s');
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
INSERT INTO `userrole` (`emailid`,`password`,`role`,`status`) VALUES 
 ('admin@gmail.com','123','ROLE_ADMIN','True'),
 ('alamin@gmail.com','123','ROLE_ADMIN','True'),
 ('barura@ten.com','123','ROLE_TAILOR','True'),
 ('bel@gmail.com','123','ROLE_TAILOR','True'),
 ('cust@gmail.com','123','ROLE_CUSTOMER','True'),
 ('customer@gmail.com','123','ROLE_CUSTOMER','True'),
 ('lata.jnu6@gmail.com','123','ROLE_CUSTOMER','True'),
 ('mirpur@ten.com','123','ROLE_TAILOR','True'),
 ('modern@ten.com','123','ROLE_TAILOR','True'),
 ('modernbarura@gmail.com','123','ROLE_TAILOR','True'),
 ('new@ten.com','123','ROLE_TAILOR','True'),
 ('tailor@gmail.com','123','ROLE_TAILOR','True'),
 ('ten.barura@gmail.com','123','ROLE_TAILOR','True'),
 ('ten.mirpur@gmail.com','123','ROLE_TAILOR','True'),
 ('tencandina@gmail.com','123','ROLE_TAILOR','True'),
 ('test@gmail.com','123','ROLE_ADMIN','True'),
 ('Uttara@ten.com','123','ROLE_TAILOR','True'),
 ('uttarabel@ten.com','123','ROLE_TAILOR','True');
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
INSERT INTO `zone` (`zoneid`,`zonename`) VALUES 
 (1,'Dhaka'),
 (2,'Chittagong'),
 (3,'Comilla');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
