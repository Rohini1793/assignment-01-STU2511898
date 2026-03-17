CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    price REAL NOT NULL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    handled_by TEXT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);


INSERT INTO customers VALUES (1,'Rahul Sharma','Mumbai');
INSERT INTO customers VALUES (2,'Priya Singh','Delhi');
INSERT INTO customers VALUES (3,'Amit Verma','Pune');
INSERT INTO customers VALUES (4,'Neha Joshi','Mumbai');
INSERT INTO customers VALUES (5,'Ravi Mehta','Bangalore');


INSERT INTO products VALUES (101,'Laptop',70000);
INSERT INTO products VALUES (102,'Headphones',2000);
INSERT INTO products VALUES (103,'Keyboard',1500);
INSERT INTO products VALUES (104,'Mouse',800);
INSERT INTO products VALUES (105,'Monitor',12000); 

INSERT INTO orders VALUES (1001,1,'2026-01-10','Raj');
INSERT INTO orders VALUES (1002,2,'2026-01-11','Simran');
INSERT INTO orders VALUES (1003,3,'2026-01-12','Raj');
INSERT INTO orders VALUES (1004,4,'2026-01-13','Aman');
INSERT INTO orders VALUES (1005,5,'2026-01-14','Simran');

INSERT INTO order_items VALUES (1,1001,101,1);
INSERT INTO order_items VALUES (2,1001,102,2);
INSERT INTO order_items VALUES (3,1002,103,3);
INSERT INTO order_items VALUES (4,1003,104,5);
INSERT INTO order_items VALUES (5,1004,105,1);


select * from customers
select * from products
select * from Orders
select * from order_items