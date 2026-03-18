## Architecture Recommendation

For a fast-growing food delivery startup handling diverse data types like GPS logs, customer reviews, transactions, and images, a **Data Lakehouse** architecture is the most suitable choice.

Firstly, the startup deals with **multiple data formats**. Payment transactions are structured, GPS logs are semi-structured, while customer reviews and images are unstructured. A Data Lakehouse can store all these formats in a unified system, unlike a traditional Data Warehouse which mainly supports structured data.

Secondly, it provides **scalability and cost efficiency**. As the startup grows, data volume will increase rapidly. A Lakehouse leverages low-cost storage from data lakes while still supporting structured querying, making it more economical than maintaining separate systems.

Thirdly, it supports **both real-time and analytical workloads**. The business needs real-time insights such as delivery tracking and fraud detection, along with historical analysis like customer behavior and sales trends. A Lakehouse enables both streaming and batch processing efficiently.

Additionally, it supports **advanced analytics and machine learning**. Customer reviews can be analyzed using NLP, GPS data can optimize delivery routes, and images can be used for menu recognition.

In conclusion, a Data Lakehouse combines flexibility, scalability, and unified analytics, making it the best choice for this scenario.