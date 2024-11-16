/*
INTRODUCTION: 
A company Axon, which is a retailer selling classic cars, is managing and analyzing their sales data. 
The sales team is struggling to make sense of the data and they do not have a centralized system to manage 
and analyze the data.The management is unable to get accurate and up-to-date sales reports, which is
 affecting the decision-making  process.To address this issue, the company has decided to do data
analysis to manage and analyze their sales  data effectively. The goal of this is to do advance
analytics in SQL on the data and extract insights  that can help the company improve its sales.
*/

USE classicmodel;							# Selecting database to work

-- Q. list of all the payments greater than twice the average amount. 
SELECT * FROM payments
WHERE amount > 2*(SELECT AVG(amount) FROM payments);

-- Q. The average percentage markup of the MSRP on buyPrice.
SELECT ROUND(AVG((MSRP-buyPrice)/MSRP)*100,2) AS 'Avg Markup %' FROM products;

-- Q. Count distinct products does classicmodels sell.
SELECT count(DISTINCT productName) As 'Distinct Product'from products;

-- Q. List the name of customers who don't have sales representatives.
SELECT customerName FROM customers WHERE salesRepEmployeeNumber IS NULL ;

-- Q. The names of executives with VP or Manager in their title.
SELECT concat(firstName, ' ',lastName) As 'Full Name', jobTitle FROM employees
WHERE jobTitle LIKE '%VP%' OR jobTitle LIKE '%Manager%';

-- Q. Top 5 customers having most revenue.
SELECT orderNumber,sum(priceEach*quantityOrdered) AS Total_Revenue, customerName FROM orderdetails
INNER JOIN orders USING (orderNumber)
INNER JOIN customers USING (customerNumber)
GROUP BY orderNumber
ORDER BY sum(priceEach*quantityOrdered) DESC
LIMIT 5;

-- Q. No.of Employee in a Company. 
SELECT count(*) As 'Employees_Count' FROM employees;

-- Q. No.of products in each product line. 
SELECT productLine,count(*) As 'Count_Of_Products' FROM products
GROUP BY productLine
ORDER BY count(*) DESC;

-- Q. Name account representative for each custome.
SELECT customerName,concat(e.firstName,' ',e.lastName) As 'Account_Repersentative' FROM customers
INNER JOIN employees e ON 
customers.salesRepEmployeeNumber = e.employeeNumber;

-- Q. The total payments by Date. 
SELECT paymentDate,sum(amount) As 'Amount' FROM payments GROUP BY paymentDate ORDER BY paymentDate;

-- Q. The products that have not been sold.
SELECT * from products
WHERE NOT EXISTS ( 
SELECT * FROM orderdetails WHERE products.productCode = orderdetails.productCode 
);

-- Q.List the value of 'On Hold' orders.
SELECT DISTINCT(orders.orderNumber), products.productName FROM orders
JOIN orderdetails ON 
orderdetails.orderNumber = orders.orderNumber
JOIN products ON 
orderdetails.productCode = products.productCode
WHERE orders.status = 'On Hold';

-- Q. List the number of orders 'On Hold' for each customer.
SELECT customerName , count(*) As 'Orders on Hold' FROM customers
INNER JOIN orders ON 
customers.customerNumber = orders.customerNumber
WHERE orders.status = 'On Hold'
GROUP BY customerName;

-- Q. List the names of products sold at less than 80% of the MSRP.
SELECT DISTINCT products.productName, products.MSRP
FROM products
JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE orderdetails.priceEach < (0.8 * products.MSRP)
ORDER BY products.MSRP DESC;

-- Q. List of products that have been sold with a markup of 100% or more. 
SELECT DISTINCT products.productName, 2*(products.buyPrice) AS new_buy_price, orderdetails.priceEach
FROM products
JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE orderdetails.priceEach > 2*products.buyPrice;
