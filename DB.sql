-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.16 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for shristationery
CREATE DATABASE IF NOT EXISTS `shristationery` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shristationery`;

-- Dumping structure for table shristationery.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `last_name` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `email` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `account_status` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `account_type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `store_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `system_generated` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `welcome_email_sent` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `state` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `city` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `pin` varchar(10) CHARACTER SET utf8 DEFAULT '0',
  `hphone` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `wphone` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `visible` char(1) CHARACTER SET utf8 NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.account: ~1 rows (approximately)
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `username`, `password`, `account_status`, `account_type`, `store_name`, `createdate`, `system_generated`, `welcome_email_sent`, `country`, `state`, `city`, `pin`, `hphone`, `wphone`, `visible`) VALUES
	(129, 'Divyesh', 'Jhaveri', 'erdivyeshjhaveri@gmail.com', 'admin@shristationery.com', 'admin@shristationery.com', 'ACTIVE', 'ADMIN', NULL, '2020-02-08 15:10:58', NULL, NULL, 'n/a', 'na/', 'n/a', 'n/a', 'n/a', 'n/a', 'Y');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table shristationery.application_recurring_charge
CREATE TABLE IF NOT EXISTS `application_recurring_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recurring_charge_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `account_id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_alias` varchar(50) CHARACTER SET utf8 NOT NULL,
  `api_client_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `price` varchar(50) CHARACTER SET utf8 NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 NOT NULL,
  `return_url` mediumtext CHARACTER SET utf8 NOT NULL,
  `billing_on` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `updated_at` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `activated_on` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `cancelled_on` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `trial_days` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `trial_ends_on` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `decorated_return_url` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.application_recurring_charge: ~0 rows (approximately)
DELETE FROM `application_recurring_charge`;
/*!40000 ALTER TABLE `application_recurring_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_recurring_charge` ENABLE KEYS */;

-- Dumping structure for table shristationery.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `alias` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_date` timestamp NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `modified_timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.category: ~3 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `alias`, `description`, `create_date`, `status`, `last_modified_by`, `modified_timestamp`) VALUES
	(1, 'Writing Instruments', 'WI', 'All type of writing instruments', '2020-02-10 00:00:00', 'on', 129, '2020-02-10 12:28:14'),
	(2, 'Drawing Instruments', 'DI', 'All type of drawing instruments', '2020-02-24 11:07:38', 'on', 129, '2020-02-24 11:07:38'),
	(3, 'Paper Products', 'PP', 'All type of paper products', '2020-02-10 00:00:00', 'on', 129, '2020-02-10 14:13:25');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for view shristationery.category_subcategory_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `category_subcategory_view` (
	`id` INT(11) NOT NULL,
	`categoryname` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_bin',
	`name` VARCHAR(100) NULL COLLATE 'utf8mb4_bin',
	`alias` VARCHAR(10) NULL COLLATE 'utf8mb4_bin',
	`description` VARCHAR(150) NULL COLLATE 'utf8mb4_bin',
	`status` VARCHAR(50) NULL COLLATE 'utf8mb4_bin'
) ENGINE=MyISAM;

-- Dumping structure for table shristationery.company
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `alias` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `fax` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `logo_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `create_date` timestamp NULL DEFAULT NULL,
  `base_discount` decimal(10,2) DEFAULT '0.00',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `modified_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.company: ~0 rows (approximately)
DELETE FROM `company`;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Dumping structure for table shristationery.distributor
CREATE TABLE IF NOT EXISTS `distributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `alias` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `gstin` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `modified_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.distributor: ~0 rows (approximately)
DELETE FROM `distributor`;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
INSERT INTO `distributor` (`id`, `name`, `alias`, `address`, `phone1`, `phone2`, `gstin`, `email`, `website`, `contact_person`, `create_date`, `status`, `last_modified_by`, `modified_timestamp`) VALUES
	(1, 'Deep Enterprise', 'DE', 'Naranpura, Ahmedabad', '9898989898', '9898989898', 'ABCABCABCABCABC', 'kalpesh@deep.com', 'www.deep.com', 'Mr. Kalpesh Patel', '2020-02-14 13:10:28', 'on', 129, '2020-02-14 13:10:28');
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;

-- Dumping structure for table shristationery.faq
CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(250) CHARACTER SET utf8 NOT NULL,
  `answer` varchar(1500) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.faq: ~0 rows (approximately)
DELETE FROM `faq`;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;

-- Dumping structure for table shristationery.log_status
CREATE TABLE IF NOT EXISTS `log_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logging_level` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.log_status: ~0 rows (approximately)
DELETE FROM `log_status`;
/*!40000 ALTER TABLE `log_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_status` ENABLE KEYS */;

-- Dumping structure for table shristationery.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 NOT NULL,
  `parent_menu_id` int(15) DEFAULT '-1',
  `menu_scope` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `visible` varchar(5) CHARACTER SET utf8 DEFAULT 'Y',
  `link` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.menu: ~0 rows (approximately)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table shristationery.persistent_logins
CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `series` varchar(64) CHARACTER SET utf8 NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.persistent_logins: ~1 rows (approximately)
DELETE FROM `persistent_logins`;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
INSERT INTO `persistent_logins` (`series`, `username`, `token`, `last_used`) VALUES
	('dGLzgsbxmhBM6OaUobHXaA==', 'admin@shristationery.com', 'AypyTc5TF6aYpmLdu26NSg==', '2020-04-04 23:09:15');
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;

-- Dumping structure for table shristationery.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `account_id` int(11) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `inventory_sync` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `product_sync` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `order_sync` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `commission` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.settings: ~0 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table shristationery.sub_category
CREATE TABLE IF NOT EXISTS `sub_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `alias` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `modified_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.sub_category: ~4 rows (approximately)
DELETE FROM `sub_category`;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` (`id`, `category_id`, `name`, `alias`, `description`, `create_date`, `status`, `last_modified_by`, `modified_timestamp`) VALUES
	(1, 1, 'Gel Pens', 'GP', 'All type of gel pens', '2020-02-13 00:00:00', 'on', 129, '2020-02-13 20:09:02'),
	(2, 1, 'Ball Point Pens', 'BP', 'All type of Ball point pens.', '2020-02-10 00:00:00', 'on', 129, '2020-02-10 14:07:40'),
	(3, 1, 'Fountain Pens', 'FP', 'All type of Fountain pens', '2020-02-10 00:00:00', 'on', 129, '2020-02-10 14:08:19'),
	(4, 1, 'Mechanical Pencil', 'MP', 'All type of Mechanical Pencils', '2020-02-10 00:00:00', 'on', 129, '2020-02-10 14:09:11');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;

-- Dumping structure for table shristationery.support
CREATE TABLE IF NOT EXISTS `support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `response` varchar(10) CHARACTER SET utf8 NOT NULL,
  `ticket_no` varchar(10) CHARACTER SET utf8 NOT NULL,
  `subject` varchar(500) CHARACTER SET utf8 NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table shristationery.support: ~0 rows (approximately)
DELETE FROM `support`;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
/*!40000 ALTER TABLE `support` ENABLE KEYS */;

-- Dumping structure for view shristationery.category_subcategory_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `category_subcategory_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `category_subcategory_view` AS select `sc`.`id` AS `id`,`c`.`name` AS `categoryname`,`sc`.`name` AS `name`,`sc`.`alias` AS `alias`,`sc`.`description` AS `description`,`sc`.`status` AS `status` from (`category` `c` join `sub_category` `sc` on((`c`.`id` = `sc`.`category_id`))) order by `c`.`name`,`sc`.`name`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
