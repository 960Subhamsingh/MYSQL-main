use data;

```
   CREATE TABLE EMPLOYEES (  
                          EMP_ID CHAR(9) NOT NULL,  
                          F_NAME VARCHAR(15) NOT NULL,  
                          L_NAME VARCHAR(15) NOT NULL,  
                          SSN CHAR(9),  
                          B_DATE DATE,  
                          SEX CHAR,  
                          ADDRESS VARCHAR(30),  
                          JOB_ID CHAR(9),  
                          SALARY DECIMAL(10,2),  
                          MANAGER_ID CHAR(9),  
                          DEP_ID CHAR(9) NOT NULL,  
                          PRIMARY KEY (EMP_ID)  
    );

```
```                      
  insert into employees values('E1001','Subham','Kumar','123456', date'1976-09-01','M',' 5631 Rice OakPark IL','100',100000,'30001','2');

  insert into employees values('E101','Subham','Kumar','123456',date'1996-09-21','M', 'bangalore','100',100000,'30001','2');

  insert into employees values('E1002','suman','kumar','123457',date'2015-12-31','M','Chennai','200',80000,'30002','5');

  insert into employees values('E1003','Raj','Kumar',123458,date'2012-09-12','M','tamil nadu','300',50000,'3002','5');

  insert into employees values('E1004','Santosh','Kumar',123459,date'2016-08-12','M','Chennai','400',60000,'30002','5');

  insert into employees values('E1005','Aman','kumar',123410,date'2018-06-21','M','Chennai','500',70000,'30001','2');

  insert into employees values('E1006','Nancy','Kumari',123411,date'2018-10-13','F','DELHI','600',90000,'30001','2');

  insert into employees values('E1007','Moni','kumar',123412,date'2019-06-16','F','DELHI','650',65000,'30003','7');

  insert into employees values('E1008','Bharath','Gupta',123413,date'2019-12-01','M','PATNA','660',65000,'30003','7');

  insert into employees values('E1009','Sita','Kumari',123414,date'2021-12-09','F','BHOPAL','234',70000,'30003','7');

  insert into employees values('E1010','Soni','kumar',123415,date'2022-11-12','F','Mumbai','220',70000,'30002','5');

``` 
```  
    select * from employees;
```
====================================================
```
-- create table 
create table users(
user_id int primary key,
name varchar(12),
per_hour_salary int default 0,
working_hour int default 0,
total_salary int default 0);

```
```
-- insert data into users table
insert into users values (101,'subham',8000,8, 90000);
insert into users (user_id, name, per_hour_salary, working_hour) values (102,'kumar',6000,6);

```

```
-- commit : save the statement
commit;
```

```
-- create trigger 

delimiter //
create  trigger before_insert_user
before insert 
on users for each row
begin
set NEW.total_salary = NEW.per_hour_salary * new.working_hour;
end; //
delimiter //

select * from users;
```


```
-- create update trigger 
-- update total salary ko based on update of perhour salary and working hour

delimiter //
create  trigger before_update_user
before update
on users for each row
begin
set NEW.total_salary = NEW.per_hour_salary * new.working_hour;
end; //
delimiter //
```

```
-- update working_hour of user table 
update users set working_hour = 11 , per_hour_salary=120000  where user_id= 101;
```

```
-- add column in users table
alter table users add column acc_count int default 0; 
```

```
-- create account table 
create table accounts(
account_no int primary key,
user_id int,
balance int default 0
);
```

```
-- create a delete Trigger 

delimiter //
create  trigger before_account_open
before insert
on accounts for each row
begin
 update users set acc_count = acc_count + 1 where user_id = new.user_id;
end; //
delimiter //

insert into accounts (account_no, user_id, balance) values (201,101,120);

```

```
select * from accounts;

select * from users;

```

```
-- close account trigger
delimiter //
create  trigger before_account_close
before delete
on accounts for each row
begin
 update users set acc_count = acc_count - 1 where user_id = old.user_id;
end; //
delimiter //

delete from accounts where account_no = '201';

```

```
-- see , how many trigger in the databases

SHOW TRIGGERS;

-- drop trigger in the trigger databases

drop  TRIGGERS trigger_name;
```

