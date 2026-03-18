-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE,
    day INTEGER,
    month INTEGER,
    year INTEGER
);

CREATE TABLE dim_store (
    store_id INTEGER PRIMARY KEY,
    store_name TEXT,
    city TEXT,
    state TEXT
);

CREATE TABLE dim_product (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INTEGER PRIMARY KEY,
    date_id INTEGER,
    store_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    total_amount REAL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- INSERT CLEANED DATA
-- =========================

-- dim_date (standardized YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 1, 2024),
(2, '2024-01-02', 2, 1, 2024),
(3, '2024-01-03', 3, 1, 2024),
(4, '2024-01-04', 4, 1, 2024);

-- dim_store (cleaned NULLs & consistent casing)
INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai', 'Maharashtra'),
(2, 'Store B', 'Pune', 'Maharashtra'),
(3, 'Store C', 'Delhi', 'Delhi');

-- dim_product (category standardized to UPPERCASE)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'ELECTRONICS'),
(2, 'Mobile', 'ELECTRONICS'),
(3, 'Shirt', 'APPAREL'),
(4, 'Shoes', 'APPAREL');

-- =========================
-- FACT TABLE DATA (10 rows)
-- =========================

INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 120000.00),
(2, 1, 1, 2, 3, 60000.00),
(3, 2, 2, 3, 5, 5000.00),
(4, 2, 2, 4, 2, 4000.00),
(5, 3, 3, 1, 1, 60000.00),
(6, 3, 1, 3, 4, 4000.00),
(7, 4, 2, 2, 2, 40000.00),
(8, 4, 3, 4, 3, 6000.00),
(9, 1, 2, 1, 1, 60000.00),
(10, 2, 1, 2, 2, 40000.00);
