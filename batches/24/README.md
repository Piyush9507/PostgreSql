# 🧾 Batch 24 – SQL Curriculum (PostgreSQL)

<div align="center">

![Batch 24](https://img.shields.io/badge/Batch-24-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)

**Instructor:** Sayyed Shiraj Ahmad (Ali)
**Duration:** 6 Weeks · 29 Sessions

</div>

---

## 📘 Your Learning Hub

Welcome, Batch 24! This folder is your central hub for weekly curriculum materials, assignments, and notes.

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

## 🧭 Getting Started

### Step 1: Environment Setup

Navigate to `week_01/day_01/00_get_started/` and pick your OS guide:

| Your OS     | Guide                                                                |
| :---------- | :------------------------------------------------------------------- |
| **macOS**   | [setup_mac.md](./week_01/day_01/00_get_started/setup_mac.md)         |
| **Windows** | [setup_windows.md](./week_01/day_01/00_get_started/setup_windows.md) |

### Step 2: Load Your Data (RetailMart V2)

```bash
# Load the RAW (dirty) database — students connect here
psql -U postgres -f datasets/sql/setup_accio_retailmart_raw.sql

# Load the CLEAN (solution) database — instructor reference
psql -U postgres -f datasets/sql/setup_accio_retailmart_clean.sql
```

[👉 Click here for the detailed dataset guide](../../datasets/README.md)

---

## 🔗 Quick Links

<div align="center">

[🏠 Main Menu](../../README.md) • [📊 RetailMart V2 Dataset](../../datasets/README.md) • [📝 Curriculum](../../curriculum/SQL_Curriculum_v3.md)

</div>

---

Happy Learning! 🚀
