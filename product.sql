
-- Use create databases data 
create database data;
use data;

-- create the Product table and load data into it.
DROP TABLE product;

CREATE TABLE product
( 
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int,
    realse_date date,
    sales int8
);

-- Display the sctructure of prodcut table

desc product;

-- add the column with in alter command

alter table product  add column sales int8;
 
-- Insert data on product table 

INSERT INTO product VALUES('Phone', 'Apple', 'iPhone 12 Pro Max', 1300,  date'2001-02-12',1200);
INSERT INTO product VALUES('Phone', 'Apple', 'iPhone 12 Pro', 1100, date'1989-02-12',1233);
INSERT INTO product VALUES ('Phone', 'Apple', 'iPhone 12', 1000, date'2001-01-11',2333);
INSERT INTO product VALUES ('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800,date'2012-01-14',2673);
INSERT INTO product VALUES('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000,date'2001-01-11',2653);
INSERT INTO product VALUES('Laptop', 'Dell', 'XPS 13', 2000,date'2012-01-11',2333);
INSERT INTO product VALUES('Laptop', 'Dell', 'XPS 15', 2300,date'2001-01-11',2333);
INSERT INTO product VALUES('Laptop', 'Dell', 'XPS 17', 2500,date'2001-01-11',2333);
INSERT INTO product VALUES('Earphone', 'Apple', 'AirPods Pro', 280,date'2001-01-11',2333);
INSERT INTO product VALUES('Earphone', 'Samsung', 'Galaxy Buds Pro', 220,date'2001-01-11',233);
INSERT INTO product VALUES('Earphone', 'Samsung', 'Galaxy Buds Live', 170,date'2001-01-11',233);
INSERT INTO product VALUES('Earphone', 'Sony', 'WF-1000XM4', 250,date'2001-01-11',273);
INSERT INTO product VALUES('Phone', 'Samsung', 'Galaxy Note 20', 1200,date'1991-01-11',2387);
INSERT INTO product VALUES('Phone', 'Samsung', 'Galaxy S21', 1000,date'2007-01-11',2303);
INSERT INTO product VALUES('Phone', 'OnePlus', 'OnePlus Nord', 300,date'2001-01-11',2389);
INSERT INTO product VALUES('Phone', 'OnePlus', 'OnePlus 9', 800,date'2000-01-01',2363);
INSERT INTO product VALUES('Phone', 'Google', 'Pixel 5', 600,date'1991-01-11',2383);
INSERT INTO product VALUES('Laptop', 'Apple', 'MacBook Pro 13', 2000,date'1981-01-11',2373);
INSERT INTO product VALUES('Laptop', 'Apple', 'MacBook Air', 1200,date'1981-01-11',2763);
INSERT INTO product VALUES('Laptop', 'Microsoft', 'Surface Laptop 4', 2100,date'1988-01-11',2333);
INSERT INTO product VALUES('Headphone', 'Sony', 'WH-1000XM4', 400,date'2002-01-11',2563);
INSERT INTO product VALUES('Headphone', 'Apple', 'AirPods Max', 550,date'2001-01-11',2312);
INSERT INTO product VALUES('Headphone', 'Microsoft', 'Surface Headphones 2', 250,date'2011-01-11',2113);
INSERT INTO product VALUES('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000,date'2001-01-11',2312);
INSERT INTO product VALUES('Smartwatch', 'Apple', 'Apple Watch SE', 400,date'2001-01-11',2312);
INSERT INTO product VALUES('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600,date'2001-01-11',2312);
INSERT INTO product VALUES('Smartwatch', 'OnePlus', 'OnePlus Watch', 220,date'2001-01-11',2333);
 
 -- save the data on the product table 
COMMIT;
-- select all the row and columns of product table and display the screen

select * from product;

-- Write query to display the most expensive product under each category (corresponding to each record)

select *, Product_name , rank() over(partition by  product_category  order by Price ) as expensive_product 
from product order by product_category desc limit 5;

-- Write query to display the least expensive product under each category (corresponding to each record)

select *, first_value(product_name)  over(partition by product_category order by price desc) as most_exp_product ,
last_value(product_name) 
    over(partition by product_category order by price desc)  as exp_product 
    from product  WHERE product_category ='Phone';

-- Alternate way to write SQL query using Window functions
select *,
first_value(product_name) over w as most_exp_product,
last_value(product_name) over w as exp_product    
from product
WHERE product_category ='Phone'
window w as (partition by product_category order by price desc
            range between unbounded preceding and unbounded following);
            
-- NTH_VALUE 
-- Write query to display the Second most expensive product under each category.
select *,
first_value(product_name) over w as most_exp_product,
last_value(product_name) over w as exp_product,
nth_value(product_name, 5) over w as second_exp_product
from product
window w as (partition by product_category order by price desc
            range between unbounded preceding and unbounded following);

-- Write a query to segregate all the expensive phones, mid range phones and the cheaper phones.
select x.product_name, 
case when x.buckets = 1 then 'Expensive Phones'
     when x.buckets = 2 then 'Mid Range Phones'
     when x.buckets = 3 then 'Cheaper Phones' END as Phone_Category
from (
    select *,
    ntile(3) over (order by price desc) as buckets
    from product
    where product_category = 'Phone') x;

-- CUME_DIST (cumulative distribution) ; 
/*  Formula = Current Row no (or Row No with value same as current row) / Total no of rows */

-- Query to fetch all products which are constituting the first 50% 
-- of the data in products table based on price.
select product_name, cume_per from (
 select *,
    round(cume_dist() over (order by price desc)*10, 2)  as cume_Per from product)
    h where h.cume_per<=0.5;


-- PERCENT_RANK (relative rank of the current row / Percentage Ranking)
/* Formula = Current Row No - 1 / Total no of rows - 1 */

-- Query to identify how much percentage more expensive is "Galaxy Z Fold 3" when compared to all products.

select product_name , per from(
select *, round(percent_rank() over(order by price)*100, 2) as per from product) x 
 where x.product_name='Galaxy Z Fold 3';
 

