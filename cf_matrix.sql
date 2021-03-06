-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2013 at 09:15 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cf_matrix`
--

-- --------------------------------------------------------

--
-- Table structure for table `glogin_users`
--

DROP TABLE IF EXISTS `glogin_users`;
CREATE TABLE IF NOT EXISTS `glogin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `glogin_users`
--

INSERT INTO `glogin_users` (`id`, `email`, `name`, `photo`, `registered`) VALUES
(1, 'salmasi@contentformula.com', 'Sirvan Almasi', 'assets/img/default_avatar.jpg', '2013-05-08 11:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `skill_hrs_bulk_addition`
--

DROP TABLE IF EXISTS `skill_hrs_bulk_addition`;
CREATE TABLE IF NOT EXISTS `skill_hrs_bulk_addition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hrs` varchar(10) NOT NULL,
  `skill_type_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `skill_type_id` (`skill_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `skill_hrs_bulk_addition`
--

INSERT INTO `skill_hrs_bulk_addition` (`id`, `hrs`, `skill_type_id`, `date`) VALUES
(1, '2.5', 5, '2013-05-01'),
(2, '3.5', 3, '2013-06-01'),
(3, '5', 3, '2013-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `skill_type`
--

DROP TABLE IF EXISTS `skill_type`;
CREATE TABLE IF NOT EXISTS `skill_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `skill_full` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `skill_type`
--

INSERT INTO `skill_type` (`id`, `skill`, `color`, `skill_full`) VALUES
(1, 'PM', '#E01B6A', 'Project Manager'),
(2, 'TPM', '#9DD6ED', 'Technical Project Manager'),
(3, 'IA', '#5542D4', 'Information Architecture'),
(4, 'DES', '#42D49E', 'Design'),
(5, 'DEV', '#CFD442', 'General Developer'),
(6, 'PHP', '#D49742', 'PHP Coding'),
(7, 'SHP', '', 'Microsoft Sharepoint 2007/2010'),
(8, 'CON', '', 'Content'),
(9, 'TES', '', 'Testing');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` int(11) NOT NULL,
  `hrs_spent` varchar(50) NOT NULL,
  `redmine_url` varchar(255) NOT NULL,
  `n_url` varchar(255) NOT NULL,
  `job_nr` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `hours` varchar(50) DEFAULT NULL,
  `gbp_total_amount` varchar(50) DEFAULT NULL,
  `payment_terms` varchar(50) DEFAULT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `estimated_end_date` varchar(50) DEFAULT NULL,
  `sold_by` varchar(50) DEFAULT NULL,
  `month_of_sale` varchar(50) DEFAULT NULL,
  `project_manager` varchar(50) DEFAULT NULL,
  `attached_project` varchar(50) DEFAULT NULL,
  `po` varchar(50) DEFAULT NULL,
  `third_party_costs` varchar(50) DEFAULT NULL,
  `client_main_contact` varchar(50) DEFAULT NULL,
  `contact_details` varchar(50) DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_users_idx` (`contact`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=429 ;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `contact`, `hrs_spent`, `redmine_url`, `n_url`, `job_nr`, `status`, `client_name`, `project_name`, `type`, `hours`, `gbp_total_amount`, `payment_terms`, `start_date`, `estimated_end_date`, `sold_by`, `month_of_sale`, `project_manager`, `attached_project`, `po`, `third_party_costs`, `client_main_contact`, `contact_details`, `notes`) VALUES
(1, 1, '', '', '', 'CF00362', 'Pending', 'Lewisham College', 'StaffNet Maintenance', 'IS', '12', '1440', 'Monthly in arrears', '15/04/2013', '15/09/2013', 'JT', 'April 2013', NULL, NULL, 'Awaiting PO', NULL, 'Daveena Dowlul', 'davee.dowlul@lewisham.ac.uk', NULL),
(2, 0, '', '', '', 'CF00361', 'Pending', 'Nuffield', 'Hospitals Microsites (manual vs automated)', 'WP', 'TBC', 'TBC', 'TBC', '08/04/2013', '31/05/2013', 'CH', 'April 2013', NULL, NULL, 'Awaiting PO', NULL, 'Solomon Degia', 'Solomon.degia@nuffieldhealth.com', NULL),
(3, 0, '', '', '', 'CF00360', 'Current', 'Nuffield', 'iConnect development work', 'WP', '38', '3496', '100% upfront', '04/04/2013', '10/04/2013', 'AWG', 'April 2013', NULL, NULL, 'Awaiting PO', NULL, 'Jason Marsh', 'jason.marsh@nuffieldhealth.com', NULL),
(4, 0, '', '', '', 'CF00359', 'Current', 'Nuffield', 'Hospitals Pricing Pages', 'WP', '131.75', '12121', '50% upfront, 50% on completion', '04/04/2013', '22/04/2013', 'CH', 'April 2013', NULL, NULL, '205000667', NULL, 'James Heal', 'james.heal@nuffieldhealth.com', NULL),
(5, 0, '', '', '', 'CF00358 ', 'Pending', 'Mars', 'Mars Killer app ', 'WP', '120', '14000', '100% upfront', '03/04/2013', '21/04/2013', 'MG', 'April 2013', NULL, NULL, 'Awaiting PO', NULL, 'Susie Organ', 'susie.organ@effem.com', NULL),
(6, 0, '', '', '', 'CF00357', 'Closed', 'Nuffield', 'iconnect header amends', 'WP', '4.5', '414', '100% upfront', '26/03/2013', '08/04/2013', 'CH', 'March 2013', NULL, NULL, '2000007255', NULL, 'Jason Marsh', 'jason.marsh@nuffieldhealth.com', NULL),
(7, 0, '', '', '', 'CF00356', 'Current', 'ASP', 'Glosair Newsltter - 4 Campain monitor sendings ', 'Iwp', 'n/a', '£120', '100%up front', '13/03/2013', 'End 2013', 'EA', 'March 2013 ', NULL, NULL, '356794', NULL, 'Nathalie Chevre', 'nchevre@its.jnj.com', NULL),
(8, 0, '', '', '', 'CF00355', 'Cancelled', 'Ethicon', 'SoTM Asia pac section', 'WP', '40', '£5000', '100% upfront', '13/03/2013', '13/04/2013', 'EA', 'March 2013', NULL, NULL, 'Awaiting PO', NULL, 'Pat Dugan ', 'PDugan1@its.jnj.com', NULL),
(9, 0, '', '', '', 'CF00354', 'Current', 'Mars', 'Growth Labs', 'IP', '465', '£43,400', '50% Upfront 50% on completion', '14/03/2013', '17/06/2013', 'MG', 'March 2013', NULL, NULL, '2003113949', NULL, 'Stephane Schitter / Myriam Cetre', 'stephane.schitter@effem.com / myriam.cetre@effem.c', NULL),
(10, 0, '', '', '', 'CF00353', 'Current', 'Nuffield', 'NH Handover Project', 'WP', '142', '13064', '50% upfront, 50% on completion', '13/03/2013', '31/05/2013', 'CH', 'March 2013', NULL, NULL, 'Awaiting PO', NULL, 'Stan Baldwin', 'stan.baldwin@nuffieldhealth.com', NULL),
(11, 0, '', '', '', 'CF00352', 'Current', 'Nuffield', 'Server Hosting Rebate', NULL, 'n/a', 'n/a', 'n/a', '06/03/2013', '06/05/2013', 'HF', 'March 2013', NULL, NULL, 'n/a', NULL, 'Mark King', 'mark.king@peer1hosting.co.uk', NULL),
(12, 0, '', '', '', 'CF00351', 'Current', 'LifeScan UK', 'PCoE', 'WP', '40', '5000', '100% upfront', '28/02/2013', '28/02/2014', 'EA', 'February 2013', NULL, NULL, 'P21251967R', NULL, 'Sabrina Paino', 'spaino@its.jnj.com', NULL),
(13, 0, '', '', '', 'CF00350', 'closed', 'Pfizer', 'Feed on EucanGoesDigital', 'IP', '7', '770', '100% upfront', '28/02/2013', '01/03/2013', 'John', 'February 2013', NULL, NULL, 'Awaiting PO', NULL, 'Emma Berry', NULL, NULL),
(14, 0, '', '', '', 'CF00349', 'Closed', 'Nuffield', 'The Vale Sitemap', 'WP', '5', '460', '100& upfront', '26/02/2013', '28/02/2013', 'CH', 'February 2013', NULL, NULL, 'Laura Dunning Spinal web sitemap', NULL, 'Laura Dunning', 'laura.dunning@nuffieldhealth.com', NULL),
(15, 0, '', '', '', 'CF00348', 'Closed', 'Nuffield', 'Physio Page', 'WP', '69', '6348', '100% upfront', '21/02/2013', '21/03/2013', 'CH', 'February 2013', NULL, NULL, '200007203', NULL, 'Solomon Degia', 'Solomon.degia@nuffieldhealth.com', NULL),
(16, 0, '', '', '', 'CF00347', 'Current', 'Novartis', 'IA/Design', 'IP', '365', '36500', '50/50', 'TBC', 'TBC', 'JS/DH/RW', 'February 2013', NULL, NULL, 'awaiting PO', NULL, 'Rachel Kitchen', 'rachel.kitchen-1@novartis.com', NULL),
(17, 0, '', '', '', 'CF00346', 'Closed', 'Ethicon', 'Balloon Sinuplasty - Wico updates ', 'IP', '4.5', '414', '100% upfront', '19/02/2013', '25/02/2013', 'EA', 'February 2013', NULL, NULL, 'P21248518N', NULL, 'Rachel Walsh', 'Walsh, Rachel [ITSGB] <rwalsh@its.jnj.com>', NULL),
(18, 0, '', '', '', 'CF00345', 'Current', 'MD&D', 'UKIRL Prof Ed', 'IP', '73', '6716', '100% upfront', '18/02/2013', '25/02/2013', 'JT', 'February 2013', NULL, NULL, 'P21242138R', NULL, 'Sam Skinner', 'SSKINNER@its.jnj.com', NULL),
(19, 0, '', '', '', 'CF00344', 'Pending', 'Mars', 'Dove/Galaxy portal ', 'IP', '96', '8880', '100% upfront', '01/05/2013', '01/06/2013', 'EA', 'May 2013', NULL, NULL, 'awaiting PO', NULL, 'Susie Organ', 'susie.organ@effem.com', NULL),
(20, 0, '', '', '', 'CF00343', 'Current', 'Danone', 'ELNN Community Site', 'WP', '494.5', '64400', '50% upfront, 50% on completion', '04/03/2013', '31/07/2013', 'CH', 'February 2013', NULL, NULL, '90776', NULL, 'Claire Coulson', 'Claire.Coulson-Joy@universalworldevents.com', NULL),
(21, 0, '', '', '', 'CF00342', 'Closed', 'Novartis', 'Content audit and planning phase', 'IP', '37.5', '3750', '100% upfront', '07/02/13', '15/02/13', 'John', 'February 2013', NULL, NULL, '3000556127', NULL, 'Rachel Kitchen', 'rachel-1.kitchen@novartis.com', NULL),
(22, 0, '', '', '', 'CF00341', 'closed', 'Pfizer', 'Pfizer digital awareness day comms', 'IP', '165', '18140', '50%midway50% completion', '13/02/13', '06/03/13', 'RW', 'February 2013', NULL, NULL, 'awaiting PO', NULL, 'Emma Berry', 'emma.berry@pfizer.com', NULL),
(23, 0, '', '', '', 'CF00340', 'Current', 'VisionCare', 'My learning Journey Bucket', 'WS', '40', '4600', '100% upfront', '05/02/13', '05/02/14', 'EA', 'February 2013', NULL, NULL, '4500152925', NULL, 'Anna Shaw', 'ashaw8@ITS.JNJ.com', NULL),
(24, 0, '', '', '', 'CF00339', 'current', 'JLR', 'JLR APQP DIscovery Phase', 'IP', '468.36', '51520', '100% upfront', '04/02/13', '15/03/13', 'RW', 'January 2013', NULL, NULL, 'Awaiting PO/ Cheque', NULL, 'Chris Hinchcliffe', 'chinchcl@jaguarlandrover.com', NULL),
(25, 0, '', '', '', 'CF00338', 'current', 'JLR', 'JLR Programme Workflow Discovery Phase', 'IP', '274.9', '30240', '100% upfront', '04/02/13', '15/03/13', 'RW', 'January 2013', NULL, NULL, 'Awaiting PO/ Cheque', NULL, 'Chris Hinchcliffe', 'chinchcl@jaguarlandrover.com', NULL),
(26, 0, '', '', '', 'CF00337', 'current', 'JLR', 'JLR Purchasing Intranet Enhancements Discovery pha', 'IP', '200', '22000', '100% up front', '04/02/13', '15/03/13', 'RW', 'January 2013', NULL, NULL, 'Awaiting PO/ Cheque', NULL, 'Chris Hinchcliffe', 'chinchcl@jaguarlandrover.com', NULL),
(27, 0, '', '', '', 'CF00336', 'current', 'JLR', 'JLR Electronic Surveys Discovery', 'IP', '143', '15730', '100% up front', '04/02/13', '15/03/13', 'RW', 'January 2013', NULL, NULL, 'Awaiting PO/ cheque', NULL, 'Chris Hinchcliffe', 'chinchcl@jaguarlandrover.com', NULL),
(28, 0, '', '', '', 'CF00335', 'Current', 'MD&D', 'Finance Function Section', 'IP', '146', '16200', '100% up front', '04/02/13', '10/03/13', 'JT', 'January ''13', NULL, NULL, 'P21231196R', NULL, 'Jasemin Sevgi-Romero', 'jsevgir1@its.jnj.com', NULL),
(29, 0, '', '', '', 'CF00334', 'Cancelled', 'Mars', 'Mars Brand Portal - Adreel', 'IP', '16', '1600', '100% upfront', '29/01/13', '15/02/13', 'EA/DH', 'January''13', NULL, NULL, 'Awaiting PO', NULL, 'Susie Organ', 'susie.organ@effem.com', NULL),
(30, 0, '', '', '', 'CF00333', 'Current', 'Cordis', 'SmartTouch ', 'IP', '49', '4508', '100% upfront', '29/01/13', '01/03/13', 'EA', 'January''13', NULL, NULL, 'PO: P21241903R', NULL, 'Isle Jacques ', 'Jacques, Ilse [CRDBEWA] <ijacque1@ITS.JNJ.com>', NULL),
(31, 0, '', '', '', 'CF00332', 'Current', 'MD&D', 'Pinewood Health and Safety Video', 'IP', '5', '460', '100% upfront', '01/02/13', '08/01/13', 'JT', 'January''13', NULL, NULL, 'P21235376N', NULL, 'Laura Routh', 'ijacque1@ITS.JNJ.com', NULL),
(32, 0, '', '', '', 'CF00331A', 'Current', 'Pfizer', 'SCBU Site Enhancements top up', 'IS', '20', '2500', NULL, '01/04/2013', '15/04/2013', 'JT', 'March 2013', NULL, NULL, NULL, NULL, 'Siji Otenigbagbe', 'Siji.Otenigbagbe@pfizer.com', NULL),
(33, 0, '', '', '', 'CF00331', 'Current', 'Pfizer', 'SCBU Site Enhancements', 'IS', '70', '7250', NULL, '19/03/2013', '26/03/2013', 'AWG', 'March''13', NULL, NULL, 'Awaiting PO', NULL, 'Siji Otenigbagbe', 'Siji.Otenigbagbe@pfizer.com', NULL),
(34, 0, '', '', '', 'CF00330', 'Current', 'RSSB', 'RRUKA website support', 'WS', '8', '800', 'Quarterly upfront', '01/02/13', NULL, 'John', 'January''13', NULL, NULL, 'Awaiting PO', NULL, 'Nailah Fraser Haynes', 'Nailah.Fraser-Haynes@rssb.co.uk', NULL),
(35, 0, '', '', '', 'CF00329', 'Cancelled', 'Nuffield', 'Physiotherapy Section', 'WP', 'TBC', 'TBC', 'TBC', '28/01/13', '18/02/13', 'CH', 'January''13', NULL, NULL, 'Awaiting PO', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(36, 0, '', '', '', 'CF00328', 'Closed', 'Nuffield', 'H/S Register Now and new section', 'WP', '4.75', '437', '100% upfront', '04/12/12', '31/12/12', 'CH', 'January''13', NULL, NULL, '200006854', NULL, 'Kate Barker', 'kate.barker@nuffieldhealth.com', NULL),
(37, 0, '', '', '', 'CF00327', 'Closed', 'Nuffield', 'Webtrends code for H/S', 'WP', '2.25', '221', '100% upfront', '07.01.13', '25/01/13', 'CH', 'January''13', NULL, NULL, 'PO 200006484', NULL, 'Kate Barker', 'kate.barker@nuffieldhealth.com', NULL),
(38, 0, '', '', '', 'CF00326', 'Closed', 'Nuffield', 'Rewards Page Revision Work', 'WP', '8', '736', '100% on completion', '03/01/13', '07/01/13', 'AWG', 'January''13', NULL, NULL, 'This was invoiced on #305A', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(39, 0, '', '', '', 'CF00325', 'Closed', 'McNeil', 'Splenda 2013 Updates', 'WP', '88', '8096', '100% Upfront', '31/12/12', '30/01/12', 'JT', 'December''12', NULL, NULL, 'Awaiting PO', NULL, 'Maria Somalya', 'msomalya@its.jnj.com', NULL),
(40, 0, '', '', '', 'CF00324', 'Closed', 'Ethicon', 'Balloon Sinuplasty', 'WP', '66', '6072', '100% Upfront', '19/12/12', '31/12/12', 'MG', 'December''12', NULL, NULL, 'P21203141R', NULL, 'Rachel Walsh', 'rwalsh@its.jnj.com', NULL),
(41, 0, '', '', '', 'CF00323', 'Current', 'EES ', 'Ethicon Surgical Care Support Bucket', 'IS', '20', '1840', '100% up front', '01/01/13', '01/02/13', 'JT', 'December''12', NULL, NULL, 'Awaiting PO', NULL, 'Marlen Busacker', 'MBusacke@its.JNJ.com', NULL),
(42, 0, '', '', '', 'CF00322', 'Closed', 'Nuffield', 'Rewards Mobile Responsive Design', 'WP', '112', '10307', '100% on completion', '17/12/12', '11/01/13', 'CH', 'December''12', NULL, NULL, '200006724 - £307 and 200006663 - £10, 000', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(43, 0, '', '', '', 'CF00321', 'Closed', 'Nuffield', 'HealthScore Sitemap', 'WP', '5', '460', '100% upfront', '03/01/13', '25/01/13', 'CH', 'December''12', NULL, NULL, '200006854', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(44, 0, '', '', '', 'CF00320', 'current', 'Ethicon', 'Energy Microsite Phase 2', 'IP', '110', '10985', '100% Upfront', '12/12/12', 'November 2013', 'MG', 'December''12', NULL, NULL, 'P21202230R', NULL, 'Jo Collins', '<jcollin9@its.jnj.com>', NULL),
(45, 0, '', '', '', 'CF00320a', 'Current', 'Ethicon', 'Energy Powerhouse phase 2 Bucket', 'IS', '40', '£5000', '100% up front', '27/03/2013', 'March 2014', 'EA', 'March 2013', NULL, NULL, '\n        P21279166R', NULL, 'Jo Collins', NULL, NULL),
(46, 0, '', '', '', 'CF00319', 'Current', 'Visioncare', 'Learning Journey Metrics', 'IP', '262.25', '24125', 'In 2012 invoice £19,097; In 2013 £5028', '10/12/12', '05/07/05', 'SR', 'November''12', NULL, NULL, NULL, NULL, 'Anna Shaw/Janice Dody', NULL, NULL),
(47, 0, '', '', '', 'CF00318', 'Closed', 'McNeil', 'Automated data downlaods', 'WP', '10', '920', '100% upfront', '10/12/12', '01/01/13', 'JT', 'November''12', NULL, NULL, '2 POs: 1 is P21183364R', NULL, 'Patricia Mead', 'pmead@its.jnj.com', NULL),
(48, 0, '', '', '', 'CF00317', 'Cancelled', 'Nuffield', 'Essex Breast Service', 'WP', '34', '3162.5', '100% upfront', '03/12/12', '21/12/12', 'CH', 'November''12', NULL, NULL, '31046271', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(49, 0, '', '', '', 'CF00316', 'Closed', 'Nuffield', 'Amends to Leeds Fibroid & YPVC', 'WP', '7', '644', '100% upfront', '03/12/11', '10/12/12', 'CH', 'November''12', NULL, NULL, '20041811', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(50, 0, '', '', '', 'CF00315', 'Cancelled', 'Visioncare', 'Presbyopia Training', 'IS', '35', '3220', '100% upfront', '26/11/12', '31/01/13', 'MG', 'November''12', NULL, NULL, 'Awaiting PO', NULL, 'Kim Landry', 'klandry@its.jnj.com', NULL),
(51, 0, '', '', '', 'CF00314', 'Cancelled', 'Visioncare', 'Presbyopia Bucket', 'IS', '20', '2500', '100% upfront', '26/11/12', '31/01/13', 'MG', 'November''12', NULL, NULL, 'Awaiting PO', NULL, 'Kim Landry', 'klandry@its.jnj.com', NULL),
(52, 0, '', '', '', 'CF00313', 'Current', 'Ethicon', 'Better World Walk', 'IP', '638', '58696', 'Up to £30,000 up front, remainder on completion', '20/11/12', '15/02/13', 'MG', 'November''12', NULL, NULL, 'Awaiting PO', NULL, 'Cathy Dalene', 'cdalene@its.jnj.com', NULL),
(53, 0, '', '', '', 'CF00313a', 'current', 'Ethicon', 'Better World Walk', 'IP', '150', '12420', '50% up front 50% completion', '20/11/12', '15/02/13', 'MG', 'November''12', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 0, '', '', '', 'CF00313b ', 'Pending', 'Ethicon', 'BWW Bucket of hours', 'IS', '90', '8280', '100% up front', '01/03/2013', '31/12/2013', 'JT', 'March 2013', NULL, NULL, 'Awaiting PO', NULL, 'Cathy Dalene', 'cdalene@its.jnj.com', NULL),
(55, 0, '', '', '', 'CF00312', 'Current', 'Mars', 'Global Brand Portals', 'IP', '749', '68880', '40% Upfront invoiced\n40% December 2012 - Invoice o', '20/11/12', '01/03/13', 'RW', 'November''12', NULL, NULL, '2002992509', NULL, 'Susie Organ', 'susie.organ@effem.com', NULL),
(56, 0, '', '', '', 'CF00311', 'Closed', 'Nuffield', 'Mike Moss Clone', 'WP', '5.5', '506', '100% upfront', '26/11/12', '07/01/13', 'CH', 'November''12', NULL, NULL, '200006214', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(57, 0, '', '', '', 'CF00310', 'Cancelled', 'Nuffield', 'The Vale Oncology Centre Clone', 'WP', '5.5', '506', '100% upfront', '26/11/12', '15/12/12', 'CH', 'November''12', NULL, NULL, 'Awaiting PO', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(58, 0, '', '', '', 'CF00309', 'Closed', 'Nuffield', 'Mr. Metin (NuT) Clone', 'WP', '5.5', '506', '100% upfront', '19/11/12', '15/12/12', 'CH', 'November''12', NULL, NULL, 'PO 21038494', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(59, 0, '', '', '', 'CF00308', 'Closed', 'EES', 'Energy Powerhouse phase 1', 'IP', '60', '5520', '100% upfront', '09/11/12', '01/12/12', 'MG', 'November''12', NULL, NULL, 'P21178234R', NULL, 'Jo Collins', NULL, NULL),
(60, 0, '', '', '', 'CF00307', 'Current', 'MD&D ', 'Emerging Markets Support Bucket', 'IS', '20', '2500', 'After 1 month', '12/11/12', '12/01/13', 'JT', 'November''12', NULL, NULL, NULL, NULL, 'Matt Puplett', 'mpuplett@its.jnj.com', NULL),
(61, 0, '', '', '', 'CF00307A', 'Current', 'MD&D', 'Emerging Markets Support Bucket', 'IS', '20', '2500', '100% upfront', '28/02/2013', '28/02/2014', 'JT', 'February 2,013', NULL, NULL, 'Awaiting PO', NULL, 'Matt Puplett', 'mpuplett@its.jnj.com', NULL),
(62, 0, '', '', '', 'CF00306', 'Closed', 'Nuffield', 'Mr Bradley Microsite Clone', 'WP', '5.5', '506', '100% upfront', '06/11/12', '13/11/12', 'CH', 'November''12', NULL, NULL, 'PO200006034', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(63, 0, '', '', '', 'CF00305A', 'Closed', 'Nuffield', 'F&W Restructure - Development', 'WP', '150.29', '13826.4', '100% on completion', '26/11/12', '20/12/12', 'CH', 'November''12', NULL, NULL, 'PO200006663', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(64, 0, '', '', '', 'CF00305', 'Closed', 'Nuffield', 'F&W Restructure - Design', 'WP', '96.75', '8901', '100% upfront', '02/11/12', '17/12/12', 'CH', 'November''12', NULL, NULL, 'PO200006112', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(65, 0, '', '', '', 'CF00304', 'Closed', 'Nuffield', 'nh.com Re-skin', 'WP', '470', '42000', '50% upfront, 50% on completion', '29/10/12', '15/02/13', 'CH', 'October''12', NULL, NULL, 'PO200006112', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(66, 0, '', '', '', 'CF00303', 'Current', 'MD&D', 'EMEA Zone Maintenance 2013', 'IS', '43', '3956', 'monthly', '01/01/13', 'Ongoing', 'AL', 'October''12', NULL, NULL, NULL, NULL, 'Marlen Busacker', 'mbusacke@its.jnj.com', NULL),
(67, 0, '', '', '', 'CF00302', 'closed', 'McNeil', 'Splenda Ireland Competition', 'WP', '14', '1400', '100% upfront', '17/10/12', '25/10/12', 'JT', 'October''12', NULL, NULL, 'P21158776N', NULL, 'Maria Somalya', 'msomalya@ITS.JNJ.com', NULL),
(68, 0, '', '', '', 'CF00301', 'Current', 'ASP', 'SSG Website', 'WP', '178.5', '16422', '50% upfront, 50% on completion', '01/11/12', '20/02/13', 'AL', 'October''12', NULL, NULL, '993082589', NULL, 'Linda Gordon', 'lgordon@its.jnj.com', NULL),
(69, 0, '', '', '', 'CF00300', 'Closed', 'Novartis', 'Workshop', 'IP', '174', '16000', '20% upfront (£3200 invoiced), £1800 invoiced 13/12', '03/12/12', '30/12/12', 'RW', 'november''12', NULL, NULL, 'Awaiting PO', NULL, 'Rachel Kitchen', 'rachel-1.kitchen@novartis.com', NULL),
(70, 0, '', '', '', 'CF00299', 'Current', 'Cordis ', 'SmartTouch', 'WP', '282', '25964', '50% Upfront invoiced \n50% completion - TBD ', '08/10/12', '31/01/12', 'AL', 'September''12', NULL, NULL, 'Awaiting PO for last 50% ', NULL, 'Laurent Lagarde', 'llagarde@its.jnj.com', NULL),
(71, 0, '', '', '', 'CF00298', 'Current', 'Ethicon', 'Pure Progress Support 10 hr Bucket', 'IS', '10', '1300', 'Invoice at end of October', '24/09/12', '01/12/12', 'AL', 'September''12', NULL, NULL, 'P21142491N', NULL, 'Peter van Leeuwen', 'pvleeuwe@its.jnj.com', NULL),
(72, 0, '', '', '', 'CF00297', 'Closed', 'McNeil', 'Splenda Sweet Talk', 'WP', '15', '1500', '100% completion', '01/09/12', '18/09/12', 'AL', 'September''12', NULL, NULL, 'Awaiting PO', NULL, 'Maria Somalya', 'msomalya@its.jnj.com', NULL),
(73, 0, '', '', '', 'CF00296A', 'Current', 'Nuffield', 'Leeds Hospital Microsite - additonal hours', 'WP', '14.8', '1361.6', '100% now', '12/03/13', '12/03/13', 'CH', 'March 2013', NULL, NULL, '205000660', NULL, 'James Heal', 'james.heal@nuffieldhealth.com', NULL),
(74, 0, '', '', '', 'CF00296', 'Closed', 'Nuffield', 'Leeds Hospital Microsite', 'WP', '87', '8004', '50% upfront, 50% on completion', '18/10/12', '18/03/13', 'CH', 'October''12', NULL, NULL, '200006049', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(75, 0, '', '', '', 'CF00295B', 'Closed', 'Nuffield', 'The Vale - Header Logo', 'WP', '2.5', '230', '100% upfront', '15/11/12', '20/11/12', 'CH', 'November''12', NULL, NULL, 'Awaiting PO', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(76, 0, '', '', '', 'CF00295', 'Closed', 'Nuffield', 'The Vale - site clone', 'WP', '5.5', '506', '100% upfront', '17/09/12', '01/11/12', 'CH', 'September''12', NULL, NULL, '500005744', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(77, 0, '', '', '', 'CF00295A', 'Closed', 'Nuffield', 'The Vale - Logo work', 'WP', '2.5', '230', '100% upfront', '25/09/12', '05/10/12', 'CH', 'September''12', NULL, NULL, '500005790', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(78, 0, '', '', '', 'CF0294', 'Closed', 'Nuffield', 'Greens Gyms Redirection', 'WP', '3', '296', '100 on completion', '23/08/12', '31/08/12', 'CH', 'August''12', NULL, NULL, 'PO 200004380', NULL, 'Lisa Owen', 'Lisa.Owen@nuffieldhealth.com', NULL),
(79, 0, '', '', '', 'CF00293', 'Current', 'Nuffield', 'CRM implementation - Summary of all components (co', 'WP', '1582.5', '-', '50% on commencement of each Component and 50% on c', '17/09/12', '31/12/12', 'CH', 'August''12', NULL, NULL, '200005853', NULL, 'Claire Myerson / Stan Baldwin', 'stan.baldwin@nuffieldhealth.com', NULL),
(80, 0, '', '', '', 'CF00293A', 'Current', 'Nuffield', 'Component One - Portal Prototyping & Design Proces', 'WP', '502.5', '46230', '50% on commencement, 50% on completion', '17/09/12', 'TBC', 'CH', 'August''12', NULL, NULL, '200005853', NULL, 'Claire Myerson / Stan Baldwin', 'stan.baldwin@nuffieldhealth.com', NULL),
(81, 0, '', '', '', 'CF00293B', 'Current', 'Nuffield', 'Salesforce integration & basic data display', 'WP', '442.5', '40710', '50% on commencement, 50% on completion', 'TBC', 'TBC', 'CH', 'August''12', NULL, NULL, '200005853', NULL, 'Claire Myerson / Stan Baldwin', 'stan.baldwin@nuffieldhealth.com', NULL),
(82, 0, '', '', '', 'CF00293C', 'Current', 'Nuffield', 'Improved Consultant data display & functionality o', 'WP', '367.5', '33810', '50% on commencement, 50% on completion', 'TBC', 'TBC', 'CH', 'August''12', NULL, NULL, '200005853', NULL, 'Claire Myerson / Stan Baldwin', 'stan.baldwin@nuffieldhealth.com', NULL),
(83, 0, '', '', '', 'CF00293D', 'Current', 'Nuffield', 'Single Sign on capability with nh.com', 'WP', '97.5', '8970', '50% on commencement, 50% on completion', 'TBC', 'TBC', 'CH', 'August''12', NULL, NULL, '200005853', NULL, 'Claire Myerson / Stan Baldwin', 'stan.baldwin@nuffieldhealth.com', NULL),
(84, 0, '', '', '', 'CF00293E', 'Current', 'Nuffield', 'Conversion Optimisation Consultancy', 'WP', '172.5', '5280', '50% on commencement, 50% on completion', 'TBC', 'TBC', 'CH', 'August''12', NULL, NULL, '200005853', NULL, 'Claire Myerson / Stan Baldwin', 'stan.baldwin@nuffieldhealth.com', NULL),
(85, 0, '', '', '', 'CF00292A', 'Closed', 'Nuffield', 'Healthscore Microsite - CSS Changes', 'WP', '3', '276', '100% upfront', '04/10/12', '10/10/12', 'CH', 'October''12', NULL, NULL, 'PO 2000005954', NULL, 'Kate Barker', 'kate.barker@nuffieldhealth.com', NULL),
(86, 0, '', '', '', 'CF00292', 'Closed', 'Nuffield', 'Healthscore Microsite (static pages)', 'WP', '89', '8199.5', '100% upfront', '05/09/12', '30/09/12', 'AL', 'August''12', NULL, NULL, 'PO 200005840 & PO 200005835', NULL, 'Kate Barker', 'kate.barker@nuffieldhealth.com', NULL),
(87, 0, '', '', '', 'CF00291', 'Closed', 'MD&D', 'Craig McClaren blog', 'IP', '16', '1500', '100 on completion', '03/09/12', '15/09/12', 'JS', 'August''12', NULL, NULL, 'coming', NULL, 'Rhodora Sepetran', 'rgsepetr@its.jnj.com', NULL),
(88, 0, '', '', '', 'CF00290', 'Closed', 'Nuffield', 'Yorkshire Pelvic Floor Clinic Microsite Clone', 'WP', 'n/a', '506', '100% upfront', '23/10/12', '23/11/12', 'CH', 'August''12', NULL, NULL, 'PO: 200005642', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(89, 0, '', '', '', 'CF00289', 'Closed', 'Nuffield', '/Brand Microsite', 'WP', '4.25', '391', '100% upfront', '17/08/12', '31/08/12', 'CH', 'August''12', NULL, NULL, 'PO: 200005630', NULL, 'Ben King', 'ben.king@nuffieldhealth.com', NULL),
(90, 0, '', '', '', 'CF00288', 'Closed', 'Nuffield', 'Consultant Microsite Mobile Design', 'WP', 'n/a', '7360', '100% upfront', '02/08/12', '19/09/12', 'CH', 'August''12', NULL, NULL, 'PO: 200005546', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(91, 0, '', '', '', 'CF00287', 'Cancelled', 'Nuffield', 'Charitable mission IA and Design', 'IP', NULL, '49500', '50/50', '10/09/12', '10/10/12', 'AL', 'August''12', NULL, NULL, NULL, NULL, 'Dr Davina Deniszczyc ', 'Davina.deniszczyc@nuffieldhealth.com / 0782 505 22', NULL),
(92, 0, '', '', '', 'CF00286', 'Closed', 'Nuffield', 'Healthscore Visualisation Work', 'WP', '80.5', '7406', 'Upfront', '01/08/12', '31/08/12', 'CH', 'July''12', NULL, NULL, 'Awaiting PO', NULL, 'Kate Barker', 'kate.barker@nuffieldhealth.com', NULL),
(93, 0, '', '', '', 'CF00285', 'closed', 'Nuffield', 'Sharepoint configuration for Claire Myerson', 'IP', '13', '828', 'Upfront', '24/11/12', '27/07/12', 'JS', 'July''12', NULL, NULL, NULL, NULL, 'Stan Baldwin', NULL, NULL),
(94, 0, '', '', '', 'CF00284', 'Closed', 'Nuffield', 'Extranet workshop - SharePoint infrastructure cons', 'IP', '7.5', '850', 'Upfront', '20/07/12', '20/07/12', 'CH', 'July''12', NULL, NULL, '200005567', NULL, 'Claire Myerson', NULL, NULL),
(95, 0, '', '', '', 'CF00283', 'Closed', 'RSSB', 'RRUK-A website', 'WP', '261', '23093.38', 'Invoice 1: £5,303.34 (After wireframes & reqs). In', '18/07/12', '24/10/12', 'JS', 'July''12', NULL, NULL, 'PO105255', NULL, 'Nailah Fraser-Haynes', 'Nailah.Fraser-Haynes@rssb.co.uk', NULL),
(96, 0, '', '', '', 'CF00282', 'Cancelled', 'ASP', 'CleanCurve Microsite', 'IP', 'N/A', '18000', 'TBC', '03/07/12', '15/09/12', 'AL', 'June''12', NULL, NULL, NULL, NULL, 'Crispin Graham', NULL, NULL),
(97, 0, '', '', '', 'CF00281', 'Closed ', 'Visioncare', 'Learning Journey', 'IP', 'N/A', '35002', '50% upfront\n50% ?', '11/06/12', '31/08/12', 'AL', 'June''12', NULL, NULL, '4500141378', NULL, 'Dan De Costa', 'ddecosta@its.jnj.com', NULL),
(98, 0, '', '', '', 'CF00281a', 'Closed', 'Visioncare', 'Learning Journey - Managerial view and bespoke fun', 'IP', 'N/A', '13064', '100% upfront', '23/07/12', '30/09/12', 'AL', 'July''12', NULL, NULL, 'Awaiting PO', NULL, 'Dan De Costa', 'ddecosta@its.jnj.com', NULL),
(99, 0, '', '', '', 'CF00281b', 'Closed', 'Visioncare', 'Learning Journey WICO OOS', 'IP', '54', '4968', 'Invoice 100% up front once PO received', '01/11/12', '30/11/12', 'SR', 'November''12', NULL, NULL, 'Awaiting PO', NULL, 'Anna Shaw/Janice Dody', NULL, NULL),
(100, 0, '', '', '', 'CF00280', 'Closed', 'Nuffield', 'Charitable mission mock ups', 'WP', 'N/A', '3000', '100% upfront', '01/06/12', '18/06/12', 'AL', 'June''12', NULL, NULL, '200005095', NULL, 'Claire Myerson', NULL, NULL),
(101, 0, '', '', '', 'CF00279', 'Closed', 'Frontera', 'Shire Replagal Intranet', 'IP', 'N/A', '15,000.00', '50/50', '01/06/12', '30/09/12', 'AL', 'May''12', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 0, '', '', '', 'CF00278', 'Closed', 'MD&D', 'MD&D EHS intranet IA design', 'IP', '57', '5232', '100% up front', '15/08/12', '01/11/12', 'John', 'May''12', NULL, NULL, NULL, NULL, 'Ken Robertshaw', NULL, NULL),
(103, 0, '', '', '', 'CF00278a', 'Current', 'MD&D', 'MD&D EHS intranet build', 'IP', '100', '9166', '100% up front', '15/01/13', '01/04/13', 'John', 'May''12', NULL, NULL, NULL, NULL, 'Ken Robertshaw', NULL, NULL),
(104, 0, '', '', '', 'CF00277', 'Closed', 'DePuy', 'DePuy intranet branding changes', 'IP', '16', '1,472.00', '100% on completion', '28/05/12', '15/06/12', 'John', 'May''12', NULL, NULL, 'Awaiting', NULL, 'Chris Mann', NULL, NULL),
(105, 0, '', '', '', 'CF00276', 'Pending', 'J&J Aveeno', '2012 Discovers support', 'WS', '84', '10,618.00', 'TBC', '01/06/12', '31/12/12', 'Sam', 'May''12', NULL, NULL, 'Awaiting', NULL, 'Claire Domoney', 'cdomoney@ITS.JNJ.com', NULL),
(106, 0, '', '', '', 'CF00276a', 'Current', 'J&J Aveeno', '2012 Redesign', 'WS', '98', '8,096.00', 'TBC', '12/08/12', '01/09/12', 'Sam', 'May''12', NULL, NULL, 'P21090448R', NULL, 'Claire Domoney', 'cdomoney@ITS.JNJ.com', NULL),
(107, 0, '', '', '', 'CF00276b', 'Current', 'J&J Aveeno', 'Copy Writing', 'WS', '40', '3,680.00', 'TBC', '12/08/12', '01/09/12', 'Sam', 'May''12', NULL, NULL, 'P21090449R', NULL, 'Claire Domoney', 'cdomoney@ITS.JNJ.com', NULL),
(108, 0, '', '', '', 'CF00276c', 'Current', 'J&J Aveeno', 'Newsletters 2012', 'WS', '36', '3,312.00', 'TBC', '12/08/12', '31/12/12', 'Sam', 'May''12', NULL, NULL, 'P21090447R', NULL, 'Claire Domoney', 'cdomoney@ITS.JNJ.com', NULL),
(109, 0, '', '', '', 'CF00276d', 'Pending', 'J&J Aveeno', 'Recruitment Strategy Drive', 'WS', '50', '4,600.00', 'TBC', '12/08/12', '01/10/12', 'Sam', 'May''12', NULL, NULL, 'Awaiting', NULL, 'Claire Domoney', 'cdomoney@ITS.JNJ.com', NULL),
(110, 0, '', '', '', 'CF00275', 'Current', 'Nuffield', 'Technical support', 'WS', 'na', '5,200.00', '100% upfront, Monthly', '01/06/12', '31/05/13', 'Caroline', 'May''12', NULL, NULL, 'May PO 200007231 is for £5650 April PO 200007166 i', NULL, 'Paul Baldwin', 'paul.baldwin@nuffieldhealth.com', NULL),
(111, 0, '', '', '', 'CF00274', 'Pending ', 'Lewisham College', 'Lewisham College intranet', 'IP', '770', '65,000.00', '50/50', '17/09/12', '31/12/12', 'John', 'May''12', NULL, NULL, NULL, NULL, 'Daveena Dowlul', NULL, NULL),
(112, 0, '', '', '', 'CF00273', 'Closed', 'RSSB', 'RSSB opsweb intake', 'WP', '57', '5214.5', '100% on completion', '18/05/12', '01/06/12', 'John', 'May''12', NULL, NULL, 'No PO', NULL, 'Susan Cassidy ', 'susan.cassidy@rssb.co.uk', NULL),
(113, 0, '', '', '', 'CF00272', 'Current', 'RSSB', 'RSSB Email templates', 'WP', '59', '5,367.00', '100% on completion', '15/08/12', '15/09/12', 'John', 'May''12', NULL, NULL, '105154', NULL, 'Susan Cassidy ', 'susan.cassidy@rssb.co.uk', NULL),
(114, 0, '', '', '', 'CF00271', 'Current', 'RSSB', 'RSSB Asset DB', 'WP', '221', '20,263.00', '50 half way, 50 on completion', '30/03/13', '30/04/13', 'John', 'May''12', NULL, NULL, '105154', NULL, 'Susan Cassidy ', 'susan.cassidy@rssb.co.uk', NULL),
(115, 0, '', '', '', 'CF00270', 'Current', 'RSSB', 'RSSB review and recommendations', 'WP', '187', '17,172.72', '50 half way, 50 on completion', '15/07/12', '15/08/12', 'John', 'May''12', NULL, NULL, '105154', NULL, 'Susan Cassidy ', 'susan.cassidy@rssb.co.uk', NULL),
(116, 0, '', '', '', 'CF00269', 'Current', 'RSSB', 'RSSB Support (2 years)', 'WS', '40', '3,622.50', 'monthly in arrears on the last day of the month', '01/06/12', '30/05/14', 'John', 'May''12', NULL, NULL, '105154', NULL, 'Susan Cassidy ', 'susan.cassidy@rssb.co.uk', NULL),
(117, 0, '', '', '', 'CF00268', 'Closed', 'GSK', 'Innovation fund', 'IP', '165', '15,000.00', '50/50', '01/06/12', '01/07/12', 'John', 'May''12', NULL, NULL, '364498', NULL, NULL, NULL, NULL),
(118, 0, '', '', '', 'CF00267', 'Current', 'Ethicon ', 'US intranet bucket', 'IS', '30', '3,600.00', '100% upfront', '21/05/12', '31/12/12', 'JT', 'May''12', NULL, NULL, '992981236', NULL, 'Lindsay Froelich', 'lFroelic@its.jnj.com', NULL),
(119, 0, '', '', '', 'CF00266', 'Closed', 'Nuffield', 'CRM High Level Design', 'WP', '88', '8,096.00', '(£8,096 is the total for 3 months) Monthly in arre', '17/05/12', '31/08/12', 'Caroline', 'May''12', NULL, NULL, '200005099', NULL, 'Justin Ward', 'justin.ward@nuffieldhealth.com', NULL),
(120, 0, '', '', '', 'CF00265', 'Current', 'McNeil', 'Benecol UK support', 'WS', '12', '1,200.00', 'Quarterly upfront', '01/06/12', '31/05/13', 'JT', 'May''12', NULL, NULL, 'PR1989186', NULL, 'Sara Harrison', 'sharri38@ITS.JNJ.com', NULL),
(121, 0, '', '', '', 'CF00264', 'Closed', 'Visioncare', 'SalesVue Intranet', 'IP', 'n/a', '25,898.00', '50/TBC/TBC', '10/05/12', '10/05/12', 'Alice', 'May''12', NULL, NULL, '4500139264', NULL, 'Janice Dody', 'jdody@its.jnj.com', NULL),
(122, 0, '', '', '', 'CF00264a', 'Closed', 'Visioncare', 'SalesVue 20hr Bucket', 'IP', '20', '2,500.00', '100& upfront', '20/08/12', '30/08/12', 'Sam', 'August''12', NULL, NULL, NULL, NULL, 'Janice Dody', NULL, NULL),
(123, 0, '', '', '', 'CF00263', 'Closed', 'Nuffield', 'Health Map & BMI calculator', 'WP', 'n/a', '3,956.00', '100& upfront', '10/05/12', '15/06/12', 'Caroline', 'May''12', NULL, NULL, '200004920', NULL, 'Ben King', 'ben.king@nuffieldhealth.com', NULL),
(124, 0, '', '', '', 'CF00262', 'Closed', 'Nuffield', 'IT Service Desk landing page', 'WP', '66.75', '6,141.00', '100 upfront', '08/05/12', '16/05/12', 'Caroline', 'May''12', NULL, NULL, '200004893 & 200005100', NULL, 'Steve Denning', 'steve.denning@nuffieldhealth.com', NULL),
(125, 0, '', '', '', 'CF00261', 'Closed', 'Ethicon', 'Fosbury to Pure Progress', 'IP', '35', '3,220.00', '100% on completion', '15/05/12', '10/06/12', 'JT', 'May''12', NULL, NULL, 'P21063469N', NULL, 'Peter van Leeuwen', 'pvleeuwe@its.jnj.com', NULL),
(126, 0, '', '', '', 'CF00260', 'Closed', 'Nuffield', 'Physiotherapy Network', 'WP', 'n/a', '5,946.50', '100% upfront', '02/05/12', '31/05/12', 'Caroline', 'May''12', NULL, NULL, 'PO 200004854', NULL, 'Stephen Hurley', 'stephen.hurley@nuffieldhealth.com', NULL),
(127, 0, '', '', '', 'CF00259', 'Closed', 'Nuffield', 'IA & Design Consultancy for Quentiq (Healthscore I', 'WP', '760', '8,740.00', 'Monthly in arrears', '09/05/12', '31/12/12', 'Caroline', 'May''12', NULL, NULL, '200005223', NULL, 'Catherine McDonald', 'catherine.mcdonald@nuffieldhealth.com', NULL),
(128, 0, '', '', '', 'CF00258', 'Closed', 'Nuffield', 'Nuffield Extranet IA and Design', 'IP', '945', '87, 000', '50% upfront', '08/05/12', '14/12/12', 'Caroline', 'May''12', NULL, NULL, '500005172', NULL, 'Toby Voss', 'toby.voss@nuffieldhealth.com', NULL),
(129, 0, '', '', '', 'CF00257', 'Closed', 'Nuffield', 'Interim Technical Support - May', 'WS', 'n/a', '5,200.00', '100% upfront', '01/05/12', '31/05/12', 'Caroline', 'May''12', NULL, NULL, 'Awaiting PO ', NULL, 'Paul Baldwin', 'paul.baldwin@nuffieldhealth.com', NULL),
(130, 0, '', '', '', 'CF00256', 'Current', 'Ethicon ', 'Omrix Build', 'IP', '85', '7,820.00', '100% upfront', '07/05/12', '01/06/12', 'JT', NULL, NULL, NULL, 'Awaiting PO ', NULL, 'Lindsay Froelich', 'LFroelic@its.jnj.com', NULL),
(131, 0, '', '', '', 'CF00255', 'Current', 'J&J Compeed', 'Compeed BE assets', 'WP', '1', '106.25', '100% upfront', '17/04/12', '17/04/12', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 0, '', '', '', 'CF00254', 'Closed', 'B&L', 'Online Booking System', 'WP', '49.5', '4,554.00', '100% upfront', '13/04/12', '20/04/00', 'JT', NULL, NULL, NULL, 'Awaiting PO', NULL, 'Darren Hancock', NULL, NULL),
(133, 0, '', '', '', 'CF00253', 'Current', 'Cordis', 'Cardiovascular care banner design', 'IS', '9', '828.00', '100% upfront', '01/03/12', '01/05/12', 'JT', NULL, NULL, NULL, 'P21038065N', NULL, 'Laurence Hazard', 'lhazard@its.jnj.com', NULL),
(134, 0, '', '', '', 'CF00252', 'Closed', 'Nuffield', 'HSSU', 'WP', '74.75', '6,877.00', '100% upfront', '15/04/12', '10/02/13', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(135, 0, '', '', '', 'CF00251', 'Closed', 'Nuffield', 'Olympics', 'WP', '53', '5,000.00', '100% upfront', '15/04/12', '30/06/12', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Nicola Bamford', NULL, NULL),
(136, 0, '', '', '', 'CF00250', 'closed', 'MD&D', 'Staffan''s Blog', 'IP', '45', '4,140.00', '100% on completion', '02/04/12', '13/04/12', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 0, '', '', '', 'CF00249', 'Current', 'EES ', 'EES EMEA website maintenance', 'WS', '24', '2,208.00', 'Monthly in arrears', '04/04/12', '03/010/2012', 'Alice', NULL, NULL, NULL, 'P21037400R', NULL, 'Marlen Busacker', NULL, NULL),
(138, 0, '', '', '', 'CF00249a', 'Current', 'EES', 'EES EMEA website support contract', 'WS', '15', '1380', '100% upfront', '01/0213', '01/05/13', 'JT', 'January''13', NULL, NULL, 'Awaiting PO', NULL, 'Marlen Busacker', 'MBusacke@its.JNJ.com', NULL),
(139, 0, '', '', '', 'CF00248', 'Current', 'McNeil', 'Splenda Italy Migration', 'WP', '15.25', '1,403.00', '100% upfront', '02/04/12', '30/04/12', 'JT', NULL, NULL, NULL, NULL, NULL, 'Patricia Mead', 'pmead@its.jnj.com', NULL),
(140, 0, '', '', '', 'CF00248A', 'Current', 'McNeil', 'Splenda Italy Migration content support', 'WP', '10', '920.00', '100% upfront', '02/04/12', '04/05/12', 'JT', 'April''12', NULL, NULL, NULL, NULL, 'Patricia Mead', 'pmead@its.jnj.com', NULL),
(141, 0, '', '', '', 'CF00247', 'Closed', 'Nuffield', 'Multisite Capabilities', 'WP', 'N/A', '8,050.00', '100% upfront', '01/05/12', '31/05/12', 'Caroline', 'February''12', NULL, NULL, 'PO 200004380', NULL, 'Ryan Wheaton', 'ryan.wheaton@nuffieldhealth.com', NULL),
(142, 0, '', '', '', 'CF00246', 'Current', 'EES ', '20 hours support bucket', 'IS', '20', '2,500.00', '100% upfront', '20/03/12', '20/03/13', 'John', NULL, NULL, NULL, NULL, NULL, 'Marlen Busacker', NULL, NULL),
(143, 0, '', '', '', 'CF00245', 'Current', 'Cordis', 'BSW product updates', 'IP', '27', '2,500.00', '100% upfront', '16/03/12', '30/04/12', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard', NULL, NULL),
(144, 0, '', '', '', 'CF00244', 'Closed', 'Nuffield', 'GP Events Form (5hrs)', 'WP', '5', '460.00', '100% upfront', '13/03/12', '14/03/12', 'Caroline', 'February''12', NULL, NULL, 'PO 20004445', NULL, 'Carolyn Emms', 'carolyn.emms@nuffieldhealth.com', NULL),
(145, 0, '', '', '', 'CF00243', 'Closed', 'Nuffield', 'Interim Technical Support - April', 'WS', 'N/A', '5,200.00', '100% upfront', '01/04/12', '30/04/2012', 'Caroline', 'March''12', NULL, NULL, NULL, NULL, 'Paul Baldwin', 'paul.baldwin@nuffieldhealth.com', NULL),
(146, 0, '', '', '', 'CF00242', 'Cancelled', 'Nuffield', 'Cookie Law Design & Testing', 'WP', '91.5', '8, 418', '100% upfront', '12/04/12', '21/05/12', 'Caroline', NULL, NULL, NULL, NULL, NULL, 'Stephen Hurley', 'stephen.hurley@nuffieldhealth.com', NULL),
(147, 0, '', '', '', 'CF00241', 'Closed', 'Nuffield', 'Forms Rebuild', 'WP', '99', '9,196.00', '100% upfront', '20/03/12', '30/04/2012', 'Caroline', 'February''12', NULL, NULL, 'PO 200004380', NULL, 'Stephen Hurley', 'stephen.hurley@nuffieldhealth.com', NULL),
(148, 0, '', '', '', 'CF00240', 'Current', 'Cordis', 'Crack the code campaign', 'IP', '35', '2,995.00', '100% upfront', '19/03/12', '31/05/12', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard', NULL, NULL),
(149, 0, '', '', '', 'CF00239', 'Closed', 'J&J Compeed', 'Flash amends', 'WP', '2', '212.50', '100% upfront', '01/03/12', '01/03/12', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 0, '', '', '', 'CF00238', 'Current', 'MD&D', 'HCC Support Bucket 10 hrs', 'IS', '10', '1,300.00', '100% upfront', '21/02/12', '06/01/12', 'James T', NULL, NULL, NULL, 'P21006590N', NULL, 'Elaine Murphy', 'EMURPHY@its.jnj.com', NULL),
(151, 0, '', '', '', 'CF00237', 'Closed', 'MD&D', 'Proj Brave Prof Ed Training Deck', 'WS', '1', '184.00', '100% upfront', '07/02/12', '14/02/12', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Matt Puplett', NULL, NULL),
(152, 0, '', '', '', 'CF00236', 'Current', 'J&J Roc', 'Tangent Costs', 'WP', 'N/A', '3,300.00', '100% upfront', '17/02/2012', '31/03/2012', 'Sam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 0, '', '', '', 'CF00235', 'Closed', 'Nuffield', 'Interim Technical Support - March', 'WS', 'N/A', '5,200.00', '100% upfront', '01/03/12', '31/03/2012', 'Caroline', 'February''12', NULL, NULL, 'PO 200004399', NULL, 'Paul Baldwin', 'paul.baldwin@nuffieldhealth.com', NULL),
(154, 0, '', '', '', 'CF00234', 'Closed', 'Nuffield', 'Consultant Microsite', 'WP', '305', '28,060.00', '50% upfront, 50% on completion', '25/04/12', '30/06/12', 'Caroline', 'April''12', NULL, NULL, '2nd PO: 200005316', NULL, 'Lisa Todd', 'lisa.todd@nuffieldhealth.com', NULL),
(155, 0, '', '', '', 'CF00233', 'Cancelled', 'Nuffield', 'Consultant Database (Initial 60 hrs)', 'WP', '60', 'TBC', 'TBC', '01/05/12', '31/07/12', 'Caroline', NULL, NULL, NULL, NULL, NULL, 'Sam Taylor', 'sam.taylor@nuffieldhealth.com', NULL),
(156, 0, '', '', '', 'CF00232N', 'Current', 'Nuffield', 'March Retainer Hours', 'WP', '58.8', '5409.6', '100% now', '01/03/13', '31/03/13', 'Caroline', 'March 2013', NULL, NULL, 'Awaiting PO', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(157, 0, '', '', '', 'CF00232M', 'Closed', 'Nuffield', 'February Retainer Hours', 'WP', '79.2', '7286.4', '100% now', '01/02/13', '28/02/13', 'Caroline', 'February ''13', NULL, NULL, '200007203', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(158, 0, '', '', '', 'CF00232L', 'Closed', 'Nuffield', 'January Retainer Hours', 'WP', '39.35', '3620.2', '100% now', '01/01/13', '31/01/13', 'Caroline', 'January ''13', NULL, NULL, 'Awaiting PO', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(159, 0, '', '', '', 'CF00232K', 'Closed', 'Nuffield', 'December Retainer Hours', 'WP', '5.8', '533.6', '100% now', '01/12/12', '31/12/12', 'Caroline', 'December''12', NULL, NULL, 'PO 200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(160, 0, '', '', '', 'CF00232J', 'Closed', 'Nuffield', 'November Retainer Hours', 'WP', '15.1', '1389.2', '100% now', '01/11/12', '30/11/12', 'Caroline', 'November''12', NULL, NULL, 'PO 200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(161, 0, '', '', '', 'CF00232I', 'Closed', 'Nuffield', 'October Retainer Hours', 'WP', '14.25', '1311', '100% now', '01/10/12', '31/10/12', 'Caroline', 'October''12', NULL, NULL, 'PO 200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(162, 0, '', '', '', 'CF00232H', 'Closed', 'Nuffield', 'September Retainer Hours', 'WP', '6.2', '570.4', '100%', '01/09/12', '30/09/12', 'Caroline', 'September''12', NULL, NULL, 'PO 200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(163, 0, '', '', '', 'CF00232G', 'Closed', 'Nuffield', 'August Retainer Hours', 'WP', '107', '9844', '100% now', '01/08/12', '31/08/12', 'Caroline', 'August''12', NULL, NULL, 'PO 200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(164, 0, '', '', '', 'CF00232F', 'Closed', 'Nuffield', 'July Retainer Hours', 'WP', '100.25', '9223', '100% now', '01/07/12', '31/07/12', 'Caroline', 'July''12', NULL, NULL, 'PO 200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(165, 0, '', '', '', 'CF00232E', 'Closed', 'Nuffield', 'June Retainer Hours', 'WP', '54.25', '4991', '100% now', '01/06/12', '30/06/12', 'Caroline', 'June''12', NULL, NULL, 'PO 200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(166, 0, '', '', '', 'CF00232D', 'Closed', 'Nuffield', 'May Retainer Hours', 'WP', '49.25', '4312.11', 'Monthly in arrears', '01/05/12', '31/05/12', 'Caroline', 'May''12', NULL, NULL, '200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(167, 0, '', '', '', 'CF00232C', 'Closed', 'Nuffield', 'April Retainer Hours', 'WS', '86.5', '7,958.00', '100% now', '01/04/12', '30/04/12', 'Caroline', 'April''12', NULL, NULL, 'PO 200004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(168, 0, '', '', '', 'CF00232B', 'Closed', 'Nuffield', 'March hours', 'WS', '46.5', '4,278.00', '100% now', '01/03/12', '31/03/12', 'Caroline', 'March''12', NULL, NULL, 'PO20004380', NULL, 'Solomon Degia', 'solomon.degia@nuffieldhealth.com', NULL),
(169, 0, '', '', '', 'CF00232A', 'Closed', 'Nuffield', 'January Wash Up 125.25 hrs', 'WS', '125.25', '11,546.00', '100% upfront', '03/01/12', '31/01/2012', 'Caroline', 'January''12', NULL, NULL, NULL, NULL, 'Ryan Wheaton', 'ryan.wheaton@nuffieldhealth.com', NULL),
(170, 0, '', '', '', 'CF00232', 'Current', 'Nuffield', 'Nuffield health maintenance contract (hrs yet inkn', 'WS', 'N/A', '43,197.00', 'Monthly from July to December in arrears', '13/03/2012', '31/12/12', 'Caroline', 'January''12', NULL, NULL, NULL, NULL, 'Sam Taylor', 'sam.taylor@nuffieldhealth.com', NULL),
(171, 0, '', '', '', 'CF00231', 'Closed', 'Nuffield', 'Interim Technical Support', 'WS', 'N/A', '5,200.00', '100% upfront', '01/02/12', '29/02/2012', 'Caroline', 'January''12', NULL, NULL, '200004199', NULL, 'Paul Baldwin', 'paul.baldwin@nuffieldhealth.com', NULL),
(172, 0, '', '', '', 'CF00230', 'Closed', 'Compeed', 'Image amendments (2hrs)', 'WP', '2', '184.00', '100% upfront', '26/01/12', '31/01/12', 'Caroline', 'January''12', NULL, NULL, 'P20985253N', NULL, 'Laura Kawulycz', 'lkawulyc@its.jnj.com', NULL),
(173, 0, '', '', '', 'CF00230A', 'Closed', 'Compeed', 'Image amendments (2hrs)', 'WP', '2', '184.00', '100% upfront', '21/02/12', '22/02/12', 'Caroline', 'February''12', NULL, NULL, NULL, NULL, 'Laura Kawulycz', NULL, NULL),
(174, 0, '', '', '', 'CF00229', 'Current', 'Codigital', 'Design changes', 'WP', '21', '2,000.00', '100% on completion (2012)', '01/02/12', '05/02/12', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 0, '', '', '', 'CF00228', 'Current', 'EES UK profed', 'Prof ed intranet for EES UK 91 hrs', 'IP', '91', '8,372.00', '100% upfront', '16/1/2012', '15/3/2012', 'JT', NULL, NULL, NULL, 'P20979057R ', NULL, 'Shelley Hawkins', NULL, NULL),
(176, 0, '', '', '', 'CF00227', 'Closed', 'Nuffield Health', 'February Hours 26.25', 'WP', '26.25', '2,415.00', '100% on 29.02', '01.02.12', '29.02.12', 'Caroline', 'February''12', NULL, NULL, 'PO 200004146', NULL, 'Ryan Wheaton', 'ryan.wheaton@nuffieldhealth.com', NULL),
(177, 0, '', '', '', 'CF00226', 'Current', 'Compeed Nordics', 'Localise some assets', 'WP', '6', '650.00', '100% on completion (2012)', '01/01/12', '01/01/12', 'John', NULL, NULL, NULL, 'PO 28103858', NULL, NULL, NULL, NULL),
(178, 0, '', '', '', 'CF00225', 'Current', 'EES UK', 'Training for posting features', 'IP', '9', '828.00', '100% upfront', '21/12/11', '03/01/12', 'James T', NULL, NULL, NULL, NULL, NULL, 'Jo Collins-Watkins', NULL, NULL),
(179, 0, '', '', '', 'CF00224', 'Closed', 'Nuffield Health', 'Nuffield Health Interim support for website', 'WS', 'N/A', '5,200.00', '100% upfront', '21/12/11', '01/02/12', 'Dan H', 'December''11', NULL, NULL, NULL, NULL, 'Claire Myerson', NULL, NULL),
(180, 0, '', '', '', 'CF00223', 'Closed', 'Compeed PT', 'Localise some flash files', 'WP', '3.5', '372.50', '100% on completion (2012)', '13/01/12', '15/1/12', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 0, '', '', '', 'CF00222', 'Closed', 'ASP', 'December eBlast 6 hrs', 'WP', '6', '552.00', '100% upfront', '13/12/2011', '16/12/2011', 'Sam', NULL, NULL, NULL, '2011-140', NULL, 'Karin Hasselstrom / Nathalie Chevre', 'khassels@its.jnj.com; nchevre@its.jnj.com', NULL),
(182, 0, '', '', '', 'CF00221', 'Current', 'ASP', 'ASP Mailing List', 'WP', 'N/A', '3,000.00', '100% upfront', '12/09/11', 'TBC', 'James', NULL, NULL, NULL, '2011-138', NULL, 'Karin Hasselstrom / Nathalie Chevre', 'khassels@its.jnj.com; nchevre@its.jnj.com', NULL),
(183, 0, '', '', '', 'CF00220', 'Current', 'EES UK', 'EES UK Maintenance  (8 hrs per month)', 'IS', '8', '960.00', 'Monthly in arrears', '01/01/12', '31/12/2012', 'James', NULL, NULL, NULL, NULL, NULL, 'Jo Collins-Watkins', NULL, NULL),
(184, 0, '', '', '', 'CF00219', 'Closed', 'Ethicon Products', 'Fosbury Maintenance Bucket 20 hrs', 'IS', '20', '2,500.00', '100% upfront - delay invoice until 2012', '01/12/11', '31/03/12', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Peter Van Leeuwen', NULL, NULL),
(185, 0, '', '', '', 'CF00219A', 'Cancelled', 'Ethicon Products', 'Fosbury Maintenance Monthly Support', 'IS', '12', '1,200.00', 'Monthly in arrears', 'TBC', 'TBC', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Peter Van Leeuwen', 'pvleeuwe@its.jnj.com', NULL),
(186, 0, '', '', '', 'CF00218', 'current', 'Cordis', '.com Site design', 'WP', 'N/A', '9,292.00', '100% upfront', '01/11/11', '31/01/2012', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Tracey Dawe', NULL, NULL),
(187, 0, '', '', '', 'CF00217', 'current', 'Bausch + Lomb', 'Forms Module', 'WP', 'N/A', '3,760.00', '100% upfront', '25/11/11', '28/02/12', 'Alice', NULL, NULL, NULL, '18832', NULL, 'Darren Hancock', NULL, NULL),
(188, 0, '', '', '', 'CF00216', 'Closed', 'Nuffield Health', 'VI Portal workshop', 'WP', '36', '3,825.00', '100% upfront', '21/11/11', '21/11/11', 'Dan', NULL, NULL, NULL, NULL, NULL, 'Christopher Musgrave-Brown', NULL, NULL),
(189, 0, '', '', '', 'CF00215', 'Closed', 'ASP GLOSAIR', 'GLOSAIR Newsletter template', 'WP', 'N/A', '4,500.00', '100% upfront', '18/11/2011', '19/12/2011', 'Sam', NULL, NULL, NULL, '2011-129', NULL, 'Karin Hasselstrom', 'khassels@its.jnj.com', NULL),
(190, 0, '', '', '', 'CF00214', 'Current', 'Ethicon EMEA ', 'Intranet support Nov 2011', 'IS', 'N/A', '12,500.00', '100% up front', '11/07/11', '02/02/12', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Francesca Demartino', NULL, NULL),
(191, 0, '', '', '', 'CF00213', 'Current', 'ASP', 'Brand Hub', 'WP', 'N/A', '7,500.00', '100% up front', '19/04/12', '23/04/12', 'Alice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 0, '', '', '', 'CF00213B', 'Current', 'ASP', 'US site improvements', 'WP', 'N/A', '55,982.00', '50/50', '09/04/12', '31/12/12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 0, '', '', '', 'CF00212', 'Current', 'Cordis', 'Site audit', 'WP', 'N/A', '9,000.00', '100% up front', '11/10/11', '31/12/11', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Tracey Hazard', NULL, NULL),
(194, 0, '', '', '', 'CF00213C', 'Current', 'ASP', 'US site improvements - OOS', 'WP', 'N/A', '1,500.00', '100% up front', '16/10/12', '01/11/12', 'Sam', 'October''12', NULL, NULL, NULL, NULL, 'Catherine Hong', NULL, NULL),
(195, 0, '', '', '', 'CF00213D', 'Current', 'ASP', 'US website tasks', 'WP', 'N/A', '£ 18,991.00', '100% up front', '01/12/12', 'TBC', 'Sam', 'December''12', NULL, NULL, '992989170', NULL, 'Catherine Hong', NULL, NULL),
(196, 0, '', '', '', 'CF00211', 'Current', 'Bausch + Lomb', 'Bausch + Lomb Maintenance 2012', 'WS', '16', '19,200.00', '100% up front', '01/01/12', '31/12/2012', 'Sam', NULL, NULL, NULL, NULL, NULL, 'Darren Hancock', NULL, NULL),
(197, 0, '', '', '', 'CF00211A', 'Current', 'Bausch + Lomb', 'Bausch + Lomb Maintenance Extra Hours 2012', 'WS', '60', '6,357.00', '100% up front', '01/05/12', '31/12/12', 'JT', NULL, NULL, NULL, '19431', NULL, 'Darren Hancock', NULL, NULL),
(198, 0, '', '', '', 'CF00211B', 'Current', 'B&L', 'Bausch + Lomb Maintenance 2013', 'IS', '192', '19200', 'TBC', '01/01/13', '31/12/13', 'JT', 'January''13', NULL, NULL, 'TBC', NULL, 'Darren Hancock', NULL, NULL),
(199, 0, '', '', '', 'CF00210', 'Closed', 'Ethicon US', 'Ops Dev Brag Blog', 'IP', '5', '531.25', '100% up front ', '01/11/11', '30/11/2011', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Lindsay Froelicj', NULL, NULL),
(200, 0, '', '', '', 'CF00209B', 'Current', 'GSK', 'Biosphere rebranding', 'IP', '10', '920.00', '100% upon completion of job 209', '14/03/12', '22/03/12', 'Caroline', 'March''12', NULL, NULL, NULL, NULL, 'Nadine Steveneers', 'nadine.steveneers@gsk.com', NULL);
INSERT INTO `tasks` (`id`, `contact`, `hrs_spent`, `redmine_url`, `n_url`, `job_nr`, `status`, `client_name`, `project_name`, `type`, `hours`, `gbp_total_amount`, `payment_terms`, `start_date`, `estimated_end_date`, `sold_by`, `month_of_sale`, `project_manager`, `attached_project`, `po`, `third_party_costs`, `client_main_contact`, `contact_details`, `notes`) VALUES
(201, 0, '', '', '', 'CF00209A', 'Current', 'GSK', 'Vaccines Intranet - Video work', 'IP', '21', '1,932.00', '100% upon completion of job 209', '02/03/12', '22/03/12', 'Caroline', 'March''12', NULL, NULL, NULL, NULL, 'Nadine Steveneers', 'nadine.steveneers@gsk.com', NULL),
(202, 0, '', '', '', 'CF00209', 'Current', 'GSK', 'Vaccines intranet', 'IP', '328', '30,176.00', '50/50', '10/11/11', '29/03/12', 'DH', NULL, NULL, NULL, NULL, NULL, 'Nadine Steveneers / Richard Gera', NULL, NULL),
(203, 0, '', '', '', 'CF00208', 'Current', 'Netbenefit', '10% commission on Nuffield Health''s hosting packag', 'WP', 'N/A', 'TBC', 'This will be paid by NetBenefit once a deal has be', '28/10/2011', '27/10/2012', 'DH', NULL, NULL, NULL, NULL, NULL, 'TBC', NULL, NULL),
(204, 0, '', '', '', 'CF00207', 'Closed', 'Lisa Steiner', 'ICC section on EMEA Zone', 'IP', 'N/A', '5,644.00', '100% up front ', '29/9', '29/10', 'John', NULL, NULL, NULL, 'P20899510R', NULL, 'Lisa Steiner', NULL, NULL),
(205, 0, '', '', '', 'CF00206', 'Closed', 'Compeed Italy', 'Compeed Italy temp site', 'IP', 'N/A', '7,500.00', '100% up front ', '26/09', '31/12/2011', 'Alice', NULL, NULL, NULL, 'P20895665R', NULL, NULL, NULL, NULL),
(206, 0, '', '', '', 'CF00205', 'Closed', 'Nuffield Health', 'Nuffield Health Website', 'WP', 'N/A', '£293, 655', '33% when PO received, 33% 01.12.11 and balance on ', '26/09/11', '21/12/2011', 'Caroline', NULL, NULL, NULL, NULL, NULL, 'Claire Myerson', 'claire.myerson@nuffieldhealth.com', NULL),
(207, 0, '', '', '', 'CF00204', 'Closed', 'Compeed Germany', 'Compeed.de amends (3 hours)', 'WS', '3', '425.00', '100% up front ', 'TBC', 'TBC', 'Caroline', NULL, NULL, NULL, NULL, NULL, 'Laura Kawukycz', 'Laura Kawulycz - lkawukycz@its.jnj.com', NULL),
(208, 0, '', '', '', 'CF00203', 'Closed', 'MD&D Eastern Europe', 'Eastern Europe & Project Brave Maintenance', 'IS', NULL, '2,500.00', '100% upfront', '10/01/11', 'When hours are used up', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Matt Puplett', NULL, NULL),
(209, 0, '', '', '', 'CF00202', 'Closed', 'Nuffield Health', 'DANs 50 hr Consultancy bucket', 'WS', '50', '5,500.00', 'In advance', '16/9/2011', '16/11/2011', 'Dan', NULL, NULL, NULL, NULL, NULL, 'Claire Myerson', NULL, NULL),
(210, 0, '', '', '', 'CF00201', 'Current', 'MD&D EMEA', 'Living One MD&D EMEA', 'IP', 'N/A', '13,067.00', '100% upfront', 'TBC', 'TBC', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Dawn Trail', NULL, NULL),
(211, 0, '', '', '', 'CF00200', 'Current', 'MD&D TMEA', 'TMEA Maintenance', 'IS', '12', '1,200.00', 'Monthly in arrears', '09/11/11', '31/08/2012', 'Alice', NULL, NULL, NULL, ' P20882660R', NULL, NULL, 'ccerezci@its.jnj.com', NULL),
(212, 0, '', '', '', 'CF00199', 'Closed', 'David Broeker', 'Ethicon Launch Excellence ', 'IS', NULL, '2,500.00', '100% upfront', '25/08/2011', 'tbc', 'Julia', NULL, NULL, NULL, 'P20877418R', NULL, 'David Broeker', NULL, NULL),
(213, 0, '', '', '', 'CF00198A', 'Closed', 'GSK', 'SharePoint Admin Service Trial ', 'IS', NULL, '1,920.00', '100% upfront', '11/07/11', '01/01/12', 'John', NULL, NULL, NULL, '4086557', NULL, 'Richard Gera', NULL, NULL),
(214, 0, '', '', '', 'CF00198', 'Closed', 'GSK', 'SharePoint Admin Service Trial ', 'IS', NULL, '1,440.00', '100% upfront', '30/8', '30/11', 'DH', NULL, NULL, NULL, NULL, NULL, 'Richard Gera', NULL, NULL),
(215, 0, '', '', '', 'CF00197', 'Closed', 'Cordis Circle', 'I need to...', 'IP', NULL, '2,760.00', '100% Upfront', '08/12/11', '09/05/11', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard', NULL, NULL),
(216, 0, '', '', '', 'CF00196', 'Closed', 'Part of UKIRL (but not for LM)', 'UK Pensions Video', 'IP', NULL, '460.00', '100% Upfront', '08/11/11', '17/08/2011', 'Sam', NULL, NULL, NULL, NULL, NULL, 'Emily Simpson', 'esimpso1@its.jnj.com', NULL),
(217, 0, '', '', '', 'CF00195', 'Closed', 'Lifescan EMEA', 'Diabetes Education Tool', 'IP', NULL, '12,000.00', '50/50', '08/08/11', '31/12/2011', 'Alice', NULL, NULL, NULL, 'P20877731R', NULL, NULL, NULL, NULL),
(218, 0, '', '', '', 'CF00194', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 0, '', '', '', 'CF00193', 'Current', 'Ethicon EMEA ', 'Ethicon Biosurgery Surgiflo microsite (bucket of 3', 'IS', 'N/A', '3,128.00', '100% upfront', '25/7/2011', 'TBC', 'Hannah', NULL, NULL, NULL, NULL, NULL, 'Fabrice Degeneve', 'FDEGENEV@its.jnj.com', NULL),
(220, 0, '', '', '', 'CF00192', 'Current', 'Ethicon US ', 'US Operation Smile', 'IP', NULL, '5,500.00', 'TBC but probably 20/40/40 like Rioflora website', '08/12/11', '19/9/2011', 'Alice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 0, '', '', '', 'CF00191', 'Closed', 'MD&D FraBeNe', 'FraBeNe Intranet Maintenance 20hrs bucket', 'IS', NULL, '2,500.00', '100% upfront', '09/01/11', '31/12/2011', 'Alice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 0, '', '', '', 'CF00190', 'Current', 'Nycomed', 'Russian Localisation', 'WP', NULL, '8,500.00', 'TBC but probably 20/40/40 like Rioflora website', '08/01/11', '30/06/12', 'Alice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 0, '', '', '', 'CF00189', 'Closed', 'Ethicon Products', 'Fosbury project microsite', 'IP', NULL, '7,774.00', '100% upfront', 'August', 'TBC', 'John', NULL, NULL, NULL, NULL, NULL, 'Peter Van Leeuwen', NULL, NULL),
(224, 0, '', '', '', 'CF00188B', 'Closed', 'Matt Puplett', 'Passion 4 Integrity', 'IS', NULL, '667.00', '100% on completition', '17/08/2011', '20/08/2011', 'Julia', NULL, NULL, NULL, 'P20882569N', NULL, NULL, NULL, NULL),
(225, 0, '', '', '', 'CF00188', 'Closed', 'Matt Puplett', 'Passion 4 Integrity', 'IP', NULL, '2,208.00', '100% upfront', '25/07', '18/08/2011', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Matt Puplett', NULL, NULL),
(226, 0, '', '', '', 'CF00187', 'Closed', 'David Broeker', 'Ethicon Launch Excellence ', 'IP', NULL, '650.00', '100% upfront', '21/07/2011', '29/07', 'Julia', NULL, NULL, NULL, NULL, NULL, 'David Broeker ', 'dbroeker@its.jnj.com', NULL),
(227, 0, '', '', '', 'CF00186', 'Closed', 'Ethicon EMEA ', 'Ethicon Biosurgery Surgiflo microsite (bucket of 3', 'IS', 'N/A', '3,600.00', '100% upfront', '07/08/11', 'TBC', 'Hannah', NULL, NULL, NULL, 'P20853144R', NULL, 'Fabrice Degeneve', 'FDEGENEV@its.jnj.com', NULL),
(228, 0, '', '', '', 'CF00185', 'Current', 'Content Formula', 'Website Updates', 'WP', 'n/a', 'n/a', 'n/a', '08/01/11', '09/01/11', 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Caroline Herman / DH', NULL, NULL),
(229, 0, '', '', '', 'CF00184', 'Current', 'DePuy EMEA', 'Diogo''s blog design', 'IP', NULL, '3,450.00', '100% up front', 'September (TBC)', 'October (TBC)', 'John', NULL, NULL, NULL, 'PO 1179505 ', NULL, 'Jenny Skilbeck', NULL, NULL),
(230, 0, '', '', '', 'CF00183', 'Current', 'MD&D EMEA WLI', 'Women''s Leadership Initiative EMEA (bucket of 45 h', 'IS', NULL, '4,600.00', '100% upfront', '20/7/2011', 'TBD', 'Sam', NULL, NULL, NULL, NULL, NULL, 'Daniella Saporita', NULL, NULL),
(231, 0, '', '', '', 'CF00182', 'Cancelled', 'Business Services Eastern Europe.', 'Business Services & NBD site on Eastern Europe', 'IP', NULL, 'TBD', 'TBD', 'TBD', 'TBD', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Carolina Rebecci', 'crebecch@its.jnj.com', NULL),
(232, 0, '', '', '', 'CF00181', 'Closed', 'DePuy EMEA', 'Consultation on Product section changes', 'IP', NULL, '585.00', '100% upfront', '07/04/11', '07/08/11', 'John', NULL, NULL, NULL, 'P20847500R', NULL, 'Oliver sacker', 'osacker@its.jnj.com', NULL),
(233, 0, '', '', '', 'CF00180', 'Current', 'EES EMEA', 'EES EMEA site on EMEA Zone', 'IP', NULL, '16,928.00', '50% on project commencement, 50% on project comple', '25/7/2011', '31/10/2011', 'John', NULL, NULL, NULL, NULL, NULL, 'Marlen Busacker', 'MBusacke@its.JNJ.com', NULL),
(234, 0, '', '', '', 'CF00179', 'Closed', 'J&J MD&D Italy', 'On-site training', 'IP', NULL, '2,036.55', '100% upfront', '14/7/2011', '15/7/2011', 'DK', NULL, NULL, NULL, NULL, NULL, 'Antonella Calcagni', 'Antonella Calcagni +39 06 91194303 acalcagn@its.jn', NULL),
(235, 0, '', '', '', 'CF00178', 'Current', 'Nycomed', 'IPad for Sales Reps', 'WP', NULL, '40,000.00', 'TBC but probably 20/40/40 like Rioflora website', '09/01/11', '31/12/2011', 'John', NULL, NULL, NULL, NULL, NULL, 'Nadja Waespi', NULL, NULL),
(236, 0, '', '', '', 'CF00177', 'Cancelled', 'Nycomed', 'Extras costed in RioFlora proposal - e.g. banner e', 'WP', NULL, '49,000.00', 'TBC but probably 20/40/40 like Rioflora website', '09/01/11', '31/12/2011', 'John', NULL, NULL, NULL, NULL, NULL, 'Nadja Waespi', NULL, NULL),
(237, 0, '', '', '', 'CF00176', 'Closed', 'Bausch + Lomb', 'Internal Newsletter (template)', 'IP', NULL, '3,600.00', '100% upfront', '27/06/2011', '18/07/2011', 'John', NULL, NULL, NULL, '17899', NULL, 'Darren Hancock', NULL, NULL),
(238, 0, '', '', '', 'CF00175', 'Cancelled', 'Irish Cultural Centre', 'Fix site', 'WP', NULL, '1,300.00', '100% upfront', '07/01/11', '15/7/2011', 'John', NULL, NULL, NULL, NULL, NULL, 'Kelly O''Connor', NULL, NULL),
(239, 0, '', '', '', 'CF00174', 'Current', 'MD&D UK', 'UKIRL Maintenance', 'IS', '12', '1,200.00', 'Monthly in arrears', '06/01/11', 'Ongoing', 'John', NULL, NULL, NULL, NULL, NULL, 'Lucinda Macari', NULL, NULL),
(240, 0, '', '', '', 'CF00174A', 'cancelled', 'MD&D UK', 'UKIRL Maintenance (24 hours)', 'IS', '24', '26,496.00', 'Quarterly in advance ( 3 x £2208 = £6624)', NULL, '28/02/2013', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Lucinda Macari', NULL, NULL),
(241, 0, '', '', '', 'CF00173', 'Closed', 'ASP', 'ENDOCLENS  and Manual Biocides', 'WP', NULL, '5,980.00', '100% upfront', '17/06/2011', '28/07/2011', 'Sam', NULL, NULL, NULL, '2011-082', NULL, 'Crispin Graham and Heather Wagstaff', 'hwagstaf@ITS.JNJ.com; CGRAHAM1@its.jnj.com', NULL),
(242, 0, '', '', '', 'CF00172', 'Closed', 'FraBeNe Market Access', 'FraBeNe Market Access Improvements', 'IP', NULL, '4,646.00', '100% upfront', '06/09/11', '07/06/11', 'Sam', NULL, NULL, NULL, 'P20825865R', NULL, 'Celine Fontaine', NULL, NULL),
(243, 0, '', '', '', 'CF00171', 'Closed', 'J&J Ethicon EMEA Intranet', 'Ethicon EMEA intranet Maintenance 2011', 'IP', NULL, '24108 ( includes £792 of 3rd party costs)', '100% upfront', '09/05/11', '01/01/12', 'Elmira', NULL, NULL, NULL, NULL, NULL, 'Francesca DeMartino', 'fdemart1@its.jnj.com', NULL),
(244, 0, '', '', '', 'CF00170', 'Closed', 'Mentor', 'Your Breast Options', 'WS', NULL, '39,744.00', 'Quarterly in advance ( 3 x £3312 = £9936)', '06/01/11', 'Ongoing', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Sylvie Mallon', 'SMagallo@its.jnj.com ', NULL),
(245, 0, '', '', '', 'CF00170A', 'Current', 'Mentor', 'Your Breast Options 24 hours', 'WS', NULL, '2,208.00', 'Monthly in arrears', '01/03/12', '28/02/2013', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Sylvie Mallon', NULL, NULL),
(246, 0, '', '', '', 'CF00169', 'Cancelled', 'Ethicon', 'I am Ethicon HOME PAGE', 'IP', NULL, 'No Invoice required', 'Credit from job 108', '31/05/2011', '31/07/2011', 'Alice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 0, '', '', '', 'CF00168', 'Closed', 'Ethicon', 'Operation Smile Microsite and email template', 'IP', NULL, 'No Invoice required (job value = £8,000)', 'Credit from job 108', '23/05/2011', '31/07/2011', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Francesca Demartino', NULL, NULL),
(248, 0, '', '', '', 'CF00167B', 'Current', 'Ethicon US ', 'Ethicon US intranet (top-up bucket)', 'IP', NULL, '3,125.00', '100% upfront', 'TBC', 'TBC', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, 0, '', '', '', 'CF00167', 'Closed', 'Ethicon US (45 hrs)', 'Ethicon US intranet', 'IP', NULL, '5,175.00', '100% upfront', '24/05/2011', 'TBC', 'Brian', NULL, NULL, NULL, NULL, NULL, 'Lindsay Froelich', 'LFroelic@its.jnj.com', NULL),
(250, 0, '', '', '', 'CF00166', 'Closed', 'EES Market Access Bucket', '20 hrs bucket', 'IS', NULL, '2,208.00', '100% upfront', '07/04/11', NULL, 'Julia', NULL, NULL, NULL, NULL, NULL, 'Dirk Saust', NULL, NULL),
(251, 0, '', '', '', 'CF00165', 'Current', 'Compeed Russia', '10 hours site maintenance', 'WS', NULL, '1,300.00', '100% upfront', '13/05/2011', 'TBC', 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Ekaterina Gubareva ', 'Ekaterina Gubareva [egubarev@ITS.JNJ.com]', NULL),
(252, 0, '', '', '', 'CF00164', 'Closed', 'DePuy ', 'Management Dashboard ADDITION', 'IP', NULL, '828.00', '100% upfront', '13/05/2011', '06/01/11', 'John', NULL, NULL, NULL, NULL, NULL, 'David Banks ', 'dbanks1@its.jnj.com', NULL),
(253, 0, '', '', '', 'CF00163', 'Closed', 'Business Services Eastern Europe.', 'Concept phase for BS EE improvements', 'IP', NULL, '2,760.00', '100% upfront', '13/05/2011', '31/05/2011', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Carolina Rebecchi', NULL, NULL),
(254, 0, '', '', '', 'CF00162', 'Current', 'MD&D EMEA', 'NORDICS maintenance bucket', 'IS', NULL, '2,125.00', '100% in advance', '05/11/11', 'Ongoing until support bucket is exhausted', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 0, '', '', '', 'CF00161', 'Closed', 'Lifescan EMEA', 'President''s Circle of Excellence intranet and 20 h', 'IS', NULL, '4,200.00', '100% in advance', '05/06/11', 'Ongoing until support bucket is exhausted', 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Krish Seal', NULL, NULL),
(256, 0, '', '', '', 'CF00161 A', 'Closed', 'Lifescan EMEA', 'President''s Circle of Excellence intranet and 20 h', 'IS', NULL, '2,500.00', '100% in advance', '19/03/12', '31/12', 'Alice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 0, '', '', '', 'CF0161 B', 'Closed', 'Lifescan EMEA', 'President''s Circle of Excellence intranet and 20 h', 'IS', NULL, '2,500.00', '100% in advance', '15/08/12', '31/08/12', 'Sam', 'September''12', NULL, NULL, 'Awaiting', NULL, 'Sabrina Paino', NULL, NULL),
(258, 0, '', '', '', 'CF00160', 'Closed', 'ASP', 'Five language site localisation', 'WS', NULL, '3,312.00', 'Quarterly in advance ( 3 x £3312 = £9936)', '05/01/11', 'Ongoing', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Daniella Saporita', NULL, NULL),
(259, 0, '', '', '', 'CF00159', 'Closed', 'Compeed Italy', 'Compeed Website Updates', 'IS', NULL, '2,125.00', '100% upfront', '04/07/11', 'tbc', 'Vicky', NULL, NULL, NULL, 'P20808371R', NULL, 'Elena Pepe', NULL, NULL),
(260, 0, '', '', '', 'CF00158', 'Cancelled', 'Ethicon', 'Plus Sutures microsite 2 -maintenance', 'IS', NULL, 'Cancelled', 'quartely in advance (£1200 x 3 = £3600 )', 'Cancelled', 'ongoing', 'John', NULL, NULL, NULL, NULL, NULL, 'Serkan Elmaz', NULL, NULL),
(261, 0, '', '', '', 'CF00157', 'Current', 'Ethicon', 'Plus Sutures microsite 2', 'IP', NULL, '4,140.00', '100% on completion', '04/01/11', '11/01/11', 'John', NULL, NULL, NULL, NULL, NULL, 'Serkan Elmaz', NULL, NULL),
(262, 0, '', '', '', 'CF00156', 'Closed', 'Ethicon', 'I Am Ethicon Awards', 'IP', NULL, 'No invoice needed (job value = £60,000)', 'Credit from job 108', '05/01/11', 'tbc', 'Alice', NULL, NULL, NULL, '-', NULL, 'Francesca DiMartino', NULL, NULL),
(263, 0, '', '', '', 'CF00155E', 'Closed', 'J&J MD&D EMEA', 'HR page updates and training', 'IP', NULL, '1,577.00', 'Part of the maintenance contract (155)', '08/08/11', '09/08/11', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, 0, '', '', '', 'CF00155D', 'Closed', 'J&J MD&D EMEA', 'Chat Zone Cluster Platform Roll Out', 'IP', NULL, '5,888.00', '100% upfront', NULL, NULL, 'Hannah', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller?', NULL, NULL),
(265, 0, '', '', '', 'CF00155C', 'Closed', 'J&J MD&D EMEA', 'EMEA Zone HCC', 'IP', NULL, '2,905.00', 'Part of the maintenance contract (155)', '07/11/11', NULL, 'Hannah', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller and Elaine Murphy', 'emurphy@its.jnj.com', NULL),
(266, 0, '', '', '', 'CF00155B', 'Closed', 'J&J MD&D EMEA', 'EMEA Zone CSR', 'IP', NULL, '2,739.00', 'Part of the maintenance contract (155)', '27/6/11', NULL, 'Hannah', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller and Ailbhe Timmons', 'Atimmons@ITS.JNJ.com', NULL),
(267, 0, '', '', '', 'CF00155A', 'Closed', 'J&J MD&D EMEA', 'EMEA Zone Chat Zone Improvements', 'IS', NULL, '6,072.00', 'Part of the maintenance contract (155)', NULL, NULL, 'Hannah', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(268, 0, '', '', '', 'CF00155', 'Current ', 'MD&D EMEA', 'MD&D EMEA Zone intranet', 'IS', NULL, '5,395.00', 'quartely in advance', '05/01/11', 'ongoing', 'Olga', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(269, 0, '', '', '', 'CF00154', 'Closed', 'Compeed Italy', 'Bucket of 20 site maintenance hours', 'IS', NULL, '1,840.00', '100% upfront', '04/12/11', '30/04/2011', 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Elena Pepe', NULL, NULL),
(270, 0, '', '', '', 'CF00153', 'Closed', 'RoC', 'Website Updates', 'WP', NULL, '5,756.00', '100% on completion', '04/11/11', '05/04/11', 'Sam', NULL, NULL, NULL, NULL, NULL, 'Sissel Gynnild', NULL, NULL),
(271, 0, '', '', '', 'CF00152', 'Closed', 'Compeed Germany', 'NY Teaser & minor site changes', 'WP', NULL, '1,062.50', '100% upfront', '04/11/11', '30/04/2011', 'Vicky', NULL, NULL, NULL, 'P20781463R', NULL, 'Koehler, Wiebke [CONDE] [mailto:wkoehle3@its.jnj.c', NULL, NULL),
(272, 0, '', '', '', 'CF00151', 'Current', 'Cordis Circle', 'Biosense Webster product portfolio integration', 'IP', NULL, '13,340.00', '50% - 50%', '09/01/11', '15/12/2011', 'Julia', NULL, NULL, NULL, NULL, NULL, 'MMONDL@its.jnj.com', 'MMONDL@its.jnj.com', NULL),
(273, 0, '', '', '', 'CF00150', 'Closed', 'EES/ASP', 'EES/ASP Market Access changes', 'IP', NULL, '2,116.00', '100% on completion', NULL, NULL, 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, 0, '', '', '', 'CF00149', 'Closed', 'Content Formula', 'Augmented Reality', 'IP', NULL, 'n/a', 'n/a', '14/3/2011', '14/5/2011', 'Hugh', NULL, NULL, NULL, NULL, NULL, 'Hugh', NULL, NULL),
(275, 0, '', '', '', 'CF00148', 'Closed', 'MD&D EMEA', 'J&J Stationery update', 'WP', NULL, '5,712.00', '100% on completion', '03/11/11', NULL, 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, 0, '', '', '', 'CF00147', 'Closed', 'CoDigital', 'Collaborative Evolution Website', 'IP', NULL, '8,584.00', '50% on project commencement, 50% on project comple', '03/11/11', '08/01/11', 'Hugh', NULL, NULL, NULL, 'tbc', NULL, 'Paddy Hood', 'paddy@codigital.com', NULL),
(277, 0, '', '', '', 'CF00146', 'Closed', 'MD&D EMEA Finance', 'MD&D EMEA Finance logo ', 'WP', NULL, '3,542.00', '100% on completion', '03/11/11', '04/01/11', 'John', NULL, NULL, NULL, 'PR 1579332', NULL, NULL, NULL, NULL),
(278, 0, '', '', '', 'CF00145', 'Closed', 'DePuy', 'DePuy Management Dashboard', 'IP', NULL, '4,462.00', '100% on completion', '03/11/11', '04/01/11', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(279, 0, '', '', '', 'CF00144', 'Current', 'Vision Care EMEA', 'Presbyopia Partnership Portal maintenance', 'IS', NULL, '2,208.00', '24 hour monthly rolling site management contract (', '03/01/11', '28/02/2012', 'DK', NULL, NULL, NULL, 'tbc', NULL, 'Andrew Cleworth (ACLEWORT1@its.jnj.com)', 'ACLEWORT1@its.jnj.com, M: 07717 700699', NULL),
(280, 0, '', '', '', 'CF00143', 'Closed', 'Nycomed - Rio', 'Umbrella Brand', 'IS', NULL, '___', 'Part of Job 138', '18/02/2011', '17/06/2011', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Nadja Waespi', NULL, NULL),
(281, 0, '', '', '', 'CF00142', 'Cancelled', 'ASP', 'Manual Solutions addition', 'WP', NULL, NULL, NULL, NULL, NULL, 'Sam', NULL, NULL, NULL, NULL, NULL, 'Daniella Saporita', NULL, NULL),
(282, 0, '', '', '', 'CF00141A', 'Closed', 'MD&D EMEA - Emerging Markets', 'Project BRAVE prof ed changes', 'IP', NULL, '2,158.00', '100% upfront', '24/11/2011', '23/12/2011', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Matt Puplett', NULL, NULL),
(283, 0, '', '', '', 'CF00141', 'Closed', 'MD&D EMEA - Emerging Markets', 'Project BRAVE microsite', 'WP', NULL, '£20746+£4000 delay cost (agreed 23/08/2011)', '50% on project commencement, 50% on project comple', '21/02/2010', '15/09/2011', 'Vicky', NULL, NULL, NULL, 'P20882571R ( £4k)', NULL, 'Matt Puplett', NULL, NULL),
(284, 0, '', '', '', 'CF00140', 'Cancelled', 'McNeil Nutritionals', 'Benecol UK site refresh', 'IP', NULL, NULL, NULL, '04/01/11', '30/05/2011', 'Hugh', NULL, NULL, NULL, NULL, NULL, 'Patricia Mead', NULL, NULL),
(285, 0, '', '', '', 'CF00139', 'Closed', 'Compeed France', '10 hours site maintenance', 'WP', NULL, '1,062.50', '100% up front', '14/02/2011', NULL, 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Gayané Dandiguian', NULL, NULL),
(286, 0, '', '', '', 'CF00138', 'Current', 'Nycomed - Rio', 'Rio Flora Website', 'WP', NULL, '91,728.00', '20% upfront, 40% at mid point of project, 40% on c', '18/02/2011', '17/06/2011', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Nadja Waespi', NULL, NULL),
(287, 0, '', '', '', 'CF00138A', 'Current', 'Nycomed - Rio', 'Additional Scope', 'WP', '286', '28,749.00', '50% on project commencement, 50% on project comple', '22/03/2012', '31/05/2012', 'Alice', NULL, NULL, NULL, NULL, NULL, 'Karina Larsen', NULL, NULL),
(288, 0, '', '', '', 'CF00138B', 'Current', 'Nycomed - Rio', 'Handover Doc', 'WP', NULL, '4,324.00', '100% on completion', '01/06/12', '30/06/12', 'Sam', 'June''12', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(289, 0, '', '', '', 'CF00137', 'current', 'Ethicon EMEA ', 'Dermabond maintenance bucket', 'IS', NULL, '8,326.00', '100% up front', '02/02/11', NULL, 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(290, 0, '', '', '', 'CF00136', 'Closed', 'McNeil Nutritionals', 'Benecol recipe section refresh', 'IP', NULL, '5,060.00', '100% on completion', '01/01/11', '30/01/2011', 'HF', NULL, NULL, NULL, NULL, NULL, 'Patricia Mead', NULL, NULL),
(291, 0, '', '', '', 'CF00135', 'Closed', 'St Andrews Healthcare', 'Intranet Migration', 'WP', NULL, '73,000.00', '50% now, 50% on completion', '04/01/11', '07/01/11', 'HF', NULL, NULL, NULL, NULL, NULL, 'Nicci Hancox', '01604 614467, NCHancox@standrew.co.uk', NULL),
(292, 0, '', '', '', 'CF00134', 'Closed', 'Visioncare WW', 'Presbyopia intranet', 'IP', NULL, '20,000.00', '100% in advance before end 2010', '23/12/2010', '03/01/11', 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Andrew Cleworth', 'Andrew Cleworth (ACLEWORT1@its.jnj.com) mobile 077', NULL),
(293, 0, '', '', '', 'CF00133', 'Closed', 'EMEA Consolidation project (UKIR cluster)', 'Travel & Expenses costs for Training', 'IP', NULL, '1,430.55', '100% on completion', '25/11/2010', '26/11/2010', 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Nick Brandon', NULL, NULL),
(294, 0, '', '', '', 'CF00132', 'current', 'Aveeno UK', 'Aveeno Discoverers activity 2011', 'WS', NULL, '27,648.50', 'Invoice £2836.50 in 2011, remaining amount £12,163', '20/12/2010', '31/12/2011', 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Vanessa Stoecklein', NULL, NULL),
(295, 0, '', '', '', 'CF00131', 'Closed', 'Cordis EMEA', 'Previews in doc library', NULL, NULL, '4,876.00', 'Part invoice now', '17/12/2010', '31/03/2010', 'Dan K', NULL, NULL, NULL, 'P00700637R', NULL, 'Laurence Hazard', NULL, NULL),
(296, 0, '', '', '', 'CF00130', 'Closed', 'Compeed Italy', 'Site maintenance bucket of 20hrs', NULL, NULL, '1,840.00', '100% in advance', '17/12/2010', '30/6/2011', 'Vicky', NULL, NULL, NULL, 'PO - P00700674R', NULL, 'Alessandra Tommasi', 'Alessandra Tommasi, tel: +39 06 91096 248 or email', NULL),
(297, 0, '', '', '', 'CF00129', 'Closed', 'Cordis EMEA', 'Streaming Video upload tool', NULL, NULL, '9200 JSt, 01/07: £9997 + £700 pa for hosting', 'Part invoice now', '16/12/2010', '09/09/11', 'DK', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard', 'Laurence Hazard, +3223521521, lhazard@its.jnj.com', NULL),
(298, 0, '', '', '', 'CF00128', 'Closed', 'MD&D EMEA', 'NORDICS Maintenance bucket', NULL, NULL, '2,000.00', '100% up front (invoice before Christmas 2010)', '12/10/10', 'Start date + 12 Months', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Erika Kruse', NULL, NULL),
(299, 0, '', '', '', 'CF00127', 'Closed', 'EES EMEA', 'EES market access site on EMEAZone', NULL, NULL, '8,326.00', '50% now - 50% on completion', '16/12/2010', '20/2/2010', 'John', NULL, NULL, NULL, NULL, NULL, 'Jessica De Geus', NULL, NULL),
(300, 0, '', '', '', 'CF00126', 'Closed', 'MD&D EMEA', 'EMEA Zone franchise page MOCKUP', NULL, NULL, '1,058.00', '100% On completion', '13/12/2010', '01/04/10', 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(301, 0, '', '', '', 'CF00125', 'Closed', 'Ethicon EMEA ', 'Biosurgery products microsite', NULL, NULL, '7,406.00', '50% now, 50% on completion', '16/12/2010', '02/01/10', 'John', NULL, NULL, NULL, NULL, NULL, 'Francesco Redivo', NULL, NULL),
(302, 0, '', '', '', 'CF00124', 'Closed', 'MD&D EMEA', 'Temp Sales Dashboard for all staff', NULL, NULL, '1,978.00', '100% On completion', '13/12/2010', '01/04/10', 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(303, 0, '', '', '', 'CF00123', 'Closed', 'HighGate School', 'MOSS News System', NULL, NULL, '2,400.00', '100% On completion', '12/07/10', '20/12/2010', 'HF', NULL, NULL, NULL, NULL, NULL, 'Fraser Robertson', 'Fraser.Robertson@highgateschool.org.uk', NULL),
(304, 0, '', '', '', 'CF00122', 'Closed', 'Cordis EMEA', 'Biosense Webster product portfolio integration', NULL, NULL, '11,316.00', '100% in advance (PO and invoice in 2010!)', '12/06/10', '09/09/11', 'DK', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard', 'Laurence Hazard, +3223521521, lhazard@its.jnj.com', NULL),
(305, 0, '', '', '', 'CF00121', 'Closed', 'Cordis EMEA', 'MarCom Ordering tool improvements', NULL, NULL, '9,384.00', 'Part invoice now', '12/06/10', '30/6/2011', 'DK', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard', 'Laurence Hazard, +3223521521, lhazard@its.jnj.com', NULL),
(306, 0, '', '', '', 'CF00120', 'Closed', 'McNeil Nutritionals', 'CMS Web Forms', NULL, NULL, '5,800.00', '100% On completion', '12/07/10', '30/2/2011', 'Elmira', NULL, NULL, NULL, NULL, NULL, 'Patricia Mead', NULL, NULL),
(307, 0, '', '', '', 'CF00119', 'Cancelled', 'Ethicon EMEA ', 'Dermabond maintenance bucket', NULL, NULL, '6,900.00', '100% up front (by Dec 10)', '25/11/2010', '30/1/2011', 'John', NULL, NULL, NULL, NULL, NULL, 'Lindsey Douglas', NULL, NULL),
(308, 0, '', '', '', 'CF00118', 'Closed', 'MD&D EMEA', 'Ethicon Products Microsite changes', NULL, NULL, '500.00', 'Invoice now', '12/01/10', '02/01/11', 'John', NULL, NULL, NULL, NULL, NULL, 'Cathy Dalene', NULL, NULL),
(309, 0, '', '', '', 'CF00117', 'Closed', 'ROC', 'RoC Christmas email', NULL, NULL, '1,840.00', NULL, '22/11/2010', '12/01/10', 'Ela', NULL, NULL, NULL, NULL, NULL, 'Sissel Gynnild', NULL, NULL),
(310, 0, '', '', '', 'CF00116', 'Closed', 'Advance Sterilization Products (ASP) EMEA', 'EMEA website Planning, intake and technical handov', NULL, NULL, '3,500.00', 'Invoice now', '09/01/10', 'One-off payment', 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Daniella Saporita', NULL, NULL),
(311, 0, '', '', '', 'CF00115', 'Closed', 'MD&D EMEA', 'Prof Ed maintenance', NULL, NULL, '2,208.00', '100% up front ', '16Nov2010', '16/11/11', 'Evelyn ', NULL, NULL, NULL, NULL, NULL, 'Steve Broomhall', 'mstiglit@ITS.JNJ.com (Marta)', NULL),
(312, 0, '', '', '', 'CF00114', 'CANCELLED', 'Ethicon EMEA ', 'CV microsite maintenance', NULL, NULL, '1,200.00', '100% up front (by Dec 10)', '01/10/11', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Laurent Storme', NULL, NULL),
(313, 0, '', '', '', 'CF00113', 'CANCELLED', 'Ethicon EMEA ', 'CV microsite', NULL, NULL, '2,990.00', '100% up front (by Dec 10)', '17/11/2010', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Laurent Storme', NULL, NULL),
(314, 0, '', '', '', 'CF00112', 'Closed', 'Ethicon EMEA ', 'Plus sutures maintenance bucket', NULL, NULL, '1,472.00', '100% up front (by Dec 10)', '12/06/10', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Serkan Elmaz', NULL, NULL),
(315, 0, '', '', '', 'CF00111', 'Closed', 'Ethicon EMEA ', 'Plus sutures microsite', NULL, NULL, '3,542.00', '100% up front (by Dec 10)', '17/11/2010', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Serkan Elmaz', NULL, NULL),
(316, 0, '', '', '', 'CF00110', 'Closed', 'Ethicon EMEA ', 'Dermabond maintenance bucket', NULL, NULL, '1,472.00', '100% up front (by Dec 10)', '11/01/10', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Lindsey Douglas', NULL, NULL),
(317, 0, '', '', '', 'CF00109', 'Closed', 'MD&D EMEA', 'Frabene Training', NULL, NULL, '3,975.64', '100% upon invoice', '25/10/2010', '16/11/2010', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Severine Lavoye-Lhonore', 'slavoye@its.jnj.com', NULL),
(318, 0, '', '', '', 'CF00108', 'Closed', 'Ethicon EMEA ', 'Operation Smile and I am Ethicon Newsletter', NULL, NULL, '80,224.00', '100% up front (by Dec 10)', '28/10/2010', '05/01/11', 'John', NULL, NULL, NULL, 'P00663398R', NULL, 'Francesca DeMartino', NULL, NULL),
(319, 0, '', '', '', 'CF00107', 'Closed', 'MD&D EMEA ', 'Emerging Intro Video TRAILER', NULL, NULL, '3,034.00', '100% up front (by Dec 10)', '26/10/2010', '22/11/2010', 'John ', NULL, NULL, NULL, NULL, NULL, 'Francesca DeMartino', NULL, NULL),
(320, 0, '', '', '', 'CF00106', 'Closed', 'MD&D EMEA ', 'HR Performance Management microsite', NULL, NULL, '2,852.00', '100% on completion', '19/10/2010', '30/11/2010', 'John', NULL, NULL, NULL, 'P00661535R', NULL, 'Edwin Schenck/ Kim Taylor', 'eschenc2@its.jnj.com, ktaylo11@its.jnj.com', NULL),
(321, 0, '', '', '', 'CF00105', 'Closed', 'MD&D EMEA ', 'Market Access microsite on EMEA Zone', NULL, NULL, '3,404.00', '100% on completion', '18/10/2010', '30/11/2010', 'John', NULL, NULL, NULL, NULL, NULL, 'Steve Broomhall', NULL, NULL),
(322, 0, '', '', '', 'CF00104', 'Closed', 'McNeil Nutritionals', 'Benecol Extra Functionality - Polling Module', NULL, NULL, '5,152.00', '100% on completion', '10/01/10', '30/10/2010', 'Hugh', NULL, NULL, NULL, NULL, NULL, 'Patricia Mead', 'patricia mead', NULL),
(323, 0, '', '', '', 'CF00103', 'Closed', 'Ethicon EMEA ', 'Dermabond microsite', NULL, NULL, '3,542.00', ' 100% up front', '28/02/2010', '16/11/2011', 'John', NULL, NULL, NULL, NULL, NULL, 'Jamie Phares', 'Send Invoices to ldougla@its.jnj.com (Lindsay Doug', NULL),
(324, 0, '', '', '', 'CF00102', 'Closed', 'EMEA Zone', 'Market Access Logo', NULL, NULL, '9,200.00', '100% on completion', '11/01/10', '30/11/2010', 'DK', NULL, NULL, NULL, 'n/a', NULL, 'Terri Mueller', 'TMUELLER1@its.jnj.comTerri\nSLABALET@its.jnj.com Su', NULL),
(325, 0, '', '', '', 'CF00101', 'Closed', 'DePuy EMEA ', 'DePuy EMEA intranet mobile ', NULL, NULL, '1,978.00', '100% on completion', '21/9/2010', '12/10/10', 'Evelyn ', NULL, NULL, NULL, '1154260', NULL, 'Oliver Sacker ', NULL, NULL),
(326, 0, '', '', '', 'CF00100', 'Closed', 'MD&D EMEA', 'J&J Medical Companies Stationery', NULL, NULL, '7,500.00', '50% now, 50% on completion', '29/9/2010', '12/01/10', 'John', NULL, NULL, NULL, 'P00661196R', NULL, 'Terri Mueller', 'Susie Labalette, SLABALET@its.jnj.com, +33 (1) 55.', NULL),
(327, 0, '', '', '', 'CF00099', 'Closed', 'Cordis EMEA', 'Cordis More Than Photo montage', NULL, NULL, '2,300.00', '100% on completion', '27/9/10', '10/04/10', 'DK', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard', 'Laurence Hazard, lhazard@its.jnj.com, +3223521521', NULL),
(328, 0, '', '', '', 'CF00098', 'Closed', 'MD&D EMEA', 'NORDICS Finance page migration', NULL, NULL, '552.00', 'See e-mail received 24/09, forwarded 24/09 & 29/09', '15/09/2010', '15/10/2010', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Erika Kruse', NULL, NULL),
(329, 0, '', '', '', 'CF00097', 'Closed', 'MD&D EMEA', 'Ethicon Products Microsite', NULL, NULL, '3,450.00', 'Invoice now', '15/9/2010', '10/08/10', 'Elmira', NULL, NULL, NULL, NULL, NULL, 'Francesca DeMartino', 'fdemart1@its.jnj.com; Send Invoices to  trobert4@i', NULL),
(330, 0, '', '', '', 'CF00096', 'Closed', 'MD&D EMEA', 'Emerging Microsite', NULL, NULL, '4,692.00', '100% on completion', '27/9/2010', '11/01/10', 'Elmira', NULL, NULL, NULL, 'P00635606R', NULL, 'Francesca DeMartino', 'fdemart1@its.jnj.com', NULL),
(331, 0, '', '', '', 'CF00095', 'Closed', 'MD&D EMEA ', 'Emerging Intro Video', NULL, NULL, '9,274.00', '50% now, 50% on completion', '20/9/2010', '22/10/2010', 'Elmira', NULL, NULL, NULL, 'P00635605R', NULL, 'Francesca DeMartino', 'fdemart1@its.jnj.com', NULL),
(332, 0, '', '', '', 'CF00094', 'Closed', 'J&J Ethicon EMEA Intranet', 'Ethicon & Emerging EMEA intranet ', NULL, NULL, '25,200.00', 'bill monthly as per retainer contract standard', '10/01/10', '04/01/11', 'Elmira', NULL, NULL, NULL, 'P00639116R', NULL, 'Francesca DeMartino', 'fdemart1@its.jnj.com', NULL),
(333, 0, '', '', '', 'CF00093', 'Closed', 'Cordis EMEA', 'Newsletter campaign tracking (ID 93)', NULL, NULL, NULL, 'Payment on delivery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(334, 0, '', '', '', 'CF00092', 'Closed', 'Michael Simpson', 'Virtual Hothouse demo video re-export', NULL, NULL, '100.00', 'Payment on delivery', '14/9/2010', '24/9/2010', 'Elmira', NULL, NULL, NULL, NULL, NULL, 'Michael Simpson ', 'msimpson@ideasfirst.net', NULL),
(335, 0, '', '', '', 'CF00091', 'Closed', 'MD&D EMEA ', 'NEVO  (Cordis Speakers Extranet)', NULL, NULL, '1,104.00', 'Home page amendments for logged out user', '31/8/2010', '16/9/2010', 'Evelyn ', NULL, NULL, NULL, NULL, NULL, 'Chris Mann ', NULL, NULL),
(336, 0, '', '', '', 'CF00090', 'CANCEL', 'RoC', 'RoC emails (x6)', NULL, NULL, '10,200.00', 'TBC - see above - includes email send out costs at', '09/01/10', '04/01/11', 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Jonathan Rudd', NULL, NULL),
(337, 0, '', '', '', 'CF00089', 'Closed', 'RoC', 'RoC maintenance contract', NULL, NULL, '14,400.00', 'starts 1st Sept, monthly in arrears (12 months TBC', '09/01/10', '31/08/2011', 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Jonathan Rudd', NULL, NULL),
(338, 0, '', '', '', 'CF00088', 'CANCEL', 'RoC', 'RoCSkinClinic (various jobs)', NULL, NULL, '37,800.00', 'TBC - some work will need to be invoiced in Jan 20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Jonathan Rudd', NULL, NULL),
(339, 0, '', '', '', 'CF00087', 'Closed', 'J&J MD&D', 'ChatZone EMEA Zone', NULL, NULL, '6,600.00', 'on completion', '08/05/10', NULL, 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Terri', NULL, NULL),
(340, 0, '', '', '', 'CF00086', 'Cancelled', 'EMEA Consolidation project (DACH cluster)', 'MD&D EMEA intranet consolidation project', NULL, NULL, '36,464.00', '50/50', '17/03/2011', '07/04/11', 'Olga', NULL, NULL, NULL, NULL, NULL, 'Axel Wieczorek (awieczor@its.jnj.com)', NULL, NULL),
(341, 0, '', '', '', 'CF00085', 'Closed', 'EMEA Consolidation project (MEDIT cluster)', 'MD&D EMEA intranet consolidation project', NULL, NULL, '20,764.00', '50/50', '04/04/11', '14/06/2011', 'Olga', NULL, NULL, NULL, NULL, NULL, 'Antonella Calcagni (acalcagn@its.jnj.com)', 'Antonella Calcagni (acalcagn@its.jnj.com) +39.06.9', NULL),
(342, 0, '', '', '', 'CF00084', 'Closed', 'EMEA Consolidation project (Iberia cluster)', 'MD&D EMEA intranet consolidation project', NULL, NULL, '8,648.00', '50/50', '19/01/2011', '02/07/11', 'Olga', NULL, NULL, NULL, NULL, NULL, 'Andres Lairet (alairet@its.jnj.com)', NULL, NULL),
(343, 0, '', '', '', 'CF00083', 'Closed', 'EMEA Consolidation project (TMEA cluster)', 'MD&D EMEA intranet consolidation project', NULL, NULL, '35,944.00', '50/50', '12/03/10', '02/01/11', 'Olga', NULL, NULL, NULL, 'PO created', NULL, 'Ceren Cerenzci (ccerezci@its.jnj.com)', 'Ceren Cerenzci (ccerezci@its.jnj.com) no phone on ', NULL),
(344, 0, '', '', '', 'CF00082', 'Closed', 'EMEA Consolidation project (E.Europe cluster)', 'MD&D EMEA intranet consolidation project', NULL, NULL, '54,588.00', '50/50', '11/08/10', '22/06/2011', 'Olga', NULL, NULL, NULL, 'PO requested', NULL, 'Matt Puplett (mpuplett@its.jnj.com)', NULL, NULL),
(345, 0, '', '', '', 'CF00081', 'Closed', 'EMEA Consolidation project (Nordics cluster)', 'MD&D EMEA intranet consolidation project', NULL, NULL, '20,700.00', '50/50', '10/04/10', '12/03/10', 'Olga', NULL, NULL, NULL, 'PO requested', NULL, NULL, NULL, NULL),
(346, 0, '', '', '', 'CF00080', 'Closed', 'EMEA Consolidation project (Fraben cluster)', 'MD&D EMEA intranet consolidation project', NULL, NULL, '25,700.00', '50/50', '08/06/10', '10/07/10', 'Olga', NULL, NULL, NULL, 'PO requested', NULL, NULL, NULL, NULL),
(347, 0, '', '', '', 'CF00079', 'Closed', 'EMEA Consolidation project (UKIR cluster)', 'MD&D EMEA intranet consolidation project', NULL, NULL, '25,700.00', '50/50', '26/07/2010', '24/09/2010', 'Olga', NULL, NULL, NULL, 'PO requested', NULL, NULL, NULL, NULL),
(348, 0, '', '', '', 'CF00078', 'Closed', 'St Andrews Healthcare', 'St Andrews Healthcare Intranet', 'IP', NULL, '34,042.56', '50/50', '19/08/2010', 'Oct', 'Dan H', NULL, NULL, NULL, 'waiting for PO', NULL, 'Nicci Hancox', NULL, NULL),
(349, 0, '', '', '', 'CF00077', 'Current', 'EES WW', 'EES SoTM (WW) (Science of Tissue Management) intra', 'IS', NULL, '2,208.00', '24 hour monthly rolling site management contract', '09/01/10', NULL, 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Pat Duggan', NULL, NULL),
(350, 0, '', '', '', 'CF00076', 'Current', 'Advance Sterilization Products (ASP) EMEA', 'Advance Sterilization Products (EMEA website manag', 'WS', NULL, '2,208.00', '24 hour monthly rolling site management contract (', '09/01/10', NULL, 'Dan H', NULL, NULL, NULL, NULL, NULL, 'Daniella Saporita', NULL, NULL),
(351, 0, '', '', '', 'CF00075', 'Closed', 'J&J MD&D', 'Ethicon Launch Excellence ', NULL, NULL, '22,586.00', '50% / 50%', '08/01/10', NULL, 'Olga', NULL, NULL, NULL, 'waiting for PO', NULL, 'David Broeker (dbroeker@its.jnj.com)', NULL, NULL),
(352, 0, '', '', '', 'CF00074', 'paid as a part of MD&D consolidation project', 'J&J MD&D ', 'Sales Dashboard (Shared with Depuy)', NULL, NULL, '5,000.00', '100% upon completion', NULL, '09/01/10', 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(353, 0, '', '', '', 'CF00073', 'Closed', 'Depuy', 'DePuy EMEA Intranet multilingual discovery phase\n', NULL, NULL, '3,588.00', '100% upon completion', NULL, NULL, 'Olga', NULL, NULL, NULL, 'waiting for PO', NULL, 'David Banks', NULL, NULL),
(354, 0, '', '', '', 'CF00072', 'Closed', 'J&J MD&D', 'Ethicon 360 EMEA ', NULL, NULL, '5,072.00', '100% advance', NULL, NULL, 'Olga', NULL, NULL, NULL, 'waiting for PO', NULL, 'Chris Mann', NULL, NULL),
(355, 0, '', '', '', 'CF00071', 'Closed', 'Wedge', 'Kilobox (communique masthead/logo)', NULL, NULL, 'N/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ']', NULL, NULL),
(356, 0, '', '', '', 'CF00070', 'Closed', 'EES UK', 'EES UK Intranet site management', 'IS', NULL, '720.00', 'monthly', '08/01/10', '30/06/2011', 'Olga', NULL, NULL, NULL, 'P20747446R', NULL, 'Joanna Collins', 'jcollin9@its.jnj.com', NULL),
(357, 0, '', '', '', 'CF00069', 'Closed', 'J&J MD&D', 'Ethicon EMEA', NULL, NULL, '1,100.00', '100% advance', '23/06/2010', '23/07/2010', 'Olga', NULL, NULL, NULL, NULL, NULL, 'Francesca DeMartino ', 'TBC', NULL),
(358, 0, '', '', '', 'CF00068', 'Closed', 'J&J MD&D', 'EES UK intranet build - extra for "alerts" functio', NULL, NULL, '644.00', 'on completion', '10/01/10', '10/01/11', 'Olga', NULL, NULL, NULL, NULL, NULL, 'Joanna Collins', 'jcollin9@its.jnj.com', NULL),
(359, 0, '', '', '', 'CF00067', 'Closed', 'J&J MD&D', 'EES UK Intranet', NULL, NULL, '20,056.00', '100% advance', '28/05/2010', '15/10/10', 'John', NULL, NULL, NULL, 'waiting for PO cinfirmation from Tracey', NULL, 'Joanna Collins', 'jcollin9@its.jnj.com', NULL),
(360, 0, '', '', '', 'CF00066', 'Closed', 'MD&D EMEA ', 'Nevo extra work', NULL, NULL, '1,000.00', '100% on completion', NULL, NULL, 'Evelyn', NULL, NULL, NULL, 'TBC', NULL, NULL, NULL, NULL),
(361, 0, '', '', '', 'CF00065', 'Closed', 'ELEXON Limited', 'Extranet design', NULL, NULL, '8,556.00', '100% on completion', '21/5/2010', '07/09/10', 'DK', NULL, NULL, NULL, '1006442', NULL, 'Kate Murray', 'kmurray@elexon.co.uk\n', NULL),
(362, 0, '', '', '', 'CF00064', 'Closed', 'Bausch+Lomb', 'Maintenance  (12 hrs per month)', 'WS', NULL, '1,200.00', 'on monthly basis', '29/05/2010', 'on-going', 'Julia', NULL, NULL, NULL, NULL, NULL, 'Mr Darren Hancock', NULL, NULL),
(363, 0, '', '', '', 'CF00063', 'Closed', 'Bausch+Lomb', 'Newsletter template', NULL, NULL, '3,864.00', '100% on completion ', '05/06/10', '31/05/2010', 'Julia ', NULL, NULL, NULL, NULL, NULL, 'Mr Darren Hancock', NULL, NULL),
(364, 0, '', '', '', 'CF00062', 'Closed', 'Compeed France', 'Compeed France - 2010 updates', NULL, NULL, '4,324.00', '100% on completion', '05/05/10', '14/05/2010', 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Melissa Besch', 'vbourdon@its.jnj.com', NULL),
(365, 0, '', '', '', 'CF00061', 'Closed', 'Compeed ', 'Transfer of Compeed Master website files', NULL, NULL, '8,000.00', 'TBC', NULL, NULL, 'Vicky', NULL, NULL, NULL, 'P00553996R', NULL, 'Anita Grix', NULL, NULL),
(366, 0, '', '', '', 'CF00060', 'Closed', 'Compeed 3 Pillars', 'Mastersite Translation Pack', NULL, NULL, '2,944.00', '100% on completion', '30/04/2010', '19/05/2010', 'Vicky', NULL, NULL, NULL, 'P00553997R', NULL, 'Anita Grix', NULL, NULL),
(367, 0, '', '', '', 'CF00059', 'Closed', 'Johnson & Johnson Medical S.p.A.', 'Road Map design\n', NULL, NULL, '3,220.00', '100% on completion', '29/04/2010', '17/05/2010', 'John', NULL, NULL, NULL, NULL, NULL, 'Francesca DeMartino\n', 'arausa@its.jnj.com ', NULL),
(368, 0, '', '', '', 'CF00058', 'Closed', 'Ethicon EMEA ', 'Ethicon 360 EMEA patients page', NULL, NULL, '1,012.00', '100% on completion', '27/04/2010', '05/05/10', 'John', NULL, NULL, NULL, 'TBC', NULL, 'Chris Mann', NULL, NULL),
(369, 0, '', '', '', 'CF00057', 'Closed', 'Compeed France', 'Night Patch - Legal Changes', NULL, NULL, '318.00', '100% on completion', '27/04/2010', '27/04/2010', 'Vicky', NULL, NULL, NULL, 'TBC', NULL, 'Vincent Bourdon', 'vbourdon@its.jnj.com', NULL),
(370, 0, '', '', '', 'CF00056', 'Closed', 'Aveeno UK', 'Auto-process for Discover Aveeno application proce', NULL, NULL, '3,281.00', '100% on completion', '23/04/10', '05/10/10', 'Vicky', NULL, NULL, NULL, 'TBC', NULL, 'Vanessa Stoecklein', NULL, NULL),
(371, 0, '', '', '', 'CF00055', 'Closed', 'Compeed Spain', 'Underfoot + ATP', NULL, NULL, '1,854.00', '100% on completion', 'TBC', 'May 2010', 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Alba Oilveras', NULL, NULL),
(372, 0, '', '', '', 'CF00054', 'closed, part of main project', 'DePuy EMEA', 'Dashboard', NULL, NULL, '5,000.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'P00552162R-V2  ', NULL, NULL, NULL, NULL),
(373, 0, '', '', '', 'CF00053', 'Closed', 'DePuy EMEA  ', 'DePuy EMEA Intranet\n', NULL, NULL, '122,728.00', '£45455- Edge ; - £77273 - Slinky', '04/01/10', '09/01/10', 'Evelyn', NULL, NULL, NULL, '£45455 - 1146435', NULL, 'David Banks', NULL, NULL),
(374, 0, '', '', '', 'CF00052', 'Closed', 'Compeed Germany', 'ATP and Underfoot Blister', NULL, NULL, '966.00', 'on completion', '04/09/10', '26/04/2010', 'Vicky', NULL, NULL, NULL, 'PO20115013', NULL, 'Kamila Scheld', 'kscheld@its.jnj.com', NULL),
(375, 0, '', '', '', 'CF00051', 'Closed', 'McNeil Nutritionals', 'Splenda Benecol maintenance contract (24hrs per mo', 'WS', NULL, '2,200.00', 'on monthly basis', '01/01/10', '31/03/2012', 'DK', NULL, NULL, NULL, 'TBC', NULL, 'Patricia Mead ', 'pmead@its.jnj.com', NULL),
(376, 0, '', '', '', 'CF00051A', 'Current', 'McNeil Nutritionals', 'Splenda UK Maintenance (4hrs per month)', 'WS', NULL, '1,200.00', 'Quarterly upfront', '03/01/12', 'on-going', 'JT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(377, 0, '', '', '', 'CF00051B', 'Current', 'McNeil Nutritionals', 'Benecol Ireland Maintenance (4hrs per month) + Spl', 'WS', NULL, '2,400.00', 'Quarterly upfront', '03/01/12', 'on-going', 'JT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(378, 0, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(379, 0, '', '', '', 'CF00050', 'Closed', 'Aveeno UK', 'Aveeno Discoverer Support', NULL, NULL, '26,565.00', 'jan 2011', '26/03/10', 'on-going', 'Vicky ', NULL, NULL, NULL, 'TBC', NULL, 'Vanessa Stoecklein', NULL, NULL),
(380, 0, '', '', '', 'CF00049', 'Closed', 'Compeed Ireland', 'Site maintenance Hours (10 hours)', NULL, NULL, '1,060.00', NULL, '30/03/10', NULL, 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Helen Archer', NULL, NULL),
(381, 0, '', '', '', 'CF00048', 'DUPLICATION - Also listed as Job no 77', 'Ethicon Endo-Surgery', 'EES SoTM (Science of Tissue Management community m', NULL, NULL, '26,500.00', '24 h per month retainer', 'May 2010', 'on-going', 'Dan K', NULL, NULL, NULL, 'TBC', NULL, 'Pat Dugan', 'Pat Dugan\n+1 (513) 337-3368\nPDugan1@its.jnj.com', NULL),
(382, 0, '', '', '', 'CF00047', 'Closed', 'MD&D EMEA', 'Design work for Francesca DeMartino', NULL, NULL, '2,000.00', 'Payment due on completion', 'Feb 2010', '1st April', 'John', NULL, NULL, NULL, 'same as for EMEA zone + same billing', NULL, 'Francesca DeMartino', NULL, NULL),
(383, 0, '', '', '', 'CF00046', 'Closed', 'MD&D EMEA', 'MD&D EMEA intranet consolidation project\n', NULL, NULL, '130,000.00', 'TBC', '03/10/10', 'Q4 2010', 'John', NULL, NULL, NULL, 'TBC', NULL, 'Terri Mueller', NULL, NULL),
(384, 0, '', '', '', 'CF00045', 'Cancelled', 'Cordis EMEA', 'Cordis Tender Management Microsite support ', NULL, NULL, '1,060.00', NULL, '19/11/2009', 'on-going', 'Kate', NULL, NULL, NULL, NULL, NULL, 'Justin Chickles', NULL, NULL),
(385, 0, '', '', '', 'CF00044', 'Closed', 'Cadbury', 'Global Commercial Wal-Mart', NULL, NULL, '3,910.00', NULL, '03/08/10', NULL, 'Julia', NULL, NULL, NULL, NULL, NULL, 'Alejandro Garcia', NULL, NULL),
(386, 0, '', '', '', 'CF00043', 'Closed', 'MD&D Benelux', 'Sales Force Effectiveness', NULL, NULL, '2,346.00', NULL, '03/10/10', NULL, 'Geoff', NULL, NULL, NULL, NULL, NULL, 'Jantien van Dorrestjein', NULL, NULL),
(387, 0, '', '', '', 'CF00042', 'Closed', 'Compeed Franchise', 'Mastersite Updates - ATP & Underfoot Blister', NULL, NULL, '2,760.00', '100% on completion', '4th March 2010', 'end of March 2010', 'Vicky', NULL, NULL, NULL, 'P00520563R', NULL, 'Anita Grix', NULL, NULL),
(388, 0, '', '', '', 'CF00041', 'cancelled', 'Aveeno UK', 'Newsletter Template Adaption - on hold', NULL, NULL, '2,300.00', NULL, '2nd March 2010', NULL, 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Vanessa Stoecklein', NULL, NULL),
(389, 0, '', '', '', 'CF00040', 'Closed', 'Aveeno UK', 'Site Support/Moderation (10.5 hours)', NULL, NULL, '966.00', '100% on completion', '2nd March 2010', 'end of March', 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Vanessa Stoecklein', NULL, NULL),
(390, 0, '', '', '', 'CF00039', 'Closed', 'Aveeno UK', 'Initial Review - before launch (22.5 hours)', NULL, NULL, '2,070.00', NULL, '2nd March 2010', NULL, 'Vicky', NULL, NULL, NULL, 'P00540587R', NULL, 'Vanessa Stoecklein', NULL, NULL),
(391, 0, '', '', '', 'CF00038', 'Closed', 'Aveeno UK', 'Promo Email', NULL, NULL, '3,220.00', NULL, '1st March 2010', NULL, 'Vicky', NULL, NULL, NULL, 'P00540581R', NULL, 'Vanessa Stoecklein', NULL, NULL),
(392, 0, '', '', '', 'CF00037', 'Closed', 'MD&D EMEA ', 'e360 Prof Ed maintenance', NULL, NULL, '2,208.00', NULL, '1st March 2010', 'TBC', 'John', NULL, NULL, NULL, 'not required', NULL, 'Steve Broomhall ', 'cmann3@ITS.JNJ.com - Chris Mann', NULL),
(393, 0, '', '', '', 'CF00036', 'Closed', 'Cordis EMEA ', 'NEVO maintenance ( 24 hrs )', NULL, NULL, '2,208.00', '£2208 per month (24 hrs)', '26/05/2010', 'TBC', 'John', NULL, NULL, NULL, NULL, NULL, 'Matt Puplett', NULL, NULL),
(394, 0, '', '', '', 'CF00035', 'Current', 'Content Formula', 'Content Formula Blog', 'WP', NULL, 'NA', NULL, 'ongoing', NULL, 'Geoff', NULL, NULL, NULL, NULL, NULL, 'Geoff Scaplehorn', NULL, NULL),
(395, 0, '', '', '', 'CF00034', 'Closed', 'Compeed Germany', 'Site maintenance Hours', NULL, NULL, '1,840.00', NULL, '26/02/2010', '26th April 2010', 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Kamila Scheld', NULL, NULL),
(396, 0, '', '', '', 'CF00033', 'Closed', 'Compeed Spain', 'Night Patch', NULL, NULL, '2,392.00', '50% on project commencement, 50% on project comple', '22/02/2010', '6/04/10 - TBC with Vicky', 'Vicky', NULL, NULL, NULL, 'P00515879R ', NULL, 'Alba Olivares Toledo', 'AOlivare@its.jnj.com', NULL),
(397, 0, '', '', '', 'CF00032', 'Closed', 'Cordis EMEA', 'CCVI (Online Re-Design)', NULL, NULL, '13,800.00', NULL, '24/02/2010', NULL, 'Julia', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard (may change)', NULL, NULL),
(398, 0, '', '', '', 'CF00031', 'Closed', 'Ideas First ', 'Virtual Hothouse demo video', NULL, NULL, '6,578.00', NULL, '20th Dec 2009', NULL, 'Evelyn', NULL, NULL, NULL, NULL, NULL, 'Michael Simpson ', NULL, NULL),
(399, 0, '', '', '', 'CF00030', 'Closed', 'MD&D EMEA', 'Nevo Cordis Speakers Extranet', NULL, NULL, '38,660.00', NULL, '1st Feb 2010', NULL, 'Evelyn', NULL, NULL, NULL, NULL, NULL, 'Matt ', NULL, NULL),
(400, 0, '', '', '', 'CF00029', 'Closed', 'MD&D EMEA', 'Prof Ed ', NULL, NULL, '4,692.00', NULL, '5th Feb 2010', NULL, 'Evelyn', NULL, NULL, NULL, NULL, NULL, 'Chris Mann', NULL, NULL),
(401, 0, '', '', '', 'CF00028', 'Closed', 'MD&D EMEA', 'Ethicon360', NULL, NULL, '20,700.00', NULL, '1st Dec 2009', NULL, 'Evelyn ', NULL, NULL, NULL, NULL, NULL, 'Chris Mann', NULL, NULL),
(402, 0, '', '', '', 'CF00027', 'Closed', 'Francesca DeMartino', 'Email banner graphics', NULL, NULL, '1,500.00', NULL, '15th Feb 2010', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Francesca Demartino', 'this job is been raplaced by job 47', NULL),
(403, 0, '', '', '', 'CF00026', 'Closed', 'Aveeno UK ', 'Legal Feedback - Flash & Text', NULL, NULL, '460.00', NULL, '15th Feb 2010', NULL, 'Vicky', NULL, NULL, NULL, 'P00540590R', NULL, 'Vanessa Stoecklein', NULL, NULL),
(404, 0, '', '', '', 'CF00025', 'Current', 'Kraft', 'Gum&Candy Maintenance Contract (15 hours per month', 'IS', NULL, '1,380.00', NULL, '01/01/11', 'Ongoing', 'Julia', NULL, NULL, NULL, '4500148723', NULL, 'Pablo Heymann (pablo.heyman@kraftfoods.com)', 'invoice Cadbury Adams USA LLC\nemail to AP.adamsusI', NULL),
(405, 0, '', '', '', 'CF00024', 'Closed', 'EMEA Zone ', 'EZ 2010 Discussion Boards', NULL, NULL, '3,404.00', NULL, '15th Jul 10', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL);
INSERT INTO `tasks` (`id`, `contact`, `hrs_spent`, `redmine_url`, `n_url`, `job_nr`, `status`, `client_name`, `project_name`, `type`, `hours`, `gbp_total_amount`, `payment_terms`, `start_date`, `estimated_end_date`, `sold_by`, `month_of_sale`, `project_manager`, `attached_project`, `po`, `third_party_costs`, `client_main_contact`, `contact_details`, `notes`) VALUES
(406, 0, '', '', '', 'CF00023', 'Cancelled', 'EMEA Zone', 'EZ 2010 Personalisation', NULL, NULL, 'TBC', NULL, '1st June 10', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(407, 0, '', '', '', 'CF00022', 'Closed', 'EMEA Zone', 'EZ 2010 Navbar', NULL, NULL, '9,660.00', NULL, '1st Apr 10', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(408, 0, '', '', '', 'CF00021', 'Closed', 'EMEA Zone', 'EZ 2010 Branding Refresh', NULL, NULL, 'TBC', NULL, '15th Mar 10', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(409, 0, '', '', '', 'CF00020', 'Cancelled', 'EMEA Zone', 'EZ 2010 Content Refresh', NULL, NULL, 'TBC', NULL, '15th Mar 10', NULL, 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(410, 0, '', '', '', 'CF00019', 'Closed', 'EMEA Zone', 'SMA (Wyeth)', NULL, NULL, '4,324.00', NULL, '15th Mar 10', '30th April', 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(411, 0, '', '', '', 'CF00018', 'Closed', 'EMEA Zone', 'EZ 2010 Ask a Leader', NULL, NULL, '5,336.00', NULL, '15th Feb 10', '2nd April', 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(412, 0, '', '', '', 'CF00017', 'Closed', 'EMEA Zone ', 'EZ 2010 User Research', NULL, NULL, '6,716.00', NULL, '9th Feb 10', '2nd April', 'John', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', NULL, NULL),
(413, 0, '', '', '', 'CF00016', 'Closed', 'Compeed Italy', 'Night Patch', NULL, NULL, '2,392.00', NULL, '9th Feb 10', NULL, 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Camilla Cierachio', NULL, NULL),
(414, 0, '', '', '', 'CF00015', 'Closed', 'Compeed Ireland', 'Night Patch', NULL, NULL, '2,392.00', NULL, '9th Feb 10', NULL, 'Vicky', NULL, NULL, NULL, 'PO 29100898', NULL, 'Helen Archer', NULL, NULL),
(415, 0, '', '', '', 'CF00014', 'Closed', 'Cordis EMEA', 'CYPHER More Than Dashboard', NULL, NULL, '13,052.00', NULL, '02/09/10', NULL, 'Daniel K', NULL, NULL, NULL, NULL, NULL, 'Laurence Hazard <lhazard@its.jnj.com>', NULL, NULL),
(416, 0, '', '', '', 'CF00013', 'Closed', 'Cadbury', 'Global Commercial Gateway Maintenance', NULL, NULL, '22,080.00', NULL, 'Ongoing', NULL, 'Julia', NULL, NULL, NULL, 'no PO is required', NULL, 'Frank Cotignola (Frank.Cotignola@kraft.com)', NULL, NULL),
(417, 0, '', '', '', 'CF00012', 'Closed', 'Bausch+Lomb', 'BauschSurgical.co.uk Internet site', NULL, NULL, '27,084.00', '50% on project commencement, 50% on project comple', '02/01/10', NULL, 'Julia', NULL, NULL, NULL, NULL, NULL, 'Jill Collishaw (Jill.Collishaw@bausch.com); Darren', NULL, NULL),
(418, 0, '', '', '', 'CF00011', 'Closed', 'Aveeno', 'Discover Aveeno - Product pages layout', NULL, NULL, '2,944.00', NULL, '04/02/10', NULL, 'Vicky', NULL, NULL, NULL, 'P00540585R', NULL, 'Vanessa Stoecklein', 'Richard Sale: rsale@its.jnj.com; Vanessa Stoeckl: ', NULL),
(419, 0, '', '', '', 'CF00010', 'Closed', NULL, 'SMA Support', NULL, NULL, '55,200.00', NULL, 'ongoing', NULL, 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Nick Bridden', NULL, NULL),
(420, 0, '', '', '', 'CF00009', 'Closed', 'LifeScan EMEA', 'LFS EMEA Comms section', NULL, NULL, '9,936.00', NULL, 'June 2009', NULL, 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Kate Purcell', NULL, NULL),
(421, 0, '', '', '', 'CF00008', 'Closed', 'BRIC', 'BRIC maintenance (site management)', 'IS', NULL, '14,400.00', NULL, 'May 2009', 'January 2012', 'DK', NULL, NULL, NULL, NULL, NULL, 'Barbara Bickel', NULL, NULL),
(422, 0, '', '', '', 'CF00007', 'Closed', 'EMEA Zone', 'EMEA Zone (site management)', NULL, NULL, '32,160.00', NULL, NULL, NULL, 'Vicky', NULL, NULL, NULL, NULL, NULL, 'Terri Mueller', 'TMUELLER1@its.jnj.comTerri\nSLABALET@its.jnj.com Su', NULL),
(423, 0, '', '', '', 'CF00006', 'Closed', 'MD&D Business Services', 'Business Services newsletters (Business Services F', NULL, NULL, '43,516.00', NULL, 'September 2009', NULL, 'Geoff', NULL, NULL, NULL, NULL, NULL, 'Ulli Domany', 'Vereecken, Marleen [JPSBE] [mvereeck@its.jnj.com]\n', NULL),
(424, 0, '', '', '', 'CF00005', 'Closed', 'MD&D EMEA', 'IN Touch', NULL, NULL, '26,400.00', NULL, 'ongoing', NULL, 'Geoff', NULL, NULL, NULL, NULL, NULL, 'Rui Alves', 'expires in April', NULL),
(425, 0, '', '', '', 'CF00004', 'Current', 'Cordis Circle', 'Cordis Circle (PAYG maintenance)', 'IS', NULL, '£11040', 'monthly ad hoc\nFrom 1 April, £1840 a month.\nThere ', '04/01/11', '31/3/12', 'DK', NULL, NULL, NULL, 'PO for each month requested by Dan K\nPending PO fo', NULL, 'Laurence Hazard', 'Laurence Hazard, Communications & Events Executive', NULL),
(426, 0, '', '', '', 'CF00003', 'Current', 'LifeScan UK', 'LifeScan UK intranet site', 'IS', NULL, '8,800.00', NULL, 'ongoing', NULL, 'Geoff', NULL, NULL, NULL, 'P00502705R', NULL, 'Julie Deans', 'LifeScan UK, send invoice by post:\nORTHO-CLINICAL ', NULL),
(427, 0, '', '', '', 'CF00002', 'Closed', 'MD&D Benelux', 'MD&D Benelux intranet site management', NULL, NULL, '13,200.00', NULL, 'ongoing', 'Li', 'Geoff', NULL, NULL, NULL, 'no PO required', NULL, 'Annemarie Barmentlo', 'J&J Medical Benelux\nemail Annemarie Barmentlo\nabar', NULL),
(428, 0, '', '', '', 'CF00001', 'Closed', 'Consumer EMEA', 'Supply chain site management ', NULL, NULL, '26,400.00', NULL, 'ongoing', NULL, 'Olga S', NULL, NULL, NULL, 'no PO required', NULL, 'Joel Schmidheiny', 'demand fullfilment in QB, email ''Schmidheiny, Joel', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks_old`
--

DROP TABLE IF EXISTS `tasks_old`;
CREATE TABLE IF NOT EXISTS `tasks_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `Contact` int(11) NOT NULL,
  `redmine_url` varchar(255) NOT NULL,
  `n_url` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `type_of_project` varchar(255) NOT NULL,
  `project_number` varchar(255) NOT NULL,
  `soldby_user_id` int(11) NOT NULL,
  `soldon_date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_email` varchar(255) NOT NULL,
  `payment_terms` varchar(255) NOT NULL,
  `total_hrs` int(11) NOT NULL,
  `hrs_spent` int(11) NOT NULL,
  `gbp_total_amount` int(11) NOT NULL,
  `estimated_deadline` date NOT NULL,
  `created_on_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tasks_old`
--

INSERT INTO `tasks_old` (`id`, `name`, `Contact`, `redmine_url`, `n_url`, `status`, `type_of_project`, `project_number`, `soldby_user_id`, `soldon_date`, `client_name`, `client_email`, `payment_terms`, `total_hrs`, `hrs_spent`, `gbp_total_amount`, `estimated_deadline`, `created_on_date`) VALUES
(1, 'Lewisham', 4, 'http://redmine.cf/projects/274-lewisham-college/wiki', 'N:\\Lewisham College', 'Pending', 'IP', 'CF00274', 6, '2013-01-01', 'Daveena Dowlul', '', '50/50', 770, 690, 70748, '2013-04-30', '2013-04-02'),
(2, 'Pfizer', 4, '', '', '', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, '0000-00-00', '0000-00-00'),
(3, 'ASPJJ', 5, '', '', '', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, '0000-00-00', '0000-00-00'),
(4, 'RRUKA', 6, '', '', '', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, '0000-00-00', '0000-00-00'),
(5, 'EMEA Zone Finance', 4, '', '', 'Closed', '', '', 4, '0000-00-00', '', '', '', 146, 117, 13432, '0000-00-00', '0000-00-00'),
(6, 'EMEA Zone Proffesional Education', 4, '', '', '', '', '', 4, '0000-00-00', '', '', '', 73, 26, 6716, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `task_repetition`
--

DROP TABLE IF EXISTS `task_repetition`;
CREATE TABLE IF NOT EXISTS `task_repetition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `skill_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_repetition_tasks1_idx` (`task_id`),
  KEY `fk_task_repetition_users1_idx` (`user_id`),
  KEY `skill_type_id` (`skill_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `task_repetition`
--

INSERT INTO `task_repetition` (`id`, `task_id`, `date`, `user_id`, `duration`, `skill_type_id`) VALUES
(1, 3, '2013-05-03', 1, '2.5', 5),
(2, 3, '2013-05-03', 2, '2.5', 3),
(3, 1, '2013-05-06', 1, '3', 2),
(4, 1, '2013-05-08', 1, '2.50', 2),
(5, 1, '2013-05-08', 2, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `working_hrs` varchar(10) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `firstname`, `surname`, `email`, `password`, `working_hrs`, `photo`, `registered`) VALUES
(1, '', 'Sirvan', 'Almasi', 'salmasi@contentformula.com', '', '7.5', '', '0000-00-00 00:00:00'),
(2, '', 'Daniel', 'Keegan', 'dkeegan@contentformula.com', '', '7.5', '', '0000-00-00 00:00:00'),
(3, '', 'James', 'Taylor', 'jtaylor@contentformula.com', '', '7.5', '', '0000-00-00 00:00:00'),
(4, '', 'James', 'Toseland', 'jtoseland@contentformula.com', '', '12', '', '0000-00-00 00:00:00'),
(5, '', 'Ben', 'Marshal', '', '', '7.5', '', '0000-00-00 00:00:00'),
(6, '', 'John', 'Scott', '', '', '7.5', '', '0000-00-00 00:00:00'),
(7, '', 'Mike', 'Gough', '', '', '7.5', '', '0000-00-00 00:00:00'),
(8, '', 'Daniel', 'Dukharan', '', '', '7.5', '', '0000-00-00 00:00:00'),
(9, 'Sirvan Almasi', '', '', 'sirvan3tr@gmail.com', '', '', 'assets/img/default_avatar.jpg', '2013-05-08 11:44:30');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
