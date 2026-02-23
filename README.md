# 🎓 SQL Curriculum (PostgreSQL Edition)

<div align="center">

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Latest-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![pgAdmin](https://img.shields.io/badge/pgAdmin-4-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![VS Code](https://img.shields.io/badge/VS%20Code-Latest-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)

### **From Zero to Hero in Data Analysis**

**Instructor:** Sayyed Shiraj Ahmad (Ali)

</div>

---

## 🚀 Welcome to Your SQL Journey

This curriculum is designed to transform you into a **Data Analyst** capable of handling real-world enterprise data. You won't just learn syntax; you'll solve business problems using **RetailMart**—a massive, realistic e-commerce database.

### 🌟 Why This Curriculum?

| Feature                   | Description                                                                               |
| :------------------------ | :---------------------------------------------------------------------------------------- |
| **🏢 Real-World Dataset** | Work with **RetailMart** (1M+ rows), simulating an Amazon-like retail giant.              |
| **⚡ Modern Stack**       | Learn on the latest **PostgreSQL**, the world's most advanced open-source DB.             |
| **🛠️ Hands-On Labs**      | 400+ practice questions, 50+ tables, and daily coding challenges.                         |
| **📈 Career Focus**       | Master the exact skills companies hire for: Joins, CTEs, Window Functions, and Reporting. |

---

## 👉 **Choose Your Learning Path**

<div align="center">

### 🔴 Are you in Batch 21, 22, or 23?

**[CLICK HERE FOR YOUR DASHBOARD](./README_BATCHES_21_22_23.md)**
_(Uses RetailMart V1 • 8 Schemas • 28 Tables)_

<br>

### 🟢 Are you in Batch 24 or newer?

**[CLICK HERE FOR YOUR DASHBOARD](./README_BATCH_24_PLUS.md)**
_(Uses RetailMart V2 • 16 Schemas • 47 Tables • Dirty Data)_

</div>

---

## 🧠 Detailed Curriculum: Topics Covered

We cover the entire spectrum of SQL development, broken down into mastery modules.

### 🏗️ Module 1: The Foundation (Week 1)

**"Building the Structures"**

- **Database Architecture**: Understanding Client-Server models, DBMS vs RDBMS.
- **DDL Mastery**: Creating databases, schemas (`CREATE SCHEMA`), and tables (`CREATE TABLE`) with precision.
- **Data Types**: Deep dive into `INT`, `NUMERIC`, `VARCHAR`, `TEXT`, `DATE`, `TIMESTAMP`, and `BOOLEAN`.
- **Constraints**: Enforcing data integrity with `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, and `CHECK`.

### 🔍 Module 2: The Art of Querying (Week 2)

**"Asking the Right Questions"**

- **Data Retrieval**: Mastering `SELECT`, aliasing, and raw data exploration.
- **Filtering Power**: complex logic with `WHERE`, `AND/OR`, `IN`, `BETWEEN`, and pattern matching with `LIKE`/`ILIKE`.
- **Handling Nulls**: The concept of `NULL` and the `IS NULL` / `IS NOT NULL` operators.
- **Sorting & Paging**: `ORDER BY` for ranking and `LIMIT`/`OFFSET` for pagination.

### 📊 Module 3: Aggregation & Grouping (Week 2-3)

**"Summarizing the World"**

- **Aggregate Functions**: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` to derive insights.
- **Grouping Data**: Segmentation using `GROUP BY` to analyze trends by region, category, or time.
- **Filtering Groups**: Using `HAVING` to filter aggregated results (e.g., "Stores with > $1M revenue").
- **Case Logic**: Conditional logic with `CASE WHEN` for dynamic categorizations (e.g., "High Value" vs "Low Value" customers).

### 🔗 Module 4: Relational Mastery (Week 3)

**"Connecting the Dots"**

- **The Power of Joins**: Visualizing data relationships.
- **Inner Join**: Finding matching records (The intersection).
- **Left/Right Join**: Preserving data from one side (The master list).
- **Full Outer Join**: Combining everything (The complete picture).
- **Cross Join**: Generating combinations (The matrix).
- **Self Join**: Hierarchical data (e.g., Employees and Managers).

### 🧩 Module 5: Advanced Analytics (Week 4)

**"Solving Complex Problems"**

- **Subqueries**: Nesting queries for multi-step logic (Scalar, Row, Table subqueries).
- **Correlated Subqueries**: Queries that depend on the outer row.
- **CTEs (Common Table Expressions)**: Writing readable, modular code with `WITH` clauses.
- **Recursive CTEs**: Traversing hierarchies (e.g., Organization charts).

### 📈 Module 6: Window Functions (Week 4-5)

**"The Analyst's Superpower"**

- **Ranking**: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` for leaderboards.
- **Value Access**: `LAG()`, `LEAD()` for period-over-period analysis (MoM, YoY).
- **Aggregates**: Running totals, moving averages, and cumulative sums using `OVER (PARTITION BY ... ORDER BY ...)`.

### ⚙️ Module 7: Performance & Engineering (Week 5)

**"Building for Scale"**

- **Transactions**: Ensuring ACID properties with `BEGIN`, `COMMIT`, `ROLLBACK`.
- **Indexing**: B-Tree, Hash, and GIN indexes to speed up queries by 100x.
- **Views**: Creating virtual tables (`CREATE VIEW`) for security and simplicity.
- **Materialized Views**: Caching complex query results for instant access.
- **Functions**: Writing reusable logic with User-Defined Functions (UDFs).

### 🏆 Module 8: Capstone Project (Week 6)

**"Putting It All Together"**

- **End-to-End Analytics**: Build a complete reporting dashboard for RetailMart.
- **Business KPIs**: Calculate CLV (Customer Lifetime Value), Churn Rate, and Monthly Recurring Revenue (MRR).
- **Dashboarding**: Presenting insights using SQL-driven data.

---

## 📂 Repository Structure

| Folder        | Description                                                                              |
| :------------ | :--------------------------------------------------------------------------------------- |
| `batches/`    | **Student Area**: Weekly folders with daily notes, assignments, and labs for each batch. |
| `datasets/`   | **RetailMart V2**: The new standard dataset (CSV + SQL) for Batch 24+.                   |
| `curriculum/` | **Curriculum Templates**: Standardized syllabus and teaching flow documents.             |
| `legacy/`     | **Archives**: Old datasets, practice questions, and notes for Batches 21-23.             |

---

## 🛠️ Tools of the Trade

You will become proficient in the industry-standard "Modern Data Stack":

1.  **PostgreSQL**: The core database engine (latest version).
2.  **pgAdmin 4**: The administrative interface for server management.
3.  **VS Code**: The modern, lightweight code editor for writing SQL queries.
4.  **Git & GitHub**: Version control for your code and projects.

---

<div align="center">

### ready to start?

**[Select Your Batch Above to Begin!](#-choose-your-learning-path)**

Created with ❤️ by **Sayyed Shiraj Ahmad (Ali)**

</div>
