CREATE TABLE order_details (
    orderid INT PRIMARY KEY,
    custid INT,
    city VARCHAR(50),
    order_date DATE,
    del_partner VARCHAR(50),
    order_time TIME,
    deliver_time TIME,
    predicted_time INT,
    aov DECIMAL(10, 2)
);


INSERT INTO order_details (orderid, custid, city, order_date, del_partner, order_time, deliver_time, predicted_time, aov) 
VALUES
(1, 101, 'Bangalore', '2024-01-01', 'PartnerA', '10:00:00', '11:30:00', 60, 100.00),
(2, 102, 'Chennai', '2024-01-02', 'PartnerB', '12:00:00', '13:15:00', 45, 200.00),
(3, 103, 'Bangalore', '2024-01-03', 'PartnerA', '14:00:00', '15:45:00', 60, 300.00),
(4, 104, 'Chennai', '2024-01-04', 'PartnerB', '16:00:00', '17:30:00', 90, 400.00);


select  del_partner , count(*) as order_count from order_details  group by del_partner;

select distinct(city) from order_details where city not Rlike '%Bagalore';