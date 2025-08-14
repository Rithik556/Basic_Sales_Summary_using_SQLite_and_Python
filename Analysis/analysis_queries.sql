-- analysis_queries.sql
.headers on
.mode column

-- 1) View all rows
SELECT * FROM sales;

-- 2) Total sales revenue
SELECT SUM(quantity * price) AS total_revenue
FROM sales;

-- 3) Daily sales revenue
SELECT sale_date, SUM(quantity * price) AS daily_revenue
FROM sales
GROUP BY sale_date
ORDER BY sale_date;

-- 4) Top-selling products by quantity
SELECT product_name, SUM(quantity) AS total_units_sold
FROM sales
GROUP BY product_name
ORDER BY total_units_sold DESC;

-- 5) Top-selling products by revenue
SELECT product_name, SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC;

-- 6) Average price per product
SELECT product_name, AVG(price) AS average_price
FROM sales
GROUP BY product_name;

-- 7) Number of sales per day
SELECT sale_date, COUNT(*) AS total_sales
FROM sales
GROUP BY sale_date
ORDER BY sale_date;

-- 8) Export daily revenue to CSV
.mode csv
.output daily_revenue.csv
SELECT sale_date, SUM(quantity * price) AS daily_revenue
FROM sales
GROUP BY sale_date
ORDER BY sale_date;
.output stdout
.mode column
