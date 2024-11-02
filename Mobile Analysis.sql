
-- Create phone databases
create database Phone;
-- use Phone databases
use phone;

-- Q0. Total numbers of Mobile
select sum(Total_mobile) from mobile;

-- Q1. Check mobile  features and price list.

select phone_name, price from mobile;

-- Q2. Find out the price of 5 most expensive phones

select * from mobile order by  price  desc limit 5;

-- Q3. Find out the price of 5 most cheapest phones
select * from mobile order by  price  asc limit 5;

-- Q4. List of top  5 Samsung Phones with price and all  Features
select * from mobile where Brands = 'Samsung' order by  price  desc limit 5;

-- Q5. Must have android phone list then top 5 High Price Android Phones
select * from mobile where operating_system_type = 'Android' order by  price  desc limit 5;

-- Q6 Must have android phone list then top 5 lower price android phones
select * from mobile order by  price  asc limit 5;

-- Q7 Must have IOS Phone list then top 5 High price IOS phones
select * from mobile where Operating_System_Type = 'IOS' order by  price  desc limit 5;

-- Q8 Must have IOS phone list then top 5 lower price IOS phones
select * from mobile order by  price  desc limit 5;

-- Q9 Write a query which phone support 5g and also top 5 phone with 5g support 
select * from mobile where 5G_Availability = 'yes'  order by  5g_Availability  desc limit 5;

-- 10 Total price of all Mobile is to be found with brand name

select brands, sum(Price) from mobile group by brands;

-- Q11. Total number of mobile in Internal_Storage and 5G_Availability 

select 5G_Availability , sum(total_mobile) , sum(internal_Storage) from mobile group by 5G_Availability ;

-- Q12. Total number of 5G Phone

select 5G_Availability , sum(total_mobile) from mobile group by 5G_Availability;

-- Q Total Number of Selfie_Camera camers and 5G_Availability

select 5G_Availability , sum(Selfie_Camera) from mobile group by 5G_Availability;


