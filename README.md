# Retail_Sales_Analysis
# Project Overview

This project showcases my SQL skills and data analysis techniques applied to retail sales data. The work involved cleaning raw data, exploring datasets, and performing exploratory data analysis (EDA) to uncover patterns and insights. I created and managed a retail sales database, wrote SQL queries to answer key business questions, and analyzed sales performance across products, regions, and time periods.

# Objectives

1. Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
2. Data Cleaning: Identify and remove any records with missing or null values.
3. Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
4. Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

# Project Structure

# 1. Database Setup
Database Creation: Designed and created a database named 'Retail_sales' to manage retail sales data.

Table Creation: Built a table retail_sales with structured columns including transaction ID, sale date, sale time, customer details (ID, gender, age), product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount. This setup ensured organized storage of data for analysis and querying.

CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales
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
