## Add the time_of_day column
 - Display how many rows have morning , afternon, evening in the sales table  

mysql> SELECT   
	time,   
	(CASE   
		WHEN 'time' BETWEEN "00:00:00" AND   "12:00:00" THEN "Morning"   
        WHEN 'time' BETWEEN "12:01:00" AND   "16:00:00" THEN "Afternoon"  
        ELSE "Evening"  
    END) AS time_of_day  
FROM sales limit 10;  

+----------+-------------+  
| time     | time_of_day |  
+----------+-------------+  
| 19:44:00 | Evening     |  
| 12:36:00 | Afternoon   |  
| 17:52:00 | Evening     |  
| 18:02:00 | Evening     |  
| 12:22:00 | Afternoon   |  
| 15:10:00 | Afternoon   |  
| 11:26:00 | Morning     |  
| 15:01:00 | Afternoon   |    
| 11:36:00 | Morning     |  
| 20:18:00 | Evening     |  
+----------+-------------+  
10 rows in set (0.00 sec)  

- Add New column in exiting sales table   

mysql>ALTER TABLE sales ADD COLUMN time_of_day  VARCHAR(20);
Query OK, 0 rows affected (1.31 sec)  
Records: 0  Duplicates: 0  Warnings: 0  

- insert the data in time_of_day column with use of upate command

mysql> update sales set time_of_day= (
    -> case
    -> when 'time' between "00:00:00" and "12:00:00" then "Morning"
    -> when 'time' between "12:01:00" and "16:00:00" then "Afternoon"
    -> else "Evening"
    -> end
    -> );
Query OK, 995 rows affected (0.18 sec)
Rows matched: 995  Changed: 995  Warnings: 0

- Display  the column date , time_of _day

mysql> select time , time_of_day from sales limit 10;  
+----------+-------------+  
| time     | time_of_day |  
+----------+-------------+  
| 19:44:00 | Evening     |  
| 12:36:00 | Evening     |  
| 17:52:00 | Evening     |   
| 18:02:00 | Evening     |    
| 12:22:00 | Evening     |     
| 15:10:00 | Evening     |   
| 11:26:00 | Evening     |  
| 15:01:00 | Evening     |  
| 11:36:00 | Evening     |  
| 20:18:00 | Evening     |  
+----------+-------------+  
10 rows in set (0.00 sec)  

## Add day_name column
- Display  the weekname of string format in sales table 

> mysql> SELECT date, DAYNAME(date)  FROM sales limit 10;  
+---------------------+---------------+  
| date                | DAYNAME(date) |  
+---------------------+---------------+  
| 2019-03-13 00:00:00 | Wednesday     |  
| 2019-01-17 00:00:00 | Thursday      |  
| 2019-03-20 00:00:00 | Wednesday     |    
| 2019-03-05 00:00:00 | Tuesday       |   
| 2019-02-27 00:00:00 | Wednesday     |    
| 2019-02-01 00:00:00 | Friday        |    
| 2019-03-27 00:00:00 | Wednesday     |  
| 2019-01-07 00:00:00 | Monday        |  
| 2019-02-14 00:00:00 | Thursday      |  
| 2019-03-25 00:00:00 | Monday        |  
+---------------------+---------------+  
10 rows in set (0.00 sec)  

- Add day_name column in the sales table   

mysql> alter table sales add  column day_name varchar(10);  
Query OK, 0 rows affected (1.31 sec)  
Records: 0  Duplicates: 0  Warnings: 0  

- Add the weekname in string format of the <p style="font-size:20px; color: red; ">day_name column</p> to the use <p style="font-size:20px; color: red;">DAYNAME  Fumction </p> 

mysql> update sales set day_name = dayname(date);  
Query OK, 995 rows affected (0.14 sec)  
Rows matched: 995  Changed: 995  Warnings: 0  

- Display column date m day_name   
 
>  mysql> SELECT date, day_name  FROM sales limit 7;  
+---------------------+-----------+  
| date                | day_name  |  
+---------------------+-----------+  
| 2019-03-13 00:00:00 | Wednesday |  
| 2019-01-17 00:00:00 | Thursday  |  
| 2019-03-20 00:00:00 | Wednesday |  
| 2019-03-05 00:00:00 | Tuesday   |  
| 2019-02-27 00:00:00 | Wednesday |  
| 2019-02-01 00:00:00 | Friday    |  
| 2019-03-27 00:00:00 | Wednesday |  
+---------------------+-----------+  
7 rows in set (0.00 sec)  


##  Add month_name column

> mysql> alter table sales add column month_name varchar(10) ;  
Query OK, 0 rows affected (1.26 sec)  
Records: 0  Duplicates: 0  Warnings: 0  

> mysql> UPDATE sales SET month_name = MONTHNAME(date);  
Query OK, 995 rows affected (0.17 sec)  
Rows matched: 995  Changed: 995  Warnings: 0  

- Display date column to use of monthname Function  

> mysql> SELECT date, MONTHNAME(date) FROM sales limit 10;  
+---------------------+-----------------+  
| date                | MONTHNAME(date) |  
+---------------------+-----------------+  
| 2019-03-13 00:00:00 | March           |  
| 2019-01-17 00:00:00 | January         |   
| 2019-03-20 00:00:00 | March           |    
| 2019-03-05 00:00:00 | March           |    
| 2019-02-27 00:00:00 | February        |    
| 2019-02-01 00:00:00 | February        |  
| 2019-03-27 00:00:00 | March           |   
| 2019-01-07 00:00:00 | January         |  
| 2019-02-14 00:00:00 | February        |    
| 2019-03-25 00:00:00 | March           |   
+---------------------+-----------------+    
10 rows in set (0.00 sec)  


<h1 style= "text-align:center; color: white"> Generic Question </h1>
 
1. How many unique cities does the data have?  
-  SELECT DISTINCT city  FROM sales;

>+-----------+  
| city      |  
+-----------+  
| Yangon    |  
| Naypyitaw |  
| Mandalay  |  
+-----------+  
3 rows in set (0.00 sec)  

2. In which city is each branch?

- SELECT DISTINCT city,  branch FROM sales;  

> +-----------+--------+  
| city      | branch |  
+-----------+--------+ 
| Yangon    | A      |  
| Naypyitaw | C      |  
| Mandalay  | B      |  
+-----------+--------+ 
3 rows in set (0.00 sec)  

<h1 style= "text-align:center; color: white"> Product Question </h1>
 

1. How many unique product lines does the data have?

- SELECT DISTINCT product_line FROM sales;  
> +------------------------+   
| product_line           |  
+------------------------+  
| Food and beverages     |  
| Health and beauty      |  
| Sports and travel      |  
| Fashion accessories    |  
| Home and lifestyle     |  
| Electronic accessories |  
+------------------------+  
6 rows in set (0.00 sec)  


2. What is the most selling product line
- select sum(quantity) as quantity , product_line  from sales  group by product_line order by quantity desc;  

>+----------+------------------------+  
| quantity | product_line           |  
+----------+------------------------+  
|      961 | Electronic accessories |  
|      952 | Food and beverages     |  
|      911 | Home and lifestyle     |  
|      902 | Fashion accessories    |  
|      902 | Sports and travel      |  
|      844 | Health and beauty      |  
+----------+------------------------+  
6 rows in set (0.00 sec) 

 
3. What is the total revenue by month

- select month_name , round(sum(total)) as total_revenue from sales group by month_name order by total_revenue desc ;

> +------------+---------------+  
| month_name | total_revenue |  
+------------+---------------+  
| January    |        116292 |  
| March      |        108867 |  
| February   |         95727 |  
+------------+---------------+  
3 rows in set (0.00 sec)  

4. What month had the largest COGS?
. select month_name , sum(cogs) as cogs from sales group by month_name order by cogs;  
> +------------+-----------+  
| month_name | cogs      |  
+------------+-----------+  
| February   |  91168.93 |  
| March      | 103683.00 |  
| January    | 110754.16 |  
+------------+-----------+  
3 rows in set (0.00 sec)  


5. What product line had the largest revenue?

 - select product_line , round(sum(total)) as total_revenue from sales group by product_line order by total_revenue desc;
> +------------------------+---------------+  
| product_line           | total_revenue |   
+------------------------+---------------+  
| Food and beverages     |         56145 |  
| Fashion accessories    |         54306 |  
| Sports and travel      |         53936 |  
| Home and lifestyle     |         53862 |    
| Electronic accessories |         53783 |  
| Health and beauty      |         48854 |  
+------------------------+---------------+  
6 rows in set (0.00 sec) 

6. What is the city with the largest revenue?

- select branch , city , round(sum(total)) as total_revenue from sales group by city, branch order by total_revenue desc;  

>> +--------+-----------+---------------+  
| branch | city      | total_revenue |   
+--------+-----------+---------------+    
| C      | Naypyitaw |        110491 |  
| A      | Yangon    |        105861 |  
| B      | Mandalay  |        104535 |  
+--------+-----------+---------------+  
3 rows in set (0.00 sec)  


7. What product line had the largest VAT?

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


<h1 style= "text-align:center; color: white"> Sales  Question </h1>
 
1. Number of sales in each time of the per weekend

- select time_of_day , day_name , count(*) as total_sales  from sales group by time_of_day , day_name order by total_sales desc;

> +-------------+-----------+-------------+  
| time_of_day | day_name  | total_sales |  
+-------------+-----------+-------------+  
| Evening     | Saturday  |         164 |  
| Evening     | Tuesday   |         158 |  
| Evening     | Wednesday |         141 |  
| Evening     | Thursday  |         138 |  
| Evening     | Friday    |         138 |  
| Evening     | Sunday    |         132 |  
| Evening     | Monday    |         124 |  
+-------------+-----------+-------------+  
7 rows in set (0.00 sec)  
 
 
-- In the evening, the shops are crowded and have good sales

2. What type of customer drives the most revenue?

-SELECT customer_type , round(sum(total)) as total_revenue from sales group by customer_type;   

>+---------------+---------------+   
| customer_type | total_revenue |    
+---------------+---------------+  
| Member        |        163625 |  
| Normal        |        157261 |   
+---------------+---------------+   

3. Which city has the largest tax  percent?

 - SELECT city,  ROUND(AVG(tax_pct), 2) AS avg_tax_pct FROM sales GROUP BY city ORDER BY avg_tax_pct DESC;  

>+-----------+-------------+   
| city      | avg_tax_pct |    
+-----------+-------------+  
| Naypyitaw |       16.09 |  
| Mandalay  |       15.13 |  
| Yangon    |       14.87 |  
+-----------+-------------+  
3 rows in set (0.00 sec)  

3. Which customer type pays the most VAT?

- SELECT customer_type, AVG(tax_pct) AS total_tax
    FROM sales  GROUP BY customer_type ORDER BY total_tax;  
> +---------------+-------------+  
| customer_type | total_tax   |  
+---------------+-------------+  
| Normal        | 15.09805040 |  
| Member        | 15.61457214 |  
+---------------+-------------+  
2 rows in set (0.00 sec)  

<h1 style=" text-align:center; "> CUSTOMER QUESTION </h1>

1. How many distinct customer types are in the data?

-  select distinct customer_type from sales;   

+---------------+  
| customer_type |  
+---------------+  
| Normal        |  
| Member        |  
+---------------+  
2 rows in set (0.00 sec)   

2. How many unique payment methods  in the sales data?

- select distinct payment , count(*) from sales group by payment;  

> +-------------+----------+   
| payment     | count(*) |  
+-------------+----------+  
| Cash        |      344 |  
| Credit card |      309 |  
| Ewallet     |      342 |  
+-------------+----------+  
3 rows in set (0.00 sec)  

3. How many common types of customer type are there in the sales data?

- select distinct customer_type from sales;

> +---------------+  
| customer_type |  
+---------------+  
| Normal        |  
| Member        |  
+---------------+  
2 rows in set (0.00 sec)

4. Which customer type buys the most?

- select customer_type, count(*) from sales group by customer_type;

>+---------------+----------+  
| customer_type | count(*) |  
+---------------+----------+  
| Member        |      499 |  
| Normal        |      496 |  
+---------------+----------+  
2 rows in set (0.00 sec)  

5. What is the gender of most of the customers?

-  select distinct gender from sales;
+--------+  
| gender |  
+--------+  
| Male   |   
| Female |  
+--------+  
2 rows in set (0.00 sec)  

6. How many genders shopped at each branch

- select distinct gender  , branch, count(*) from sales   group by gender, branch ;

> +--------+--------+----------+    
| gender | branch | count(*) |  
+--------+--------+----------+  
| Female | A      |      160 |  
| Female | B      |      160 |  
| Female | C      |      177 |  
| Male   | A      |      179 |  
| Male   | B      |      169 |  
| Male   | C      |      150 |  
+--------+--------+----------+    
6 rows in set (0.00 sec)

7. Which time of the day do customers give most ratings?

- SELECT  time_of_day, AVG(rating) AS avg_rating FROM sales  group by time_of_day;

> +-------------+------------+  
| time_of_day | avg_rating |  
+-------------+------------+  
| Evening     |    6.95749 |  
+-------------+------------+    
1 row in set (0.00 sec) 
 
**Customers give the highest ratings in the evening time**

8. What time of day do customers rate each branch the highest?

- SELECT  time_of_day, branch, avg(rating) as avg_rating from sales group by time_of_day ,branch;

> +-------------+--------+------------+  
| time_of_day | branch | avg_rating |  
+-------------+--------+------------+  
| Evening     | A      |    7.01829 |  
| Evening     | B      |    6.78906 |  
| Evening     | C      |    7.06391 |  
+-------------+--------+------------+  
3 rows in set (0.00 sec)  

9. Which day for the week has the best avg ratings?

- SELECT day_name, 	AVG(rating) AS avg_rating  FROM sales
GROUP BY day_name  ORDER BY avg_rating DESC; 

> +-----------+------------+  
| day_name  | avg_rating |  
+-----------+------------+   
| Monday    |    7.13065 |  
| Friday    |    7.05507 |  
| Tuesday   |    7.00316 |  
| Sunday    |    6.98864 |  
| Saturday  |    6.90183 |   
| Thursday  |    6.88986 |  
| Wednesday |    6.76028 |  
+-----------+------------+  
7 rows in set (0.06 sec)  

10. On which day of the week is the average rating per branch the best?

- SELECT  branch, day_name, AVG(rating) AS avg_rating  FROM sales GROUP BY day_name , branch ORDER BY avg_rating DESC;

>+--------+-----------+------------+   
| branch | day_name  | avg_rating |  
+--------+-----------+------------+  
| A      | Friday    |    7.31200 |  
| B      | Monday    |    7.26579 |  
| C      | Saturday  |    7.22963 |  
| C      | Friday    |    7.20541 |  
| A      | Monday    |    7.09792 |  
| A      | Sunday    |    7.07885 |  
| C      | Wednesday |    7.06400 |  
| A      | Tuesday   |    7.05882 |  
| C      | Monday    |    7.03684 |    
| C      | Sunday    |    7.02826 |  
| B      | Tuesday   |    7.00189 |  
| A      | Thursday  |    6.95870 |   
| C      | Tuesday   |    6.95185 |  
| C      | Thursday  |    6.95000 |  
| A      | Wednesday |    6.84286 |  
| B      | Sunday    |    6.79706 |  
| B      | Thursday  |    6.75227 |  
| A      | Saturday  |    6.74600 |  
| B      | Saturday  |    6.73667 |  
| B      | Friday    |    6.69412 |  
| B      | Wednesday |    6.37959 |  
+--------+-----------+------------+  
21 rows in set (0.00 sec)