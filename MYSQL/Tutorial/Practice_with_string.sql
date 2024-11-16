create database practice;

use practice;

create table users(id int, name varchar(12) , username varchar(15));

--  inserting a string with double quotes into a table

INSERT INTO USERS (ID, NAME, USERNAME) VALUES (NULL, "tes", "hello");

--  inserting a string with  single quotes  into a table

INSERT INTO USERS (ID, NAME, USERNAME) VALUES (NULL, 'tes', 'hello');

-- insert a double quote into a table you need to enclose it within single quotes.

insert into users (id, name, username) values (null, '"tes"', '"hello"');

INSERT INTO USERS (NAME) VALUES ('"test"');

-- inserting data directly into an SQL file, you can use escape characters to handle double quotes

INSERT INTO USERS (NAME , USERNAME) VALUES ('Another va', 'Hii,""Hello!""');

-- wrapping the values inside single quotes.

INSERT INTO USERS (ID, NAME, USERNAME) VALUES (NULL, '"tes"', '"hello"');

/*
LOAD DATA
INFILE 'yourfile.csv'
INTO TABLE your_table
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
(
    column1,
    column2
)

*/

/*

PostgreSQL, you can use the COPY command to import data from a CSV file. Make sure to specify the delimiter and quote character.

SQL

COPY your_table (column1, column2)
FROM 'C:\\path\\to\\yourfile.csv'
DELIMITER ','
CSV QUOTE '"';

*/

/*
Using Update Statements:
If you need to clean up the data after insertion, you can use an UPDATE statement to remove unwanted double quotes.

SQL

UPDATE your_table
SET column1 = REPLACE(column1, '"', '');

*/
