# 🧾 Batch 21 – SQL Curriculum (PostgreSQL)

<div align="center">

![Batch 21](https://img.shields.io/badge/Batch-21-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)

**Instructor:** Sayyed Shiraj Ahmad (Ali)
**Duration:** 6 Weeks · 18 Sessions

</div>

---

## 📘 Your Learning Hub

Welcome, Batch 21! This folder is your central hub for weekly curriculum materials, assignments, and notes.

### 🗂️ Weekly Roadmap

| Week       | Focus Area       | Key Topics                         |
| :--------- | :--------------- | :--------------------------------- |
| **Week 1** | **Foundations**  | `week_01_foundations_environment`  |
| **Week 2** | **Aggregation**  | `week_02_aggregation_grouping`     |
| **Week 3** | **Joins**        | `week_03_joins_relationships`      |
| **Week 4** | **Constraints**  | `week_04_constraints_transactions` |
| **Week 5** | **Advanced SQL** | `week_05_advanced_sql`             |
| **Week 6** | **Analytics**    | `week_06_analytics_final_project`  |

---

## 🧭 Daily Checklist

### Step 1: PostgreSQL Setup

Navigate to `week_01_foundations_environment/day_01/00_get_started/` and follow the guide to install PostgreSQL 18.

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
