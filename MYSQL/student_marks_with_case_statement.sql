create table studnts_tbl (sname varchar(50), marks int);


insert into studnts_tbl values ('A', 75),
('B', 30),('C', 55),('A', 60),('D', 91),
('B', 19),('G', 36),('S', 65),('K', 49);

we used CASE Statement and alter table commands

select *, case when marks>=80 then 'Excellent'
     when marks>=60 and marks <80 then 'Very_Good'
     when marks>=35 and marks <60 then 'Good'
     else 'poor' end as Grade from studnts_tbl;

+-------+-------+-----------+
| sname | marks | Grade     |
+-------+-------+-----------+
| A     |    75 | Very_Good |
| B     |    30 | poor      |
| C     |    55 | Good      |
| A     |    60 | Very_Good |
| D     |    91 | Excellent |
| B     |    19 | poor      |
| G     |    36 | Good      |
| S     |    65 | Very_Good |
| K     |    49 | Good      |
+-------+-------+-----------+

mysql> alter table studnts_tbl add Grade char(12) as (
    -> case when marks>=80 then 'Excellent'
    -> when marks>=60 and marks <80 then 'Very_Good'
    -> when marks>=35 and marks <60 then 'Good'
    -> else 'poor' end );
Query OK, 0 rows affected (0.38 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from studnts_tbl;
+-------+-------+-----------+
| sname | marks | Grade     |
+-------+-------+-----------+
| A     |    75 | Very_Good |
| B     |    30 | poor      |
| C     |    55 | Good      |
| A     |    60 | Very_Good |
| D     |    91 | Excellent |
| B     |    19 | poor      |
| G     |    36 | Good      |
| S     |    65 | Very_Good |
| K     |    49 | Good      |
+-------+-------+-----------+
9 rows in set (0.00 sec)

================================================


we used LAG and LEAD Functions. You will understand how lag and lead functions.
  
Let us first create cinemas table

create table cinema_tbl (seat_id int, free int);

Insert the records
insert into cinema_tbl values (1,1),(2,0),(3,1),(4,0),(5,1),(6,1),(7,1),(8,0),(9,1),(10,1);

with cte as(
select *, lag(free) over(order by seat_id) as previous_seat, lead(free) over (order by seat_id) as next_seat from cinema_tb1)
select seat_id from cte where previous_seat = 1 or next_seat =1


========================================================

we used ROW_NUMBER(), COUNT() and FIRST_VALUE() Functions. You will understand how all these functions work.

Let us first create brands table
create table brands (category varchar(50), brand_name varchar(50));

Insert the records
insert into brands values ('chocolates', '5-star'),(NULL, 'dairy milk'),(NULL, 'perk'),(NULL, 'eclair'),('Biscuits', 'Britania'),(NULL, 'good day'),(NULL, 'boost');

with cte as (
select *, row_nmber() over(order by select null)) as rnum from brands),
cte2 as (
select *, count(category) over(order by rnum) as cnt from cte)
select first_value(category) over (partition by cnt order by rnum) as category, brand_name from cte2;
