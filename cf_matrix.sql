-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 16, 2013 at 05:23 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.4

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
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `Contact`, `redmine_url`, `n_url`, `status`, `type_of_project`, `project_number`, `soldby_user_id`, `soldon_date`, `client_name`, `client_email`, `payment_terms`, `total_hrs`, `hrs_spent`, `gbp_total_amount`, `estimated_deadline`, `created_on_date`) VALUES
(1, 'Lewisham', 4, 'http://redmine.cf/projects/274-lewisham-college/wiki', 'N:\\Lewisham College', 'Pending', 'IP', 'CF00274', 6, '2013-01-01', 'Daveena Dowlul', '', '50/50', 770, 620, 65000, '2013-04-30', '2013-04-02'),
(2, 'Pfizer', 4, '', '', '', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, '0000-00-00', '0000-00-00'),
(3, 'ASPJJ', 5, '', '', '', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, '0000-00-00', '0000-00-00'),
(4, 'RRUKA', 6, '', '', '', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `taskss`
--

DROP TABLE IF EXISTS `taskss`;
CREATE TABLE IF NOT EXISTS `taskss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_nr` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `hours` varchar(50) DEFAULT NULL,
  `total_amount` varchar(50) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `duration` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `task_repetition`
--

INSERT INTO `task_repetition` (`id`, `task_id`, `date`, `user_id`, `duration`) VALUES
(1, 1, '2013-03-22', 1, 8.50),
(2, 1, '2013-03-25', 1, 6.00),
(3, 1, '2013-03-22', 1, 3.25),
(4, 2, '2013-03-22', 1, 2.50),
(5, 1, '2013-03-22', 2, 6.00),
(6, 1, '2013-03-22', 2, 6.00),
(7, 1, '2013-03-22', 0, 12.00),
(8, 2, '2013-03-22', 0, 12.00),
(9, 2, '0000-00-00', 2, 0.00),
(10, 2, '2013-03-22', 2, 12.00),
(11, 1, '2013-03-25', 1, 6.00),
(12, 2, '2013-03-22', 2, 5.00),
(13, 2, '2013-03-22', 2, 5.00),
(14, 2, '2013-03-22', 2, 5.00),
(15, 2, '2013-03-22', 2, 5.00),
(16, 2, '2013-03-22', 3, 5.00),
(17, 3, '2013-03-22', 3, 5.00),
(18, 4, '2013-03-22', 4, 2.00),
(19, 2, '2013-03-23', 1, 2.00),
(20, 3, '2013-03-22', 1, 2.00),
(21, 2, '2013-03-25', 2, 2.00),
(22, 3, '2013-03-22', 8, 9.00),
(23, 2, '2013-03-22', 4, 3.00),
(24, 1, '2013-03-25', 2, 3.00),
(25, 4, '2013-03-25', 2, 2.50),
(26, 4, '2013-03-25', 3, 7.20),
(27, 2, '2013-03-25', 3, 0.30),
(28, 2, '2013-03-27', 1, 5.00),
(29, 1, '2013-03-28', 1, 2.00),
(30, 1, '2013-03-28', 1, 4.00),
(31, 1, '2013-03-25', 2, 2.00),
(32, 1, '2013-04-15', 1, 2.50),
(33, 2, '2013-04-15', 1, 2.60),
(34, 1, '2013-04-15', 1, 2.50),
(35, 1, '2013-04-15', 2, 2.50),
(36, 2, '2013-04-15', 2, 5.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `surname`, `email`, `password`) VALUES
(1, 'Sirvan', 'Almasi', 'salmasi@contentformula.com', ''),
(2, 'Daniel', 'Keegan', 'dkeegan@contentformula.com', ''),
(3, 'James', 'Taylor', 'jtaylor@contentformula.com', ''),
(4, 'James', 'Toseland', 'jtoseland@contentformula.com', ''),
(5, 'Elisa', 'Azogui', '', ''),
(6, 'John', 'Scott', '', ''),
(7, 'Mike', 'Gough', '', ''),
(8, 'Daniel', 'Dukharan', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
