-- show databases
show databases

-- create the new  databases 
create database sql_info

 --use the existing databases
 use sql_info
 
 -- drop the Existing databases
 drop database  database_name
 
 --Display the existing  tables
 show tables 
 
 -- Drop the existing table 
 drop table emp
 
 --create the emp table 
 CREATE TABLE emp (Name VARCHAR(25), Age int,
sex CHAR(1), DOB DATE, City varchar(15), salary float);

-- add department and id  column in the existing emp table 
alter table  emp add column Departmant varchar(2);
alter table emp add id int  first ;

-- modify the department column
alter table  emp modify column Departmant char(12);

-- display the structure of the existing table
desc emp;

-- insert the row and  values of the existing table ;
insert into emp values
(101,"subham", 15, "M", "2005-05-30", "Delhi", 70000, "HR"),
(102,"Mohan", 30, "M", "1999-06-25", "Madhya pradesh", 55000,"sales"),
(103,"Ram", 28, "M", "2009-03-10", "Mumbai", 62000,"HR"),
(104,"Sita", 37, "F", "2011-07-12", "Delhi", 57000,"sales"),
(105,"Sonu", 32, "M", "2017-10-27", "Bihar", 72000,"HR"),
(106,"Rita", 32, "F", "2017-10-27", "Bihar", 72000,"accountant"),
(107,"Sita", 32, "F", "2017-10-27", "Bhopal", 72000,"HR"),
(108,"Moni", 32, "F", "2017-10-27", "Bhopal", 72000,"sales"),
(109,"Akta", 32, "F", "2017-10-27", "chennai", 72000,"Finance"),
(110,"Anjali", 32, "F", "2017-10-27", "Bihar", 72000,"HR"),
(111,"Monu", 35, "M", "2014-12-20", "Gaya", 80000,"sales");

-- delete the existing row of emp table 
Truncate table emp 
 
-- dispaly the existing row and column
 select * from emp;
-- display  the rows  with  unique  city 
select  distinct city  from  emp ;
 
 -- count how many employee in emp table
 select count(name) from emp;
 
-- sum of all salary  in the emp table
select sum(salary) from emp;

-- Update Salary for all people in HR department to 20000
update emp set salary =20000 where department='HR';

update emp set name = 'subahm kumar' where id= 101;

-- avg salary of emp table 
select avg(salary) from emp;

-- display the emp of whose age is 30 years old
select * from emp  where age > 30;

-- display anem , sex city from emp table whose sex is Female(F)
select name, sex, city from emp  where sex = 'F';

select * from emp where City =  'patna' or city = 'Bhopal';

select * from emp  where city in ('Bhopal',' Delhi');

select * from emp  where dob between '2000-01-01' and '2010-12-31';

select * from emp  where age>30 and sex = 'M';

select sex, sum(salary) as total_salary from emp group by sex;

select * from emp order by salary desc;
-- Delete data for emp having id=1

delete from emp where id=101;

--  find the total number of emp  working in the ‘HR’ department’.
select count(*) from emp where department ='HR';
/*  COUNT(*) is a SQL aggregate function that returns the total number of rows in a
 specified table or query. It counts all the rows, regardless of whether they contain NULL
 values or no  */

-- find all the emp that have their name starting from ‘R’

/* LIKE- It is used to search for a specified pattern in a column
 We use ‘%’ and ‘_’ for searching patterns
 */
 
 
select (10 + 20) as addition;

select 30-50 as subtract;

select length('India') as total_len;

select repeat('@', 10);

select upper('India');

select lower('India');

select curdate();

select day(curdate());

select now();

 update emp set id = id+1;

