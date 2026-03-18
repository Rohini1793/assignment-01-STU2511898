-- Test script: Run this in SQLite after installing "SQLite" extension in VSCode
-- 1. Ctrl+Shift+P > SQLite: Open Database > part3-datawarehouse/dw_test.db
-- 2. Paste and run this file

.read star_schema.sql

-- Verify data
SELECT 'Tables created' AS status;
.tables;
SELECT COUNT(*) AS fact_rows FROM fact_sales;
SELECT COUNT(*) AS date_rows FROM dim_date;
SELECT COUNT(*) AS store_rows FROM dim_store;
SELECT COUNT(*) AS product_rows FROM dim_product;

-- Run Q1
-- Q1: Total sales revenue by product category for each month
SELECT  
    d.year,
    d.month, 
    p.category, 
    SUM(f.total_revenue) AS total_revenue 
FROM fact_sales f 
JOIN dim_date d ON f.date_id = d.date_id 
JOIN dim_product p ON f.product_id = p.product_id 
GROUP BY d.year, d.month, p.category 
ORDER BY d.year, d.month, total_revenue DESC;

-- Q2
-- Q2: Top 2 performing stores by total revenue
SELECT  
    s.store_name, 
    s.city,
    SUM(f.total_revenue) AS total_revenue 
FROM fact_sales f 
JOIN dim_store s ON f.store_id = s.store_id 
GROUP BY s.store_id, s.store_name, s.city
ORDER BY total_revenue DESC 
LIMIT 2;

-- Q3
-- Q3: Month-over-month sales trend across all stores
SELECT  
    d.year, 
    d.month, 
    SUM(f.total_revenue) AS total_sales
FROM fact_sales f 
JOIN dim_date d ON f.date_id = d.date_id 
GROUP BY d.year, d.month 
ORDER BY d.year, d.month;
