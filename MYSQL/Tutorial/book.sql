create database book
show databases
use book;

create table players (player_id int, name varchar(20), country varchar(20), goals int);
 insert into players 
 (player_id, name, country, goals)
 values (101, 'Mohan', 'USA', 6),
 (103, 'Ram', 'England', 7),
 (104, 'Gaurav', 'France', 10),
 (102, 'Sourav', 'New yprk', 6),
 (105, 'Madan', 'German', 5),
 (106, 'Akash', 'Scotland', 3),
  (107, 'Madan', 'Mexico', 5),
   (108, 'sytam', 'Japan', 5);

select * from players;

select * from players where goals = ( select min(goals) from players)

select * from players order by goals limit 1  ;

select * from players order by goals  desc 

select * from players where  goals    limit 1 offset 1;