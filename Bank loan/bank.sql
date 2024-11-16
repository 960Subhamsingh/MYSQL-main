-- create database database_name 
create database bank;
-- access the database
use bank;
-- drop tanle 
drop table  financial_loan;
-- display the structure in the table 
desc financial_loan;

-- modify the columns in existing table 
alter table financial_loan modify column  address_state char(3) ;
alter table financial_loan modify column  application_type varchar(12) , modify column emp_title varchar(70);

-- length of columns

SELECT 
    emp_title, LENGTH(MAX(emp_title)), MAX(emp_title)
FROM
    financial_loan
GROUP BY emp_title;


-- Total loan Application
SELECT 
    COUNT(*) AS Total_loan_Application
FROM
    financial_loan;

-- MTD Loan Application

SELECT 
    COUNT(id) AS Total_Application
FROM
    financial_loan
WHERE
    MONTH(issue_date) = 12;

 SELECT 
    SUM(total_payment) AS Total_AMount_collect
FROM
    financial_loan
WHERE
    MONTH(issue_date) = 11;

SELECT 
    TO_CHAR(issue_date, '%yyyy')
FROM
    financial_loan;

-- PMTD Loan Application

SELECT 
    COUNT(id) AS Total_Application
FROM
    financial_loan
WHERE
    MONTH(issue_date) = 11;

 SELECT 
    SUM(total_payment) AS Total_Application
FROM
    financial_loan
WHERE
    MONTH(issue_date) = 11;

--  Total loan Application 

SELECT 
    SUM(loan_amount) AS Total_number_amount
FROM
    financial_loan
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021;

-- Average Interest Rate 

SELECT 
    ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_rate
FROM
    financial_loan
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021;



-- Loan Application 
SELECT 
    COUNT(id) AS Loan_Application
FROM
    financial_loan
WHERE
    loan_status = 'Fully Paid'
        OR loan_status = 'Current';

-- Bad Loan Application 
SELECT 
    COUNT(id) AS Bad_Loan_Application
FROM
    financial_loan
WHERE
    loan_status = 'Charged off';

-- Bad Loan Funded Amount 

 SELECT 
    SUM(loan_amount) AS Basd_Loan_fund_amount
FROM
    financial_loan
WHERE
    loan_status = 'Charged off';

-- Bad laon Amount Received  
SELECT 
    SUM(total_payment) AS Bad_Loan_amount_received
FROM
    financial_loan
WHERE
    loan_status = 'Charged off';

SELECT 
    loan_status,
    SUM(total_payment) AS Total_amount_received,
    SUM(loan_amount) AS total_fund_amount
FROM
    financial_loan
GROUP BY loan_status;


select loan_status, 
sum(total_payment) as Total_amount_received,
sum(loan_amount) as total_fund_amount ,
avg(int_rate*100) as Interest_rate,
avg(dti*100) as DTI
from financial_loan
-- where month(issue_date)=12
group by loan_status;
 
 
 select (count(case when loan_status = 'Fully Paid' 
 OR loan_status= 'Current'
 then id end)*100) /
 count(id) as Good_loan_pecentage
 from financial_loan;
 
 
 -- loan funded Amount
 
 select sum(loan_amount) as Loan_Funded_Amount  from financial_loan where
 loan_status= 'Fully Paid' or 
loan_status = 'Current';


 SELECT 
    (COUNT(CASE
        WHEN loan_status = 'Charged off' THEN id
    END) * 100) / COUNT(id) AS Bad_loan_pecentage
FROM
    financial_loan;
 
 -- 
 SELECT 
    MONTH(issue_date) AS Month_number,
    COUNT(id) AS Total_loan_Appl,
    SUM(loan_amount) AS Total_fund_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    financial_loan
GROUP BY MONTH(issue_date); -- datename(month,issue_date)
 -- order by datename(month, issue_date);
 
SELECT 
    address_state,
    COUNT(id) AS Total_loan_Appl,
    SUM(loan_amount) AS Total_fund_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    financial_loan
GROUP BY address_state
ORDER BY COUNT(id) DESC;
 
 
 SELECT 
    emp_length,
    COUNT(id) AS Total_loan_Appl,
    SUM(loan_amount) AS Total_fund_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    financial_loan
GROUP BY emp_length
ORDER BY COUNT(id) DESC;
 
 
 SELECT 
    home_ownership,
    COUNT(id) AS Total_loan_Appl,
    SUM(loan_amount) AS Total_fund_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    financial_loan
WHERE
    grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;