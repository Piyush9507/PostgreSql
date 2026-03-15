# 🎓 SQL Curriculum — Batch 24 & Beyond

<div align="center">

![Batch 24+](https://img.shields.io/badge/Batch-24%2B-blue?style=for-the-badge)
![V2 Dataset](https://img.shields.io/badge/Dataset-RetailMart%20V2-success?style=for-the-badge)
![Dirty Data](https://img.shields.io/badge/Mode-Real%20World%20Sim-red?style=for-the-badge)

### **The Next Generation of Data Analytics**

**Instructor:** Sayyed Shiraj Ahmad (Ali)

</div>

---

## 📘 Your Future-Ready Curriculum

Welcome to the **RetailMart V2** experience. This curriculum doesn't just teach SQL; it teaches you how to handle the messy, complex reality of enterprise data.

| **Parameter** | **Details**                                           |
| :------------ | :---------------------------------------------------- |
| **Duration**  | 6 Weeks                                               |
| **Sessions**  | 29 Sessions (Intensive)                               |
| **Database**  | **RetailMart V2** (16 Schemas • 47 Tables • 1M+ Rows) |
| **Platform**  | PostgreSQL (latest) • pgAdmin 4                       |

---

## 🆕 What's New in V2?

We've upgraded the curriculum to reflect modern industry demands.

| Feature           | The Upgrade                                       | Why It Matters                                |
| :---------------- | :------------------------------------------------ | :-------------------------------------------- |
| **16 Schemas**    | Adds Supply Chain, Audit, Loyalty, Payroll + more | Holistic business understanding.              |
| **Dirty Data**    | Intentional typos, duplicates, nulls              | 80% of a Data Analyst's job is cleaning data. |
| **Dual Datasets** | Raw (dirty) + Clean (solution) side by side       | Compare and learn data cleaning techniques.   |
| **Authenticity**  | Real Indian names, cities & email domains         | Better context for analysis.                  |

---

## 🗂️ Essential Resources

| Resource             | Location                                       | Usage                                                           |
| :------------------- | :--------------------------------------------- | :-------------------------------------------------------------- |
| **🗄️ RetailMart V2** | [`datasets/`](./datasets/)                     | The new standard. Includes `csv_raw` (dirty) and `csv_cleaned`. |
| **📝 Practice**      | [`practise_questions/`](./practise_questions/) | **400+ Daily Questions** covering cleaning & analytics.         |
| **📂 Batch Folder**  | `batches/24/`                                  | Your daily notes, assignments, and class materials.             |

## Dataset Link => https://www.kaggle.com/datasets/sirajahmad/acciojob-sql-dataset
---

## 🚀 Quick Start Guide

### Load to PostgreSQL (One Command!)

Run from the **repo root**:

```bash
# Load the RAW (dirty) database — students connect here
psql -U postgres -f datasets/sql/setup_accio_retailmart_raw.sql

# Load the CLEAN (solution) database — instructor reference
psql -U postgres -f datasets/sql/setup_accio_retailmart_clean.sql
```

Each script creates the database, builds all schemas/tables, and loads data automatically.

> **Need help?** Check the [Dataset Guide](./datasets/README.md)

---

## 🧩 RetailMart V2 Schema Map (16 Schemas)

| Schema           | What it Teaches    | Key Tables                               |
| :--------------- | :----------------- | :--------------------------------------- |
| **core**         | Dimensions         | `dim_date`, `dim_region`, `dim_category` |
| **customers**    | CRM                | `customers`, `addresses`, `reviews`      |
| **stores**       | Retail Ops         | `stores`, `employees`, `expenses`        |
| **products**     | Catalog            | `products`, `suppliers`, `inventory`     |
| **sales**        | Transactions       | `orders`, `order_items`, `payments`      |
| **finance**      | Accounting         | `expenses`, `revenue_summary`            |
| **hr**           | People Analytics   | `attendance`, `salary_history`           |
| **marketing**    | Campaign Analytics | `campaigns`, `ads_spend`, `email_clicks` |
| **support**      | CX Analytics       | `tickets`                                |
| **web_events**   | Digital Analytics  | `page_views`, `events`                   |
| **supply_chain** | Logistics          | `warehouses`, `shipments`, `snapshots`   |
| **loyalty**      | Retention          | `tiers`, `members`, `redemptions`        |
| **manufacture**  | IoT/Ops            | `production_lines`, `work_orders`        |
| **payroll**      | Compensation       | `tax_brackets`, `pay_slips`              |
| **call_center**  | Voice Analytics    | `calls`, `transcripts`                   |
| **audit**        | Compliance         | `logs`, `api_requests`, `record_changes` |

---

## 🎓 The Learning Journey (29 Sessions)

### Phase 1: The Cleaner (Weeks 1-3)

**"Data is never clean."**

- work with `csv_raw` folders.
- Identify NULLs, duplicates, and referential integrity breaks.
- Write SQL scripts to clean and standardize data.

### Phase 2: The Architect (Weeks 4-5)

**"Structure matters."**

- Design normalized schemas (3NF).
- Create Views and Materialized Views for reporting.
- Implement indexing strategies for performance.

### Phase 3: The Analyst (Week 6)

**"Insights drive decisions."**

- Build cross-schema queries (e.g., "Impact of Supply Chain delays on Customer Churn").
- Analyze Audit logs to detect system anomalies.
- Create a final executive dashboard.

---

## 💡 Daily Practice Routine

You will tackle **400+ questions** designed to break your code involving:

- 🧹 Data Cleaning Challenges
- 🔗 12-Table Joins
- 📊 Complex Window Functions
- 🕵️ Forensic Data Analysis

---

<div align="center">

**Ready for the challenge?**

[Go to Main Menu](./README.md)

</div>
