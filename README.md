# Retail-Data-Analytics-Using-Sql
Problem: Lack of insights into sales trends, store performance, and warranty issues. 

Solution: Built SQL-based analytics to track sales, identify top products/stores, and analyze warranty claims. 

Tools Used: PostgreSQL, SQL (joins, subqueries, window functions). 

SQL Business Case Study 🚀

This repository contains a collection of SQL scripts designed to demonstrate database creation, indexing, query optimization, and solving real-world business problems with SQL.

📂 Files Included

-- Index on sale_date for faster range queries
CREATE INDEX idx_sales_date ON sales(sale_date);

-- Index on store_id for joins and grouping
CREATE INDEX idx_sales_store ON sales(store_id);

-- Index on product_id for joins with products
CREATE INDEX idx_sales_product ON sales(product_id);

-- Index on claim_date for warranty analysis
CREATE INDEX idx_warranty_date ON warranty(claim_date);

-- Index on repair_status for filtering
CREATE INDEX idx_warranty_status ON warranty(repair_status);

-- Index on category_id for product-category joins
CREATE INDEX idx_products_category ON products(category_id);

Table Creation.sql → Defines the database schema with tables, relationships, and constraints.

Indexes.sql → Demonstrates how indexing improves query performance.

Count rows.sql → Simple row counting queries for validation and exploration.

Business_Problems.sql → A set of SQL queries that address common business problems (sales trends, performance metrics, insights, etc.).

🛠️ Skills Demonstrated

Database design and schema creation

Query optimization with indexes

Data exploration and aggregation

Solving analytical and business-related problems using SQL

🚀 How to Use

Clone this repository:

git clone https://github.com/your-username/your-repo-name.git


Import the SQL scripts into your PostgreSQL/MySQL/SQL Server environment.

Run Table Creation.sql first to set up the schema.

Apply Indexes.sql to optimize performance.

Explore queries in Business_Problems.sql and Count rows.sql.

📊 Example Business Problems Solved

Analyzing sales performance

Tracking growth trends

Identifying key business metrics

Running validation checks
