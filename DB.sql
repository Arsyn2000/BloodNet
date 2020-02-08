-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.16 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5683
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table elitedinner.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL DEFAULT '0',
  `last_name` varchar(150) NOT NULL DEFAULT '0',
  `email` varchar(150) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT '0',
  `account_status` varchar(50) DEFAULT '0',
  `account_type` varchar(50) NOT NULL,
  `country` varchar(50) DEFAULT '0',
  `state` varchar(50) DEFAULT '0',
  `city` varchar(50) DEFAULT '0',
  `pin` varchar(10) DEFAULT '0',
  `hphone` varchar(50) DEFAULT '0',
  `wphone` varchar(50) DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `system_generated` varchar(10) DEFAULT NULL,
  `welcome_email_sent` varchar(10) DEFAULT NULL,
  `verification_code` varchar(100) DEFAULT NULL,
  `visible` char(1) NOT NULL DEFAULT 'Y',
  `access_token` varchar(250) DEFAULT NULL,
  `shopify_store_url` varchar(250) DEFAULT NULL,
  `device_token` varchar(250) DEFAULT NULL,
  `arise_uname` varchar(250) DEFAULT NULL,
  `arise_upass` varchar(250) DEFAULT NULL,
  `arise_connected` varchar(250) DEFAULT 'DISCONNECTED',
  `store_name` varchar(250) DEFAULT NULL,
  `shopify_bill_id` varchar(255) DEFAULT NULL,
  `profit_margin` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table elitedinner.application_recurring_charge
CREATE TABLE IF NOT EXISTS `application_recurring_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recurring_charge_id` varchar(50) NOT NULL,
  `account_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `plan_alias` varchar(50) NOT NULL,
  `api_client_id` varchar(50) DEFAULT NULL,
  `price` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `return_url` mediumtext NOT NULL,
  `billing_on` varchar(50) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `activated_on` varchar(50) DEFAULT NULL,
  `cancelled_on` varchar(50) DEFAULT NULL,
  `trial_days` varchar(50) DEFAULT NULL,
  `trial_ends_on` varchar(50) DEFAULT NULL,
  `decorated_return_url` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table elitedinner.faq
CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(250) NOT NULL,
  `answer` varchar(1500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table elitedinner.log_status
CREATE TABLE IF NOT EXISTS `log_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logging_level` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table elitedinner.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL,
  `parent_menu_id` int(15) DEFAULT '-1',
  `menu_scope` varchar(20) DEFAULT NULL,
  `visible` varchar(5) DEFAULT 'Y',
  `link` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table elitedinner.persistent_logins
CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `series` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table elitedinner.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `account_id` int(11) NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `inventory_sync` varchar(45) DEFAULT NULL,
  `product_sync` varchar(45) DEFAULT NULL,
  `order_sync` varchar(45) DEFAULT NULL,
  `commission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table elitedinner.support
CREATE TABLE IF NOT EXISTS `support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `response` varchar(10) NOT NULL,
  `ticket_no` varchar(10) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
