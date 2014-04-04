-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 03, 2014 at 11:22 PM
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
-- Table structure for table `ost_api_key`
--

DROP TABLE IF EXISTS `ost_api_key`;
CREATE TABLE IF NOT EXISTS `ost_api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apikey` (`apikey`),
  KEY `ipaddr` (`ipaddr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_attachment`
--

DROP TABLE IF EXISTS `ost_attachment`;
CREATE TABLE IF NOT EXISTS `ost_attachment` (
  `object_id` int(11) unsigned NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `inline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`file_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_attachment`
--

INSERT INTO `ost_attachment` (`object_id`, `type`, `file_id`, `inline`) VALUES
(1, 'C', 3, 0),
(8, 'T', 1, 1),
(9, 'T', 1, 1),
(10, 'T', 1, 1),
(11, 'T', 1, 1),
(12, 'T', 1, 1),
(13, 'T', 1, 1),
(14, 'T', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_canned_response`
--

DROP TABLE IF EXISTS `ost_canned_response`;
CREATE TABLE IF NOT EXISTS `ost_canned_response` (
  `canned_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`canned_id`),
  UNIQUE KEY `title` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.', 'en_US', '', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first}, <br /> <br /> Your ticket #%{ticket.number} created on %{ticket.create_date} is in %{ticket.dept.name} department.', 'en_US', '', '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_config`
--

DROP TABLE IF EXISTS `ost_config`;
CREATE TABLE IF NOT EXISTS `ost_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`,`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `ost_config`
--

INSERT INTO `ost_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'pankaj_kumar036@yahoo.com', '2014-04-02 10:19:41'),
(2, 'core', 'helpdesk_url', 'http://smartzonewebservices.com/dev/osticket/', '2014-04-02 10:19:41'),
(3, 'core', 'helpdesk_title', 'pankajkumar', '2014-04-02 10:19:41'),
(4, 'core', 'schema_signature', 'f5692e24c7afba7ab6168dde0b3bb3c8', '2014-04-02 10:19:41'),
(5, 'sla.1', 'transient', '0', '2014-04-02 10:19:40'),
(6, 'core', 'time_format', 'h:i A', '2014-04-02 10:19:40'),
(7, 'core', 'date_format', 'm/d/Y', '2014-04-02 10:19:40'),
(8, 'core', 'datetime_format', 'm/d/Y g:i a', '2014-04-02 10:19:40'),
(9, 'core', 'daydatetime_format', 'D, M j Y g:ia', '2014-04-02 10:19:40'),
(10, 'core', 'default_timezone_id', '8', '2014-04-02 10:19:40'),
(11, 'core', 'default_priority_id', '2', '2014-04-02 10:19:40'),
(12, 'core', 'enable_daylight_saving', '0', '2014-04-02 10:19:40'),
(13, 'core', 'reply_separator', '-- do not edit --', '2014-04-02 10:19:40'),
(14, 'core', 'allowed_filetypes', '.doc, .pdf, .jpg, .jpeg, .gif, .png, .xls, .docx, .xlsx, .txt', '2014-04-02 10:19:40'),
(15, 'core', 'isonline', '1', '2014-04-02 10:19:40'),
(16, 'core', 'staff_ip_binding', '0', '2014-04-02 10:19:40'),
(17, 'core', 'staff_max_logins', '4', '2014-04-02 10:19:40'),
(18, 'core', 'staff_login_timeout', '2', '2014-04-02 10:19:40'),
(19, 'core', 'staff_session_timeout', '30', '2014-04-02 10:19:40'),
(20, 'core', 'passwd_reset_period', '0', '2014-04-02 10:19:40'),
(21, 'core', 'client_max_logins', '4', '2014-04-02 10:19:40'),
(22, 'core', 'client_login_timeout', '2', '2014-04-02 10:19:40'),
(23, 'core', 'client_session_timeout', '30', '2014-04-02 10:19:40'),
(24, 'core', 'max_page_size', '25', '2014-04-02 10:19:40'),
(25, 'core', 'max_open_tickets', '0', '2014-04-02 10:19:40'),
(26, 'core', 'max_file_size', '1048576', '2014-04-02 10:19:40'),
(27, 'core', 'max_user_file_uploads', '1', '2014-04-02 10:19:40'),
(28, 'core', 'max_staff_file_uploads', '1', '2014-04-02 10:19:40'),
(29, 'core', 'autolock_minutes', '3', '2014-04-02 10:19:40'),
(30, 'core', 'default_smtp_id', '5', '2014-04-03 14:26:01'),
(31, 'core', 'use_email_priority', '0', '2014-04-02 10:19:40'),
(32, 'core', 'enable_kb', '0', '2014-04-02 10:19:40'),
(33, 'core', 'enable_premade', '1', '2014-04-02 10:19:40'),
(34, 'core', 'enable_captcha', '0', '2014-04-02 10:19:40'),
(35, 'core', 'enable_auto_cron', '1', '2014-04-03 13:09:58'),
(36, 'core', 'enable_mail_polling', '1', '2014-04-03 13:09:58'),
(37, 'core', 'send_sys_errors', '1', '2014-04-02 10:19:40'),
(38, 'core', 'send_sql_errors', '1', '2014-04-02 10:19:40'),
(39, 'core', 'send_login_errors', '1', '2014-04-02 10:19:40'),
(40, 'core', 'save_email_headers', '1', '2014-04-02 10:19:40'),
(41, 'core', 'strip_quoted_reply', '1', '2014-04-02 10:19:40'),
(42, 'core', 'ticket_autoresponder', '0', '2014-04-02 10:19:40'),
(43, 'core', 'message_autoresponder', '0', '2014-04-02 10:19:40'),
(44, 'core', 'ticket_notice_active', '1', '2014-04-02 10:19:40'),
(45, 'core', 'ticket_alert_active', '1', '2014-04-02 10:19:40'),
(46, 'core', 'ticket_alert_admin', '1', '2014-04-02 10:19:40'),
(47, 'core', 'ticket_alert_dept_manager', '1', '2014-04-02 10:19:40'),
(48, 'core', 'ticket_alert_dept_members', '0', '2014-04-02 10:19:40'),
(49, 'core', 'message_alert_active', '1', '2014-04-02 10:19:40'),
(50, 'core', 'message_alert_laststaff', '1', '2014-04-02 10:19:40'),
(51, 'core', 'message_alert_assigned', '1', '2014-04-02 10:19:40'),
(52, 'core', 'message_alert_dept_manager', '0', '2014-04-02 10:19:40'),
(53, 'core', 'note_alert_active', '0', '2014-04-02 10:19:40'),
(54, 'core', 'note_alert_laststaff', '1', '2014-04-02 10:19:40'),
(55, 'core', 'note_alert_assigned', '1', '2014-04-02 10:19:40'),
(56, 'core', 'note_alert_dept_manager', '0', '2014-04-02 10:19:40'),
(57, 'core', 'transfer_alert_active', '0', '2014-04-02 10:19:40'),
(58, 'core', 'transfer_alert_assigned', '0', '2014-04-02 10:19:40'),
(59, 'core', 'transfer_alert_dept_manager', '1', '2014-04-02 10:19:40'),
(60, 'core', 'transfer_alert_dept_members', '0', '2014-04-02 10:19:40'),
(61, 'core', 'overdue_alert_active', '1', '2014-04-02 10:19:40'),
(62, 'core', 'overdue_alert_assigned', '1', '2014-04-02 10:19:40'),
(63, 'core', 'overdue_alert_dept_manager', '1', '2014-04-02 10:19:40'),
(64, 'core', 'overdue_alert_dept_members', '0', '2014-04-02 10:19:40'),
(65, 'core', 'assigned_alert_active', '1', '2014-04-02 10:19:40'),
(66, 'core', 'assigned_alert_staff', '1', '2014-04-02 10:19:40'),
(67, 'core', 'assigned_alert_team_lead', '0', '2014-04-02 10:19:40'),
(68, 'core', 'assigned_alert_team_members', '0', '2014-04-02 10:19:40'),
(69, 'core', 'auto_claim_tickets', '1', '2014-04-02 10:19:40'),
(70, 'core', 'show_related_tickets', '1', '2014-04-02 10:19:40'),
(71, 'core', 'show_assigned_tickets', '1', '2014-04-02 10:19:40'),
(72, 'core', 'show_answered_tickets', '0', '2014-04-02 10:19:40'),
(73, 'core', 'hide_staff_name', '0', '2014-04-02 10:19:40'),
(74, 'core', 'overlimit_notice_active', '0', '2014-04-02 10:19:40'),
(75, 'core', 'email_attachments', '1', '2014-04-02 10:19:40'),
(76, 'core', 'random_ticket_ids', '1', '2014-04-02 10:19:40'),
(77, 'core', 'log_level', '2', '2014-04-02 10:19:40'),
(78, 'core', 'log_graceperiod', '12', '2014-04-02 10:19:40'),
(79, 'core', 'landing_page_id', '1', '2014-04-02 10:19:40'),
(80, 'core', 'thank-you_page_id', '2', '2014-04-02 10:19:40'),
(81, 'core', 'offline_page_id', '3', '2014-04-02 10:19:40'),
(82, 'core', 'system_language', 'en_US', '2014-04-02 10:19:40'),
(83, 'core', 'default_email_id', '4', '2014-04-03 13:38:36'),
(84, 'core', 'alert_email_id', '0', '2014-04-03 13:38:36'),
(85, 'core', 'default_dept_id', '1', '2014-04-02 10:19:41'),
(86, 'core', 'default_sla_id', '1', '2014-04-02 10:19:41'),
(87, 'core', 'default_template_id', '1', '2014-04-02 10:19:41'),
(91, 'core', 'add_email_collabs', '1', '2014-04-03 13:09:58'),
(90, 'staff.1', 'lang', '', '2014-04-02 12:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `ost_department`
--

DROP TABLE IF EXISTS `ost_department`;
CREATE TABLE IF NOT EXISTS `ost_department` (
  `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_name` varchar(128) NOT NULL DEFAULT '',
  `dept_signature` tinytext NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ost_department`
--

INSERT INTO `ost_department` (`dept_id`, `tpl_id`, `sla_id`, `email_id`, `autoresp_email_id`, `manager_id`, `dept_name`, `dept_signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `updated`, `created`) VALUES
(1, 0, 0, 1, 1, 0, 'Support', 'Support Department', 1, 0, 1, 1, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(2, 0, 1, 1, 1, 0, 'Sales', 'Sales and Customer Retention', 1, 0, 1, 1, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(3, 0, 0, 1, 1, 0, 'Maintenance', 'Maintenance Department', 0, 0, 1, 1, '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_draft`
--

DROP TABLE IF EXISTS `ost_draft`;
CREATE TABLE IF NOT EXISTS `ost_draft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) unsigned NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `ost_draft`
--

INSERT INTO `ost_draft` (`id`, `staff_id`, `namespace`, `body`, `created`, `updated`) VALUES
(1, 1, 'ticket.response.1', '', '2014-04-02 10:27:10', '2014-04-02 10:27:20'),
(2, 1, 'ticket.note.1', '', '2014-04-02 10:27:11', '2014-04-02 10:27:20'),
(9, 1, 'ticket.staff.response', '', '2014-04-02 10:51:42', '2014-04-03 11:17:57'),
(6, 1, 'ticket.note.2', '', '2014-04-02 10:45:40', '2014-04-02 10:53:31'),
(7, 1, 'ticket.response.2', 'Hi pankaj, <br /> <br /> Your ticket #133638 created on 04/02/2014 5:35 am is in Support department.', '2014-04-02 10:46:18', '2014-04-02 10:53:31'),
(8, 1, 'ticket.staff', '', '2014-04-02 10:51:41', '2014-04-03 11:17:57'),
(10, 1, 'ticket.staff.note', '', '2014-04-02 10:51:42', '2014-04-03 11:17:58'),
(11, 1, 'ticket.response.3', '', '2014-04-02 11:11:08', NULL),
(12, 1, 'ticket.note.3', '', '2014-04-02 11:11:08', NULL),
(16, 1, 'ticket.response.4', '', '2014-04-02 11:15:48', '2014-04-02 11:15:58'),
(15, 1, 'ticket.note.4', '', '2014-04-02 11:14:00', '2014-04-02 11:15:58'),
(18, 1, 'ticket.note.5', '', '2014-04-02 12:49:58', '2014-04-02 12:50:38'),
(44, 1, 'ticket.note.11', '', '2014-04-03 13:32:37', '2014-04-03 13:32:59'),
(20, 1, 'ticket.response.5', '', '2014-04-02 12:50:28', '2014-04-02 12:50:38'),
(24, 1, 'ticket.response.6', '', '2014-04-02 12:54:01', '2014-04-02 12:54:11'),
(23, 1, 'ticket.note.6', '', '2014-04-02 12:53:51', '2014-04-02 12:54:11'),
(26, 1, 'ticket.note.7', '', '2014-04-02 13:10:17', '2014-04-02 13:10:39'),
(28, 1, 'ticket.response.7', '', '2014-04-02 13:10:30', '2014-04-02 13:10:39'),
(29, 0, 'ticket.client.tjhadrdov0g1', '', '2014-04-03 04:49:28', '2014-04-03 09:52:04'),
(40, 1, 'ticket.note.10', '', '2014-04-03 13:21:20', '2014-04-03 13:21:41'),
(45, 1, 'ticket.response.11', '', '2014-04-03 13:32:50', '2014-04-03 13:32:59'),
(33, 1, 'ticket.response.8', '', '2014-04-03 10:10:29', '2014-04-03 10:17:17'),
(35, 1, 'ticket.note.9', '', '2014-04-03 11:19:14', '2014-04-03 11:19:48'),
(47, 1, 'ticket.note.12', '', '2014-04-04 04:27:06', '2014-04-04 04:27:33'),
(32, 1, 'ticket.note.8', '', '2014-04-03 10:10:06', '2014-04-03 10:17:18'),
(37, 1, 'ticket.response.9', '', '2014-04-03 11:19:39', '2014-04-03 11:19:50'),
(41, 1, 'ticket.response.10', '', '2014-04-03 13:21:31', '2014-04-03 13:21:41'),
(49, 1, 'ticket.response.12', '', '2014-04-04 04:27:24', '2014-04-04 04:27:33');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 1, 2, 1, 'engineer.pankaj.kashyap@gmail.com', 'Support', 'pankajkumar@smartzonewebservices.com', '$2$JDEk2PIue9vmTRo9EJdJ5QhMh2U7AOzysRjaJPSpM+VA1Hs=', 0, 'pop.gmail.com', 'POP', 'NONE', 465, 5, 30, NULL, 0, 0, NULL, NULL, 1, 'smartzonewebservices.com', 26, 1, 0, 0, '', '2014-04-02 04:19:41', '2014-04-03 07:38:44'),
(2, 0, 2, 1, 'alerts@gmail.com', 'osTicket Alerts', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(3, 0, 2, 1, 'noreply@gmail.com', '', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(4, 0, 1, 2, 'teamleader.smartzone@gmail.com', 'adasdasdasdasd', 'kushal.smartzone@gmail.com', '$2$JDEkUcSqUQlIckEQq8vhTneK0i2ADGAcoRMaXWip8Oi0Nz8=', 0, '', 'POP', 'NONE', 0, 0, 0, NULL, 0, 0, NULL, NULL, 0, 'smtp.gmail.com', 465, 1, 1, 0, '', '2014-04-03 04:07:49', '2014-04-03 04:07:49'),
(5, 0, 2, 1, 'pankaj.kumar.dimple@gmail.com', 'pankaj kashyap', 'pankajkumar@smartzonewebservices.com', '$2$JDEkHcBV1L83LGjuyi70jHgiI0ywzlqi+mQ3rpJ3p8Ihl+U=', 0, '', 'POP', 'NONE', 0, 0, 0, NULL, 0, 0, NULL, NULL, 1, 'smartzonewebservices.com', 26, 1, 0, 1, '', '2014-04-03 08:25:38', '2014-04-03 08:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template`
--

DROP TABLE IF EXISTS `ost_email_template`;
CREATE TABLE IF NOT EXISTS `ost_email_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(11) unsigned NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `ost_email_template`
--

INSERT INTO `ost_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href="%{recipient.ticket_link}">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Subject: <strong>%{ticket.subject}</strong><br /> Submitted: <strong>%{ticket.create_date}</strong> <br /> <br /> %{message} <br /> <br /> A representative will follow-up with you as soon as possible. You can <a href="%{recipient.ticket_link}">view this ticket''s progress online</a>. <br /> <br /> <div style="color: rgb(127, 127, 127)"> Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style="color: rgb(127, 127, 127); font-size: small"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href="%{recipient.ticket_link}"><span style="color: rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href="%{recipient.ticket_link}">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style="color: rgb(127, 127, 127)">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style="color: rgb(127, 127, 127); font-size: small"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or informatione, please reply to this email or <a href="%{recipient.ticket_link}"><span style="color: rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href="%{recipient.ticket_link}">#%{ticket.number}</a> has been noted <br /> <br /> <div style="color: rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style="color: rgb(127, 127, 127); font-size: small; text-align: center"><em>You can view the support request progress <a href="%{recipient.ticket_link}">online here</a></em> </div>', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href="%{recipient.ticket_link}">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href="%{recipient.ticket_link}">view this ticket''s progress online</a>. <br /> <br /> <div style="color: rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style="color: rgb(127, 127, 127); font-size: small"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href="%{recipient.ticket_link}"><span style="color: rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href="%{url}/tickets.php?e=%{ticket.email}">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name},</strong></h3> %{response} <br /> <br /> <div style="color: rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style="color: rgb(127, 127, 127); font-size: small; text-align: center"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href="%{recipient.ticket_link}" style="color: rgb(84, 141, 212)">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div> <em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style="color: rgb(127, 127, 127); font-size: small; text-align: center"> <em>You''re getting this email because you are a collaborator on ticket <a href="%{recipient.ticket_link}" style="color: rgb(84, 141, 212)">#%{ticket.number}</a>. To participate, simply reply to this email or <a href="%{recipient.ticket_link}" style="color: rgb(84, 141, 212)">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table> <tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Department</strong>: </td> <td> %{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href="%{ticket.staff_link}">login</a> to the support ticket system</div> <em style="font-size: small">Your friendly Customer Support System</em> <br /> <a href="http://osticket.com/"><img width="126" height="19" style="width: 126px" alt="Powered By osTicket" src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" /></a>', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href="%{ticket.staff_link}">#%{ticket.number}</a> <br /> <br /> <table> <tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Department</strong>: </td> <td> %{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href="%{ticket.staff_link}"><span style="color: rgb(84, 141, 212)">login</span></a> to the support ticket system</div> <em style="color: rgb(127,127,127); font-size: small">Your friendly Customer Support System</em><br /> <img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width: 126px" />', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(10, 1, 'note.alert', 'New Internal Note Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An internal note has been appended to ticket <a href="%{ticket.staff_link}">#%{ticket.number}</a> <br /> <br /> <table> <tbody> <tr> <td> <strong>From</strong>: </td> <td> %{note.poster} </td> </tr> <tr> <td> <strong>Title</strong>: </td> <td> %{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href="%{ticket.staff_link}">login</a> to the support ticket system <br /> <br /> <em style="font-size: small">Your friendly Customer Support System</em> <br /> <img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width: 126px" />', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href="%{ticket.staff_link}">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table> <tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Subject</strong>: </td> <td> %{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href="%{ticket.staff_link}"><span style="color: rgb(84, 141, 212)">login</span></a> to the support ticket system</div> <em style="font-size: small">Your friendly Customer Support System</em> <br /> <img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width: 126px" />', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href="%{ticket.staff_link}">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote><div> %{comments} </div></blockquote> <hr /> <div>To view or respond to the ticket, please <a href="%{ticket.staff_link}">login</a> to the support ticket system. </div> <em style="font-size: small">Your friendly Customer Support System</em> <br /> <a href="http://osticket.com/"><img width="126" height="19" alt="Powered By osTicket" style="width: 126px" src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" /></a>', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href="%{ticket.staff_link}">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href="%{ticket.staff_link}"><span style="color: rgb(84, 141, 212)">login</span></a> to the support ticket system. You''re receiving this notice because the ticket is assigned directly to you or to a team or department of which you''re a member.</div> <em style="font-size: small">Your friendly <span style="font-size: smaller">(although with limited patience)</span> Customer Support System</em><br /> <img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" height="19" alt="Powered by osTicket" width="126" style="width: 126px" />', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(14, 1, 'staff.pwreset', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> A password reset request has been submitted on your behalf for the helpdesk at %{url}. <br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address. <br /> <br /> Follow the link below to login to the help desk and change your password. <br /> <br /> <a href="%{reset_link}">%{reset_link}</a> <br /> <br /> <em style="font-size: small">Your friendly Customer Support System</em> <br /> <img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width: 126px" />', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(15, 1, 'user.accesslink', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}. <br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}. <br /> <br /> <a href="%{recipient.ticket_link}">%{recipient.ticket_link}</a> <br /> <br />If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address. <br /> <br /> --<br /> %{company.name}', NULL, '2014-04-02 04:19:41', '2014-04-02 04:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template_group`
--

DROP TABLE IF EXISTS `ost_email_template_group`;
CREATE TABLE IF NOT EXISTS `ost_email_template_group` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_email_template_group`
--

INSERT INTO `ost_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2014-04-02 04:19:40', '2014-04-02 10:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq`
--

DROP TABLE IF EXISTS `ost_faq`;
CREATE TABLE IF NOT EXISTS `ost_faq` (
  `faq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`faq_id`),
  UNIQUE KEY `question` (`question`),
  KEY `category_id` (`category_id`),
  KEY `ispublished` (`ispublished`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_category`
--

DROP TABLE IF EXISTS `ost_faq_category`;
CREATE TABLE IF NOT EXISTS `ost_faq_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_topic`
--

DROP TABLE IF EXISTS `ost_faq_topic`;
CREATE TABLE IF NOT EXISTS `ost_faq_topic` (
  `faq_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`faq_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_file`
--

DROP TABLE IF EXISTS `ost_file`;
CREATE TABLE IF NOT EXISTS `ost_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ft` (`ft`),
  KEY `key` (`key`),
  KEY `signature` (`signature`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ost_file`
--

INSERT INTO `ost_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 5128, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'h6zc6UtnLiOrQZq9HwTtUacr_1w3kYqn', 'powered-by-osticket.png', NULL, '2014-04-02 04:19:40'),
(2, 'T', 'D', 'image/png', 6879, '6fe1efdea357534d238b86e7860a7c5a', 'fiak1C25LaMYZhVXc2weGfgAaiVKnzAJ', 'kangaroo.png', NULL, '2014-04-02 04:19:40'),
(3, 'T', 'D', 'text/plain', 24, '5Wok0MWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_file_chunk`
--

DROP TABLE IF EXISTS `ost_file_chunk`;
CREATE TABLE IF NOT EXISTS `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL,
  PRIMARY KEY (`file_id`,`chunk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000ef000000240806000000615f6dce0000000473424954080808087c086488000000097048597300000761000007610195c3b8b60000001974455874536f667477617265007777772e696e6b73636170652e6f72679bee3c1a0000138549444154789ced9c797c55d5b5c7bfebdc2103490081101226994411eb6cb5ceb64a1dab169fad5ac7d2a2a5b5f65987f63daca57dbe0e6a9d8b4a9d780f41a9437d28d6f129088a8a13f310424820049290e4dee49e73d6fb63ef4b4e2e371301e5c1fd7d3ef7f3397bed699d7bceda6bdafb88aa9241063b0377c60927fb1ab9d909e987e1e3fffd4ef7e52b476a76f1ddf1faeab3f2272cdbfc55f3b7b7c3f9aa19c8e0ff2fb4a9617064e8c567848abefd8bc46b3fdfa45945af45864f383a27bfffb35f356ffb0232c29bc14ec3f1eaaa345e89f4d83f8aef4a78c8f77208f7400a0e3c2e31e39bd77dd5fcededc8086f063b8d50c3d677a95dba024072072339c500383dc784b561edddcdd34f1afb9532b8972323bcfb1afe714e49e2f1438e70a70e3c253eb56470b7c69a545de76d5b3a47eb57f93859dbc992dd1f71c261c7dff60efff58d21dd653983f4904cc06a2fc75d8372dc7e25ffaa8e73be935b522c7923fbe344407df05dd5e6cd8d7ec3ba75d25cb3cc4f247e15bdf2c32f3a3df683437a37e7e64fc78b8d0b0d3853428527b6d47931d48be396cd5e1bafd97c54fe840f3201ac5d8c8cf0eea5a87fa8a8303b7fe854c91d7ca253745a6f89eed77e072f86bfe5c366bf7e55a993d37faa73d6a03b61b29fb6ed0385796ecfe137837385d3efb812a7f7a1e044d38fab1e5ef98bebfcfa95e5f8eef448cdda2799545dd7cddbcb808cf0ee851071a71d7483e6164d0a0fface10c92eea5a77f5f0ab17e2d77d518fef2d10751f76635b6bc2fee670c2d54227b7f0c250dec8314ee1894325bb7f17c6f5d1d806fc6d2bd679752ba7472f9e7b6bd718cb201519e1dd8bd03cb568ac9337ec8fa192b38f95bc9105dd1ed04fa00da568531592d54fc92e6c924841767786d4a66abc8d6f3c133effe9f1dde66f1740447e0c1c093ca7aaffd889feb70187dae263aafadc2e64af5d84bfac8932d88d985a929b88144c71069c3e2e3ce0ac03915d1487742248fe08247f048000dd125cdc46dcb54fad49c497fd6c57bf78227210706717bafc02f3fe3f68cbe345a450559bba38f571c0b7ecf5bb5decdb2decd3c22b2207abea67edd41f042c5755f74b64ab4b68fa6bc9394eee805f87875d3146b2fbf7d8a1819f00bf09c279bb9f19f5f037bd55ebd7af5a067e15beefe2c5b2d46b8a8838f53e9e7aaa3fc9bdaa6ac36e98bd37704617da4f0156021e1002aa80e6ddc057b721221700e702efaaeac3497a5844aeb7d70ad402eb807754758fbc915d051109018f614ca6b6f0107021e6c1ee51883d34a8249295fb50b8e48c034303c60d378a7147f85b1621f9c391dd2cbc7efd4adf5b377385c6aa6f8e4e58f7a5998e41168054ad9915b84ead5355ad1491d1c0d7803774cff5216f03c66252bb2dc20bdc883121007a01e701f78ac875aafae697cb63061d629684dcd8d8c9e182a15784f6bf74a044f74b2fb5167ecd62c27dbfdeb539fc268279db8ee055bd5dab9bde991bc9495cca65ebbabce88b480418058c061a80c5aa5ad146db28c6c71c88d19aa5c017aa3a9f80592f2225c0fa40d711aaba3e65ac2c8c0c7c0ef403b6a4992fcbf2350aa3dc56a9eaaa4ede57181811206d54d5ad81fabec021403ef0851ddb4f19e3188ce002f4149103ecb51b06ea5475464a87d1c04b22324655e39d613483dd8fa6a74f3a5d9a0f7f245c744ab1d3e7985047ed3556015db4f8b5792b7ef5024203c675a2b147a274c63aea57dd11b9fcd3073beed01a2222c04f80ff008226bf2722b381eb54b52ad0fe0ae0f7c08094a16a45641630a18bda730cb0c85efb18f339395704b815f8151049e1fb33e0f4b61698c0bd4d032eb3a465c0f1b6ae0878143833a5db5a1199a8aa2fdbfe3f057e1ba83fd7fe00cad2fabcaaba5444bec048fcfb01868a806f0085c027c0bce49f252227636cf244a07d21d05f553f4db9b1d354f5b5407990bdb15c8cc9be2ca5fdb1aa3a5f440e064e00aa557566a0feeb98d57823f0baaad6a6de935db18ec5acd6ef61fc9dcec0139121b66f3ef0b1aabe6fc71c0244547587b144648ce5b3b293f3b48d572e1be0d694cf0e87f73bc2197a7944c2f91df7711b70574fc3e97374a7a7d1442deef2fb08959cb3635d7c13925dd84248d4facdcb1f58e525aa2ecdb9ba6c61a727698d8781abd3d043c078e02811394c556b44e4348c30a4b3347a0205bbd8ec7d91b67de8acf604d7e24fb408ee06e00c55dd2c22fd80c518194a2281592086027344641c300fb8bbbd09da0b4bc680ed997711f93ef00c5084312f2e06fe2122bd6d931f60043b886b81bf0609223200b82550be04f81bc67ca905fe2c229352c6f9bd0de95f0b6cc298568848b6884c07be87f9838a80b936d0149cf336e02e5b54e0d7c0e598d5b6239c8359eda3402370a3884cb52b6304f8731bfd1ec23c949dc7ac8bf2bce72f99e6c5122b43032ffc7a68e8f73b27b87e1389950f811326d4ffd44e4da5893adce5f7a2cd5b700a46b71e6ecb22901645afdb966f4d7cfa9b5a3fb661e2ce0aae881c075c1520fd093809f35c92da7628f09ff67a1c2d82fb32d017230049a1fecbcef0d1066fe369115c05fe009c085c044ca56da1f26dff9b801b2cad0623b8a5b63c8516c17d0b63361762dec924eec3f8e8a700b302f4b996760a70515acd2b223d305af7135b1e0c5c0f9ca4aa31dbec6911f911703b300998636ff8cdc050a702eb456490aa9659da69c0ab76dca1c004e05455f52cedefc07c11792170c3a3811255bd3685d5eb81f9aa7a5f80f78518413dc3968f028e06ce0ef8134f89c8543ab7b7fb9baa7a49a03c5d449e04ce55d5e74524cfa618360578180354a86af5f65e0f14e6354573663b392523249c1d43b21a88e46d9568ef2a89f6daec7b6e337ecc2311f7255edec76fae3adcc9291eedf41d97dfd98d161adf845ff309fe96f7d1a6cd440ebcb195d0b505bff673bcd21968a216277f24845a32427edd12b4b91a67bf234cb9e2a5555ec5dc9ea8cec8fe51e56b6d8dd9094ca44518df52d51bedf5db22928359fc002e11911b80a0fb76287088aabe01bc6e7fbb12c1f7ec0955bd29509e95da38801aab8ceeb0e538704e32a361fde7a0a5312569958ac8ef811f0183307ef260557d53448266d0c6601c6abbf0dae86b7fcc1f733d305955b7d9ea1f02f7070437894780a5d63f7815f82556ab8ac82118d3743e70012d2be369c03df6fa3ae09ea4e002a8aa27224f03dfa6e501e607fa04710d2690b01daaba48448a442457551b812b81bb530301189fe3f03463a6e26f69687763fca1e78127804b699d63bc12a30d5a70eda67a6f6abfcb1d3ffe7468e0c5df90ec2207af09f59bc06f262461c4899a6d864e848e450e40d1863223b0358bd1f8464b17c283c7d3a1d07b8d24d63cb14eeb96f656424d2291a8dfb02694f8f8a67a75a25b714261a760ccb0f0e0f10e7eb32656dcff85d6973e15ed5df147c6b73cb39d443090f35e4a5db0dc033808a31c6ec198d445c0eb22f20170bbaabed84d5e52312c70dd95b3c983310160301afb62557d27503f145a3dda0922724d1b638da603d72e0c0c129197312abf1258015ca9aae581762380d9a99dada0ad00f657d5e522d2282245d6cfbb0873e31f00336811de43808fedf50140a3f5035219af0994ab83810b006bae87317f402a6b0ee6017c060cc7441353b1260d2d1dcad2d09603fbdbeb678057b0c26b238c276316b256c89d5055d138addfc5ac9df1b8d363c8e14ed169bd25d2b3dd68f176f809fcc6f298d6afaad086d50d1adf5ca4892dfdf05da315c326de23597d090fbd04c91bdef658eae3572fdce056ccfd541355f765f5da3887f503a3891c776ca44fe522d60f8c260ae44ae931f8f6f0a00b1d8d6fac7197df53ea797537644fa8dc555a2e78dae8a394bacf009716e5d25755e7d817fd2e4c56044c9aef051159009cdf093fb443d8e7373040ea4a4efad600cf02a4ee721b9a526e6f9759ef76eac04e54a6aa1d8516b3816d6dd46dc3040cc0f822a763b4d1199855b159445444fadb76cb0281855e4005ad0515e0358c802491aaf1937d6bd3f405f81d2d7f7a6fdb2e1ddf9d41431a5a1c1b1d55d506115962032b1f6122882fa7d1f400d80d0adf6a9cd6af385cfdde35440b0e71c23dfb9233208f506ec441f15505751dbc46072fbe59dd6d159aa82da5a97a81f894aa139e24e1ac4b42fd4fc5e97b3cdab01677cde3840a4f26547276db8704fc26bccdf3e27ecde7ef4bacf426f1dc182aa727b6165daf3ddc3cf5f4fb8c57cf9d36e216e97fca77c245a7f7f1abdf5feaad9bb9d1c5bd34e79acaf5e907de293406ae538f0d16d37a03510580aa3e26222f003761ccee6400e01860262698d92da8aa2b22315aa2df9d08326c4718f3be24fb3e20220b5435f92e0753510960324643a743ea829676b2ce603146d3a453e3fb03c9bcd71ce0a722f22126f796ccf9cd06cec6ac4673037dd761727af33bc94710e5403435cd95066598d4c28a147a6abaa12df463c7d5b798d61a399912f8086342df4207b0427c7bb2dc38b5df80b0867b7bbec6bd2c2f9eebe43572c59aed0b53d3c3c3473979074c70b2fbfc4c7a8e3dc0293820e4d72dc1af7819a2bd881c3c1989a47fcfb4b12ce66efadfb5125b5fa67ee2df223ff87821770dca69cef56e46b851459e8b66fbe7c59bb28f71679cfa7068d44f8f94ecc20277ed53effa5b16bd14ed55fe8748f7cde454acc0584560842f88d4f2f667a7aa5b809bac8f7807f0635b75bc88f4691567d87994624c7580a3681dc7690f8b3101ce7b31fb25f2809922728cdd76195448116081aa7664c90485bb9595d659e19d8f892ebf1a248ac848cc4e952d988b8f45647fe09bb476ec6763cc9d06e0df02f437ecb85d165eabd13789c811aabaa89da60b3091ca54e13d314ddb743801f35082f80e81076ad3585344643f4ccaa25349fc207227545560350c00b30e8e7a8f1f7416597dff859c410744465c3edac93fa04063e5f85b3fc6abfd1ce97920a1c1df65c7ec89a2f5ab1bdcaa79a51a2f2f95f8d66723b1da59ad8ee2fdbc2c1685c9f1478ba739befea93926f5e1bc920de1e157f6f1b7ad8ebb6bfef6aa5fbf6952d6c4f265ec1eccc43c17805393cfd1064b7f1c68f7a6b56ecec104013f0050d55a11f96d4adb56f9d86e60212dc2fb0b1179d5bedb0e7018c6adfc499a7ed355b5cc9af7476314c4d7302ed57596e785b62e39f6bce05e0a1119068c55d5e72d29e82e9e202239aa1a1391fe022c51d5033bba1b11f90b26d13cd59a16c38027815b55f5ad40bb473066d0d9c14dded6dc4155cf0dd01ccc82300b78349923b6c1aef2e42a2a224b55b575fec2d00fc304b526aaea879696051ca1aaf36c391f780798a4aa6f5bdaa118d3ab50554f6be79e5f01aa81bfa8ea024b3b1e13b03a5955eb036d6fc404c0e6a8ea131dfd9feda1f9e1e2f39d9e07df11ea77e210c91f99a54d55f85b16a18d6548de709c3e47239154774ad16dabb6b955ef964a6c4399db54fdf76c97679858ba35ed2429687ab0681821e73c3bd492acca8ab94c4e6ffaef0ad820e7425a4ee48059bcfad222841e7098aa7e2a228f61d24815c052602bc6e74d7e0d6485aa6e0f5eca8e3bac06a5d9617538814d1aaa1ab2f4a1768ee036b3cd181f368a793707dab673693998f04b55fda3a59f8e7123932beb7755f559fbeebd4f8be2ac003ec4b8a6833001d8ff51d5b3ec3867022f05f8a8b7bfa2b0fd033b831b30bb61668a482fcc8a3051553f49693713385e773c9df134269abd1daaea8bc8b731bb585eb1b9531713b09812689a964755fd48442e057e631f968bf18f9fc324b951d56df68ffc9d88fcdad62fc784ec3bfa48dacb985327b78bc8ad400ec6d41f17145c8be9985c5dba4d075d82a0a784875ddd0f71b2dce5f742b417a1bec721c5a91b72147fdbaa1abffabdd51aab58a9f1cad9d1e6f84b5cbba9beab274eb22656aea62517bedba1aa0911390f13f03bca9283aecc26e087a91b7c6c9b5497670b26d7bfab785b6bdfabbf02c9af18f40d34e970d7a1aace15917b809f59d22322b2c86af00b80fb31c23a00382ba57b707fc01c8c657aac2de7d95fe63cefae82889c015ca8aa13ba3b96fbd89867c2636fbb103f81b7f1b594ad8a8ad6afd9ec6df9608536962df11bcb9fc9d2f5ff6482766f43c857046b7d9d8931a18b31b18ccf8067557573a05d1fdbee488c128862e20e9f00ff6dd382c171f369d9b30f70a7aad6a5b41980c9ad82d1bcb7a7d41701df050e044a30daf753e07155adb16d2ea3c5779f9bb4f86c5d162675945c4b3f54d5176c5d0f3bf641c0488c36ad04de065ed1d63b15a396cf233056c962607146787711ac5b30d9469c771a8dd3fa15470b8e9e11deff8a13b4792b5abf0a67bf96834fdeeac7eab46ef105e1abcb5f87ccc3db9791f97a643760cd7cacf9a7dd155c8070227482d3fbc821001adb8064f56d55ef7b0dd5e1abd7bf9611dc0c32c2db3d9c25226f62cc9fab3a68db2948b4f7994ec1a8c100ba6de50ec22b48670f5464b097639ffe924677a1e69b475dfeee517b909c01c3cd260bc5af5f45287c5e604217fc786a0027837d1419cdbb0721fe68f110e93966208057f50ea4ec8bf06b97b8346d9e9bb67306fb1c32c2bb07219c557461a8cf9143b4b11cbf626e0339254b82f55af3f196b0d6cc6bab7f06fb1632c2bb0741c3bd8e70d7bfb0c92d7dfa11dcfae3c37d0e6f399be7c5d0e6ba795c55d5d93dd919ece5c808ef1e046928fd241cff6074e4d2f93f949ca273246f943db9a4b8aba755ba0d4b6f687f840cf6256402567b10c257af4a7e3502c92e3e26f9fd65aff29fcdea354cc9bea6b2b3c71833d8079011de3d104d0f0f1c15193c7e9436d7e06f78719d36d73c13b9e4fdfbbf6abe32d8b39011de3d127aaeb7f12d8f8a579e74ddba5b73ae59bf2bcfd166b097e0ff006c1dfeeb6591b8ff0000000049454e44ae426082),
(2, 0, 0x89504e470d0a1a0a0000000d49484452000000a10000005b08060000001b58e5c900001aa6494441547801ed5d09bc54f5753e779987208b2cb20808ca2a0ab821a020a042834b896669d326a9266d4cd3c6ec8d59dca2698cd1b431a451639b2636ad356a354963054504414116954516d9917d95fdddaddf77ee7b30336fde9b993777e6cdccbbffdf0fde2c77ee72eeb9e77fce77cef9fe468021f18825d08212305bf0d8f1a16309a80462256ca58a1038c7b25e797078a7f8bbdfcdba5da11bd885ee20fe7d6549c0dfbd42dc258f4bb06f9dc8e9678a35f87ab107fc8948a25dca85f85be68bb3e43191e307a4e6da9f8bd1a157caf751be31629f304a7196ffbe9c377e2c62b511b3eb60f1de7d56fced4ba060bdc5bef46fc51a3059c43dae4aeaaef99dd45cf58fe26f7e4dfc0fb648cde41f8918c59938634b58fe7a13ed191edb2f469781629d3b59acfe5749706083781b5e1667cedde2ad7a56c43b21fed6372431e5c7629e75a9185d0789f7fc2de2bdf7825883ae8bf65ceaf6162b6151c45ac63b350c090e6d17093c11df11e38cfe625f72abd0fff3def9b59eb835f253620dfc90be36da74127be4cde22e7c58ccde9789d1eeccc82fae38f635f2d38c771895048cb65dc5dfb3120a0825e4f05d28a40fab3841a7699d9a2ffc6cf85dddff26aca6d86da188d3533e8fea4dac845149b242f663741e2002ab47df0f4e5e78d6848adb9c016574c53cf71a313af649b91a23d156aca1378ab7f2b7e26d9e9bf25d146f62258c428a15b40fa3fb05123847c5dfbb1a962f9174e65044042c169430d3b0fa4d44047dbab8f31f94007e65942356c228a55901fb3261e58c33fa0921989468178a69b4ef2946b7a119afc2e8d85bcc33a1c0bb96ab7f281126da6225cc28f22afed0b4c3a975cd1f2438b21b8a68e11f829523bb801bf610e3b4ce992f1ebf33ba0d51ebe9ad7c5adcd5cf67deae199fc64ad80ca155fa4fac0153c2408360b4058004f89f7f70b31850c2a606a11db59e5eadb8f37ea8186353dbe7fa5d0cd1e42aa9a4ede8530587b689c07a04c7f64980ac82d41ec6167eb895dd0e16a523fe751169d72d9ce6f0b75c8651d341eccbfe5e9c97bea1e7665f8468f8e82e6100d2d4304eefae96d03affcfc4db324f9c976f97c4758f88d9f9dca67e96f5bb3863925544081a91670d006bf8efbf29feceb724f860ab08a627b14f1303d085d49c8ed7487b31a300ec4d9c23129c38142a2614961088416584bf45ac8dbe15fdb2961d819c78ee6609004c5bc33f01d86695989dfa4be29afb1b3d2d7fff7a09f6bf87e0658a5ac1da3f7e418cb65d2431757a418a182b61a322873ec109f7d6be20fea6d950c423629e71ae987da0443d2f068cd13bf49fd272ae277707c73da0753cbe5f7c58cd60e7dbe2ef784b6fb6603a63daccc4b4487cce687fd6c99f95e2051f2277d1bfe8b5898b878469bc9e178935f2d3629d7375cea7e06f5f2cceccafe3e1b3a0bc0f88d9ebe29c7f9bbc61ac84c9d2e06b288fb7e535640ffe03966fa1189dfa8935e406e067936129ce4edf3aeff7c1d13d88309789b76ea6785be78b81cc8579f60458a3bf80851c96f7fef2f9011f246fd573c80dc3173cb855d377c405ad41d78ac9a898414a9e23802fe9ccbd170fd8db625ffc37620dfb381ece4e79ed2556c224713199ef2e7e04f0c5eb62f4182ef6057f29e6395765f595927691d74b2aa4bf6196b8c8d90698eaac7e576a0acde83228affd64db38708f890fa577dffaa504c00769c9cda1d3d4ea713a2d78c005f1563daffb57c0bbcf58e49d91e2ebd41756be175c91ae38441d309ee160b11242283eca9abca5bf4092feffd4225870d4adfe13e1f72583b919a417d5471e6e22acaffbf6afa0246b1442b1877fb2e0f229064fdefa19a896792e0c3cfa8e137bd84754095381ea682e2438f181f83cdeda3faaeba17b85bfcc7c33fd60b3cf1831fb5e0e4b89ec4cd268d54a181cdb8b1bff6bf196ff27e0899eb0429f433913e00bf8482d3290cff536be027fed110910adda83ae1773e054dcc0f3c240288793a2bf47dfd38385a51f2ac0fd784d9c72d3d37139ecaed99bf80737498099c5dbb648e4c046f8c5ef8bb0820701993deedb624121eb47eb5442f8611ec05ae7cde988648f897de167c406eca0516ebd645af22fa64ff5dd963fa950100b4acd9e17c24a43190928d7b40ffd374c83b43ec1919d28527d2f4cc511806ed311d3e128553eb3fb7044ee2df450d5cb104512c1f183c8571f1577c14f34fd9798784ffdb7f08b5b59a353002882859d0c3aacc137a098f3f35ad4795222e5f4020f88bf63a9788cce77ad407129a021c52391e76510419808d81efd3a06505438b3f72844f1e7e0f3d44ae972b82cc256b5bffda898a8e64e5cf6c593a784ab681d834fa2079fcb7de75762741e2835045993a684b29402148c3e14ffb1f42a38016b42a01c108f414cb25e09013e8b55539697907c52de8aff466666a3d8b0d2c9a3552821cb8fdcf93fd2c24dfbd22f089dfe169fa292ef422eaf4d4b2d9ed0eae5b27d996de3efdf20eed27f852f38562c6092c9a3aa9590097a0565df7d1ad6649c24263f0490385af8235998f1ebcc12203ee9ceb91718ac2ff6d86f34300055ab84deba17c541ed1b9d617bc25d620fb911d357fe606c66b1c69fe62a01b60d38afde8dd6d16530020fc26f3dbfc14fab4e0983c33bc44104e6a35bcc440aca1efbf548321d0d24d71a3e40f5b5bf63090222c22b28d4601e1cfea802cf740f086531f2e65ffaa4f4515116a62d03f45d11b57befcd10a34d07a9b9fe314d0d66125b5545c704499dd71f14c3ad156bec57c51efa6108050e7c33070b3f59456c0dbeae997ba8d09f01522184a519166472049090663f985da9c750d19527b5503407f9712a5ced11cc3ac73480e28ca33012e024abdf04b147c007076cd4d8a80a4bc8cc4068fd7e0feb778dd8977f0dd6aff02a150f389d205fdc9a943000b0ecbc867ee3adaf8b89927e7bf49760c14642a9a04429ed005029f878826c0f2b8702560f79689a62399b46ee895011691db38cec5b64d9414b7fedadf93dacdf4362e0e9b527dd0beb07dfaf00eb577f3db4801e320e769f5438a1fefb6afceb6d9c2dee2b7728f65833f56750c22b9bbe4cca5981f0360545ec15ab844c4f390bfe597c4cc1ac70b131fd4661fdeaa5ee6f7b137ed0de929759d51fbfb47f03e0a74fa05afa01146e8c4059d60fc5ecd8b764a750794ac894dbeadf894b3a0b240e6c5055d843a6850e7164620b5075f2a246d306b30f251fb8301d254004e1cf7126f1a0842c59b3c7dfd1a0c0a0d8975f514ae8233f4ae5f391e4b7064c156bcc5760fda27f625956e56d9a83745e1f31518a54d2e19e108f29c5b3912569467d5f3ee74a1cd599f52df15164605f713b72e83747e2cae4730edcb6329490243d0812083c33dc4f5cf32082856b71fac5b1142e9abc59ebc75a42e6664b399c258f6a454fd115100f74ed8caf6236f1a4e6865f68c14329af33f95865af84f4cd9c37fe096549cb50b5fb11b147a1afa15df7e46b88f4356b0b7d14681a89d3b41f24d29d67d999bbe22994953d293537fd26cb96857ded21f275677d47cc1e1762fafd4e5dd16961fb2ce4d765ab84845ddcc58fa120f319a0ecc32471c3e32838185dc8b566ff2dac82fbe64fb5834e3af6c294383efb6f22dac25bfbbf9ada327a5d945f80a5a0f0ee9c1ba75cf60cc3a5b1477c1a1544b7e2ec8b339be42396b253c20053afd6d261eaa580ec2bbe895abf8f9d0249f3b9ba3cb7f5563e83cae097715843fb3eb4c531cf7d3467738599e67c0f60ef71283e60915c212660730e4af6ad812858cd7660e079eea29f69116f62fc77c53aefa66cbf28d9f765a5843e8201169a6abfc5900fa371e6afb52fb614d220279ff3c64338142253a0fbf6f91f2fc56185fea7fbda0fc2749816a35e9af3719d050fab4f67763ea7c9df04471180e0183e3a076d1493969302f2c4cb4209fded4bb503ccdfb61000e904494cfc5ed8fdd5a468a3fb920a58fbd237918642ea09757b16e873cd331b26daa33b22f684a9dfa1bb8152fe30cb0003089e18ed7acbe140c4f558a4d1e6c6279adcda4731acf3ea5d5a6acf96ce523d5c4d9e54da97504260627bd7ea14c486146de6667a26d729216d87b9bed50e303493936e8cfdabec594d5cf7a85860072dd940da89533ff3cd823279ce694687b3b4d7a498e7c0927cb25b79ab9ec101710b08c5602ad6225b34d4671bdeba19fa7b3eac4d5177786be06782ae2338ba13e947f476800cb31c072520019a525c94dbf035a7225e18c91279438cf6784d8e12906cab92b26c9c5d68f9964521e11d1cddab4c06deb6c5c0fa666ba5b0d97b0c88b991224a2b742ca6b082da434a89ab9ccda0b3e083184222a87743aed42862b6c047379d83daba603b1a80b41abace9bc36bab77f6c08b6da9ceac6fa301ea430097ff34a39802c8da5df473f140904efa5fde5732afb2fdb21c874ec7e42f0e0e6e11973958bd01b08e7b5688607a64823a208d054b74a87c68d753656445455bbc66621b8a69208718f07bca140de4064057e56c214f0b385bd87d25f04d02e478c985c24e7f13ce71a13c26390b95bdb76454201138389a99a8d704bc26e59103c5cdb246ded2e88dcdf9384d6ce881c9ca25dc4406acfa6a146e4ff992260485024d0d2d2e9809fe18dca30402362d9b4afb01a9801d0439fea6571131f7c7c38d06a99e9720b57975da96e5f336a594cb99871278141fd2793571010245626d181587d38596eba0d146e92d481f417880eb6180e1938aa73755ad0a6e6a40a535a170a7a314a803406674e58350873da754d8949b50247990a8887c7a1eb0467ff31c043c1b711d385fb5e438c7f089d1a0c01c3c4d1293ee8141c4b9453c5431c0f9ec23dda8037209079f587d6a553e067a5e0c4ec7b490fc07391926fff2b384ba0e0c326a08578146247df85b178833fb0e5c9f2d09b4552a2d4719363ca59f778a12aab33ce73edcb0b9616f283306953294fbe590aecf41f2220fd3163bd5842d902c33624991ba10bce97583a5480810aca13785a06d0efe58fd4f73f9cb19848ac736c7e0f0f6701661bb26143d7cb0f120b348942550fc8b07443fe779c1273778ce6c62f2f11d1f76b84535531f6e98dd4030c5c67967e14fc4ea7b85245049de94af98cbb997729b5425e4912100b6447a680a37b164807dd167c48c989622920b643b645dbfadf6dc92358bab0fa1f2856d913aedd3eac2af0dd9ea71a3d5ead41d9dd61dd6c6bef8736120127120e6ef7c07c0f774045d4bc5ec3f5169784d50f5ea8c8063812e4967192e56c31c2ecbe083e33877b279f1dcf040e8b9b34f06d42406acb73df90155b264f9716a775ebb5fc87c60810b26818c925afae48dcafc754325ac3b618d1ae73fa053b235eca3f095a685cdd7f40d4b39e89352a90e6dc574ba413144f22d0707d0e1cf9b460b41e73b4989e880b316ce02d6e8ef5d854cc47da7ac20dd06b64c025b63e9bf15b1b5274190fbd6bfa3d2e779a4c5468425666c406f64681b27be53e54cdb864c0ace0b5f542baeac57e8294e1e1aa4bcf25dc8e1805a3f424b95381a55425e8c062b58db8202d51b47a122a03080e599b030617417d165634ae174e463daa2650b001bf907c08787d58482a3fb601d3cf897088040a3c6055e9853266f8b46b53adda2a41cd81e8158abff240d9eb8bf13cf7e524980743ae69487a9d03aef46852ba29cb25456cb9e08fd3e3c04f6a8bf0b69d6323cb4541a6293c4458d2e83c3c8358d9f85341e4a6209b6fdc4d5a8ef4b06a4315bb94bff0ddcd13f0d159d3e7c81449511ddc566eda64925acdf23f3b8642ce093e76f5b0068e5107c8eee4a7263741d08010c14219c8335320cc518817bd132853e377643df0bff18e4a0ff831c301a2973bfe42841238d7f781b3ec3e7f48b40386982fac2201f609701228cf25066af850bbc016c625ffa7888ed61da32d9cb8a0c87d9e7f230e8c11103585082b4feaaff09cf454c6527b02ff97ca48509248ef496fd467c902991f785e5506418d000a35e80b0d4a10c818bbebf20a49c6bd7056ca95f82a24ec256a9b30b39a16be77e5f59ba1257de89eb26ab5538b49581d98ff533c542ef863dfacb7838e16756f0c8490953ae0f3da444e195f011d305993bb50b8bd31c4057569f68c9b741b8a64eb8b472f4733c44d8500e9539b7a5cfc688199083525740d1581f48084823c2a42996e7e0ef5e098803d5d41b67e90d37fb8d570e19f2ae244fc75a750d30d8475180fa568029ec119f0a69de72e87948b9de4c6f10ccf8db4023b7f2295dfb8d5c31f670d0c8613aa442100ff5f7ad51d781d6dadff32e6695cde143036b6ca21a28015740af3369ff6456e0ca49def2ff82af7a2b14fa16586ec8b16e709d39e7d57bc2e9773c4885d8ca5005237f254cbf685a2e4c97c1911dda992627e0683b58a84541526c4c45a2934d5a5d02e12450248b00ff311acd0689c0f229be07e62c6ffd4bea3b99e090b1c8564536f9a4c11a40aecfe682e0920ebf892a181bfeac8188d120e451e050e5daf0925676b3c096818675c19f874507da6b111ec0c3c3e9a2f520d83c2f7ce0f41af14032b818739b56b0243f34fc958f7e16072c110cac12a86e56ea8ffaf385bbe12e7e1400340214f8978c7e734defd5efa29cff16ae84c5b83a580492ff30ab427c8fafc948c5655139f51a50e693835537b8e9ec35f1c1f1c7610e4036611094144a126a817edcbcff10f878db813322f9efc18f23f669a1a38f644a9a5faeb7f6697be7ece0b36c0ad417ecbfe5039898741ff2d2534e6d091c965652574a42f50e57d9b447df96622115a0c6d4ccee370b9691f47504fbab6994871242e908537868b40e98d243444b4b6690d719d6cc028547ca7abb5452de3cb08f12d30c607dcdee23a078a0bda55f98275d6d831b4a0502c4e2c1eaf1e607c73fd00080be9e95e7fe5911a454242cd947c46eb4ed86c301a081c5d3a91ab012f9af35524f594d09b4c508089df9c862e17a12e3be05eb78458353ad860f5a460931c5d23af8ef2f42b0837fe070264ec6d27de690cdb3c729209b52cf47c58372724af631cd716a0cc9c7b1642aa75b46eb050c2a85065e4877f12ff13a7d084830c987008a52c8a042bb28bde2b51a748a15886eafd62dc1de8e24eba6182372bf4400ac0b3e01acf6b3ea3f1772fc72fe6de99490be1da3604475cc6b32c88027140625fd26c2c28c567f2725d24310434cd0e36f68f100cc321227ebbd2a6a2144e60cb0803bfa1aad22e2076f2132de5ac56df6bf0ac50448a175ea8373ac0bae22b88b4a5c8e7583bde54fe17800d6f1d069340d6889c70e0049f99be62af50679a5b9d688925c4670ec72de45c99490d685eb5e28de48871e7e95123a321b931cb132f2248734158f94b780709888e7da1904a04dae52d9881fd6a4a0697dc15343a5a36f1720a5a78be02042b7b8b608ac1d73ad29d6b7c91d36ff4b568fb3c32d40058f87755148a3ab1016ac2119fc7569099c4fb3aeb3f9a7d562bf2c9912b282d883935e8385570c02ab69f00b95cd5b3f0b967206ace4724c3f9d15f2b01064983d106034a7fd9153387c32566c3368d1b41e1498bdc4e448d145a471d38d964cf2e3a1532a0da6f1f830b2b8a2950d5c756906a33c83379ceba3250d4eb32e7b3bb0a687a0cecf6007d884bb5549d259de937ed6f8cbba299ce55aec1de671c9454d62467bdced62d1da91a726ed21687c8745fe860f978d7fad78944e0961918c0cdc74ccb3128631916ab3d001a6aceec9d3732e37074039537c5cabc363ad20527daccf6334695e769b46b646dbceb9ec29dea60524501225d4e256640cac611f6b70894ce05ba864498cfd5aded689e551ccb16ab083208355e0cc1beb5a19dd6075edc201ea06271c7f10b9044aa3849c1201cc9a6953b1a6f2d85b81b45aced323313c606e2ed8b8b83c97aed3814a18fbf27f083328cdf11d23176bbcc37c2450122564da4db8f42a972a4d1a5aa18d9414571ccf3658e8c002514eb774e41929dbe81e3358a3172b5e36f195f5f7a551424011ba2a1173c5c9032b6062cecc0988f5166255ca554fa3ace97e8d9a5b34a24dbe86f875c1124075417187f679ec5e0138646c8303b1e0402b6e7228450abc63c88af4510c2d56c006a2ace80f8aae84c4fcd820c52ae3f4a165f7a830311239d4c39d38acd37614d530e9e711bf6f5909145f09c125c8aadf4cb95d7fdf5a24f4019d24d5cc35268e805337fb665b2198db984caae5f3a22aa1963361ed60662652527375d20b304de7b4f224321f0228a7924bd8ab45618a711d455542566013cb23bf4cfad05226607bb9f04c075c4303100f5b09e2517d1228ae12a20c9f74229996f2226cc3722ea353ffac52d59e5d4239ec658947d549a0684a486606e6854df2ab24c0c290367cd4056a4f4a0e75803eda3bc37e941e697b89df5683048aa784e0b2611ba499522d1c8a8c1d635c3343fd41f0d9641b5cc19c7dc24a29926de3f8fb8a9340d194d043712633219916d4635997b04e10d5ca29fd2299c4a78d4ecb00f120b5178faa9440719410fe9b4ec56c4a226b57d2f051c1ccc597192d137cce5627e81f00eb028a518bce579d748ef1cbd24aa0284ac8cae84c53319be6495bab7c31c0fb349597e57ac954402c511becb36c1b7f5d9912288e128279551527294bc240c59d7d177a71314db3a814fd1546b7a14d4b0d75821e7a32d841470ec47854a7048aa3845c21928d4b75fdc1648275d05fe26d9d27d6182c010bf6786650b231876aca0f4de616d8c1e251bd1288bc8a4619b400a9709d0c5d29135c30ba16095848db4cb853fb3b48e6435f91d5cf4d0d77c59300a88768f34f53dbc5df55b604a257425450ebd48be0234050c1a93771f50f4e153020da65ef305b3c9b2a6465ab27cbf51393be9f31e557d9628fcf3e5902d12b21aba88fee424bb10b4e1552d6a6b2f173a58060ff3a31c77e25f93c525f4351dd85d391691982d6d089a9dfc5efaa4e02912b21b1bf9a69bf84f25d925158846ee82b729a6d6cb8ab9f438be63ce5668eab661a9352f57c1eb9129a3d46362e1d9d8a67229537ea64d092be3173ca5c7bc31af95721f177fa06f1fbaa934051a2e3c6a4c4353c74c9b046686d03e08bce8b5f563e9a04c82ce3d13a24505a25642a8f6caee059491f24ffa9fd0368cfc0509fc06aee5af69fbe51fcbe2a2510f974dca894407741662a73e0144cc5a7f8f508e3b86026f5963ca6c5af8ca449a0198fd623819229a1bf67353807f78b0d46fde0f8416549d0c675f60fa398811468da001f67465a8ff6d55d69e9941084442c627566df096ec13d50c2adcac9a70b2b62a140b36fc36ebc5677375ae905974609419cce527f52bc910cd2027668f4180e4686c100b3fbb652d1c7975d2f81d250c371e908d001eb5208111098d79f7cfcb73a24501a25ac0e59c5575124099414a229d235c4bbad7009c44a58e137b01a4e3f56c26ab88b157e0dff0f308d13cd5066a56a0000000049454e44ae426082),
(3, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter`
--

DROP TABLE IF EXISTS `ost_filter`;
CREATE TABLE IF NOT EXISTS `ost_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `execorder` int(10) unsigned NOT NULL DEFAULT '99',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `match_all_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reject_ticket` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_replyto_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disable_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canned_response_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(11) unsigned NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `email_id` (`email_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `match_all_rules`, `stop_onmatch`, `reject_ticket`, `use_replyto_email`, `disable_autoresponder`, `canned_response_id`, `email_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `form_id`, `target`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Email', 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_rule`
--

DROP TABLE IF EXISTS `ost_filter_rule`;
CREATE TABLE IF NOT EXISTS `ost_filter_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  KEY `filter_id` (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_filter_rule`
--

INSERT INTO `ost_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form`
--

DROP TABLE IF EXISTS `ost_form`;
CREATE TABLE IF NOT EXISTS `ost_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL DEFAULT 'G',
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ost_form`
--

INSERT INTO `ost_form` (`id`, `type`, `deletable`, `title`, `instructions`, `notes`, `created`, `updated`) VALUES
(1, 'U', 1, 'Contact Information', NULL, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(2, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(3, 'C', 1, 'Company Information', 'Details available in email templates', NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry`
--

DROP TABLE IF EXISTS `ost_form_entry`;
CREATE TABLE IF NOT EXISTS `ost_form_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) unsigned NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_lookup` (`object_type`,`object_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `ost_form_entry`
--

INSERT INTO `ost_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `created`, `updated`) VALUES
(1, 3, NULL, 'C', 1, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(2, 1, 1, 'U', 1, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(3, 2, 1, 'T', 1, '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(4, 1, 2, 'U', 1, '2014-04-02 04:35:24', '2014-04-02 04:35:24'),
(5, 2, 2, 'T', 1, '2014-04-02 04:35:24', '2014-04-02 04:35:24'),
(6, 2, 3, 'T', 1, '2014-04-02 05:08:56', '2014-04-02 05:08:56'),
(7, 1, 3, 'U', 1, '2014-04-02 05:13:00', '2014-04-02 05:13:00'),
(8, 2, 4, 'T', 1, '2014-04-02 05:13:00', '2014-04-02 05:13:00'),
(9, 1, 4, 'U', 1, '2014-04-02 06:48:20', '2014-04-02 06:48:20'),
(10, 2, 5, 'T', 1, '2014-04-02 06:48:20', '2014-04-02 06:48:20'),
(11, 1, 5, 'U', 1, '2014-04-02 06:53:32', '2014-04-02 06:53:32'),
(12, 2, 6, 'T', 1, '2014-04-02 06:53:32', '2014-04-02 06:53:32'),
(13, 1, 6, 'U', 1, '2014-04-02 07:08:19', '2014-04-02 07:08:19'),
(14, 2, 7, 'T', 1, '2014-04-02 07:08:19', '2014-04-02 07:08:19'),
(15, 1, 7, 'U', 1, '2014-04-03 04:09:20', '2014-04-03 04:09:20'),
(16, 2, 8, 'T', 1, '2014-04-03 04:09:20', '2014-04-03 04:09:20'),
(17, 1, 8, 'U', 1, '2014-04-03 05:18:51', '2014-04-03 05:18:51'),
(18, 2, 9, 'T', 1, '2014-04-03 05:18:51', '2014-04-03 05:18:51'),
(19, 2, 10, 'T', 1, '2014-04-03 07:19:58', '2014-04-03 07:19:58'),
(20, 2, 11, 'T', 1, '2014-04-03 07:32:08', '2014-04-03 07:32:08'),
(21, 2, 12, 'T', 1, '2014-04-03 22:25:48', '2014-04-03 22:25:48');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry_values`
--

DROP TABLE IF EXISTS `ost_form_entry_values`;
CREATE TABLE IF NOT EXISTS `ost_form_entry_values` (
  `entry_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_form_entry_values`
--

INSERT INTO `ost_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(1, 8, 'pankajkumar', NULL),
(1, 9, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(3, 5, 'osTicket Installed!', NULL),
(3, 7, 'Normal', 2),
(4, 3, '9914773793', NULL),
(4, 4, NULL, NULL),
(5, 5, 'Developer working', NULL),
(5, 7, 'Normal', 2),
(6, 5, 'Developer workings', NULL),
(6, 7, 'Normal', 2),
(7, 3, '12234567890', NULL),
(7, 4, NULL, NULL),
(8, 5, 'Test', NULL),
(8, 7, 'Normal', 2),
(9, 3, NULL, NULL),
(9, 4, NULL, NULL),
(10, 5, 'Developer working', NULL),
(10, 7, 'Normal', 2),
(11, 3, NULL, NULL),
(11, 4, NULL, NULL),
(12, 5, 'Testing', NULL),
(12, 7, 'Normal', 2),
(13, 3, NULL, NULL),
(13, 4, NULL, NULL),
(14, 5, 'Developer working', NULL),
(14, 7, 'Normal', 2),
(15, 3, NULL, NULL),
(15, 4, NULL, NULL),
(16, 5, 'asdasd', NULL),
(16, 7, 'Low', 1),
(17, 3, NULL, NULL),
(17, 4, NULL, NULL),
(18, 5, 'issue', NULL),
(18, 7, 'Normal', 2),
(19, 5, 'issuess', NULL),
(19, 7, 'Normal', 2),
(20, 5, 'issuess discuss', NULL),
(20, 7, 'Normal', 2),
(21, 5, 'Resolved', NULL),
(21, 7, 'Low', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_field`
--

DROP TABLE IF EXISTS `ost_form_field`;
CREATE TABLE IF NOT EXISTS `ost_form_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `edit_mask` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) unsigned NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ost_form_field`
--

INSERT INTO `ost_form_field` (`id`, `form_id`, `type`, `label`, `required`, `private`, `edit_mask`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 'text', 'Email Address', 1, 0, 15, 'email', '{"size":40,"length":64,"validator":"email"}', 1, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(2, 1, 'text', 'Full Name', 1, 0, 15, 'name', '{"size":40,"length":64}', 2, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(3, 1, 'phone', 'Phone Number', 0, 0, 0, 'phone', NULL, 3, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(4, 1, 'memo', 'Internal Notes', 0, 1, 0, 'notes', '{"rows":4,"cols":40}', 4, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(5, 2, 'text', 'Issue Summary', 1, 0, 15, 'subject', '{"size":40,"length":50}', 1, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(6, 2, 'thread', 'Issue Details', 1, 0, 15, 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(7, 2, 'priority', 'Priority Level', 0, 1, 3, 'priority', NULL, 3, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(8, 3, 'text', 'Company Name', 1, 0, 3, 'name', '{"size":40,"length":64}', 1, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(9, 3, 'text', 'Website', 0, 0, 0, 'website', '{"size":40,"length":64}', 2, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(10, 3, 'phone', 'Phone Number', 0, 0, 0, 'phone', '{"ext":false}', 3, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(11, 3, 'memo', 'Address', 0, 0, 0, 'address', '{"rows":2,"cols":40,"html":false,"maxlength":100}', 4, NULL, '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_groups`
--

DROP TABLE IF EXISTS `ost_groups`;
CREATE TABLE IF NOT EXISTS `ost_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_post_ticket_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_assign_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_transfer_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_premade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_faq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_view_staff_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `group_active` (`group_enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ost_groups`
--

INSERT INTO `ost_groups` (`group_id`, `group_enabled`, `group_name`, `can_create_tickets`, `can_edit_tickets`, `can_post_ticket_reply`, `can_delete_tickets`, `can_close_tickets`, `can_assign_tickets`, `can_transfer_tickets`, `can_ban_emails`, `can_manage_premade`, `can_manage_faq`, `can_view_staff_stats`, `notes`, `created`, `updated`) VALUES
(1, 1, 'Overseers', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'System overlords. These folks (initially) have full control to all the departments they have access to.', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(2, 1, 'Managers', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'Inhabitants of the ivory tower', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(3, 1, 'Staff', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 'Lowly staff members', '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_group_dept_access`
--

DROP TABLE IF EXISTS `ost_group_dept_access`;
CREATE TABLE IF NOT EXISTS `ost_group_dept_access` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `group_dept` (`group_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_group_dept_access`
--

INSERT INTO `ost_group_dept_access` (`group_id`, `dept_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic`
--

DROP TABLE IF EXISTS `ost_help_topic`;
CREATE TABLE IF NOT EXISTS `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `page_id` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_pid`),
  KEY `topic_pid` (`topic_pid`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`,`team_id`),
  KEY `sla_id` (`sla_id`),
  KEY `page_id` (`page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `isactive`, `ispublic`, `noautoresp`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `form_id`, `topic`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 1, 0, 2, 1, 0, 0, 0, 0, 0, 'General Inquiry', 'Questions about products or services', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(2, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 'Feedback', 'Tickets that primarily concern the sales and billing departments', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(10, 0, 1, 1, 0, 2, 1, 0, 0, 0, 0, 0, 'Report a Problem', 'Product, service, or equipment related issues', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(11, 10, 1, 1, 0, 3, 1, 0, 0, 1, 0, 0, 'Access Issue', 'Report an inability access a physical or virtual asset', '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list`
--

DROP TABLE IF EXISTS `ost_list`;
CREATE TABLE IF NOT EXISTS `ost_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_list_items`
--

DROP TABLE IF EXISTS `ost_list_items`;
CREATE TABLE IF NOT EXISTS `ost_list_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `list_item_lookup` (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_page`
--

DROP TABLE IF EXISTS `ost_page`;
CREATE TABLE IF NOT EXISTS `ost_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` enum('landing','offline','thank-you','other') NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ost_page`
--

INSERT INTO `ost_page` (`id`, `isactive`, `type`, `name`, `body`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1>\n<p>\nIn order to streamline support requests and better serve you, we utilize\na support ticket system. Every support request is assigned a unique\nticket number which you can use to track the progress and responses\nonline. For your reference we provide complete archives and history of\nall your support requests. A valid email address is required to submit a\nticket.\n</p>', 'en_US', 'The landing page is served on the front page of the customer portal\nabove the two links for creating new tickets and viewing ticket status.', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'en_US', 'The thank-you page is served to the customer portal when a user submites\na new ticket via the customer portal.', '2014-04-02 04:19:40', '2014-04-02 04:19:40'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style="font-size: medium">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'en_US', 'The offline page is served to the customer portal when the help desk is\nconfigured offline in the Admin Panel', '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin`
--

DROP TABLE IF EXISTS `ost_plugin`;
CREATE TABLE IF NOT EXISTS `ost_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `installed` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_session`
--

DROP TABLE IF EXISTS `ost_session`;
CREATE TABLE IF NOT EXISTS `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'osTicket staff ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `updated` (`session_updated`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('ar5p06srf77kdctjhadrdov0g1', 0x6366673a636f72657c613a323a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b733a31323a2264625f747a5f6f6666736574223b733a373a222d362e30303030223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236353032643933373937393465643134616562646263366462623632373138383033393731316665223b733a343a2274696d65223b693a313339363531383739313b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c623a303b5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f6465762f6f737469636b65742f7363702f656d61696c732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a323a7b733a353a227374616666223b613a323a7b733a323a226964223b733a313a2231223b733a333a226b6579223b733a32313a226c6f63616c3a70616e6b616a5f6b756d6172303336223b7d733a343a2275736572223b613a323a7b733a373a22737472696b6573223b693a313b733a31303a226c617374737472696b65223b4e3b7d7d6366673a73746166662e317c613a303a7b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2238643762623939323032653064656232636432653030656135656564323030323a313339363531383739313a3337613866653837333634636538643731626339313933363331393432393862223b7d6c61737463726f6e63616c6c7c693a313339363531383734343b7365617263685f37633633633639626561326135303532366435633732623939393039386431647c733a313837353a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d6520202c7469636b65742e7374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974795f69642920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207469636b65742e7374617475733d226f70656e2229204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207469636b65742e7374617475733d276f70656e2720414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b73746166663a6c616e677c4e3b7365617263685f30303166313532316335636632313531393064383238376465343339366265647c733a313835343a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d6520202c7469636b65742e7374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974795f69642920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207469636b65742e7374617475733d226f70656e2229204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207469636b65742e7374617475733d276f70656e2720414e44207469636b65742e6973616e7377657265643d3120204f52444552204259207469636b65742e6c617374726573706f6e736520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b7365617263685f61616563613133656234323164303361363566363931326639653939623361397c733a313837323a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d6520202c7469636b65742e7374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974795f69642920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207469636b65742e7374617475733d226f70656e2229204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207469636b65742e7374617475733d276f70656e2720414e44207469636b65742e73746166665f69643d31204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b6366673a707772657365747c613a303a7b7d, '2014-04-04 03:53:11', '2014-04-03 03:53:11', 1, '122.173.151.53', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36'),
('kid7t6r8so56pinmf0gf5a2mb3', 0x6366673a636f72657c613a313a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231663434383266643666363535633830393239616364633239376533376230373537396163373533223b733a343a2274696d65223b693a313339363531383736333b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c733a313a2230223b, '2014-04-04 03:52:43', '2014-04-03 03:52:43', 0, '122.173.151.53', 'Mozilla/5.0 (Windows NT 6.1; rv:29.0) Gecko/20100101 Firefox/29.0'),
('ihuqu74nvnf12f4mito0ngs0m7', 0x6366673a636f72657c613a323a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b733a31323a2264625f747a5f6f6666736574223b733a373a222d362e30303030223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233643238396434636232343965633534336265396265313764356530663733653737313564313335223b733a343a2274696d65223b693a313339363532303933363b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c623a303b5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f6465762f6f737469636b65742f7363702f656d61696c732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a323a7b733a323a226964223b733a313a2231223b733a333a226b6579223b733a32313a226c6f63616c3a70616e6b616a5f6b756d6172303336223b7d7d6366673a73746166662e317c613a303a7b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2235666361323066323138343562353338333733626536336236373438636332323a313339363532303933363a3337613866653837333634636538643731626339313933363331393432393862223b7d6c61737463726f6e63616c6c7c693a313339363532303734393b7365617263685f37633633633639626561326135303532366435633732623939393039386431647c733a313837353a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d6520202c7469636b65742e7374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974795f69642920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207469636b65742e7374617475733d226f70656e2229204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207469636b65742e7374617475733d276f70656e2720414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b7365617263685f61616563613133656234323164303361363566363931326639653939623361397c733a313837323a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d6520202c7469636b65742e7374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974795f69642920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207469636b65742e7374617475733d226f70656e2229204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207469636b65742e7374617475733d276f70656e2720414e44207469636b65742e73746166665f69643d31204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b, '2014-04-04 04:29:16', '2014-04-03 04:29:16', 1, '122.173.151.53', 'Mozilla/5.0 (Windows NT 6.1; rv:29.0) Gecko/20100101 Firefox/29.0'),
('i5clcc6vi6840u6ekcurpbdmv7', 0x6366673a636f72657c613a323a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b733a31323a2264625f747a5f6f6666736574223b733a373a222d362e30303030223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230626365616364616638363462333536326238653831633463353031393161386266666566393965223b733a343a2274696d65223b693a313339363538353635333b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c623a303b5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32383a222f6465762f6f737469636b65742f7363702f656d61696c732e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a323a7b733a323a226964223b733a313a2231223b733a333a226b6579223b733a32313a226c6f63616c3a70616e6b616a5f6b756d6172303336223b7d7d6366673a73746166662e317c613a303a7b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2263346264313764393733623338633636643964646166623935633936333135393a313339363538353634313a6535383230343964653331306130363239343163343838343931636263333333223b7d6c61737463726f6e63616c6c7c693a313339363538353439373b73746166663a6c616e677c623a303b7365617263685f37633633633639626561326135303532366435633732623939393039386431647c733a313837353a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d6520202c7469636b65742e7374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d206f73745f7469636b6574207469636b657420204c454654204a4f494e206f73745f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e206f73745f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e206f73745f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e206f73745f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e206f73745f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e206f73745f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e206f73745f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e206f73745f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e206f73745f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e206f73745f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e206f73745f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974795f69642920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207469636b65742e7374617475733d226f70656e2229204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207469636b65742e7374617475733d276f70656e2720414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b, '2014-04-04 22:27:33', '2014-04-03 22:27:33', 1, '122.173.194.182', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36'),
('63grj9rjov4fbtapqop53mc6f3', 0x6366673a636f72657c613a313a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262613363303936663731386561353239623835356163343539313262633536353531373361613538223b733a343a2274696d65223b693a313339363533353639343b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c733a313a2230223b, '2014-04-04 08:34:54', '2014-04-03 08:34:54', 0, '122.173.3.235', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; Trident/6.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0E; InfoPath.2; .NET4.0C)'),
('9nj0ivsk10nqng4tjeldqst9a1', 0x6366673a636f72657c613a313a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2231386564306430653237633061313038656132636633363833336166366535363164633036623262223b733a343a2274696d65223b693a313339363538373230393b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c733a313a2230223b, '2014-04-04 22:53:29', '2014-04-03 22:53:29', 0, '122.173.194.182', 'Opera/9.80 (Windows NT 6.1) Presto/2.12.388 Version/12.16');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sla`
--

DROP TABLE IF EXISTS `ost_sla`;
CREATE TABLE IF NOT EXISTS `ost_sla` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_priority_escalation` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disable_overdue_alerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `isactive`, `enable_priority_escalation`, `disable_overdue_alerts`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 0, 48, 'Default SLA', '', '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff`
--

DROP TABLE IF EXISTS `ost_staff`;
CREATE TABLE IF NOT EXISTS `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` tinytext NOT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `group_id` (`group_id`,`staff_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `group_id`, `dept_id`, `timezone_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `daylight_saving`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 8, 'pankaj_kumar036', 'pankaj', 'kashyap', '$2a$08$E3fuR0Qm/QSvQZwNGufnYuy9QpeIVXjdDnNXbJ1J0g9ct.I18hbsC', NULL, 'pankaj_kumar036@yahoo.com', '', '', '', '', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '2014-04-02 04:19:41', '2014-04-03 22:24:55', '2014-04-02 06:32:12', '2014-04-02 06:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `ost_syslog`
--

DROP TABLE IF EXISTS `ost_syslog`;
CREATE TABLE IF NOT EXISTS `ost_syslog` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '122.173.245.61', '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(2, 'Warning', 'Failed login attempt (user)', 'Login: : IP: 122.173.245.61 TIME: Apr 2, 2014, 4:30 am MDT Attempts #3', '', '122.173.245.61', '2014-04-02 04:30:21', '2014-04-02 04:30:21'),
(3, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: : IP: 122.173.245.61 Time:Apr 2, 2014, 4:35 am MDT Attempts #5', '', '122.173.245.61', '2014-04-02 04:35:45', '2014-04-02 04:35:45'),
(4, 'Warning', 'Failed login attempt (user)', 'Login: : IP: 122.173.245.61 TIME: Apr 2, 2014, 4:39 am MDT Attempts #3', '', '122.173.245.61', '2014-04-02 04:39:55', '2014-04-02 04:39:55'),
(5, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: : IP: 122.173.245.61 Time:Apr 2, 2014, 4:46 am MDT Attempts #5', '', '122.173.245.61', '2014-04-02 04:46:59', '2014-04-02 04:46:59'),
(6, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: pankaj_kumar036@yahoo.com: #133638 IP: 122.173.245.61 Time:Apr 2, 2014, 4:47 am MDT Attempts #6', '', '122.173.245.61', '2014-04-02 04:47:15', '2014-04-02 04:47:15'),
(7, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: pankaj_kumar036@yahoo.com: 133638 IP: 122.173.245.61 Time:Apr 2, 2014, 4:47 am MDT Attempts #7', '', '122.173.245.61', '2014-04-02 04:47:25', '2014-04-02 04:47:25'),
(8, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: pankaj_kumar036@rediffmail.com: #133638 IP: 122.173.245.61 Time:Apr 2, 2014, 4:47 am MDT Attempts #8', '', '122.173.245.61', '2014-04-02 04:47:53', '2014-04-02 04:47:53'),
(9, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: pankaj.kumar.dimple@gmail.com: #133638 IP: 122.173.245.61 Time:Apr 2, 2014, 4:48 am MDT Attempts #9', '', '122.173.245.61', '2014-04-02 04:48:56', '2014-04-02 04:48:56'),
(10, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: : IP: 122.173.245.61 Time:Apr 2, 2014, 4:49 am MDT Attempts #10', '', '122.173.245.61', '2014-04-02 04:49:05', '2014-04-02 04:49:05'),
(11, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: pankaj_kumar036@rediffmail.com: #133638 IP: 122.173.245.61 Time:Apr 2, 2014, 4:49 am MDT Attempts #11', '', '122.173.245.61', '2014-04-02 04:49:32', '2014-04-02 04:49:32'),
(12, 'Warning', 'Failed login attempt (user)', 'Login: : IP: 122.173.245.61 TIME: Apr 2, 2014, 5:18 am MDT Attempts #3', '', '122.173.245.61', '2014-04-02 05:18:41', '2014-04-02 05:18:41'),
(13, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: : IP: 122.173.245.61 Time:Apr 2, 2014, 5:19 am MDT Attempts #5', '', '122.173.245.61', '2014-04-02 05:19:21', '2014-04-02 05:19:21'),
(14, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Login: sumitbaindi@gmail.com: #860758 IP: 122.173.245.61 Time:Apr 2, 2014, 5:19 am MDT Attempts #6', '', '122.173.245.61', '2014-04-02 05:19:37', '2014-04-02 05:19:37'),
(15, 'Warning', 'Failed staff login attempt (pankaj_kumar036)', 'Username: pankaj_kumar036 IP: 122.173.245.61 TIME: Apr 2, 2014, 6:30 am MDT Attempts #3', '', '122.173.245.61', '2014-04-02 06:30:48', '2014-04-02 06:30:48'),
(16, 'Warning', 'Staff Password Reset', 'Password reset was attempted for staff member: pankaj kashyap<br /><br /> Requested-User-Id: pankaj_kumar036@yahoo.com<br /> Source-Ip: 122.173.245.61<br /> Email-Sent-To: pankaj_kumar036@yahoo.com<br /> Email-Sent-Via: alerts@gmail.com', '', '122.173.245.61', '2014-04-02 06:31:01', '2014-04-02 06:31:01'),
(17, 'Warning', 'Staff Password Reset', 'Password reset was attempted for staff member: pankaj kashyap<br /><br /> Requested-User-Id: pankaj_kumar036@yahoo.com<br /> Source-Ip: 122.173.245.61<br /> Email-Sent-To: pankaj_kumar036@yahoo.com<br /> Email-Sent-Via: alerts@gmail.com', '', '122.173.245.61', '2014-04-02 06:31:03', '2014-04-02 06:31:03'),
(18, 'Error', 'Mailer Error', 'Unable to email via SMTP:smartzonewebservices.com:26 [pankajkumar@smartzonewebservices.com] Failed to add recipient: teamleader.smartzone@gmail.com [SMTP: Invalid response code received from server (code: 550, response: (localhost) [173.254.28.87]:41304 is currently not permitted to relay through this server.)] ', '', '122.173.151.53', '2014-04-03 04:10:13', '2014-04-03 04:10:13'),
(19, 'Error', 'Mailer Error', 'Unable to email via SMTP:smartzonewebservices.com:26 [pankajkumar@smartzonewebservices.com] Failed to add recipient: pankaj_kumar036@yahoo.com [SMTP: Invalid response code received from server (code: 550, response: (localhost) [173.254.28.87]:51275 is currently not permitted to relay through this server.)] ', '', '122.173.3.235', '2014-04-03 05:19:27', '2014-04-03 05:19:27'),
(20, 'Error', 'Mailer Error', 'Unable to email via SMTP:smartzonewebservices.com:26 [pankajkumar@smartzonewebservices.com] Failed to add recipient: pankaj_kumar036@yahoo.com [SMTP: Invalid response code received from server (code: 550, response: (localhost) [173.254.28.87]:50055 is currently not permitted to relay through this server.)] ', '', '122.173.3.235', '2014-04-03 07:32:10', '2014-04-03 07:32:10'),
(21, 'Error', 'Mailer Error', 'Unable to email via SMTP:smartzonewebservices.com:26 [pankajkumar@smartzonewebservices.com] Failed to add recipient: pankaj_kumar036@yahoo.com [SMTP: Invalid response code received from server (code: 550, response: (localhost) [173.254.28.87]:50691 is currently not permitted to relay through this server.)] ', '', '122.173.3.235', '2014-04-03 07:32:44', '2014-04-03 07:32:44'),
(22, 'Error', 'Mailer Error', 'Unable to email via SMTP:smartzonewebservices.com:26 [pankajkumar@smartzonewebservices.com] Failed to add recipient: pankaj_kumar036@yahoo.com [SMTP: Invalid response code received from server (code: 550, response: (localhost) [173.254.28.87]:54095 is currently not permitted to relay through this server.)] ', '', '122.173.194.182', '2014-04-03 22:25:50', '2014-04-03 22:25:50'),
(23, 'Error', 'Mailer Error', 'Unable to email via SMTP:smartzonewebservices.com:26 [pankajkumar@smartzonewebservices.com] Failed to add recipient: pankaj_kumar036@yahoo.com [SMTP: Invalid response code received from server (code: 550, response: (localhost) [173.254.28.87]:55117 is currently not permitted to relay through this server.)] ', '', '122.173.194.182', '2014-04-03 22:27:17', '2014-04-03 22:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team`
--

DROP TABLE IF EXISTS `ost_team`;
CREATE TABLE IF NOT EXISTS `ost_team` (
  `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noalerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `name` (`name`),
  KEY `isnabled` (`isenabled`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `isenabled`, `noalerts`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2014-04-02 04:19:40', '2014-04-02 04:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team_member`
--

DROP TABLE IF EXISTS `ost_team_member`;
CREATE TABLE IF NOT EXISTS `ost_team_member` (
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`,`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket`
--

DROP TABLE IF EXISTS `ost_ticket`;
CREATE TABLE IF NOT EXISTS `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`),
  KEY `sla_id` (`sla_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `number`, `user_id`, `user_email_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `ip_address`, `status`, `source`, `isoverdue`, `isanswered`, `duedate`, `reopened`, `closed`, `lastmessage`, `lastresponse`, `created`, `updated`) VALUES
(1, '837404', 1, 0, 1, 1, 1, 0, 0, 0, '122.173.245.61', 'open', 'Web', 0, 0, NULL, NULL, NULL, '2014-04-02 04:19:41', NULL, '2014-04-02 04:19:41', '0000-00-00 00:00:00'),
(2, '133638', 2, 0, 1, 1, 10, 1, 0, 0, '122.173.245.61', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-02 04:35:24', '2014-04-02 04:46:13', '2014-04-02 04:35:24', '2014-04-02 04:46:13'),
(3, '926222', 2, 0, 1, 1, 10, 0, 0, 0, '122.173.245.61', 'open', 'Web', 0, 0, NULL, NULL, NULL, '2014-04-02 05:08:56', NULL, '2014-04-02 05:08:56', '0000-00-00 00:00:00'),
(4, '860758', 3, 0, 1, 1, 10, 1, 0, 0, '122.173.245.61', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-02 05:13:00', '2014-04-02 05:15:40', '2014-04-02 05:13:00', '2014-04-02 05:15:40'),
(5, '844024', 4, 0, 1, 1, 10, 1, 0, 0, '122.173.245.61', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-02 06:48:20', '2014-04-02 06:50:22', '2014-04-02 06:48:20', '2014-04-02 06:50:22'),
(6, '330783', 5, 0, 1, 1, 10, 1, 0, 0, '122.173.245.61', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-02 06:53:32', '2014-04-02 06:53:55', '2014-04-02 06:53:32', '2014-04-02 06:53:55'),
(7, '670456', 6, 0, 1, 1, 10, 1, 0, 0, '122.173.245.61', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-02 07:08:19', '2014-04-02 07:10:21', '2014-04-02 07:08:19', '2014-04-02 07:10:21'),
(8, '153761', 7, 0, 1, 1, 2, 1, 0, 0, '122.173.151.53', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-03 04:09:20', '2014-04-03 04:10:11', '2014-04-03 04:09:20', '2014-04-03 04:10:11'),
(9, '538990', 8, 0, 1, 1, 10, 1, 0, 0, '122.173.3.235', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-03 05:18:51', '2014-04-03 05:19:25', '2014-04-03 05:18:51', '2014-04-03 05:19:25'),
(10, '489027', 8, 0, 1, 1, 10, 1, 0, 0, '122.173.3.235', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-03 07:19:58', '2014-04-03 07:21:24', '2014-04-03 07:19:58', '2014-04-03 07:21:24'),
(11, '116252', 8, 0, 1, 1, 10, 1, 0, 0, '122.173.3.235', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-03 07:32:08', '2014-04-03 07:32:41', '2014-04-03 07:32:08', '2014-04-03 07:32:41'),
(12, '770212', 8, 0, 1, 1, 2, 1, 0, 0, '122.173.194.182', 'open', 'Web', 0, 1, NULL, NULL, NULL, '2014-04-03 22:25:48', '2014-04-03 22:27:15', '2014-04-03 22:25:48', '2014-04-03 22:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_attachment`
--

DROP TABLE IF EXISTS `ost_ticket_attachment`;
CREATE TABLE IF NOT EXISTS `ost_ticket_attachment` (
  `attach_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `inline` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `ref_id` (`ref_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ost_ticket_attachment`
--

INSERT INTO `ost_ticket_attachment` (`attach_id`, `ticket_id`, `file_id`, `ref_id`, `inline`, `created`) VALUES
(1, 4, 3, 6, 0, '2014-04-02 05:15:40'),
(2, 5, 3, 8, 0, '2014-04-02 06:50:22'),
(3, 8, 3, 14, 0, '2014-04-03 04:10:11'),
(4, 9, 3, 16, 0, '2014-04-03 05:19:25'),
(5, 11, 3, 20, 0, '2014-04-03 07:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_collaborator`
--

DROP TABLE IF EXISTS `ost_ticket_collaborator`;
CREATE TABLE IF NOT EXISTS `ost_ticket_collaborator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collab` (`ticket_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_email_info`
--

DROP TABLE IF EXISTS `ost_ticket_email_info`;
CREATE TABLE IF NOT EXISTS `ost_ticket_email_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) unsigned NOT NULL,
  `email_mid` varchar(255) NOT NULL,
  `headers` text,
  PRIMARY KEY (`id`),
  KEY `email_mid` (`email_mid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `ost_ticket_email_info`
--

INSERT INTO `ost_ticket_email_info` (`id`, `thread_id`, `email_mid`, `headers`) VALUES
(1, 1, '<8wYkNnw0ZvqLeDsmzoN3PleL@557c16ed33>', NULL),
(2, 2, '<sKj6AP5VIQS0-Dutpi8gQQHe@557c16ed33>', NULL),
(3, 3, '<w-rcqdSDaUeFiaDoC4WsJZOv@557c16ed33>', NULL),
(4, 4, '<e9L90D.SdW7GUacEF.MzHiHX@557c16ed33>', NULL),
(5, 5, '<YJDX9srVVknMoEcdfQNt1kS0@557c16ed33>', NULL),
(6, 6, '<SbMtvPTesycyRPJze4HgZ9Ec@557c16ed33>', NULL),
(7, 7, '<4fb7n8ZXwuQFQ3Szw7f--LOz@557c16ed33>', NULL),
(8, 8, '<hSomUWG5-NkMEvjYiZcSuNta@557c16ed33>', NULL),
(9, 9, '<.cNt4C-sKQ23IepyAv2wYDLQ@557c16ed33>', NULL),
(10, 10, '<4RmiCXkjRMCeHIAHFBkbsm2i@557c16ed33>', NULL),
(11, 11, '<NkfOmo-q0GpzcQJZdzPad1FR@557c16ed33>', NULL),
(12, 12, '<7FE72rptyo6eg2.SXcKFFFpt@557c16ed33>', NULL),
(13, 13, '<WS60yYY9cAOCchfz5-qAaii2@557c16ed33>', NULL),
(14, 14, '<heY0r-XZpZy1C4B2FLpG-T2R@557c16ed33>', NULL),
(15, 15, '<4qszCVp7w-T3WaTjzfFZ-5Or@557c16ed33>', NULL),
(16, 16, '<.wRPoCo0L1BqzD34NlyhKcyb@557c16ed33>', NULL),
(17, 17, '<Oaim7IES90WZDtbTFN7fwONA@557c16ed33>', NULL),
(18, 18, '<znnpEoEBKY6yBkduWncFht7k@557c16ed33>', NULL),
(19, 19, '<TD4mwlYMFZkm1u.7CQDY00sv@557c16ed33>', NULL),
(20, 20, '<PZmibSIatK4Sj6Ehadn2wL5Z@557c16ed33>', NULL),
(21, 21, '<sVw2YC.rX4UZ68j7mpnvH2fq@557c16ed33>', NULL),
(22, 22, '<a5sXBoNpsRz1-mmCeJEdzDb.@557c16ed33>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_event`
--

DROP TABLE IF EXISTS `ost_ticket_event`;
CREATE TABLE IF NOT EXISTS `ost_ticket_event` (
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL,
  `team_id` int(11) unsigned NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  `state` enum('created','closed','reopened','assigned','transferred','overdue') NOT NULL,
  `staff` varchar(255) NOT NULL DEFAULT 'SYSTEM',
  `annulled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL,
  KEY `ticket_state` (`ticket_id`,`state`,`timestamp`),
  KEY `ticket_stats` (`timestamp`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_ticket_event`
--

INSERT INTO `ost_ticket_event` (`ticket_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `state`, `staff`, `annulled`, `timestamp`) VALUES
(1, 0, 0, 1, 1, 'created', 'SYSTEM', 0, '2014-04-02 04:19:41'),
(2, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-02 04:35:27'),
(3, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-02 05:08:58'),
(4, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-02 05:13:03'),
(5, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-02 06:48:22'),
(6, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-02 06:53:35'),
(7, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-02 07:08:22'),
(8, 0, 0, 1, 2, 'created', 'SYSTEM', 0, '2014-04-03 04:09:23'),
(9, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-03 05:18:54'),
(10, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-03 07:20:01'),
(11, 0, 0, 1, 10, 'created', 'SYSTEM', 0, '2014-04-03 07:32:12'),
(12, 0, 0, 1, 2, 'created', 'SYSTEM', 0, '2014-04-03 22:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_lock`
--

DROP TABLE IF EXISTS `ost_ticket_lock`;
CREATE TABLE IF NOT EXISTS `ost_ticket_lock` (
  `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`lock_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_priority`
--

DROP TABLE IF EXISTS `ost_ticket_priority`;
CREATE TABLE IF NOT EXISTS `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_thread`
--

DROP TABLE IF EXISTS `ost_ticket_thread`;
CREATE TABLE IF NOT EXISTS `ost_ticket_thread` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_type` enum('M','R','N') NOT NULL,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `ost_ticket_thread`
--

INSERT INTO `ost_ticket_thread` (`id`, `pid`, `ticket_id`, `staff_id`, `user_id`, `thread_type`, `poster`, `source`, `title`, `body`, `ip_address`, `created`, `updated`) VALUES
(1, 0, 1, 0, 1, 'M', 'osTicket Support', 'Web', 'osTicket Installed!', '<p> Thank you for choosing osTicket. </p><p> Please make sure you join the <a href="http://osticket.com/forums">osTicket forums</a> and our <a href="http://osticket.com/updates">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p><p> If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p><p> If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href="http://www.supportsystem.com">http://www.supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem''s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p><p> Cheers, </p><p> -<br /> osTicket Team http://osticket.com/ </p><p> <strong>PS.</strong> Don''t just make customers happy, make happy customers! </p>', '122.173.245.61', '2014-04-02 04:19:41', '0000-00-00 00:00:00'),
(2, 0, 2, 0, 2, 'M', 'pankaj kumar', '', '', 'Hi<br />I want to inform you that I work on site as developer in the site .<br /><br /><br />regrad<br />pankaj', '122.173.245.61', '2014-04-02 04:35:24', '0000-00-00 00:00:00'),
(3, 2, 2, 1, 0, 'R', 'pankaj kashyap', '', '', 'Hi pankaj, <br /> <br /> Your ticket #133638 created on 04/02/2014 5:35 am is in Support department.', '', '2014-04-02 04:46:13', '0000-00-00 00:00:00'),
(4, 0, 3, 0, 2, 'M', 'pankaj kumar', '', '', 'Hi <br />I am developer', '122.173.245.61', '2014-04-02 05:08:56', '0000-00-00 00:00:00'),
(5, 0, 4, 0, 3, 'M', 'sumit', '', '', 'Hi<br />Here is mail for tester<br /><br /><br /><br />Regard<br />sumit', '122.173.245.61', '2014-04-02 05:13:01', '0000-00-00 00:00:00'),
(6, 5, 4, 1, 0, 'R', 'pankaj kashyap', '', '', 'Hi sumit, <br /> <br /> Your ticket #860758 created on 04/02/2014 6:13 am is in Support department.osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.', '', '2014-04-02 05:15:40', '0000-00-00 00:00:00'),
(7, 0, 5, 0, 4, 'M', 'navdeep', '', '', 'Hi <br />I submit ticket<br />Regad<br />navdeep<br />', '122.173.245.61', '2014-04-02 06:48:20', '0000-00-00 00:00:00'),
(8, 7, 5, 1, 0, 'R', 'pankaj kashyap', '', '', 'osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systemsHi navdeep, <br /> <br /> Your ticket #844024 created on 04/02/2014 7:48 am is in Support department. - simple, lightweight, reliable, open source, web-based and easy to setup and use.', '', '2014-04-02 06:50:22', '0000-00-00 00:00:00'),
(9, 0, 6, 0, 5, 'M', 'baindi', '', '', 'Hi <br />I am tester<br /><br />Regard<br />Pankaj', '122.173.245.61', '2014-04-02 06:53:32', '0000-00-00 00:00:00'),
(10, 9, 6, 1, 0, 'R', 'pankaj kashyap', '', '', 'Hi baindi, <br /> <br /> Your ticket #330783 created on 04/02/2014 7:53 am is in Support department.', '', '2014-04-02 06:53:55', '0000-00-00 00:00:00'),
(11, 0, 7, 0, 6, 'M', 'panky', '', '', 'Hi<br />I am develope', '122.173.245.61', '2014-04-02 07:08:19', '0000-00-00 00:00:00'),
(12, 11, 7, 1, 0, 'R', 'pankaj kashyap', '', '', 'Hi panky, <br /> <br /> Your ticket #670456 created on 04/02/2014 8:08 am is in Support department.', '', '2014-04-02 07:10:21', '0000-00-00 00:00:00'),
(13, 0, 8, 0, 7, 'M', 'teamleader', '', '', 'asdasd', '122.173.151.53', '2014-04-03 04:09:20', '0000-00-00 00:00:00'),
(14, 13, 8, 1, 0, 'R', 'pankaj kashyap', '', '', 'osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer hHi teamleader, <br /> <br /> Your ticket #153761 created on 04/03/2014 5:09 am is in Support department.ghjgkjhasdkjhfjjsystems - simple, lightweight, reliable, open source, web-based and easy to setup and use.', '', '2014-04-03 04:10:11', '0000-00-00 00:00:00'),
(15, 0, 9, 0, 8, 'M', 'pankaj kumar', '', '', 'HI''<br />fjdsfdsfjkfdsf<br />sfsfsafsfsf', '122.173.3.235', '2014-04-03 05:18:52', '0000-00-00 00:00:00'),
(16, 15, 9, 1, 0, 'R', 'pankaj kashyap', '', '', 'osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer suHi pankaj, <br /> <br /> Your ticket #538990 created on 04/03/2014 6:18 am is in Support department.pport systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.', '', '2014-04-03 05:19:25', '0000-00-00 00:00:00'),
(17, 0, 10, 0, 8, 'M', 'pankaj kumar', '', '', 'fdsfdsfdsfdasfds', '122.173.3.235', '2014-04-03 07:19:59', '0000-00-00 00:00:00'),
(18, 17, 10, 1, 0, 'R', 'pankaj kashyap', '', '', 'Hi pankaj, <br /> <br /> Your ticket #489027 created on 04/03/2014 8:19 am is in Support department.', '', '2014-04-03 07:21:24', '0000-00-00 00:00:00'),
(19, 0, 11, 0, 8, 'M', 'pankaj kumar', '', '', 'this is good', '122.173.3.235', '2014-04-03 07:32:08', '0000-00-00 00:00:00'),
(20, 19, 11, 1, 0, 'R', 'pankaj kashyap', '', '', 'osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer suHi pankaj, <br /> <br /> Your ticket #116252 created on 04/03/2014 8:32 am is in Support department.pport systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.', '', '2014-04-03 07:32:41', '0000-00-00 00:00:00'),
(21, 0, 12, 0, 8, 'M', 'pankaj kumar', '', '', 'This issue has been resloved', '122.173.194.182', '2014-04-03 22:25:48', '0000-00-00 00:00:00'),
(22, 21, 12, 1, 0, 'R', 'pankaj kashyap', '', '', 'Hi pankaj, <br /> <br /> Your ticket #770212 created on 04/03/2014 11:25 pm is in Support department.Hi pankaj, <br /> <br /><br />', '', '2014-04-03 22:27:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket__cdata`
--

DROP TABLE IF EXISTS `ost_ticket__cdata`;
CREATE TABLE IF NOT EXISTS `ost_ticket__cdata` (
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `subject` mediumtext,
  `priority` mediumtext,
  `priority_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ost_ticket__cdata`
--

INSERT INTO `ost_ticket__cdata` (`ticket_id`, `subject`, `priority`, `priority_id`) VALUES
(1, 'osTicket Installed!', 'Normal', 2),
(2, 'Developer working', 'Normal', 2),
(3, 'Developer workings', 'Normal', 2),
(4, 'Test', 'Normal', 2),
(5, 'Developer working', 'Normal', 2),
(6, 'Testing', 'Normal', 2),
(7, 'Developer working', 'Normal', 2),
(8, 'asdasd', 'Low', 1),
(9, 'issue', 'Normal', 2),
(10, 'issuess', 'Normal', 2),
(11, 'issuess discuss', 'Normal', 2),
(12, 'Resolved', 'Low', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_timezone`
--

DROP TABLE IF EXISTS `ost_timezone`;
CREATE TABLE IF NOT EXISTS `ost_timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `ost_timezone`
--

INSERT INTO `ost_timezone` (`id`, `offset`, `timezone`) VALUES
(1, -12.0, 'Eniwetok, Kwajalein'),
(2, -11.0, 'Midway Island, Samoa'),
(3, -10.0, 'Hawaii'),
(4, -9.0, 'Alaska'),
(5, -8.0, 'Pacific Time (US & Canada)'),
(6, -7.0, 'Mountain Time (US & Canada)'),
(7, -6.0, 'Central Time (US & Canada), Mexico City'),
(8, -5.0, 'Eastern Time (US & Canada), Bogota, Lima'),
(9, -4.0, 'Atlantic Time (Canada), Caracas, La Paz'),
(10, -3.5, 'Newfoundland'),
(11, -3.0, 'Brazil, Buenos Aires, Georgetown'),
(12, -2.0, 'Mid-Atlantic'),
(13, -1.0, 'Azores, Cape Verde Islands'),
(14, 0.0, 'Western Europe Time, London, Lisbon, Casablanca'),
(15, 1.0, 'Brussels, Copenhagen, Madrid, Paris'),
(16, 2.0, 'Kaliningrad, South Africa'),
(17, 3.0, 'Baghdad, Riyadh, Moscow, St. Petersburg'),
(18, 3.5, 'Tehran'),
(19, 4.0, 'Abu Dhabi, Muscat, Baku, Tbilisi'),
(20, 4.5, 'Kabul'),
(21, 5.0, 'Ekaterinburg, Islamabad, Karachi, Tashkent'),
(22, 5.5, 'Bombay, Calcutta, Madras, New Delhi'),
(23, 6.0, 'Almaty, Dhaka, Colombo'),
(24, 7.0, 'Bangkok, Hanoi, Jakarta'),
(25, 8.0, 'Beijing, Perth, Singapore, Hong Kong'),
(26, 9.0, 'Tokyo, Seoul, Osaka, Sapporo, Yakutsk'),
(27, 9.5, 'Adelaide, Darwin'),
(28, 10.0, 'Eastern Australia, Guam, Vladivostok'),
(29, 11.0, 'Magadan, Solomon Islands, New Caledonia'),
(30, 12.0, 'Auckland, Wellington, Fiji, Kamchatka');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user`
--

DROP TABLE IF EXISTS `ost_user`;
CREATE TABLE IF NOT EXISTS `ost_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `default_email_id` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ost_user`
--

INSERT INTO `ost_user` (`id`, `default_email_id`, `name`, `created`, `updated`) VALUES
(1, 1, 'osTicket Support', '2014-04-02 04:19:41', '2014-04-02 04:19:41'),
(2, 2, 'pankaj kumar', '2014-04-02 04:35:24', '2014-04-02 04:35:24'),
(3, 3, 'sumit', '2014-04-02 05:13:00', '2014-04-02 05:13:00'),
(4, 4, 'navdeep', '2014-04-02 06:48:20', '2014-04-02 06:48:20'),
(5, 5, 'baindi', '2014-04-02 06:53:32', '2014-04-02 06:53:32'),
(6, 6, 'panky', '2014-04-02 07:08:19', '2014-04-02 07:08:19'),
(7, 7, 'teamleader', '2014-04-03 04:09:20', '2014-04-03 04:09:20'),
(8, 8, 'pankaj kumar', '2014-04-03 05:18:51', '2014-04-03 05:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_email`
--

DROP TABLE IF EXISTS `ost_user_email`;
CREATE TABLE IF NOT EXISTS `ost_user_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `address` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `user_email_lookup` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ost_user_email`
--

INSERT INTO `ost_user_email` (`id`, `user_id`, `address`) VALUES
(1, 1, 'support@osticket.com'),
(2, 2, 'pankaj_kumar036@rediffmail.com'),
(3, 3, 'sumitbaindi@gmail.com'),
(4, 4, 'navdeep@smartzonewebservices.com'),
(5, 5, 'sumit@smartzonewebservices.com'),
(6, 6, 'pankajkumar@smartzonewebservices.com'),
(7, 7, 'teamleader.smartzone@gmail.com'),
(8, 8, 'pankaj_kumar036@yahoo.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
