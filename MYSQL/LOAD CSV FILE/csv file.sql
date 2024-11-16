 
 
create table d(H date, Open decimal(10,2), High decimal(10,2), Low decimal(10,2), Adj decimal(10,2), Volume int);

LOAD DATA LOCAL INFILE 'E:\plsql\data_cleaning-main\data_cleaning-main\GOOD.csv'
INTO TABLE d
                FIELDS OPTIONALLY ENCLOSED BY '"' 
                TERMINATED BY ','
                LINES TERMINATED BY '\n';
                
SET GLOBAL local_infile=1;
			
SHOW GLOBAL VARIABLES LIKE 'local_infile';
																		
                                                                         
LOAD DATA LOCAL INFILE 'D:/Project/MYSQL-main/MYSQL/LOAD CSV FILE/myData.csv' 
                INTO TABLE equity_last_import
                FIELDS OPTIONALLY ENCLOSED BY '"' 
                TERMINATED BY ','
                LINES TERMINATED BY '\n'
                (equity,last,last_date);
                SET last_date = STR_TO_DATE( @last_date, '%Y-%m-%d %H:%i:%s');