# 🎓 SQL Curriculum — Legacy Batches (21-23)

<div align="center">

![Batch 21](https://img.shields.io/badge/Batch-21-orange?style=for-the-badge)
![Batch 22](https://img.shields.io/badge/Batch-22-orange?style=for-the-badge)
![Batch 23](https://img.shields.io/badge/Batch-23-orange?style=for-the-badge)

### **Mastering PostgreSQL with RetailMart V1**

**Instructor:** Sayyed Shiraj Ahmad (Ali)

</div>

---

## 📘 Your Learning Dashboard

You are learning SQL using the **RetailMart V1** dataset—a robust 8-schema database designed to teach you data analytics from the ground up.

| **Parameter** | **Details**                                          |
| :------------ | :--------------------------------------------------- |
| **Duration**  | 6 Weeks                                              |
| **Sessions**  | Batch 21 (18) • Batch 22 & 23 (24)                   |
| **Database**  | **RetailMart V1** (8 Schemas • 28 Tables • 1M+ Rows) |
| **Platform**  | PostgreSQL (latest) • pgAdmin 4                      |

---

## 🗂️ Essential Resources

| Resource            | Location                                                                                   | Usage                                                |
| :------------------ | :----------------------------------------------------------------------------------------- | :--------------------------------------------------- |
| **🗄️ Dataset**      | [`legacy/batch_21_22_23/datasets/`](./legacy/batch_21_22_23/datasets/)                     | Your source of truth. Includes CSVs and SQL scripts. |
| **📝 Practice**     | [`legacy/batch_21_22_23/practise_questions/`](./legacy/batch_21_22_23/practise_questions/) | **400+ Daily Questions** to sharpen your skills.     |
| **📂 Batch Folder** | `batches/21/`, `batches/22/`, `batches/23/`                                                | Your daily notes, assignments, and class materials.  |

---

## 🚀 Quick Start Guide

### Step 1: PostgreSQL Setup

Navigate to your batch's `week_01` folder and follow the installation guide.

### Step 2: Load the Data

Run these commands in your terminal (from the repo root):

```bash
# 1. Create the Database
psql -U postgres -d postgres -f legacy/batch_21_22_23/datasets/sql/retailmart_create_database.sql

# 2. Build the Structure (Schemas & Tables)
psql -U postgres -d retailmart -f legacy/batch_21_22_23/datasets/sql/retailmart_all_schemas_create.sql

# 3. Import the Data (1M+ Rows)
psql -U postgres -d retailmart -f legacy/batch_21_22_23/datasets/sql/retailmart_all_schemas_load_csv.sql
```

> **Need help?** Check the [Detailed Dataset Guide](./legacy/batch_21_22_23/datasets/README.md)

---

## 🧩 RetailMart V1 Schema Overview

Your playground consists of 8 interconnected schemas simulating a real retail business.

| Schema           | Purpose               | Key Tables                               |
| :--------------- | :-------------------- | :--------------------------------------- |
| **🟦 core**      | **Shared Dimensions** | `dim_date`, `dim_region`, `dim_category` |
| **🟨 customers** | **Customer 360**      | `customers`, `reviews`, `loyalty_points` |
| **🟥 products**  | **Inventory Mgmt**    | `products`, `suppliers`, `inventory`     |
| **🟩 stores**    | **Operations**        | `stores`, `employees`, `expenses`        |
| **🟪 sales**     | **Transactions**      | `orders`, `order_items`, `payments`      |
| **🟧 finance**   | **P&L Analysis**      | `revenue_summary`, `expenses`            |
| **🟫 hr**        | **Workforce**         | `attendance`, `salary_history`           |
| **🩵 marketing** | **Growth**            | `campaigns`, `ads_spend`, `email_clicks` |

---

## 🧠 What You Will Master

### Week 1: The Foundation

- **Setup**: Installing PostgreSQL & pgAdmin.
- **DDL**: Creating databases and tables.
- **Constraints**: `PK`, `FK`, `UNIQUE`, `NOT NULL`.

### Week 2: Data Manipulation

- **Filtering**: `WHERE`, `LIKE`, `IN`, `BETWEEN`.
- **Aggregation**: `GROUP BY`, `HAVING`, `COUNT`, `SUM`.
- **Logic**: `CASE WHEN`, `COALESCE`.

### Week 3: Relationships

- **Joins**: `INNER`, `LEFT`, `RIGHT`, `FULL`, `CROSS`.
- **Set Ops**: `UNION`, `INTERSECT`, `EXCEPT`.

### Week 4: Advanced Analytics

- **Subqueries**: Scalar, Row, and Table subqueries.
- **CTEs**: Common Table Expressions for readability.
- **Window Functions**: `RANK`, `DENSE_RANK`, `ROW_NUMBER`.

### Week 5: Performance & Engineering

- **Transactions**: `BEGIN`, `COMMIT`, `ROLLBACK`.
- **Indexing**: Optimizing query speed.
- **Views**: `CREATE VIEW` & `MATERIALIZED VIEW`.

### Week 6: The Final Project

- **Goal**: Build an end-to-end analytics dashboard.
- **Deliverable**: A comprehensive presentation of business insights using all you've learned.

---

## 💡 Daily Practice Routine

To succeed, you must practice. You have access to **400+ questions** covering:

- ✅ Basic SELECTs
- ✅ Complex Joins
- ✅ Analytical Window Functions
- ✅ Business Scenario Solving

👉 **[Start Practicing Here](./legacy/batch_21_22_23/practise_questions/README.md)**

---

<div align="center">

**Ready to become a Data Analyst?**

[Go to Main Menu](./README.md)

</div>
