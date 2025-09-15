### Retail_Sales_Analysis

## Project Overview
This project showcases my SQL skills and data analysis techniques applied to retail sales data. The work involved cleaning raw data,
exploring datasets, and performing exploratory data analysis (EDA) to uncover patterns and insights. I created and managed a retail sales database,
wrote SQL queries to answer key business questions, and analyzed sales performance across products, regions, and time periods.

	

create database Retail_sales

-- Take top 10 Rows of records
select top 10 * from R_sales


-- Data Cleaning


-- Count the no of records in the table
select COUNT(*) from R_sales   -- 2000 rows

-- find out the Null values in Each Column

select * from R_sales
where transactions_id is Null    -- there is no Null values in this column

select * from r_sales
where sale_date is null    -- there is no Null values in this column

 select * from r_sales
where sale_time is null   -- there is no Null values in this column

 select * from r_sales 
where customer_id is null    -- there is no Null values in this column

 select * from r_sales 
where gender is null    -- there is no Null values in this column

select * from R_sales
where age is Null           

select * from R_sales
where category is Null  

select * from R_sales
where quantiy is Null

select * from R_sales
where Price_per_unit is Null

select * from R_sales
where cogs is Null

select * from R_sales
where total_sale is Null

-- how to check all the columns Null values in one query

select * from R_sales
where  transactions_id is Null 
       or
	   sale_date is null
	   or 
	   sale_time is null
       or
	   customer_id is null
	   or
	   gender is null
	   or
	   age is null
	   or 
	   category is null
	   or
	   quantiy is Null
	   or
	   Price_per_unit is Null
	   or
	   cogs is Null
	   or
	   total_sale is Null

-- OR condition is if at least one condition is satisfied then its provide the true value. Here OR condition find the Null
-- values in each column wherever its find then provide the true.



-- Delete the Null values form the table

Delete from R_Sales
where transactions_id is Null 
       or
	   sale_date is null
	   or 
	   sale_time is null
       or
	   customer_id is null
	   or
	   gender is null
	   or
	   age is null
	   or 
	   category is null
	   or
	   quantiy is Null
	   or
	   Price_per_unit is Null
	   or
	   cogs is Null
	   or
	   total_sale is Null
	   

-- check how may rows we have

select COUNT(*) from R_Sales  -- 13 rows are deleted



-- Data Exploration

-- How many Sales we have?
select SUM(total_sale) as 'total', COUNT(*) as 'number' from R_Sales

-- How many customer we have?
select COUNT(customer_id) as 'total_customers' from R_Sales  -- 1987

-- Find the Unique customers
select  COUNT(distinct customer_id) as 'unique_Cust' from R_sales   -- 155

-- find how many total and unique category
select COUNT(category) as 'total' from R_sales   -- 1987
select COUNT(distinct category) as 'U_total' from R_sales   -- 3

-- find the name of the categories
select category, COUNT(distinct category) as 'total_cat' from R_sales
group by category


-- data analysis and Business key problems and answers

-- 1) Write SQL query to retrive all the columns for sales made on '2022-11-05'

select * from R_Sales
where sale_date='2022-11-05'

-- 2) Write a SQL query to retrive all transaction where the category is 'Clothing' and the quantity sold more than 4 in 
-- the month of november - 2022

select * from R_Sales
where category = 'clothing' and quantiy>=4 and sale_date='2022-11-05'


-- 3) Write a SQL query to caluculate the total sales (total_sales) for each category

select category, SUM(total_sale) as 'Total_sale', COUNT(*) as 'Total_orders' from R_sales
group by category
order by total_sale desc

-- 4) write a SQL query to find the average  age of customers who purchased items from the 'Beauty' category

select category, avg(age) as'Avg_age', COUNT(*) as 'No_of_customers' from R_sales
where category='Beauty'
group by category


-- 5) Write a SQL query to find all the transactions where the table_sale is greter than 1000

select sale_date, customer_id, age, category, quantiy, COUNT(transactions_id) as 'Total_transaction' from R_sales
where total_sale>=1000
group by sale_date, customer_id, age, category, quantiy
order by quantiy desc


-- 6) Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category.
select category, gender, COUNT(transactions_id) as 'Total_Transactions' from R_sales
group by category, gender
order by Total_transactions desc



-- 7) write a SQL query to calculate the avg sale for each month. find out best selling month in each year.

select YEAR(sale_date) as 'year', MONTH(sale_date) as 'Month', avg(total_sale) as 'Avg_Sal' from R_sales
group by sale_date, sale_date
order by year , month 


-- 8) Write a SQL query to find top 5 customers based on the highest total sales

select top 5 customer_id, COUNT(Customer_id) as 'Total_Customers', SUM(total_sale) as 'Total_Sale' from R_sales
group by customer_id
order by total_customers desc



-- 9) write a SQL query to find the number of unique customers who purchased items from each category

select  category, COUNT(distinct customer_id) as 'Unique_c_id' from R_sales
group by category
order by Unique_c_id desc










