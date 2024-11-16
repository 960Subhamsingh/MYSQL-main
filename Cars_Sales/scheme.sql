CREATE DATABASE IF NOT EXISTS `car_model`;

USE `car_model`;


DROP TABLE IF EXISTS `customers`;

CREATE TABLE IF NOT EXISTS `customers` (
  `customerNumber` int NOT NULL,
  `customerName` varchar NOT NULL,
  `contactLastName` varchar NOT NULL,
  `contactFirstName` varchar NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar NOT NULL,
  `addressLine2` varchar DEFAULT NULL,
  `city` varchar NOT NULL,
  `state` varchar DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `sales_emp_No` int(11) DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`customer_No`),
  KEY `sales_emp_No` (`sales_emp_No`),
  CONSTRAINT `customers_sal` FOREIGN KEY (`sales_emp_No`) REFERENCES `employees` (`emp_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `employees`;

CREATE TABLE IF EXISTS `employees` (
  `empNo` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`empNo`),
  KEY `reportsTo` (`reportsTo`),
  KEY `officeCode` (`officeCode`),
  CONSTRAINT `employees_1` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`empNo`),
  CONSTRAINT `employees_2` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `offices`;

CREATE TABLE IF EXISTS `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL,
  PRIMARY KEY (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productCode`),
  KEY `productLine` (`productLine`),
  CONSTRAINT `products_1` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `productlines`;

CREATE TABLE IF EXISTS  `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext,
  `image` mediumblob,
  PRIMARY KEY (`productLine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `customer_No` int(11) NOT NULL,
  `check_No` varchar(50) NOT NULL,
  `payment_Date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customer_No`,`check_No`),
  CONSTRAINT `payments_1` FOREIGN KEY (`customer_No`) REFERENCES `customers` (`customerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `orderdetails` ;

CREATE TABLE `orderdetails` (
  `order_No` int(11) NOT NULL,
  `product_Code` varchar(15) NOT NULL,
  `quantity_Ordered` int(11) NOT NULL,
  `price_each` decimal(10,2) NOT NULL,
  `orderLine_No` smallint(6) NOT NULL,
  PRIMARY KEY (`order_No`,`product_Code`),
  KEY `product_Code` (`product_Code`),
  CONSTRAINT `orderdetails_1` FOREIGN KEY (`order_No`) REFERENCES `orders` (`order_No`),
  CONSTRAINT `orderdetails_2` FOREIGN KEY (`product_Code`) REFERENCES `products` (`product_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_No` int(11) NOT NULL,
  `order_Date` date NOT NULL,
  `required_Date` date NOT NULL,
  `shipped_Date` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text,
  `customer_No` int(11) NOT NULL,
  PRIMARY KEY (`order_No`),
  KEY `customer_No` (`customerNo`),
  CONSTRAINT `orders_1` FOREIGN KEY (`customerNo`) REFERENCES `customers` (`customer_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 