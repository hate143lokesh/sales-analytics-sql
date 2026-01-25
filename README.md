# sales-analytics-sql
SQL project for sales data analysis using MySQL
.

📊 Sales Analytics SQL Project (Phase 1)
📌 Project Overview

This project is a Sales Analytics system built using MySQL.
It focuses on database design, data analysis, and business insights using real-world SQL queries.

The project demonstrates how raw sales data can be transformed into meaningful business insights such as top customers, best-selling products, and high-value orders.

🗄️ Database Used

MySQL – sales_db

🧱 Database Schema (Tables)

The database follows a normalized relational design with four tables:

customers

customer_id (PK)

customer_name

city

country

products

product_id (PK)

product_name

category

price

orders

order_id (PK)

customer_id (FK)

order_date

orders_item (Bridge Table)

orders_item_id (PK)

order_id (FK)

product_id (FK)

quantity

🔗 Relationships

One customer can place many orders

One order can contain many products

One product can appear in many orders

orders_item resolves the many-to-many relationship between orders and products

🧠 SQL Concepts Covered

This project uses industry-standard SQL concepts, including:

INNER JOIN & LEFT JOIN

GROUP BY, HAVING

Subqueries

ORDER BY, LIMIT

NULL handling using COALESCE

Aggregate functions (SUM, AVG)

Business-level analytical queries

📈 Business Insights Generated

The following insights are extracted from the data:

🔝 Top customers by total spending

🛒 Best-selling products

💰 High-value orders

📦 Products that were never sold

📊 Revenue per customer

🧾 Total revenue analysis

All calculations are NULL-safe and suitable for real-world datasets.

📂 Project Files
sales-analytics-sql/
│
├── schema.sql              # Database & table creation
├── sample_data.sql         # Sample insert data
├── analysis_queries.sql    # All analysis & business queries
├── views.sql               # Reusable SQL views
└── README.md               # Project documentation

🛡️ NULL Handling Strategy

Used LEFT JOIN where data may be missing

Applied COALESCE() to avoid NULL values in calculations

Ensured compatibility with Pandas & NumPy for future analysis

🧪 Tools & Technologies

MySQL

MySQL Workbench

GitHub

🚀 Future Scope (Phase 2)

Integrate with Python (Pandas & NumPy)

Perform advanced data analysis

Add visualizations (Matplotlib / Seaborn)

Extend insights using window functions

👤 Author

Lokesh Hate
SQL & Data Analytics Learner

✅ Project Status

✔ Phase 1 Completed
✔ Schema & Relationships Verified
✔ Business Queries Validated
✔ GitHub Ready
