## Anomaly Analysis

### Insert Anomaly
In the orders_flat table, product information and order information are stored together. If the company wants to add a new product but no customer has ordered it yet, it cannot be inserted because order details such as order_id and customer_id are required.

### Update Anomaly
Customer information such as city appears multiple times for every order placed by that customer. If the customer changes city, every row must be updated. If one row is missed, the database will contain inconsistent information.

### Delete Anomaly
If the last order containing a particular product is deleted, the product information will also be removed from the table even though the product still exists. This results in loss of important product data.
