# Retail_Sales_Analysis

## Project Overview

**Project Title**: Retail Sales Analysis  

This project showcases SQL skills and data analysis techniques applied to retail sales data. The work involved cleaning raw data,
exploring datasets, and performing exploratory data analysis (EDA) to uncover patterns and insights. I created and managed a retail sales database,
wrote SQL queries to answer key business questions, and analyzed sales performance across products, regions, and time periods.


## Objectives

1. Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
2. Data Cleaning: Identify and remove any records with missing or null values.
3. Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
4. Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation: Designed and created a database named 'Retail_sales' to manage retail sales data.
- **Table Creation: Built a table retail_sales with structured columns including transaction ID, sale date, sale time, customer details 
(ID, gender, age), product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount. This setup ensured organized
storage of data for analysis and querying.

```sql
CREATE DATABASE Retail_sales

CREATE TABLE R_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
select *
from R_Sales
where sale_date='2022-11-05'
;
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
select *
from R_Sales
           where category = 'clothing'
           and quantiy>=4
           and sale_date='2022-11-05'
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
select
      category, SUM(total_sale) as 'Total_sale',
      COUNT(*) as 'Total_orders'
from R_sales
group by category
order by total_sale desc
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
select
      category, avg(age) as'Avg_age',
      COUNT(*) as 'No_of_customers'
from R_sales
where category='Beauty'
group by category
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
select *
from R_sales
where total_sale>1000
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
select
     category,
     gender,
     COUNT(transactions_id) as 'Total_Transactions'
from R_sales
group
     by
     category,
     gender
order
     by
     Total_transactions desc
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
WITH MonthlySales AS (
    SELECT
        YEAR(sale_date) AS sales_year,
        MONTH(sale_date) AS sales_month,
        AVG(total_sale) AS avg_monthly_sale
    FROM R_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
),
RankedSales AS (
    SELECT
        sales_year,
        sales_month,
        avg_monthly_sale,
        RANK() OVER (PARTITION BY sales_year ORDER BY avg_monthly_sale DESC) AS sales_rank
    FROM MonthlySales
)
SELECT
    sales_year,
    sales_month,
    avg_monthly_sale,
    sales_rank
FROM RankedSales
WHERE sales_rank = 1;   -- Best month per year
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
SELECT TOP 5
    customer_id,
    SUM(total_sale_amount) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
SELECT
      category,
      COUNT(DISTINCT customer_id) AS unique_customers
FROM R_sales
GROUP BY
      category;
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project provided me with hands-on experience in applying SQL to real-world business problems. From creating and managing databases to performing data cleaning, exploratory analysis, and advanced business-driven queries, I was able to demonstrate my ability to transform raw sales data into meaningful insights. The analysis highlighted sales patterns, customer behavior, and product performance, which are critical for strategic decision-making. By completing this project, I not only strengthened my SQL skills but also showcased my capability to think analytically and solve problems that directly impact business outcomes—skills that are highly valuable for a Business Analyst or Data Analyst role.
