-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2016 at 12:33 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fishing`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `color` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `qty`, `color`, `created`, `modified`) VALUES
(2, 4, 2, 3, 0, '2016-10-18 05:06:40', '2016-10-18 05:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` varchar(255) NOT NULL,
  `modified_by` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `is_active`, `is_delete`, `created_by`, `modified_by`, `created`, `modified`) VALUES
(1, 0, 'Fish grip', 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 'Tackle, Rods & Tool Holders', 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 'Hook Removal & Scaler Tools', 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 0, 'Boat Hitch  & Walking Accessories', 1, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE IF NOT EXISTS `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Black', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Grey', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Green', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Blue', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `usage_per_limit` int(11) NOT NULL,
  `usage_per_user` int(11) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `old_coupons`
--

CREATE TABLE IF NOT EXISTS `old_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `criteria_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `range` tinyint(1) NOT NULL,
  `value` varchar(255) NOT NULL,
  `limit` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('null','Processing','Confirmed','On-hold','Cancelled','In Transist','Refunded','Shipped','Delivered','Handover','Completed','Return') DEFAULT 'null',
  `sub_total` double(11,2) NOT NULL DEFAULT '0.00',
  `codcharge` varchar(255) DEFAULT NULL,
  `shipping` varchar(255) NOT NULL,
  `discount` double(11,2) NOT NULL DEFAULT '0.00',
  `total` double(11,2) NOT NULL DEFAULT '0.00',
  `payment_methoad` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `order_address_id` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_no`, `user_id`, `status`, `sub_total`, `codcharge`, `shipping`, `discount`, `total`, `payment_methoad`, `transaction_id`, `order_address_id`, `invoice`, `created`, `modified`) VALUES
(1, NULL, 6, 'null', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', NULL, 4, 0, '2016-10-19 07:59:32', '2016-10-19 07:59:32'),
(2, NULL, 6, 'null', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', NULL, 4, 0, '2016-10-19 08:00:59', '2016-10-19 08:00:59'),
(3, NULL, 6, 'null', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', NULL, 4, 0, '2016-10-19 08:02:18', '2016-10-19 08:02:18'),
(4, NULL, 6, 'null', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', NULL, 4, 0, '2016-10-19 08:02:45', '2016-10-19 08:02:45'),
(5, NULL, 6, 'null', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', NULL, 4, 0, '2016-10-19 08:03:02', '2016-10-19 08:03:02'),
(6, NULL, 6, 'null', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', NULL, 4, 0, '2016-10-19 08:04:31', '2016-10-19 08:04:31'),
(7, 'ojw7n2', 6, 'Processing', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', '4R170316XU765732E', 4, 0, '2016-10-19 08:11:36', '2016-10-19 08:13:03'),
(8, 'o27gxr', 6, 'Processing', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', '6KA249461D531150C', 4, 0, '2016-10-19 08:14:15', '2016-10-19 08:15:41'),
(9, 'ihcw7g', 6, 'Processing', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', '4J292221EM008445Y', 4, 0, '2016-10-19 08:16:29', '2016-10-19 08:17:48'),
(10, 'b5ggrb', 7, 'Processing', 100.00, NULL, '0', 0.00, 100.00, 'PayPal', '7N982185421494349', 9, 0, '2016-10-20 05:35:54', '2016-10-20 05:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE IF NOT EXISTS `order_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `order_addresses`
--

INSERT INTO `order_addresses` (`id`, `order_id`, `address_id`, `created`, `modified`) VALUES
(1, 1, 0, '2016-09-23 00:00:00', '2016-09-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_images`
--

CREATE TABLE IF NOT EXISTS `order_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `order_images`
--

INSERT INTO `order_images` (`id`, `order_id`, `product_id`, `image`, `created`, `modified`) VALUES
(1, 1, 1, '160922133604_Koala.jpg', '2016-09-23 00:00:00', '2016-09-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `reason_for_cancellation` text,
  `price` double(11,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) NOT NULL DEFAULT 'Processing',
  `request_for_cancellation` tinyint(1) DEFAULT '0',
  `request_for_return` tinyint(1) DEFAULT '0',
  `invoice` varchar(255) DEFAULT NULL,
  `invoice_pdf` varchar(255) DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `user_id`, `product_id`, `qty`, `color_id`, `image`, `reason_for_cancellation`, `price`, `status`, `request_for_cancellation`, `request_for_return`, `invoice`, `invoice_pdf`, `status_date`, `created`, `modified`) VALUES
(1, 1, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 07:59:32', '2016-10-19 07:59:32'),
(2, 2, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 08:00:59', '2016-10-19 08:00:59'),
(3, 3, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 08:02:18', '2016-10-19 08:02:18'),
(4, 4, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 08:02:45', '2016-10-19 08:02:45'),
(5, 5, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 08:03:02', '2016-10-19 08:03:02'),
(6, 6, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 08:04:31', '2016-10-19 08:04:31'),
(7, 7, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 08:11:36', '2016-10-19 08:11:36'),
(8, 8, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 08:14:16', '2016-10-19 08:14:16'),
(9, 9, 6, 2, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-19 08:16:29', '2016-10-19 08:17:48'),
(10, 10, 7, 3, 1, 0, NULL, NULL, 100.00, 'Processing', 0, 0, NULL, NULL, NULL, '2016-10-20 05:35:54', '2016-10-20 05:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `pagecontents`
--

CREATE TABLE IF NOT EXISTS `pagecontents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pagecontents`
--

INSERT INTO `pagecontents` (`id`, `category_id`, `name`, `description`, `created`, `modified`) VALUES
(1, 1, 'Fish Grip Main Heading Contetn', 'Never have to Stick Your Hand Inside of a Fishes Mouth or Worry about Getting Finned While Safely and Securely Holding onto the Fish and Buy a Fish Lipper. We offer Norton Plastics Fish Grip Pliers the Industries only Plastic Fish Lip Grabber Tools for Sale at the Best Prices.\r\n', '0000-00-00 00:00:00', '2016-10-04 08:33:54'),
(2, 1, 'Fish Grip Main Body Content', '<p>After catching a fish whether you are going to release it or keep it you have to be able to grip the fish safely. It can be difficult to grab and hold on to it by its body, because fish are slippery and move around a lot. This why most experienced fisherman grab the fish by the lip to take out the hook and handle the fish. However, gripping the fish by the lip with your hand can be dangerous for both you and the fish. You can get finned, cut your figures on the hook or the fish&rsquo;s teeth and even though grabbing the fish by lip is much more secure than holding its body it is still easy to lose your grip and drop the fish. Without the right tool to hold onto your fish you will undoubtedly at some point lose your catch, get finned, or not get the fish back in the water onto to release it. This is why you need to buy and have plastic handheld fish lip grabber in your tackle box.<br />\r\n<br />\r\nThere a variety of fish lippers you can buy. However, many of these fish holder tools are heavy, do not lock into place and are made from metal that will sink and are pretty expensive. The fish grip made by Norton United Plastics is a plastic plier like fish grabber. The Norton United Plastics fish holder tool is lightweight, inexpensive when compared to other fish lip holders, floats, locks into place and has any easy hand operated plier like movement. The Norton United Plastics fish grip was created by expert anglers who know what is needed by a fish lip grabber. It is the best lip holding tool you can buy and makes holding, landing, scaling, and releasing fish safe and easy.<br />\r\n<br />\r\nAt our online fishing supplies and accessories store we offer the Norton United Plastics fish grip in 6 different colors including glow in the dark at the best possible price. We make it easy and affordable for you to buy and have the fish lip holding tool you need on your next fishing trip. We also offer impeccable customer service before and after the sale. If you have any questions about the United Plastics hand held fish grip lip grabber please let us know and we will be more than happy to assist you.</p>\r\n', '2016-10-04 08:06:52', '2016-10-04 08:35:49'),
(3, 2, 'Tackle, Roads & Tool Holders Heading Contetn', '<p>Always have the Gear and Equipment you need with the best Fishing Supplies Holders and Carriers. We offer High Quality Fishing Supplies Holders and Holsters made specifically for the Amazing Tools and Fishing Accessories we have for Sale.</p>\r\n', '2016-10-04 08:07:19', '2016-10-04 08:38:05'),
(4, 2, '', '<p>There are a variety of tools and accessories that make fishing easier and more enjoyable. There are certain fishing tools and supplies that you need every time you catch a fish and need easy access to. Fishing gear holders and tool holsters allow you to easily carry and have quick access to the supplies and equipment you need most. They also make easy for you to walk and move around the boat with your hands free while still carrying the fishing tools and accessories you need.<br />\r\n<br />\r\nWhen purchasing fishing equipment carriers and gear holsters it is important to purchase quality supplies holders that securely carry the types of tools you need and provide easy access to them. There is no point in buying carriers and holsters that are made for fishing equipment you do not carry or to buy cheap low quality holders that fall apart quickly and need to be replaces or lose the tools and accessories it was supposed to be carrying.<br />\r\n<br />\r\nHere, at our online fishing supplies and accessories store we offer high quality holsters and holders that make it easy to carry the tools and gear offered from this site. Our fishing equipment holders and holsters are made from high quality durable materials that not only make carrying the tools and accessories we offer at our online store easy they will last. The fishing tool carriers and holsters we offer are made specifically for the unique gear we offer and provide a secure tight fit. If you have any questions or need any help finding the best equipment holders for the tools and accessories you carry please let us know and we will be more than happy to assist you.&nbsp;</p>\r\n', '2016-10-04 08:07:40', '2016-10-04 08:07:40'),
(5, 3, 'Hook Removal & Scaler Tools', '<p>Safely Remove Hooks no Matter how Deep the Barb and Make Scaling Fish Easy with the Best Fish Hook Extractors and Descaler Tools. We have for Sale a Durable Heavy Duty Plastic Fish Hook Remover and the Ultimate Scaling Tool that Make Removing Hooks and Skinning Fish Safe and Easy.</p>\r\n', '2016-10-04 08:08:02', '2016-10-04 08:38:36'),
(6, 3, '', '<p>After a catching a fish whether you are going to keep it or release it you have to remove the hook or lure. If you are keeping the fish you have to clean and remove the scales before you are able to cook it. Removing the hook and lures as well as descaling and cleaning the fish can be difficult and even dangerous without the proper tools. Removing a hook or lure by hand it is easy to get cut the barb or by the fish itself. When the hook is deep it makes it that much tough and that much more dangerous. When using a knife to descale the fish it is very easy for it to slip and cut you, and to cut out meat that could have been eaten.</p>\r\n\r\n<p>The best fish hook extractors and scalers are essential tools that make it safer and easier to remove fish hooks, descale and clean your catch. When purchasing a hook extractor or a fish scaler it is important to purchase quality tools that will last and get the job done. The most important things when buying a fishing hook/lure remover is that it is long enough so that regardless of how deep the hook is or big the fish is you never have to stick your hand in its mouth. And that the part of the tool that removes the barb is not so wide that it will not fit in small fishes mouths. It is also a good idea to buy one that is made of thick durable plastic so it will float. When purchasing a fish scaler the most important things are that the tool is easy to use, doesn&rsquo;t send scales flying all over the place and will last.</p>\r\n\r\n<p>Here, at our online fishing supplies and accessories store we offer the best fish hook/lure extractor and scaler for sale at the best possible price. Our fish hook removing and scaling tools make it easy and safe for you to descale your catch and extract hooks and lures regardless of the size of the fish or how deep the barbs are. Our fishing hook removing tool is long and skinny making it easy to get in and out of any fishes mouth and safely extract hooks and lures of all sizes. Our fish scaler is simple to use, and unlike other descaling tools does not send scales flying all of over the place so there isn&rsquo;t ever a big mess to have to clean up.</p>\r\n\r\n<p>Both our lure/hook remover and fish scaler are made from durable plastic that while being lightweight and easy to carry will not break and will float. We make it easy and affordable for you to get the best fishing hook extractor and scaler and make it as easy and safe as possible for you to remove hooks and lures and clean your catch. If you have any questions about our hook remover, fish descaler or other tools and accessories we have for sale please let us know and we will be more than happy to assist you.</p>\r\n', '2016-10-04 08:08:17', '2016-10-04 08:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `desc` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(255) NOT NULL,
  `view_count` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `sku`, `qty`, `price`, `image`, `width`, `height`, `desc`, `active`, `slug`, `view_count`, `is_delete`, `created`, `modified`) VALUES
(1, 1, 'test grip', 'test-121', 10, 100, '160922133604_Koala.jpg', 250, 300, 'test', 1, 'test-grip-2', 0, 0, '2016-09-22 13:31:39', '2016-10-06 06:04:07'),
(2, 1, 'test grip', 'test-121', 9, 100, '160922133604_Koala.jpg', 250, 300, 'test', 1, 'test-grip-1', 0, 1, '2016-09-22 13:31:39', '2016-09-22 13:36:04'),
(3, 2, 'test grip', 'test-121', 9, 100, '160922133604_Koala.jpg', 250, 300, 'test', 1, 'test-grip-1', 0, 0, '2016-09-22 13:31:39', '2016-09-22 13:36:04'),
(4, 3, 'test grip', 'test-121', 10, 100, '160922133604_Koala.jpg', 250, 300, 'test', 1, 'test-grip-1', 0, 0, '2016-09-22 13:31:39', '2016-09-22 13:36:04'),
(5, 4, 'test grip', 'test-121', 10, 100, '160922133604_Koala.jpg', 250, 300, 'test', 1, 'test-grip-1', 0, 0, '2016-09-22 13:31:39', '2016-09-22 13:36:04'),
(6, 2, 'test grip', 'test-121', 10, 100, '160922133604_Koala.jpg', 250, 300, 'test', 1, 'test-grip-1', 0, 0, '2016-09-22 13:31:39', '2016-09-22 13:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE IF NOT EXISTS `product_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `color_id` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `product_id`, `color_id`, `created`, `modified`) VALUES
(9, 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `picture`, `created`, `modified`) VALUES
(1, 3, 'caddy2.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 5, 'brackets2.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 11, 'gatorfoot3.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 12, 'knee2.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created`, `modified`) VALUES
(2, 4, 1, 3, 'nice product', '2016-10-15 05:58:42', '2016-10-15 05:58:42'),
(3, 3, 1, 4, 'Very nice product', '2016-10-15 05:58:42', '2016-10-15 05:58:42'),
(4, 4, 2, 5, '', '2016-10-15 06:49:20', '2016-10-15 06:49:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_sellers`
--

CREATE TABLE IF NOT EXISTS `product_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `actual_rate` double(11,2) NOT NULL,
  `seller_rate` double(11,2) DEFAULT NULL,
  `pincode` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created`, `modified`) VALUES
(1, 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'AL'),
(2, 'AK'),
(3, 'AS'),
(4, 'AZ'),
(5, 'AR'),
(6, 'CA'),
(7, 'CO'),
(8, 'CT'),
(9, 'DE'),
(10, 'DC'),
(11, 'FM'),
(12, 'FL'),
(13, 'GA'),
(14, 'GU'),
(15, 'HI'),
(16, 'ID'),
(17, 'IL'),
(18, 'IN'),
(19, 'IA'),
(20, 'KS'),
(21, 'KY'),
(22, 'LA'),
(23, 'ME'),
(24, 'MH'),
(25, 'MD'),
(26, 'MA'),
(27, 'MI'),
(28, 'MN'),
(29, 'MS'),
(30, 'MO'),
(31, 'MT'),
(32, 'NE'),
(33, 'NV'),
(34, 'NH'),
(35, 'NJ'),
(36, 'NM'),
(37, 'NY'),
(38, 'NC'),
(39, 'ND'),
(40, 'MP'),
(41, 'OH'),
(42, 'OK'),
(43, 'OR'),
(44, 'PW'),
(45, 'PA'),
(46, 'PR'),
(47, 'RI'),
(48, 'SC'),
(49, 'SD'),
(50, 'TN'),
(51, 'TX'),
(52, 'UT'),
(53, 'VT'),
(54, 'VI'),
(55, 'VA'),
(56, 'WA'),
(57, 'WV'),
(58, 'WI'),
(59, 'WY');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created`, `modified`) VALUES
(1, 'david@mavq.co.uk', '2016-10-15 06:53:59', '2016-10-15 06:53:59'),
(2, 'info@anytimeremovals.co.uk', '2016-10-15 09:17:08', '2016-10-15 09:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `bio` longtext,
  `active` tinyint(1) NOT NULL,
  `is_register` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `password`, `email`, `name`, `picture`, `bio`, `active`, `is_register`, `is_delete`, `created`, `modified`, `email_verified`) VALUES
(1, 1, 'jordan', '$2y$10$57YqPYIJicV9cXIWs0vnJOGTHaIc5Vk7vTBqjP9OFuhbJ77I1CCJ.', 'jordan@admin.com', 'Jordan', '160624130617_Koala.jpg', '', 1, 0, 1, '2016-09-19 00:00:00', '2016-09-19 08:03:50', 1),
(2, 2, 'chris_sena', '$2y$10$57YqPYIJicV9cXIWs0vnJOGTHaIc5Vk7vTBqjP9OFuhbJ77I1CCJ.', 'chris@user.com', 'chris', '', 'test data', 1, 0, 0, '2016-09-22 00:00:00', '2016-09-22 00:00:00', 1),
(4, 2, 'chiragsenjaliya99@gmail.com', '$2y$10$hf9s0IY7Crv6kOR2ABFA8Otw3xB8sQy.aLYBrIq/yYKlMc/vR4r12', 'chiragsenjaliya99@gmail.com', 'chris', '', '', 1, 0, 0, '2016-10-03 06:14:23', '2016-10-17 06:55:30', 1),
(5, 2, 'chiragsenjaliya98@gmail.com', '$2y$10$NLNdcqC3UJ.giepRB4xvnunMFrwz2l.AJ602/fCC58EW80uj.jDNu', 'chiragsenjaliya98@gmail.com', 'chris test', '', '', 1, 0, 0, '2016-10-15 12:52:25', '2016-10-17 06:01:52', 1),
(6, 2, 'chiragsenjaliya98@gmail.com', NULL, 'chiragsenjaliya98@gmail.com', NULL, NULL, NULL, 1, 0, 0, '2016-10-19 07:40:50', '2016-10-19 07:40:50', 1),
(7, 2, 'chiragsenjaliya98@gmail.com', NULL, 'chiragsenjaliya98@gmail.com', NULL, NULL, NULL, 1, 0, 0, '2016-10-20 05:19:00', '2016-10-20 05:19:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE IF NOT EXISTS `user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `phone_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `name`, `address1`, `address2`, `phone`, `phone_2`, `city`, `state`, `postcode`, `country`, `is_delete`, `created`, `modified`) VALUES
(2, 4, 'test', 'Near Pakwan 606-akik Toweer', 'S.G. Highway', '8866257917', '9979400055', 'Ahmedabad', 'Gujarat', '380001', 'India', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 4, '', 'Near tower', 'behind bridge', '8866257917', '9979400055', 'New York', 'New York', '10004', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 6, '', '228 Park Ave S', 'behind bridge', '+1971250500', '9979400055', 'New York', 'NY', '10003', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 7, 'Chirag Senjaliiya', '228 Park Ave S', 'behind bridge', '+1971250500', '9979400055', 'New York', 'NY', '10003', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bio` text,
  `phoneno` varchar(255) NOT NULL,
  `mobileno` int(11) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `modified_by` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `color` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `qty`, `color`, `created`, `modified`) VALUES
(2, 4, 1, 3, NULL, '2016-10-14 06:34:11', '2016-10-15 05:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `wrappers`
--

CREATE TABLE IF NOT EXISTS `wrappers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `charges` double(11,2) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
