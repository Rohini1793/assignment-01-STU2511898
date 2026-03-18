## ETL Decisions

### Decision 1 — Date Format Standardization
Problem: The raw dataset contained inconsistent date formats such as "01-02-2026", "02/01/2026", and "2026/02/01". This made it difficult to group data by month or perform time-based analysis.
Resolution: All date values were converted into a consistent format (YYYY-MM-DD) before inserting into the dim_date table. This ensured accurate aggregation and simplified querying.

### Decision 2 — Handling Missing (NULL) Values
Problem: Some records had missing values for important fields such as product category or store information. These NULL values could lead to incorrect joins or incomplete analysis.
Resolution: Missing values were handled by either replacing them with a default value such as "Unknown" or removing incomplete records where necessary. This ensured data consistency and prevented errors in queries.

### Decision 3 — Category Value Normalization
Problem: Product categories were inconsistent in casing and format, such as "electronics", "Electronics", and "ELECTRONICS". This caused incorrect grouping during aggregation queries.
Resolution: All category values were standardized into a consistent format (e.g., "Electronics", "Clothing", "Groceries") before loading into the dim_product table. This improved data quality and ensured correct analytical results.