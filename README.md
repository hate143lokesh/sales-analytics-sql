# 📊 Retail Sales Analytics

**SQL + Excel + Power BI Business Intelligence Project**

A complete **end-to-end Sales Analytics project** demonstrating how raw transactional data can be transformed into **business insights** using **MySQL, Microsoft Excel, and Power BI**.

---

# 📌 Project Overview

This project is divided into **three structured phases**:

**Phase 1:** Sales Analytics using SQL (MySQL)
**Phase 2:** Business Intelligence Dashboard using Excel
**Phase 3:** Interactive Data Visualization using Power BI

The project focuses on:

* Database design
* Analytical SQL queries
* KPI generation
* Business intelligence dashboards
* Interactive data visualization

---

# 🧩 Phase 1 – Sales Analytics Using SQL

## 🎯 Objective

Design a normalized sales database and extract meaningful business insights using **industry-standard SQL queries**.

## 🗄️ Database Details

Database Name: `sales_db`
DBMS: MySQL
Design Approach: Normalized relational schema

---

## 🧱 Database Schema

### 1️⃣ customers

* customer_id (PK)
* customer_name
* city
* country

### 2️⃣ products

* product_id (PK)
* product_name
* category
* price

### 3️⃣ orders

* order_id (PK)
* customer_id (FK)
* order_date

### 4️⃣ orders_item

Bridge table resolving many-to-many relationship

* orders_item_id (PK)
* order_id (FK)
* product_id (FK)
* quantity

---

## 🔗 Relationships

* One customer → many orders
* One order → many products
* One product → many orders
* `orders_item` resolves many-to-many relationship

---

## 🧠 SQL Concepts Implemented

* INNER JOIN & LEFT JOIN
* GROUP BY, HAVING
* Subqueries
* ORDER BY, LIMIT
* COALESCE() for NULL handling
* Aggregate functions (SUM, AVG)
* Business analytical queries

---

## 📈 Business Insights Generated

* 🔝 Top customers by total spending
* 🛒 Best-selling products
* 💰 High-value orders
* 📦 Products never sold
* 📊 Revenue per customer
* 🧾 Total revenue analysis

All queries are **NULL-safe and production-ready**.

---

## 🛡️ NULL Handling Strategy

* Used LEFT JOIN where data may be missing
* Applied COALESCE() to avoid NULL values
* Ensured compatibility with **Pandas & NumPy**

---

## 📂 Project Structure (Phase 1)

```
sales-analytics-sql
│
├── schema.sql
├── sample_data.sql
├── analysis_queries.sql
├── views.sql
└── README.md
```

---

# 📊 Phase 2 – Business Intelligence Dashboard (Excel)

## 🎯 Objective

Transform structured SQL data into an **interactive executive-level dashboard** using Microsoft Excel.

---

## 🛠 Tools & Technologies

* Power Query
* Power Pivot
* Excel Data Model
* DAX Measures
* Pivot Tables & Pivot Charts
* Interactive Slicers

---

## 🔄 Data Workflow

1. Generated structured sales data in MySQL
2. Created analytical SQL view: `sales_summary`
3. Imported data into Excel
4. Loaded data into Excel Data Model
5. Created DAX measures
6. Designed interactive dashboard

---

## 📈 KPI Metrics Implemented

* Total Revenue
* Total Orders
* Average Order Value (AOV)

### DAX Measures

```
Total Revenue := SUM(sales_summary[total_amount])

Total Orders := DISTINCTCOUNT(sales_summary[order_id])

Avg Order Value := DIVIDE([Total Revenue], [Total Orders])
```

---

## 📊 Dashboard Components

* Monthly Revenue Trend (Line Chart)
* Monthly Revenue vs Orders (Combo Chart)
* Revenue by Category
* Top 5 Customers by Revenue
* Top 5 Products by Revenue
* Interactive Slicers

---

# 📊 Phase 3 – Business Intelligence Dashboard (Power BI)

## 🎯 Objective

Create a **modern interactive analytics dashboard** using Power BI for deeper business insights and advanced visual analytics.

---

## 🛠 Tools Used

* Power BI Desktop
* Power Query
* Data Modeling
* DAX Measures
* Interactive Visualizations

---

## 📊 Power BI Dashboard Features

* Sales Overview Dashboard
* Regional Sales Analysis
* Category Performance
* Product Profitability Analysis
* Monthly Sales Trends
* Customer Insights
* Interactive Filters & Slicers

---

## 📈 Power BI Visualizations Used

* Bar Chart
* Line Chart
* Waterfall Chart
* Treemap
* Donut Chart
* Map Visualization
* Scatter Plot
* Key Influencers Analysis
* Decomposition Tree

---

## 📊 Key Insights from Power BI Dashboard

* East region contributes the highest sales revenue
* Electronics category dominates overall revenue
* Sales show seasonal patterns across months
* Profit growth directly impacts total sales
* Customer purchasing patterns vary by region

---

## 📂 Project Structure (Full Project)

```
Retail-Sales-Analytics
│
├── SQL
│   ├── schema.sql
│   ├── sample_data.sql
│   ├── analysis_queries.sql
│   └── views.sql
│
├── Excel_Dashboard
│   └── Retail_Analytics_Dashboard.xlsx
│
├── PowerBI
│   └── Retail_Analytics.pbix
│
├── screenshots
│   ├── dashboard_overview.png
│   ├── sales_analysis.png
│   └── kpi_section.png
│
├── slides
│   └── PowerBI_Presentation.pptx
│
└── README.md
```

---

# 🎨 Dashboard Design Principles

* Clean executive layout
* KPI cards positioned at top
* Consistent color palette
* Interactive filters
* Clear visual storytelling
* Professional BI layout

---

# 💼 Skills Demonstrated

✔ SQL Database Design
✔ Data Modeling
✔ Advanced SQL Analytics
✔ Business Intelligence (Excel & Power BI)
✔ DAX Calculations
✔ KPI Design
✔ Dashboard Storytelling
✔ Data Visualization

---

# 👤 Author

**Lokesh Hate**
SQL & Data Analytics Learner

---

# ✅ Project Status

✔ Phase 1 Completed (SQL Analytics)
✔ Phase 2 Completed (Excel BI Dashboard)
✔ Phase 3 Completed (Power BI Dashboard)
✔ GitHub Portfolio Ready

