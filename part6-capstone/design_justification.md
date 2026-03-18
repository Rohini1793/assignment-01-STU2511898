## Storage Systems

To meet the hospital network’s four goals, a combination of specialized storage systems is required.

For **predicting patient readmission risk**, a **Data Warehouse (OLAP system)** is ideal. Historical treatment data needs to be structured, cleaned, and aggregated for machine learning models. A warehouse ensures high-quality, consistent data for accurate predictions.

For **natural language querying of patient history**, a **Vector Database** should be used alongside a traditional database. Patient records can be embedded into vectors, allowing doctors to search using plain English queries. This enables semantic understanding rather than exact keyword matching.

For **monthly reporting (bed occupancy, costs)**, again a **Data Warehouse** is suitable. It supports analytical queries, aggregations, and business intelligence dashboards efficiently.

For **real-time ICU vitals streaming**, a **Data Lake or Time-Series Database** is recommended. These systems can handle high-velocity streaming data and store raw, unstructured sensor inputs for real-time monitoring and future analysis.

---

## OLTP vs OLAP Boundary

The **OLTP system** includes real-time operational databases such as patient records, appointment systems, and ICU monitoring systems. These systems handle frequent inserts, updates, and transactions with low latency.

The **OLAP system** begins where data is extracted from OLTP systems and moved into analytical storage like a Data Warehouse or Data Lake. This is typically done through ETL/ELT pipelines. Once data is transformed and stored in analytical systems, it is used for reporting, dashboards, and machine learning.

In this design, the boundary lies at the **data pipeline layer**, where operational data is replicated or streamed into analytical systems without affecting transactional performance.

---

## Trade-offs

One major trade-off in this architecture is **increased system complexity**. Using multiple storage systems (Data Warehouse, Vector DB, Data Lake) improves functionality but also increases maintenance, integration effort, and operational overhead.

To mitigate this, the system can adopt a **unified orchestration layer** using tools like data pipelines and workflow managers. Additionally, implementing a **Data Lakehouse approach** can reduce fragmentation by combining data lake flexibility with warehouse-like structure.

Another mitigation strategy is **clear data governance and schema management**, ensuring consistency across systems. Monitoring tools and automation can also help reduce manual effort and errors.

Overall, while the architecture introduces complexity, it provides scalability, flexibility, and advanced capabilities required for modern healthcare systems.