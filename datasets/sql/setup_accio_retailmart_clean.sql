-- ✨ ACCIO RETAILMART CLEAN (SOLUTION) SETUP SCRIPT
-- Run this from the repository root: psql -U postgres -f datasets/sql/setup_accio_retailmart_clean.sql

\set ON_ERROR_STOP on
\echo 'Creating accio_retailmart_clean DB...'
DO $$
BEGIN
  PERFORM pg_terminate_backend(pid)
  FROM pg_stat_activity
  WHERE datname = 'accio_retailmart_clean'
    AND pid <> pg_backend_pid();
EXCEPTION WHEN OTHERS THEN
  NULL; -- Ignore errors if DB doesn't exist or permissions fail
END
$$;
DROP DATABASE IF EXISTS accio_retailmart_clean;
CREATE DATABASE accio_retailmart_clean;
\connect accio_retailmart_clean;
\echo 'Connected to accio_retailmart_clean'



CREATE SCHEMA IF NOT EXISTS core;

CREATE TABLE IF NOT EXISTS core.dim_date (
  date_key TEXT PRIMARY KEY,
  day TEXT, month TEXT, year TEXT, quarter TEXT,
  day_name TEXT, month_name TEXT
);

CREATE TABLE IF NOT EXISTS core.dim_region (
  region_id TEXT PRIMARY KEY,
  region_name TEXT,
  country TEXT,
  state TEXT
);

CREATE TABLE IF NOT EXISTS core.dim_category (
  category_id TEXT PRIMARY KEY,
  category_name TEXT
);

CREATE TABLE IF NOT EXISTS core.dim_brand (
  brand_id TEXT PRIMARY KEY,
  brand_name TEXT,
  category_id TEXT REFERENCES core.dim_category(category_id)
);

CREATE TABLE IF NOT EXISTS core.dim_department (
  dept_id TEXT PRIMARY KEY,
  dept_name TEXT
);

CREATE TABLE IF NOT EXISTS core.dim_expense_category (
  exp_cat_id TEXT PRIMARY KEY,
  category_name TEXT
);


CREATE SCHEMA IF NOT EXISTS customers;

CREATE TABLE IF NOT EXISTS customers.customers (
  customer_id TEXT PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone TEXT,
  registration_date TEXT
);

CREATE TABLE IF NOT EXISTS customers.addresses (
  address_id TEXT PRIMARY KEY,
  customer_id TEXT REFERENCES customers.customers(customer_id),
  address_line text,
  city TEXT,
  state TEXT,
  pincode TEXT,
  is_default TEXT
);

CREATE TABLE IF NOT EXISTS customers.reviews (
  review_id TEXT PRIMARY KEY,
  customer_id TEXT REFERENCES customers.customers(customer_id),
  product_id TEXT,
  rating TEXT,
  review_text text,
  review_date TEXT
);

CREATE TABLE IF NOT EXISTS customers.loyalty_points (
  loyalty_id TEXT PRIMARY KEY,
  customer_id TEXT REFERENCES customers.customers(customer_id),
  points_earned TEXT,
  source TEXT,
  date_earned TEXT
);


CREATE SCHEMA IF NOT EXISTS stores;

CREATE TABLE IF NOT EXISTS stores.stores (
  store_id TEXT PRIMARY KEY,
  store_name TEXT,
  region_id TEXT REFERENCES core.dim_region(region_id),
  city TEXT,
  square_ft TEXT,
  opening_date TEXT
);

CREATE TABLE IF NOT EXISTS stores.employees (
  employee_id TEXT PRIMARY KEY,
  store_id TEXT REFERENCES stores.stores(store_id),
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  role TEXT,
  dept_id TEXT REFERENCES core.dim_department(dept_id),
  joining_date TEXT,
  salary TEXT
);

CREATE TABLE IF NOT EXISTS stores.expenses (
  store_expense_id TEXT PRIMARY KEY,
  store_id TEXT REFERENCES stores.stores(store_id),
  expense_type TEXT,
  amount TEXT,
  expense_date TEXT
);


CREATE SCHEMA IF NOT EXISTS products;

CREATE TABLE IF NOT EXISTS products.suppliers (
  supplier_id TEXT PRIMARY KEY,
  supplier_name TEXT,
  contact_name TEXT,
  city TEXT,
  email TEXT
);

CREATE TABLE IF NOT EXISTS products.products (
  product_id TEXT PRIMARY KEY,
  product_name TEXT,
  brand_id TEXT REFERENCES core.dim_brand(brand_id),
  supplier_id TEXT REFERENCES products.suppliers(supplier_id),
  price TEXT,
  cost_price TEXT
);

CREATE TABLE IF NOT EXISTS products.inventory (
  store_id TEXT REFERENCES stores.stores(store_id),
  product_id TEXT REFERENCES products.products(product_id),
  quantity_on_hand TEXT,
  reorder_level TEXT,
  PRIMARY KEY (store_id, product_id)
);

CREATE TABLE IF NOT EXISTS products.promotions (
  promo_id TEXT PRIMARY KEY,
  promo_name TEXT,
  discount_percent TEXT,
  start_date TEXT,
  end_date TEXT,
  active TEXT
);


CREATE SCHEMA IF NOT EXISTS sales;

CREATE TABLE IF NOT EXISTS sales.orders (
  order_id TEXT PRIMARY KEY,
  cust_id TEXT REFERENCES customers.customers(customer_id),
  store_id TEXT REFERENCES stores.stores(store_id),
  order_date TEXT,
  order_status TEXT,
  gross_total TEXT,
  discount_amount TEXT,
  net_total TEXT
);

CREATE TABLE IF NOT EXISTS sales.order_items (
  order_item_id TEXT PRIMARY KEY,
  order_id TEXT REFERENCES sales.orders(order_id),
  prod_id TEXT REFERENCES products.products(product_id),
  quantity TEXT,
  unit_price TEXT,
  gross_amount TEXT,
  discount_amount TEXT,
  net_amount TEXT
);

CREATE TABLE IF NOT EXISTS sales.payments (
  payment_id TEXT PRIMARY KEY,
  order_id TEXT REFERENCES sales.orders(order_id),
  payment_date TEXT,
  payment_mode TEXT,
  amount TEXT
);

CREATE TABLE IF NOT EXISTS sales.shipments (
  shipment_id TEXT PRIMARY KEY,
  order_id TEXT REFERENCES sales.orders(order_id),
  courier_name TEXT,
  shipped_date TEXT,
  delivered_date TEXT,
  status TEXT
);

CREATE TABLE IF NOT EXISTS sales.returns (
  return_id TEXT PRIMARY KEY,
  order_id TEXT REFERENCES sales.orders(order_id),
  prod_id TEXT REFERENCES products.products(product_id),
  return_date TEXT,
  reason text,
  refund_amount TEXT
);


CREATE SCHEMA IF NOT EXISTS finance;

CREATE TABLE IF NOT EXISTS finance.expenses (
  expense_id TEXT PRIMARY KEY,
  expense_date TEXT,
  exp_cat_id TEXT REFERENCES core.dim_expense_category(exp_cat_id),
  amount TEXT,
  description text
);

CREATE TABLE IF NOT EXISTS finance.revenue_summary (
  summary_id TEXT PRIMARY KEY,
  summary_date TEXT,
  total_revenue TEXT,
  total_orders TEXT,
  avg_order_value TEXT
);


CREATE SCHEMA IF NOT EXISTS hr;

CREATE TABLE IF NOT EXISTS hr.attendance (
  attendance_id TEXT PRIMARY KEY,
  employee_id TEXT REFERENCES stores.employees(employee_id),
  check_in TEXT,
  check_out TEXT,
  status TEXT
);

CREATE TABLE IF NOT EXISTS hr.salary_history (
  payment_id TEXT PRIMARY KEY,
  employee_id TEXT REFERENCES stores.employees(employee_id),
  amount TEXT,
  payment_date TEXT,
  status TEXT
);


CREATE SCHEMA IF NOT EXISTS marketing;

CREATE TABLE IF NOT EXISTS marketing.campaigns (
  campaign_id TEXT PRIMARY KEY,
  campaign_name TEXT,
  start_date TEXT,
  end_date TEXT,
  budget TEXT
);

CREATE TABLE IF NOT EXISTS marketing.ads_spend (
  spend_id TEXT PRIMARY KEY,
  campaign_id TEXT REFERENCES marketing.campaigns(campaign_id),
  spend_date TEXT,
  amount TEXT,
  platform TEXT
);

CREATE TABLE IF NOT EXISTS marketing.email_clicks (
  email_id TEXT PRIMARY KEY,
  campaign_id TEXT REFERENCES marketing.campaigns(campaign_id),
  sent_date TEXT,
  emails_sent TEXT,
  emails_opened TEXT,
  emails_clicked TEXT
);


CREATE SCHEMA IF NOT EXISTS support;

CREATE TABLE IF NOT EXISTS support.tickets (
  ticket_id TEXT PRIMARY KEY,
  customer_id TEXT REFERENCES customers.customers(customer_id),
  agent_id TEXT REFERENCES stores.employees(employee_id),
  category TEXT,
  priority TEXT,
  status TEXT,
  created_date TEXT,
  resolved_date TEXT,
  subject text
);


CREATE SCHEMA IF NOT EXISTS web_events;

CREATE TABLE IF NOT EXISTS web_events.page_views (
  view_id TEXT PRIMARY KEY,
  session_id TEXT,
  customer_id TEXT REFERENCES customers.customers(customer_id),
  page_url TEXT,
  view_timestamp TEXT,
  device_type TEXT,
  os TEXT
);

CREATE TABLE IF NOT EXISTS web_events.events (
  event_id TEXT PRIMARY KEY,
  view_id TEXT REFERENCES web_events.page_views(view_id),
  event_type TEXT,
  element_id TEXT,
  event_timestamp TEXT
);


CREATE SCHEMA IF NOT EXISTS supply_chain;

CREATE TABLE IF NOT EXISTS supply_chain.warehouses (
  warehouse_id TEXT PRIMARY KEY,
  name TEXT,
  location_city TEXT,
  region TEXT,
  capacity_sqft TEXT,
  manager_name TEXT
);

CREATE TABLE IF NOT EXISTS supply_chain.shipments (
  shipment_id TEXT PRIMARY KEY,
  supplier_id TEXT REFERENCES products.suppliers(supplier_id),
  warehouse_id TEXT REFERENCES supply_chain.warehouses(warehouse_id),
  product_id TEXT REFERENCES products.products(product_id),
  quantity TEXT,
  shipped_date TEXT,
  arrival_date TEXT,
  status TEXT
);

CREATE TABLE IF NOT EXISTS supply_chain.inventory_snapshots (
  warehouse_id TEXT REFERENCES supply_chain.warehouses(warehouse_id),
  product_id TEXT REFERENCES products.products(product_id),
  snapshot_date TEXT,
  quantity_on_hand TEXT,
  PRIMARY KEY (warehouse_id, product_id, snapshot_date)
);


CREATE SCHEMA IF NOT EXISTS loyalty;

CREATE TABLE IF NOT EXISTS loyalty.tiers (
  tier_id TEXT PRIMARY KEY,
  tier_name TEXT,
  min_points TEXT,
  max_points TEXT,
  benefits text
);

CREATE TABLE IF NOT EXISTS loyalty.members (
  customer_id TEXT PRIMARY KEY REFERENCES customers.customers(customer_id),
  tier_id TEXT REFERENCES loyalty.tiers(tier_id),
  points_balance TEXT,
  join_date TEXT
);

CREATE TABLE IF NOT EXISTS loyalty.redemptions (
  redemption_id TEXT PRIMARY KEY,
  customer_id TEXT REFERENCES customers.customers(customer_id),
  reward_name TEXT,
  points_redeemed TEXT,
  redemption_date TEXT
);


CREATE SCHEMA IF NOT EXISTS manufacture;

CREATE TABLE IF NOT EXISTS manufacture.production_lines (
  line_id TEXT PRIMARY KEY,
  line_name TEXT,
  capacity_per_hour TEXT,
  supervisor_name TEXT
);

CREATE TABLE IF NOT EXISTS manufacture.work_orders (
  work_order_id TEXT PRIMARY KEY,
  product_id TEXT REFERENCES products.products(product_id),
  line_id TEXT REFERENCES manufacture.production_lines(line_id),
  start_timestamp TEXT,
  end_timestamp TEXT,
  quantity_produced TEXT,
  rejected_quantity TEXT,
  status TEXT
);


CREATE SCHEMA IF NOT EXISTS payroll;

CREATE TABLE IF NOT EXISTS payroll.tax_brackets (
  min_salary TEXT,
  max_salary TEXT,
  tax_rate TEXT
);

CREATE TABLE IF NOT EXISTS payroll.pay_slips (
  pay_slip_id TEXT PRIMARY KEY,
  employee_id TEXT REFERENCES stores.employees(employee_id),
  salary_month TEXT,
  salary_year TEXT,
  basic_salary TEXT,
  hra TEXT,
  other_allowances TEXT,
  pf TEXT,
  professional_tax TEXT,
  income_tax TEXT,
  gross_salary TEXT,
  net_salary TEXT,
  payment_date TEXT
);


CREATE SCHEMA IF NOT EXISTS call_center;

CREATE TABLE IF NOT EXISTS call_center.calls (
  call_id TEXT PRIMARY KEY,
  customer_id TEXT REFERENCES customers.customers(customer_id),
  agent_id TEXT REFERENCES stores.employees(employee_id),
  call_start_time TEXT,
  call_duration_seconds TEXT,
  call_reason TEXT,
  status TEXT
);

CREATE TABLE IF NOT EXISTS call_center.transcripts (
  transcript_id TEXT PRIMARY KEY,
  call_id TEXT REFERENCES call_center.calls(call_id),
  transcript_text text,
  sentiment_score TEXT
);


CREATE SCHEMA IF NOT EXISTS audit;

CREATE TABLE IF NOT EXISTS audit.application_logs (
  log_id TEXT PRIMARY KEY, TEXT TEXT,
  service_name TEXT,
  level TEXT,
  message text,
  trace_id TEXT
);

CREATE TABLE IF NOT EXISTS audit.api_requests (
  request_id text, TEXT TEXT,
  endpoint TEXT,
  method TEXT,
  status_code TEXT,
  response_time_ms TEXT,
  user_agent text
);

CREATE TABLE IF NOT EXISTS audit.record_changes (
  change_id TEXT PRIMARY KEY,
  table_name TEXT,
  record_id TEXT,
  column_name TEXT,
  old_value text,
  new_value text,
  changed_by TEXT REFERENCES stores.employees(employee_id),
  changed_at TEXT,
  action TEXT
);


\echo 'Loading data from datasets/csv_cleaned...'
\copy core.dim_date FROM 'datasets/csv_cleaned/core/dim_date.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy core.dim_region FROM 'datasets/csv_cleaned/core/dim_region.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy core.dim_category FROM 'datasets/csv_cleaned/core/dim_category.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy core.dim_brand FROM 'datasets/csv_cleaned/core/dim_brand.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy core.dim_department FROM 'datasets/csv_cleaned/core/dim_department.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy core.dim_expense_category FROM 'datasets/csv_cleaned/core/dim_expense_category.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy customers.customers FROM 'datasets/csv_cleaned/customers/customers.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy customers.addresses FROM 'datasets/csv_cleaned/customers/addresses.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy customers.reviews FROM 'datasets/csv_cleaned/customers/reviews.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy customers.loyalty_points FROM 'datasets/csv_cleaned/customers/loyalty_points.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy stores.stores FROM 'datasets/csv_cleaned/stores/stores.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy stores.employees FROM 'datasets/csv_cleaned/stores/employees.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy stores.expenses FROM 'datasets/csv_cleaned/stores/expenses.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy products.suppliers FROM 'datasets/csv_cleaned/products/suppliers.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy products.products FROM 'datasets/csv_cleaned/products/products.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy products.inventory FROM 'datasets/csv_cleaned/products/inventory.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy products.promotions FROM 'datasets/csv_cleaned/products/promotions.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy sales.orders FROM 'datasets/csv_cleaned/sales/orders.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy sales.order_items FROM 'datasets/csv_cleaned/sales/order_items.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy sales.payments FROM 'datasets/csv_cleaned/sales/payments.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy sales.shipments FROM 'datasets/csv_cleaned/sales/shipments.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy sales.returns FROM 'datasets/csv_cleaned/sales/returns.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy finance.expenses FROM 'datasets/csv_cleaned/finance/expenses.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy finance.revenue_summary FROM 'datasets/csv_cleaned/finance/revenue_summary.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy hr.attendance FROM 'datasets/csv_cleaned/hr/attendance.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy hr.salary_history FROM 'datasets/csv_cleaned/hr/salary_history.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy marketing.campaigns FROM 'datasets/csv_cleaned/marketing/campaigns.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy marketing.ads_spend FROM 'datasets/csv_cleaned/marketing/ads_spend.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy marketing.email_clicks FROM 'datasets/csv_cleaned/marketing/email_clicks.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy support.tickets FROM 'datasets/csv_cleaned/support/tickets.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy web_events.page_views FROM 'datasets/csv_cleaned/web_events/page_views.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy web_events.events FROM 'datasets/csv_cleaned/web_events/events.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy supply_chain.warehouses FROM 'datasets/csv_cleaned/supply_chain/warehouses.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy supply_chain.shipments FROM 'datasets/csv_cleaned/supply_chain/shipments.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy supply_chain.inventory_snapshots FROM 'datasets/csv_cleaned/supply_chain/inventory_snapshots.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy loyalty.tiers FROM 'datasets/csv_cleaned/loyalty/tiers.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy loyalty.members FROM 'datasets/csv_cleaned/loyalty/members.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy loyalty.redemptions FROM 'datasets/csv_cleaned/loyalty/redemptions.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy manufacture.production_lines FROM 'datasets/csv_cleaned/manufacture/production_lines.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy manufacture.work_orders FROM 'datasets/csv_cleaned/manufacture/work_orders.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy payroll.tax_brackets FROM 'datasets/csv_cleaned/payroll/tax_brackets.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy payroll.pay_slips FROM 'datasets/csv_cleaned/payroll/pay_slips.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy call_center.calls FROM 'datasets/csv_cleaned/call_center/calls.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy call_center.transcripts FROM 'datasets/csv_cleaned/call_center/transcripts.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy audit.application_logs FROM 'datasets/csv_cleaned/audit/application_logs.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy audit.api_requests FROM 'datasets/csv_cleaned/audit/api_requests.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
\copy audit.record_changes FROM 'datasets/csv_cleaned/audit/record_changes.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');

\echo '✅ Setup Complete! Connected to accio_retailmart_clean'
\dt *.*