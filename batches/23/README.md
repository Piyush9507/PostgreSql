# 🧾 Batch 23 – SQL Curriculum (PostgreSQL)

<div align="center">

![Batch 23](https://img.shields.io/badge/Batch-23-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)

**Instructor:** Sayyed Shiraj Ahmad (Ali)
**Duration:** 6 Weeks · 24 Sessions

</div>

---

## 📘 Your Learning Hub

Welcome, Batch 23! This folder is your central hub for weekly curriculum materials, assignments, and notes.

### 🗂️ Weekly Roadmap

| Week       | Focus Area       | Key Topics                      |
| :--------- | :--------------- | :------------------------------ |
| **Week 1** | **Foundations**  | Setup, DDL, Data Types          |
| **Week 2** | **Aggregation**  | Filtering, Grouping, CASE WHEN  |
| **Week 3** | **Joins**        | Inner, Outer, Self, Cross Joins |
| **Week 4** | **Constraints**  | Data Integrity, Transactions    |
| **Week 5** | **Advanced SQL** | Window Functions, CTEs          |
| **Week 6** | **Analytics**    | Capstone Project                |

---

## 🧭 Daily Checklist

### Step 1: PostgreSQL Setup

Navigate to `week_01` folder to begin your journey and install PostgreSQL 18.

### Step 2: Load Your Data (RetailMart V1)

**⚠️ CRITICAL:** You must use the **`legacy/batch_21_22_23/datasets/`** folder.

```bash
# Run this from the repository root:
psql -U postgres -d postgres -f legacy/batch_21_22_23/datasets/sql/retailmart_create_database.sql
psql -U postgres -d retailmart -f legacy/batch_21_22_23/datasets/sql/retailmart_all_schemas_create.sql
psql -U postgres -d retailmart -f legacy/batch_21_22_23/datasets/sql/retailmart_all_schemas_load_csv.sql
```

[👉 Click here for the detailed setup guide](../../legacy/batch_21_22_23/datasets/README.md)

### Step 3: Practice, Practice, Practice

Access your 400+ daily questions in the legacy practice folder:
[👉 Go to Practice Questions](../../legacy/batch_21_22_23/practise_questions/README.md)

---

## 🔗 Quick Links

<div align="center">

[🏠 Main Menu](../../README.md) • [📊 RetailMart Dataset](../../legacy/batch_21_22_23/datasets/README.md) • [📝 Question Bank](../../legacy/batch_21_22_23/practise_questions/README.md)

</div>

---

Happy Learning! 🚀
