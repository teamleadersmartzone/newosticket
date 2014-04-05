-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 05, 2014 at 04:29 AM
-- Server version: 5.5.37-log
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `smartzo1_osticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `ost_email`
--

DROP TABLE IF EXISTS `ost_email`;
CREATE TABLE IF NOT EXISTS `ost_email` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `popimap` varchar(255) NOT NULL,
  `pipassword` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `email`, `name`, `popimap`, `pipassword`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 1, 2, 1, 'engineer.pankaj.kashyap@gmail.com', 'Support', '', '0', 'pankajkumar@smartzonewebservices.com', '$2$JDEk2PIue9vmTRo9EJdJ5QhMh2U7AOzysRjaJPSpM+VA1Hs=', 0, 'pop.gmail.com', 'POP', 'NONE', 465, 5, 30, NULL, 0, 0, NULL, NULL, 1, 'smartzonewebservices.com', 26, 1, 0, 0, '', '2014-04-02 04:19:41', '2014-04-03 07:38:44'),
(2, 0, 2, 1, 'alerts@gmail.com', 'osTicket Alerts', '', '0', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(4, 0, 1, 2, 'teamleader.smartzone@gmail.com', 'adasdasdasdasd', '', '0', 'kushal.smartzone@gmail.com', '$2$JDEkUcSqUQlIckEQq8vhTneK0i2ADGAcoRMaXWip8Oi0Nz8=', 0, '', 'POP', 'NONE', 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 'smtp.gmail.com', 465, 1, 1, 0, '', '2014-04-03 04:07:49', '2014-04-03 04:07:49'),
(11, 0, 1, 3, 'smartabc@gmail.com', 'pankaj kashyap', 'smartzonetestmails@gmail.com', 'pankaj1390', 'smartzonetestmail.com', '$2$JDEkzCuY/IJvn05CZjr6hW7XJQXB8iRkVCcRiDdIvI5My7s=', 0, 'pop.gmail.com', 'POP', 'NONE', 587, 5, 30, NULL, 0, 0, NULL, NULL, 0, 'smtp.gmail.com', 465, 1, 0, 0, '', '2014-04-04 23:26:13', '2014-04-05 01:29:56'),
(6, 1, 3, 2, 'pankaj_kumar036@rediffmail.com', 'pankaj kashyap', '', '0', '', '', 0, '', 'POP', 'NONE', 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, '', 0, 1, 0, 0, '', '2014-04-04 04:50:39', '2014-04-04 04:51:19'),
(12, 1, 1, 3, 'engineer.pankaj.kashyap1123@gmail.com', 'pankaj kashyap', 'smartzonetestmails@gmail.com', 'pankaj1390', 'smartzonetestmail@gmail.com', '$2$JDEkFajzc0WLO/NfR6wCxj6aPK71aqJJVXK7HT/ZPyJF6+s=', 0, 'pop.gmail.com', 'POP', 'NONE', 587, 5, 30, NULL, 0, 0, NULL, NULL, 0, 'smtp.gmail.com', 465, 1, 0, 0, '', '2014-04-05 01:32:49', '2014-04-05 01:32:49'),
(13, 1, 1, 3, 'engineer.pankaj.kashyap121@gmail.com', 'Support', 'smartzonetestmail@gmail.com', '123456', 'smtpuser', '$2$JDEkBhAVeOW8t9SlN4of6Y2Ekhx9mUxIlCBHZkQrhf0se9I=', 0, 'pop.gmail.com', 'POP', 'NONE', 587, 5, 30, NULL, 0, 0, NULL, NULL, 0, 'smtp.gmail.com', 465, 1, 0, 0, '', '2014-04-05 01:35:09', '2014-04-05 04:06:42');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
