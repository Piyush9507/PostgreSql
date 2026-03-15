# 📦 RetailMart V1 — Legacy Dataset (Batches 21-23)

<div align="center">

![Type](https://img.shields.io/badge/Dataset-Legacy-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Stable-success?style=for-the-badge)
![Size](https://img.shields.io/badge/Rows-1M%2B-blue?style=for-the-badge)

**For Batches 21, 22, and 23**
_Your playground for mastering SQL analytics._

</div>

---

## ⚠️ Vision Check

| Your Batch           | Action                                                                    |
| :------------------- | :------------------------------------------------------------------------ |
| **Batch 21, 22, 23** | ✅ **Use this folder.** This is your assigned dataset.                    |
| **Batch 24+**        | ❌ **STOP.** Go to [`/datasets/`](../../../datasets/) for the V2 dataset. |

---

## 📘 The RetailMart V1 Ecosystem

RetailMart V1 is a **simulated enterprise database** mirroring the complexity of a real e-commerce giant like Amazon or Flipkart.

### 📊 At a Glance

- **8 Schemas**: Logical separation of business units (Sales, HR, Marketing, etc.)
- **28 Tables**: A web of connected data entities.
- **1,000,000+ Rows**: High-volume data to test your query performance.
- **Authentic Context**: Indian names, cities (`Mumbai`, `Delhi`), and currency (`INR`).

---

## 🚀 Setup Guide: From Zero to Querying

### Step 1: Initialize

Open your terminal in the **repository root** and run:

```bash
# 1. Create the Database Shell
psql -U postgres -d postgres -f legacy/batch_21_22_23/datasets/sql/retailmart_create_database.sql
```

### Step 2: Construct

Build the empty structures (tables, keys, constraints):

```bash
# 2. Build Schema Architecture
psql -U postgres -d retailmart -f legacy/batch_21_22_23/datasets/sql/retailmart_all_schemas_create.sql
```

### Step 3: Populate

Inject 1 million rows of data (this might take 1-2 minutes):

```bash
# 3. Load Data
psql -U postgres -d retailmart -f legacy/batch_21_22_23/datasets/sql/retailmart_all_schemas_load_csv.sql
```

---

## 🧩 Schema Deep Dive

### 🟦 The Core Layer

**`core` Schema**

- **Purpose**: Reference data used across the entire business.
- **Tables**: `dim_date`, `dim_region`, `dim_category`, `dim_brand`.
- **Key Insight**: Always join with `dim_date` for time-based analysis.

### 🟨 The Customer 360

**`customers` Schema**

- **Purpose**: Everything about the user.
- **Tables**: `customers`, `addresses`, `reviews`, `loyalty_points`.
- **Challenge**: Analyze customer lifetime value vs. reviews.

### 🟩 Operations & Retail

**`stores` Schema**

- **Purpose**: Physical footprint and workforce.
- **Tables**: `stores`, `employees`, `expenses`.
- **Metric**: Calculate "Revenue per Square Foot" or "Sales per Employee".

### 🟥 Product Catalog

**`products` Schema**

- **Purpose**: Inventory and supply chain.
- **Tables**: `products`, `suppliers`, `inventory`.
- **Alert**: Watch out for low-stock items in `inventory`!

### 🟪 The Transaction Engine

**`sales` Schema**

- **Purpose**: The heart of the business - money changing hands.
- **Tables**: `orders`, `order_items`, `payments`, `shipments`, `returns`.
- **Volume**: The largest tables in the database.

### 🟧 Financial Health

**`finance` Schema**

- **Purpose**: The bottom line.
- **Tables**: `revenue_summary`, `expenses`.

### 🟫 Human Resources

**`hr` Schema**

- **Purpose**: Employee lifecycle.
- **Tables**: `attendance`, `salary_history`.
- **Task**: Correlate attendance with store performance.

### 🩵 Growth Engine

**`marketing` Schema**

- **Purpose**: Customer acquisition.
- **Tables**: `campaigns`, `ads_spend`, `email_clicks`.
- **KPI**: ROI (Return on Ad Spend).

---

## 🧪 Verify Your Setup

Run this SQL query to ensure everything is working:

```sql
\c retailmart

SELECT schema_name, COUNT(*) as table_count
FROM information_schema.tables
WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
GROUP BY schema_name;
```

**Expected Output:** You should see 8 schemas listed.

---

<div align="center">

**[🏠 Return to Main Menu](../../../README.md)**

</div>
