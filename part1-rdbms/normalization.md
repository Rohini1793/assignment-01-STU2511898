## Anomaly Analysis

### Insert Anomaly
In the `orders_flat.csv`, it is not possible to insert a new product or customer without creating an order entry. For example, if a new product (e.g., Product_ID: P106, Product_Name: Tablet) needs to be added but no order has been placed yet, there is no place to store it independently. This shows an **insert anomaly**, as product data depends on order data.

### Update Anomaly
Customer details such as `customer_name` and `city` are repeated across multiple rows. For instance, if "Rahul Sharma" from "Mumbai" appears in multiple records and his city changes to "Pune", all rows must be updated. If even one row is missed, it leads to inconsistent data. This is an **update anomaly** caused by redundancy.

### Delete Anomaly
If a particular order is deleted, important information may be lost. For example, deleting the only order containing Product_ID: P105 may also remove all details of that product from the dataset. This results in a **delete anomaly**, where deleting one record unintentionally removes other valuable information.

---

## Normalization Justification

While keeping all data in a single table may appear simple, it leads to redundancy and data inconsistency. In the `orders_flat.csv`, customer details like `customer_name` and `city` are repeated across multiple rows whenever the same customer places multiple orders. This duplication increases storage and creates maintenance issues.

For instance, if a customer’s city needs to be updated, it must be modified in every related row. Missing even one update results in an **update anomaly**, causing inconsistent data. Similarly, adding a new product without an associated order is not possible, leading to an **insert anomaly**. Deleting an order may also remove important information about a customer or product, resulting in a **delete anomaly**.

Normalization to Third Normal Form (3NF) resolves these issues by separating data into logical tables such as Customers, Orders, Products, and Sales Representatives. Each table contains only relevant attributes, and relationships are maintained using primary and foreign keys. This eliminates redundancy and ensures data integrity.

Although normalization introduces multiple tables, it improves consistency, scalability, and ease of maintenance. Therefore, normalization is not over-engineering but a necessary design approach for building reliable and efficient database systems.