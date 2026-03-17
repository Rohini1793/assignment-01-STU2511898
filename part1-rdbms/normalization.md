## Normalization Justification

Keeping all data in a single table may seem simple, but it creates redundancy and data inconsistencies. In the `orders_flat.csv`, customer, product, order, and sales representative details are repeated across multiple rows. For instance, if a customer like Rahul Sharma appears in several records, updating their city in only one row leads to an **update anomaly**. Similarly, adding a new product without an order is difficult (**insert anomaly**), and deleting an order may remove important related data (**delete anomaly**).

Normalization up to Third Normal Form (3NF) addresses these issues by separating data into logical tables such as Customers, Orders, Products, and Sales Representatives. Each table stores only relevant attributes, reducing duplication and improving consistency. Relationships are maintained using primary and foreign keys.

Although normalization introduces more tables, it improves data integrity, simplifies updates, and supports scalability. Therefore, it is not over-engineering but a necessary approach for maintaining accurate and reliable data.
