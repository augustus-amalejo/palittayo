-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2015 at 07:07 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `palittayo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `authassignment`
--

CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authitem`
--

CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authitemchild`
--

CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(100) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_desc` text NOT NULL,
  `status` int(3) NOT NULL COMMENT '1:active 2:inactive',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_desc`, `status`) VALUES
(1, 'Gadget', 'as fasf sfads sdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(100) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `user_id` int(100) NOT NULL,
  `item_id` int(100) NOT NULL,
  `date_posted` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(100) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(30) NOT NULL,
  `item_desc` text NOT NULL,
  `item_trade_value` varchar(50) NOT NULL,
  `category_id` int(100) NOT NULL,
  `item_condition` varchar(50) NOT NULL,
  `status` int(3) NOT NULL COMMENT '1:active 2:inactive',
  `featured` int(3) NOT NULL COMMENT '1:not featured 2:Featured',
  `user_id` int(100) NOT NULL,
  `date_posted` date NOT NULL,
  `date_updated` date NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `category_id` (`category_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_desc`, `item_trade_value`, `category_id`, `item_condition`, `status`, `featured`, `user_id`, `date_posted`, `date_updated`) VALUES
(1, 'Laptop for trade! Asus', 'askfhaj asdk fsaf hkjfa alasfkjsa ksa haskfj s kja kjasfas asf asf asf asf sadf ', '10k - 20k', 1, 'New', 1, 1, 1, '2015-09-05', '2015-09-05'),
(2, 'Phone for your whatever!', 'asdf af asf asfasdf sf asf s asf asf dfsdafasdfas dsaf dasf sdfds saf dsf sadf', '10k - 20k', 1, 'Used', 1, 1, 1, '2015-09-05', '2015-09-05'),
(3, 'Camera up for Grabs!', 'asfasfasf asf sffasf saf sdf sdfdsf', '10k - 20k', 1, 'New', 1, 1, 1, '2015-09-05', '2015-09-05'),
(4, 'Digital Clock for your anythin', 'asf asf ads asdfadsfdsfsfsd fsa', '5k - 6k', 1, 'Used', 1, 1, 1, '2015-09-05', '2015-09-06'),
(5, 'Google Glass for your Iphone!', 'asf saf asf sdf as ', '10k - 20k', 1, 'New', 1, 1, 1, '2015-09-07', '2015-09-08'),
(6, 'Go pro for your Shoes!', 'asf asf safsf asafsd ', '5k - 6k', 1, 'Used', 1, 1, 1, '2015-09-16', '2015-09-17'),
(7, 'Lappy for your Pappy!sadsfs af', 'saf sf sdf afads fsd ', '20k - 30k', 1, 'Used', 1, 1, 1, '2015-09-29', '2015-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1430754598),
('m150504_154455_createAuthTables', 1430754608);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `status` int(3) NOT NULL COMMENT '1:active 2:inactive',
  `user_type` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_fullname`, `status`, `user_type`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 1, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `profile_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `profile_fname` varchar(50) NOT NULL,
  `profile_lname` varchar(50) NOT NULL,
  `profile_mname` varchar(50) DEFAULT NULL,
  `profile_mobile` varchar(20) NOT NULL,
  `profile_tel` varchar(20) DEFAULT NULL,
  `profile_location` varchar(100) DEFAULT NULL,
  `profile_email` varchar(50) NOT NULL,
  `profile_flavor_text` text NOT NULL,
  `date_updated` date NOT NULL,
  `tag_name` varchar(20) NOT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`profile_id`, `user_id`, `profile_fname`, `profile_lname`, `profile_mname`, `profile_mobile`, `profile_tel`, `profile_location`, `profile_email`, `profile_flavor_text`, `date_updated`, `tag_name`) VALUES
(1, 1, 'Admin', 'istrator', 'A', '09163013924', '6429163', 'Philippines', 'amalejo@gmail.com', 'ang buhay ay parang bato...magaspang!', '2015-09-11', '@DmoneyMaker');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authassignment`
--
ALTER TABLE `authassignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
