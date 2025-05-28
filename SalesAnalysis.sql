create database company;

use company;

select * from sales;

--  Ques:1 find all orders shipped via 'economy' mode with a total amount greater than 25000---
select * from sales where Ship_Mode='Economy' and Total_Amount >25000;


-- Ques:2 retrive all sales data for "Technology" category in"Ireland" made after 2020-01-01--
select* from sales where Category="Technology" and Country="Ireland"and Order_Date > '01-01-2020' ;


-- Ques:3 list the top 10 most profiltable sales in transactions in descending order--
select * from sales order by Unit_Profit desc limit 10;
select * from sales order by Unit_Profit desc limit 10 ,20;-- here top 10 sales will be skiped and will give next top 20 sales--

-- Ques4 find all customers whose name starts with 'J' and ends with 'N'.
select Order_ID, Customer_Name from sales where Customer_Name LIKE 'J%n';

-- Ques 5 retrive all the products names tht contain 'Acco' anywhere in the name?--
select Order_ID, Product_Name from sales where Product_Name like '%Acco%';

-- Ques 6 get the top 5 cities with the highest total sales amount--
select City,SUM(Total_amount) as Total_Sales
from sales group by City order by Total_sales desc limit 5;

-- Ques 7 Display the second set of 10 records for customer_name and total_amount in descending order.--
select Customer_Name,Total_Amount from sales order by Total_Amount Desc limit 10,10; 

-- Ques 8 find the total revenue, average unit cost,and total numbers of orders.--
select sum(Total_Amount) as `Total_Revenue`,avg(Unit_Cost) as `Average Unit Cost`,count(Order_ID) as `Total Number Of Orders` from sales;


-- Ques 9 Count unique number of reagions--
 select  count(distinct(Region)) as uniq_reg from sales ;
 
 -- Ques-10 find the number of orders placed by each customer---
select Customer_Name, count(Order_ID) as Order_count from sales group by Customer_Name Order By Order_count desc; 

-- Ques-11 Rank 5 products based on total sales usinf rank()---
select Product_Name, SUM(Total_Amount) as Total_Sales, RANK() over (order by sum(Total_Amount) desc) as Sales_Rank from sales group by Product_Name LIMIT 5;