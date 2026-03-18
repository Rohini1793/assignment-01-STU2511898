-- Q1: List all customers along with the total number of orders they have placed

SELECT 
    c.customer_id,
    c.name,   -- change to customer_name if needed
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv') c
LEFT JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Q2: Find the top 3 customers by total order value

SELECT 
    c.name,   -- change if needed
    SUM(o.total_amount) AS total_value
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_value DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
SELECT DISTINCT 
    c.name
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';

-- Q4: Show customer name, order date, product name, quantity

SELECT 
    c.name,
    o.order_date,
    o.total_amount,
    o.num_items
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id;