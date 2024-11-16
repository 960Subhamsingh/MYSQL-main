-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;


-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- Data cleaning

SELECT 	* FROM sales;


-- Add the time_of_day column
SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;


ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- For this to work turn off safe mode for update
-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
-- Reconnect to MySQL: Query > Reconnect to server
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);


-- Add day_name column
SELECT
	date,
	DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);


-- Add month_name column
SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

 
-- ---------------------------- Generic Question ------------------------------
 
-- How many unique cities does the data have?
SELECT 
	DISTINCT city
FROM sales;

-- In which city is each branch?
SELECT 
	DISTINCT city,
    branch
FROM sales;

 
------------------------------ Product Question -------------------------------
 

-- How many unique product lines does the data have?
SELECT
	DISTINCT product_line
FROM sales;


-- What is the most selling product line
SELECT
	SUM(quantity) as qty,
    product_line
FROM sales
GROUP BY product_line
ORDER BY qty DESC;

-- What is the most selling product line
SELECT
	SUM(quantity) as qty,
    product_line
FROM sales
GROUP BY product_line
ORDER BY qty DESC;

-- What is the total revenue by month
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue;


-- What month had the largest COGS?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs;


-- What product line had the largest revenue?
SELECT
	product_line,
	SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT
	branch,
	city,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch 
ORDER BY total_revenue;


-- What product line had the largest VAT?
SELECT
	product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;


-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales

SELECT 
	AVG(quantity) AS avg_qnty
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;


-- Which branch sold more products than average product sold?
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);


-- What is the most common product line by gender
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- What is the average rating of each product line
SELECT
	ROUND(AVG(rating), 2) as avg_rating,
    product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- -------------------------- Customers -------------------------------
 
-- How many distinct customer types are in the data?

select distinct customer_type from sales; 

-- How many unique payment methods  in the sales data?

select distinct payment , count(*) from sales group by payment; 


-- How many common types of customer type are there in the sales data?

select distinct customer_type from sales;

-- Which customer type buys the most?

select customer_type, count(*) from sales group by customer_type;

-- What is the gender of most of the customers?

select distinct gender from sales;

-- How many genders shopped at each branch

select distinct gender  , branch, count(*) from sales 
 group by gender, branch ;

-- Which time of the day do customers give most ratings?

SELECT  time_of_day, AVG(rating) AS avg_rating FROM sales 
 group by time_of_day;
 
**Customers give the highest ratings in the evening time**

-- What time of day do customers rate each branch the highest?

SELECT  time_of_day, branch, avg(rating) as avg_rating from sales
 group by time_of_day ,branch;

-- Which day fo the week has the best avg ratings?

SELECT day_name, 	AVG(rating) AS avg_rating  FROM sales
GROUP BY day_name  ORDER BY avg_rating DESC; 

/* 1. Mon,Tuesday and Friday are the best days for  rating. 
2. I Think  this days has many people are active on application
*/

-- On which day of the week is the average rating per branch the best?

SELECT  branch, day_name, AVG(rating) AS avg_rating  FROM sales 
GROUP BY day_name , branch ORDER BY avg_rating DESC;
 
-- ---------------------------- Sales ---------------------------------
 

-- Number of sales in each time of the per weekend

select time_of_day , day_name , count(*) as total_sales  from sales
 group by time_of_day , day_name order by total_sales desc;


-- In the evening, the shops are crowded and have good sales

-- What type of customer drives the most revenue?

SELECT customer_type , round(sum(total)) as total_revenue from sales group by customer_type;   

-- Which city has the largest tax  percent?

SELECT city,  ROUND(AVG(tax_pct), 2) AS avg_tax_pct FROM sales GROUP BY city ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most VAT?

SELECT customer_type, AVG(tax_pct) AS total_tax
    FROM sales  GROUP BY customer_type ORDER BY total_tax;  
 

