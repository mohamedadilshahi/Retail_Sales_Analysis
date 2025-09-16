
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

### . Data Exploration & Cleaning

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
    sale_date IS NULL
	OR 
	sale_time IS NULL 
	OR customer_id IS NULL
	OR 
    gender IS NULL 
	OR 
	age IS NULL 
	OR
	category IS NULL 
	OR 
    quantity IS NULL 
	OR 
	price_per_unit IS NULL 
	OR
	cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL 
	OR 
	sale_time IS NULL 
	OR 
	customer_id IS NULL
	OR 
    gender IS NULL 
	OR
	age IS NULL 
	OR
	category IS NULL
	OR 
    quantity IS NULL 
	OR 
	price_per_unit IS NULL 
	OR 
	cogs IS NULL;
```

-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

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
