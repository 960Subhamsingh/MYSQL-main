# MYSQL 
[MYSQL QUestion](https://github.com/960Subhamsingh/MYSQL-main/blob/main/MYSQL%20Question.md)

## SQL For Data Analysis

This repo contains my solutions for the course I took from [DataCamp](https://www.datacamp.com/courses/intro-to-sql-for-data-science).

You can find all the solutions here: [intro-sql-for-data-science.sql](https://github.com/jonathanbcsouza/intro-sql-for-data-science/blob/master/Intro%20to%20SQL%20for%20Data%20Science.sql).

I have matched the structure of this repo with the structure of the course:

- Part 1 - Selecting columns
  Provided a brief introduction to working with relational databases. It taught how to begin an analysis by using simple SQL commands to select and summarize columns from database tables.

- Part 2 - Filtering rows
  This exercise taught how to filter tables for rows that meet certain criteria. I learned how to use basic comparison operators, combine multiple criteria, match patterns in text, and much more.

- Part 3 - Aggregate functions
  This exercise taught how to use aggregate functions to summarize data and gain useful insights. Additionally, I learned about arithmetic in SQL, and how to use aliases to make results more readable!

- Part 4 - Sorting, grouping and joins
  This exercise provided a brief introduction to sorting and grouping results, and briefly touched on the concept of joins.

I separated each exercise with the following structure:

```
Part/Chapter XXXXXXX XXXXXXX
----------------------------

-- Exercise XXXXXXXXXXXXX
	### Instruction XXXXXXXXXXXXXXX
	### Solution XXXXXXXXXXXX
```

Example:

```sql
#Part 4 Sorting, grouping and joins
-----------------------------------

--All together now
	#Finally, modify your query to order the results from highest average gross earnings to lowest.
	SELECT release_year, AVG(budget) as avg_budget, AVG(gross) as avg_gross
	FROM films
	GROUP BY release_year
	HAVING AVG(budget) > 60000000
	ORDER BY AVG(gross) DESC;
```


## find all the customers who placed orders on three consecutive days 

## crweate table  

SQL> create table orders( customer_name varchar(15) , order_date date);

Table created.

## insert the row of the existing  order table 

SQL> insert into orders values('subham' ,date'2024-04-01');

1 row created.

SQL> insert into orders values('kumar', date'2024-04-01');

1 row created.

SQL> insert all
     INTO Orders (customer_name, order_date) VALUES ('Mohan', date'2024-04-02')   
     INTO Orders (customer_name, order_date) VALUES ('Mohit', date'2024-04-03')  
     INTO Orders (customer_name, order_date) VALUES ('Ram', date'2024-04-03')      
     INTO Orders (customer_name, order_date) VALUES ('sita', date'2024-04-02')   
     INTO Orders (customer_name, order_date) VALUES ('Shivam', date'2024-04-06')  
     INTO Orders (customer_name, order_date) VALUES ('Akash', date'2024-04-10')  
     INTO Orders (customer_name, order_date) VALUES ('Satyam', date'2024-04-15')   
     INTO Orders (customer_name, order_date) VALUES ('Satyam', date'2024-04-25')   
     INTO Orders (customer_name, order_date) VALUES ('Anjali', date'2024-04-12')  
     INTO Orders (customer_name, order_date) VALUES ('Akta', date'2024-04-12')  
     INTO Orders (customer_name, order_date) VALUES ('Manoj', date'2024-04-21')   
     select * from dual;

4 rows created.


## Display the orders table 

SQL> SELECT * FROM Orders;

CUSTOMER_NAME   ORDER_DAT  
--------------- ---------  
subham          01-APR-24  
kumar           01-APR-24  
Mohan           02-APR-24   
Mohit           03-APR-24  
Ram             03-APR-24  
sita            02-APR-24  
Shivam          06-APR-24  
Akash           10-APR-24  
Satyam          15-APR-24  
Satyam          25-APR-24  
Anjali          12-APR-24  

CUSTOMER_NAME   ORDER_DAT  
--------------- ---------    
Akta            12-APR-24  
Manoj           21-APR-24  

13 rows selected.  



Q  find the average marks of each student separated by comma   
https://datasculptor.blogspot.com/2024/04/winning-lottery.html

 top 1% of salaries by using the PERCENTILE function.   

 select  PERCENTILE_DISC(0.99) within group(order by sal) over() as p from emp  