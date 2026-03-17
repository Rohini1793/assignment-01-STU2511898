
-- Q1: List all customers from Mumbai along with their total order value

SELECT c.customer_name,
SUM(p.price * oi.quantity) AS total_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_name;

-- Q2: Find the top 3 products by total quantity sold

SELECT p.product_name,
SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 3;

-- Q3: List all sales representatives and number of unique customers

SELECT sales_rep,
COUNT(DISTINCT customer_id) AS total_customers
FROM orders
GROUP BY sales_rep;

-- Q4: Orders where total value exceeds 10000

SELECT o.order_id,
SUM(p.price * oi.quantity) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING total_value > 10000
ORDER BY total_value DESC;

-- Q5: Products never ordered

SELECT product_name
FROM products
WHERE product_id NOT IN (
SELECT DISTINCT product_id FROM order_items
);





