-- phpMyAdmin SQL Dump
-- version 2.11.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2013 at 12:18 AM
-- Server version: 5.0.45
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `cf_matrix`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `Contact` int(11) NOT NULL,
  `redmine_url` varchar(255) NOT NULL,
  `n_url` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `Contact`, `redmine_url`, `n_url`) VALUES
(1, 'Lewisham', 4, 'http://redmine.cf/projects/274-lewisham-college/wiki', 'N:\\Lewisham College'),
(2, 'Pfizer', 4, '', ''),
(3, 'ASPJJ', 5, '', ''),
(4, 'RRUKA', 6, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `task_repetition`
--

DROP TABLE IF EXISTS `task_repetition`;
CREATE TABLE IF NOT EXISTS `task_repetition` (
  `id` int(11) NOT NULL auto_increment,
  `task_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `duration` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `task_repetition`
--

INSERT INTO `task_repetition` (`id`, `task_id`, `date`, `user_id`, `duration`) VALUES
(1, 1, '2013-03-22', 1, '8.50'),
(2, 1, '2013-03-25', 1, '6.00'),
(3, 1, '2013-03-22', 1, '3.25'),
(4, 2, '2013-03-22', 1, '2.50'),
(5, 1, '2013-03-22', 2, '6.00'),
(6, 1, '2013-03-22', 2, '6.00'),
(7, 1, '2013-03-22', 0, '12.00'),
(8, 2, '2013-03-22', 0, '12.00'),
(9, 2, '0000-00-00', 2, '0.00'),
(10, 2, '2013-03-22', 2, '12.00'),
(11, 1, '2013-03-25', 1, '6.00'),
(12, 2, '2013-03-22', 2, '5.00'),
(13, 2, '2013-03-22', 2, '5.00'),
(14, 2, '2013-03-22', 2, '5.00'),
(15, 2, '2013-03-22', 2, '5.00'),
(16, 2, '2013-03-22', 3, '5.00'),
(17, 3, '2013-03-22', 3, '5.00'),
(18, 4, '2013-03-22', 4, '2.00'),
(19, 2, '2013-03-23', 1, '2.00'),
(20, 3, '2013-03-22', 1, '2.00'),
(21, 2, '2013-03-25', 2, '2.00'),
(22, 3, '2013-03-22', 8, '9.00'),
(23, 1, '2013-03-22', 3, '2.00'),
(24, 1, '2013-03-22', 4, '3.00'),
(25, 1, '2013-03-23', 2, '3.65'),
(26, 1, '2013-03-23', 1, '5.50'),
(27, 2, '2013-03-22', 4, '2.00'),
(28, 1, '2013-03-22', 4, '0.50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
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
