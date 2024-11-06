

**1. How do you switch tp the IMBD Databases?**

**Answer:-** Use IMBD;

**2. How do you list all tables in the current database?**

**Answer:-** show tables

**3. How do you display the structure of the Movies table?**

**Answer:-**  desc Movies;

**4. How do you select all columns from the Movies tables?**

**Answer:-** select * from Movies;

**5. How do you select the name and year columns  from the Movies tables ?**

**Answer:-** select  name, year from Movies;

**6. How do you select the  rank score and name columns from the Movies table?**

**Answer:-**  select  rankscore , name from Movies;

**Keyword:**  
- **LIMIT** = Restricts the number of rows returnded in the result set.
- **OFFSET** = Specifies the number of rows to skip before starting to return rows.

**7. How do you get the first 20 rows of name and rank score from Hotal?**

**Answer:-** select name, rankscore from Hotal limit 20;

**8. Why to use limit and Offset ?**

**Answer:-**  
- **LIMIT:**  Efficient Resource Usage

- **OFFSET** Enables PAgination

**9. How do you get 20 rows of name and rankscore starting from the 21st row in Movies?**

**Answer:-** select name, Booking_id from Hotals limit 20 offset 21;

## Keyword:
 
 **ORDER BY** 
  - The ORDER BY clause in SQL is used to sort the result set by one or more columns. By default, it sorts in ascending order(ASC), but you can specify descending order (DESC) if needed

**10. How do You list the top 10 most recent Movies by year , showing name , rankscore and year**

**Answer:-** select name , rankscore, year from  `2018` order by year  limit 15;

**11. How do you list the top 10 oldest movies by year, showing name, rankscore and year? **

**Answer:-** Select name, rankscore, year from movies order by desc limit 10;

##  Keyword:
**DISTINCT**
 - The distinct keyword in sql is used to return only unique(distinct) values. It eliminates duplicate rows from the result set.

**12. How do you list all unique genres from the movies_genres table?**

**Answer:-** select distinct genere from movies_genres;

**13. How do You list all unique combinations of first_name and last_name from the directors tables?**

**Answer:-** select distinct first_name, last_name from directors;

## Keyword:
- Where:- Twe where clause in sel is used to filter rows based on a specified condtion. It enables you to extract only the rows that meet the specified criteria.

**14. How do you list all movies with a rankscore greater than 9, showing name, year and rankscore?**

**Answer:-** select name , year, rankscore from movies where rankscore>9;

**15. How do You list the top 10  Movies with a rankscore greater then 9, sorted in descending order of rankscore**

**Answer:-** select name, year, rankscore from movies where rankscore>9 order by rankscore desc limit 10;

**16. How do you list all recors from movies_genres where the genre is 'Comedy'?**

**Answer:-** select * from movies_genres where genres='Comeday';

**17. How do You list all records from movies genres where the genre is not 'Horror'?**

**Answer:-** select * from movies where genre <> 'Horror';

**18, What is the result of querying movies where rankscore equals null?**

**Answer:-** select name, year,rankscore from movies where rankscore=null;

**19. How do you list the first 20 movies where the rankscore is Null?**

**Answer:-** select name, year, rankscore from movies where rankscore is null limit 20;

**20. How do you list the first 20 movies where the rankscore is Not Null?**

**Answer:-** select name, year, rankscore from movies where rankscore is not null limit 20;

## Keyword:
- Logical operators :- In SQL, logical operators are used to combine multiple conditions in a where clause. These operators include AND, OR, NOT, BETWEEN, IN, LIKE, etc.

1. IN: Checks if value matches any value in Sub-query
2. Not IN: Checks if a value does  not match any  value in a Sub-result.
3. EXITS: Returns True if the Sub-query returns boolean more records
4. NOT EXITS : Returns true if the Sub-query return no records.
5. ANY: Returns true if any in the Sub-query meets the conditions.
6. All: Returns true if all values in The sub-query meets a conditions.

**21. How do you list movies witha rankscore greater then 9 and released after the year 2000?**

**Answer:-** select name, year, ranscore from movies where ranscore > 9 and year >200;

**22. How do you list the first 20 Movies released after the year 2000?**

**Answer:-** select name, year, rankscore from movies where not year<=2000 limit 20;

**23. How do You list movies with a rankscore greater then 9 or released the year 2007 ?**

**Answer:-** select name, year, rankscore from movies where rankscore>9 or year>2007;

**24. How do you list movies released between 1999 and 200, inclusive ?**

**Answer:-** select * from movies where year between 1999 and 2000;

**25. How do you list records where the genre is either 'Comedy' or 'Horror' ?**

**Answer:-** select * from movies where genre in ('Comedy', 'Horror');

**26. How do you list movies with names starting with 'Tis' ?**

**Answer:-** select * from where name like 'Tie%';

**27.How do you list actors whose first names end with 'es' ?**

**Answer:-** select first_name, last_name from actors where first_name like '%es';

**28. How do you list actors whose firstnames contain 'es' ?**

**Answer:-** select first_name , last_name from actors where first_name like '%es%';

**29. How do you list actors whose first names match 'Agn_s', where '_' is exactly on character ?**

**Answer:-** select first_name , last_name from actors where first_name like 'Agn_s';

**30. How do you list actors whose first names start with 'L' but do not start with 'Li' ?**

**Answer:-** select first_name, lst_name from actors where first_name like 'L%' and first_name not like 'Li%';

## Keyword 
**Aggregate Function:-**  in SQL compute a single value from a set of rows. Common Aggregate Function include count, min , max, sum and AVG.

**31. How do You find the earliest year in the movies table ?**

**Answer:-** select min(year) from Movies;

**32. How do you find the most recent year in the movies table ?**

**Answer:-** select max(year) from Movies;

**33. How do you count the total number of rows in the movies table ?**

**Answer:-** select count(*) from movies;

**34. How do you count the number of Movies released after the year 2000 ?**

**Answer:-** select count(*) from movies where year > 2000;

**35. How do You count the number of non-null year value in the movies table ?**

**Answer:-** select count(year) from movies;

## Keyword 

**Group by:-** The Group by clause in SQL is used to arrange identical data into Groups. This clause is often used with Aggregate Function
(count, max,min, sum, AVG) to perform operations on each Group of data. 

 - Groups row that have the same values in specified columns.

**36. How do you find number of movies released each year ?**

**Answer:-** select year , count(year) as total from movies Group by year;

**37. How do you find number of movies released each year, order by year ?**

**Answer:-** select year , count(year) as Movies_count from movies Group by year order by year;

## Keyword:

**HAVING:-** The HAVING clause in SQL is used to specify conditions on Groups created by the Group by clause. It is similar to the where 
clause, but HAVING is used to filter Group rather than individual row is typically used with Aggregate Function.
 - filter the Groups based on the conditions. 
 **Hav Vs. Where***
 - where is applied to individual rows before Grouping
 - HAVING is applied to Groups after the Aggregation 

**38. How do you find years with more than 1000 movies ?**

**Answer:-**  select year , count(year) as Movies_count from movies Group by year  HAVING Movies_count>1000;

**39. How do you list movies released after the year 2000 without using Group by ?**

**Answer:-** select , name , year from movies HAVING year>2000;

**40. How do you find years with more than 20 movies  that have a rankscore greater than 9 ?**

**Answer:-** select year, count(year) as movies_year_count from movies where ranscore>9 Group by year HAVING movies_year_count>20;

## Keyword
**JOIN:-** The JOIN clause in SQL is used to combine  rows from two or more tables based on a related columns between them . There are several types of joins 
including  inner joins , LEFT JOIN , RIGHT JOIN and FULL JOIN 

**41. How do you list the names and genere of movies, limiting the result to 20 rows**

**Answer:-** select m.name, g.genere from movies m join movies_genres g on m.id = g.movie_id limit 20;

**42. How do you list the names and genere of movies, including movies with no genre, limiting the result to 20 rows ?**

**Answer:-** select m.name, g.genere from movies m LEFT join movies_genres g on m.id=g.movie_id limit 20;

**43. How do You list the first and last_name of actors who acted in the movie 'Officer 444' ?**

**Answer:-** select a.first_name, a.last_name from actors a join roles r on a.id = r.actor_id join movie m on m.id=r.movie_id and m.name = 'Officer 444';

## Keyword
**Sub-queries:-** A Sub-query, also known as a nested query or inner query, is a query within another SQL query. The Sub-query is executed first,
and its result is used by the outer query. Sub-queries can be used with various operators like IN, NOT IN, EXITS, NOT EXITS, ANY, ALL, and Common
operators. 

**44. How do You list all actors in the movie " Schindler's List " ?**

**Answer:-** select first_name, last_name from actors Where id in (select actor_id from roles where movie_id in(
    select id from Movies where name='Schindler's List'));

**45. How do You list all actors in the movie " Schindler's List " ?**

**Answer:-** select * from Movies rankscore>=all(select max(rankscore) from Movies);

**46. How do You insert a new movie record with the ID 412345 , name"kumar", year"2013" and rankscore12 ?**

**Answer:-** insert into movies(id, name,year,rankscore) values (412345,'kumar',2013,7);

**47. How do you insert multiple movie records in a single query ?**

**Answer:-** insert into movies(id, name, year,rankscore ) (412345,'kumar',2013,7),(412344,'Ram',2013,7),(411345,'Mohan',2013,7);

**48. How do you copy rows from one table to another using a Sub-query ?**

**Answer:-** insert into table_name(columns1, columns2) select columns1 , columns2 from sour_table where conditions;

**49. How do you update the ranscore of the movie with ID 213343 to 9 ?***

**Answer:-** update movies set rankscore = 9 where id= 213343;

**50. How do you update the ranscore of all movies released before 2010 to 8 ?***

**Answer:-** update movies set rankscore=8 where year<2010;

**51. How do you delete the movie record with ID 23445 ?**

**Answeer:-** delete from movies  where id= 23445;

**52. How do you create a new table named language with columns (integer primary key) and lang (non-nullable variable character) ?**

**Answer:-** create table subject( id int primary key, name  varchar(20) not null);

## Keywords:
 - Constraints: are rules applied to table columns to enforce data integrity.
 - NOT NULL: Ensure that a column cannot have a NULL value.
 - UNIQUE: Ensures that all values in a column are different.
 - Primary Key: A combination of NOT NULL and UNIQUE. Uniquely identifies each row in a table.
 - FOREIGN KEY: Uniquely identifies a row/another table.

**53. How do you ensure that the name column cannot have NUll values ?**

**Answer:-** create table Users(id int, name varchar(20) not null);

**54. How do you ensure that all values in the email column are different ?**

**Answer:-** create table users (id int , email varchar(10) unique);

**55. How do you uniquely identify each row in the users table?**

**Answer:-** create table users (id int primary key , name varchar(20));

**56. How do you enforce that the user_id in the orders table uniquely identifies in the users table?**

**Answer:-** Create table orders (order_id int, user_id int, foreign key(user_id) references users(id));

**57. How do you ensure that the price column in the products table is greater than 0 ?**

**Answer:-** create table products (id int, price decimal(10,2), check(price>0));

**58. How do you set a default values for the created_at column to the current timestamp ?**

**Answer:-** create table customers (id int , created_at timestamp default currrent_timestamp)
;

**59. How do you create an index on the name column in the users table to speed up queries ?**

**Answer:-** create index idx_user on users(name);

**60. **

## Alter:- commend is used to add, modify or drop columns in an existing table.

**60. How do you add a new column named country of type varchar(50) to the langauege table ?**

**Answer:-** alter table language add country varchar(20);

**61. How do you change the country column in the language table to type varchar(60) ?**

**Answer:-** Alter table language modify country varchar(60);

**62. How do you remove the country column from the language ?**

**Answer:-** Alter table language drop country;
 **DROP:-** Removes both tha table and all of the data permanently

**63. How do you permanently remove a table named Tablename and all its data ?**

**Answer:-** Drop Table Tablename;

**64. How do you safely remove a table named TableName only  if it exists?**

**Answer:-** Drop table TableName if Exists;