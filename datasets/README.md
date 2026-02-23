# 🧪 RetailMart V2 — The Future of Data (Batch 24+)

<div align="center">

![Version](https://img.shields.io/badge/Version-V2.0-blueviolet?style=for-the-badge)
![Mode](https://img.shields.io/badge/Mode-Production%20Sim-red?style=for-the-badge)
![Status](https://img.shields.io/badge/Data-Dirty%20%26%20Real-orange?style=for-the-badge)

**For Batch 24 and Beyond**
_Real-world chaos. Authentic scale. Next-gen skills._

</div>

---

## 🚦 Status Check

| If you are in...     | Then...                                                                                 |
| :------------------- | :-------------------------------------------------------------------------------------- |
| **Batch 21, 22, 23** | 🛑 **STOP.** This is not for you. Go to [`legacy/`](../legacy/batch_21_22_23/datasets/) |
| **Batch 24+**        | 🟢 **PROCEED.** This is your new reality.                                               |

---

## 🆕 Why V2?

The world of data isn't clean. V2 is designed to teach you the **#1 skill hiring managers look for**: handling messy, broken, realistic data.

### 🎭 The "Dirty Data" Engine

We don't just give you tables; we give you problems to solve.

- **Typo Injection**: `Mubmai` instead of `Mumbai`.
- **Null Values**: Missing phone numbers, unrecorded dates.
- **Duplicates**: The same customer appearing twice with different IDs.
- **Orphan Records**: Orders without customers (Integrity issues).

### 🇮🇳 Hyper-Local Context

- **Names**: `Priya Sharma`, `Arjun Patel` (not `John Doe`).
- **Logistics**: Shipping from `Bhiwandi` warehouses to `Indiranagar`.
- **Brands**: `Tata`, `Reliance`, `Amul` contexts.
- **Emails**: 200+ real domains (`gmail.com`, `yahoo.co.in`, `tcs.com`, etc.)

---

## 🗂️ The V2 Folders (Dual-Mode)

We provide TWO versions of the data. Your job is to bridge the gap.

```
datasets/
├── csv_raw/          ← 🗑️ Dirty data (for student practice)
├── csv_cleaned/      ← ✨ Clean data (instructor solution)
└── sql/
    ├── setup_accio_retailmart_raw.sql    ← One-click raw DB setup
    └── setup_accio_retailmart_clean.sql  ← One-click clean DB setup
```

### 1. 🗑️ `csv_raw/` (The "Before" State)

This is what real life looks like.

- Contains raw CSVs fresh from the "source".
- Full of errors, inconsistencies, and duplicates.
- **Task**: Use SQL to inspect and profile this data.

### 2. ✨ `csv_cleaned/` (The "After" State)

This is your destination.

- The "Golden Record" version.
- Normalized, deduplicated, and pristine.
- **Task**: Write the transformation scripts to get here.

### 3. 📜 `sql/` (One-Click Setup Scripts)

Deploy databases instantly:

```bash
# Deploy the dirty database (students connect here)
psql -U postgres -f datasets/sql/setup_accio_retailmart_raw.sql

# Deploy the clean database (solution reference)
psql -U postgres -f datasets/sql/setup_accio_retailmart_clean.sql
```

Database names: `accio_retailmart_raw` / `accio_retailmart_clean`. You can rename them manually after loading for batch-specific naming.

---

## 🧩 Expanded Schema Universe (16 Schemas)

V2 extends the original schemas with critical business units:

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

## ⚙️ How It's Built

Generated using the custom **Python Generator** (`docs/dataset_generator/`).

### Dual Mode (Default) — Generates both Raw + Clean in one shot:

```bash
cd docs/
python3 -m dataset_generator.main --scale 1.0 --dirty 0.10
```

### Single Mode — Generate only one dataset:

```bash
cd docs/
python3 -m dataset_generator.main --output-dir ../datasets/csv_raw --scale 1.0 --dirty 0.10
```

### CLI Options

| Flag           | Default | Description                                           |
| :------------- | :------ | :---------------------------------------------------- |
| `--scale`      | `1.0`   | Multiplier for row counts (0.1 = small, 2.0 = double) |
| `--dirty`      | `0.10`  | % of data corrupted in Raw (0.0–1.0)                  |
| `--output-dir` | _None_  | If set, single-mode output to this directory          |
| `--seed`       | `42`    | Random seed for reproducibility                       |

### Scale Reference

| Scale | Customers | Orders  | Order Items |
| :---- | :-------- | :------ | :---------- |
| 0.1   | 5,000     | 15,000  | ~37,500     |
| 1.0   | 50,000    | 150,000 | ~375,000    |
| 2.0   | 100,000   | 300,000 | ~750,000    |

---

<div align="center">

**[🏠 Return to Main Menu](../README.md)**

</div>
