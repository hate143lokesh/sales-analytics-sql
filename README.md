📊 Retail Sales Analytics
SQL + Excel Business Intelligence Dashboard

A complete end-to-end Sales Analytics project demonstrating how raw transactional data can be transformed into business insights using MySQL and Microsoft Excel BI tools.

📌 Project Overview

This project is divided into two structured phases:

Phase 1: Sales Analytics using SQL (MySQL)

Phase 2: Business Intelligence Dashboard using Excel

It focuses on database design, analytical SQL queries, KPI generation, and executive-level dashboarding.

🧩 Phase 1 – Sales Analytics Using SQL
🎯 Objective

To design a normalized sales database and extract meaningful business insights using industry-standard SQL queries.

🗄️ Database Details

Database Name: sales_db

DBMS: MySQL

Design Approach: Normalized relational schema

🧱 Database Schema
1️⃣ customers

customer_id (PK)

customer_name

city

country

2️⃣ products

product_id (PK)

product_name

category

price

3️⃣ orders

order_id (PK)

customer_id (FK)

order_date

4️⃣ orders_item (Bridge Table)

orders_item_id (PK)

order_id (FK)

product_id (FK)

quantity

🔗 Relationships

One customer → many orders

One order → many products

One product → many orders

orders_item resolves the many-to-many relationship

🧠 SQL Concepts Implemented

INNER JOIN & LEFT JOIN

GROUP BY, HAVING

Subqueries

ORDER BY, LIMIT

NULL handling using COALESCE()

Aggregate functions (SUM, AVG)

Business-level analytical queries

📈 Business Insights Generated

🔝 Top customers by total spending

🛒 Best-selling products

💰 High-value orders

📦 Products never sold

📊 Revenue per customer

🧾 Total revenue analysis

✔ All queries are NULL-safe and production-ready.

🛡️ NULL Handling Strategy

Used LEFT JOIN where data may be missing

Applied COALESCE() to avoid NULL values

Ensured compatibility with Pandas & NumPy for future analysis

📂 Project Structure (Phase 1)
sales-analytics-sql/
│
├── schema.sql              # Database & table creation
├── sample_data.sql         # Sample insert data
├── analysis_queries.sql    # Business & analytical queries
├── views.sql               # Reusable SQL views
└── README.md               # Project documentation
📊 Phase 2 – Business Intelligence Dashboard (Excel)
🎯 Objective

To transform structured SQL data into an interactive executive-level BI dashboard using Microsoft Excel.

🛠 Tools & Technologies

Power Query (Data Cleaning & Transformation)

Power Pivot (Data Modeling)

Excel Data Model

DAX Measures

Pivot Tables & Pivot Charts

Slicers

Executive Dashboard Design

🔄 Data Workflow

Generated structured sales data in MySQL

Created analytical SQL view: sales_summary

Imported data into Excel

Loaded data into the Data Model

Created DAX measures

Designed interactive dashboard

📈 KPI Metrics Implemented

Total Revenue

Total Orders

Average Order Value (AOV)

🧮 DAX Measures
Total Revenue := SUM(sales_summary[total_amount])

Total Orders := DISTINCTCOUNT(sales_summary[order_id])

Avg Order Value := DIVIDE([Total Revenue], [Total Orders])
📊 Dashboard Components

Monthly Revenue Trend (Line Chart)

Monthly Revenue & Orders (Combo Chart)

Revenue by Category

Top 5 Customers by Revenue

Top 5 Products by Revenue

Interactive Slicers (City & Category)

📌 Key Insights

📈 Revenue spike during Q4 season

💻 Electronics category contributes highest revenue

🧍 Revenue concentration among top customers

🏆 Product performance ranking analysis

🎨 Dashboard Design Approach

Clean executive layout

KPI cards at the top

Centered visual alignment

Interactive slicers

Backend sheets hidden

Workbook structure protected

💼 Skills Demonstrated

✔ SQL Database Design
✔ Data Modeling
✔ Advanced SQL Analytics
✔ DAX Calculations
✔ KPI Design
✔ BI Dashboard Storytelling
✔ Excel BI Best Practices

👤 Author

Lokesh Hate
SQL & Data Analytics Learner

✅ Project Status

✔ Phase 1 Completed

✔ Database Schema Verified

✔ Business Queries Validated

✔ Phase 2 Dashboard Completed

✔ GitHub & Resume Ready
