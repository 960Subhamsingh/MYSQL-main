create database bike_sales;
use bike_sales

-- create table address(
-- ADDRESSID int,
-- CITY varchar(50),
-- POSTALCODE varchar(35),
-- STREET varchar(50),
-- BUILDING int,
-- COUNTRY char(20),
-- REGION char(25),
-- ADDRESSTYPE int,
-- VALIDITY_STARTDATE date,
-- VALIDITY_ENDDATE date,
-- LATITUDE int ,
-- LONGITUDE int
-- );


 select * from  address

select fiscalyearperiod from salesorders

alter table  salesorders modify column  fiscalyearperiod to date
 
select  * from salesorders


-- total number of products for each product category
SELECT PRODCATEGORYID, COUNT(*) as total_no FROM bike_sales.products
group by PRODCATEGORYID;

-- top 5 most expensive products.
SELECT PRODUCTID, PRICE FROM products
ORDER BY PRICE DESC
LIMIT 5;

-- all products that belong to the 'Mountain Bike' category
SELECT * FROM products p
LEFT JOIN productcategorytext pt
ON p.PRODCATEGORYID=pt.PRODCATEGORYID
WHERE SHORT_DESCR LIKE 'Mountain Bike'
;

-- total sales amount (gross) for each product category
SELECT PRODCATEGORYID, SUM((s.GROSSAMOUNT)) AS GROSS 
FROM salesorders s
LEFT JOIN products p
ON s.PARTNERID=p.SUPPLIER_PARTNERID
GROUP BY PRODCATEGORYID;

-- total gross amount for each sales order.
SELECT SALESORDERID,SUM(GROSSAMOUNT) AS total_gross_amount 
FROM salesorders
GROUP BY SALESORDERID
ORDER BY total_gross_amount DESC;

-- Trend in sales over different fiscal year periods
UPDATE salesorders2
SET FISCALYEARPERIOD = STR_TO_DATE(CONCAT(LEFT(FISCALYEARPERIOD, 4), '-', MID(FISCALYEARPERIOD, 5, 3)), '%Y-%j');

ALTER TABLE salesorders2
MODIFY COLUMN FISCALYEARPERIOD DATE;

WITH ROLLING_TOTAL AS (
SELECT YEAR(FISCALYEARPERIOD) AS `YEAR`,SUM(GROSSAMOUNT) AS total_sales 
FROM salesorders2
GROUP BY `YEAR`
ORDER BY total_sales DESC)
SELECT *, SUM(total_sales) OVER(ORDER BY total_sales DESC) AS rolling_totalsales FROM ROLLING_TOTAL;

-- Which products contribute the most to revenue when the billing status is 'Complete'
SELECT p.PRODUCTID,pt.SHORT_DESCR AS product_name,ROUND(SUM(NETAMOUNT),2) AS total_revenue FROM salesorders2 s 
LEFT JOIN products p 
ON s.PARTNERID=p.SUPPLIER_PARTNERID
LEFT JOIN productcategorytext pt
ON p.PRODCATEGORYID=pt.PRODCATEGORYID
WHERE BILLINGSTATUS='C'
GROUP BY p.PRODUCTID, product_name
ORDER BY total_revenue DESC;

-- How many business partners are there for each partner role?
SELECT PARTNERROLE, COUNT(*) AS no_of_partners FROM businesspartners
GROUP BY PARTNERROLE ;

-- List the employees who have 'W' in their first name 
SELECT EMPLOYEEID, CONCAT(NAME_FIRST, " ", NAME_LAST) AS full_name FROM employees
WHERE NAME_FIRST LIKE '%W%';

-- Find the number of employees for each sex.
SELECT SEX,COUNT(*) no_employee 
FROM employees
GROUP BY sex;

-- Q27: List the top 5 employees who have created the most sales orders.
SELECT e.EMPLOYEEID, COUNT(s.SALESORDERID) AS sales_count FROM employees e
LEFT JOIN salesorders2 s
ON e.EMPLOYEEID=s.CREATEDBY
GROUP BY EMPLOYEEID
ORDER BY sales_count DESC
LIMIT 5;