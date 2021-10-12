-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 12, 2021 at 09:58 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `curd`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllProducts` ()  BEGIN
	SELECT *  FROM `product` ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllProductsById` (`p_id` INT)  BEGIN
	SELECT *  FROM `product` where id =p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductbyId` (`p_id` INT)  BEGIN
	SELECT *  FROM `product` where id =p_id;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteProduct` (`p_id` INT) RETURNS INT(6) BEGIN
	
	
	 
   delete from `curd`.`product`  WHERE id =p_id;
 
      
    RETURN 1;  
	
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `SaveProduct` (`p_name` VARCHAR(255), `p_category` VARCHAR(255), `p_description` VARCHAR(255), `p_code` VARCHAR(255), `p_price` DOUBLE, `p_quntity` INT, `p_rate` INT) RETURNS INT(6) BEGIN
	
	 declare bus_id varchar(2);   
   INSERT INTO curd.product
( category,  description, code , name, price, quantity, rating)
VALUES(p_category , p_description,p_code,  p_name, p_price, p_quntity, p_rate);  
    SET bus_id = LAST_INSERT_ID() ;
    RETURN bus_id;  
	
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `updateProduct` (`p_id` INT, `p_name` VARCHAR(255), `p_category` VARCHAR(255), `p_description` VARCHAR(255), `p_code` VARCHAR(255), `p_price` DOUBLE, `p_quntity` INT, `p_rate` INT) RETURNS INT(6) BEGIN
	
	
	 
   UPDATE `curd`.`product` SET category =p_category ,description=p_description,code=p_code,name=p_name
   ,price=p_price,quantity=p_quntity,rating=p_rate WHERE `id`=p_id;
 
      
    RETURN 1;  
	
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category`, `code`, `description`, `image`, `name`, `price`, `quantity`, `rating`, `status`) VALUES
(1, 'Accessories', 'fsgdbrg4tg', 'Product Description', '45.00', 'Purple Gemstone Necklace', 45, 55, 20, 0),
(2, 'Electronics', NULL, 'Product Description', NULL, 'Yellow Earbuds', 55, 150, 3, 0),
(3, 'Electronics', '123', 'Product Description', NULL, 'Red Earbuds', 55, 150, 10, 0),
(33, 'Person', '122', 'engineer', NULL, 'frge', 500, 55, 55, 0),
(34, 'qqq', '122', 'qq', NULL, 'qq', 500, 55, 55, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
