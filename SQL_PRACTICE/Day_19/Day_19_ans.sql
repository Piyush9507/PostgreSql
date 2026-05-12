-- ANSWER 1
CREATE INDEX IF NOT EXISTS idx_order_items
ON sales.order_items(order_id)

EXPLAIN ANALYZE
SELECT * FROM sales.order_items WHERE order_id = 1000

DROP INDEX sales.idx_order_items

	-- BEFORE Execution Time: 36.380 ms
	-- AFTER Execution Time: 0.046 ms

-- ANSWER 2
CREATE INDEX idx_stores_employees
ON stores.employees(store_id, salary DESC)

DROP INDEX stores.idx_stores_employees

-- Execution Time: 2.089 ms
EXPLAIN ANALYZE
select * from stores.employees WHERE store_id = 10 ORDER BY salary DESC
-- Execution Time: 0.180 ms

-- ANSWER 3
SELECT indexname, indexdef FROM pg_indexes WHERE schemaname = 'sales'
-- Primary key creates a B-Tree Index By default

-- ANSWER 4
CREATE INDEX IF NOT EXISTS idx_products
ON products.products USING GIN (to_tsvector('english', product_name))

DROP INDEX IF EXISTS products.idx_products

select * from products.products
WHERE to_tsvector('english', product_name) @@ (to_tsquery('english','Pro:*'))

-- ANSWER 5
CREATE INDEX IF NOT EXISTS idx_camp
ON marketing.campaigns USING GIN (to_tsvector('english', campaign_name))

DROP INDEX IF EXISTS marketing.idx_camp

select * from marketing.campaigns
WHERE to_tsvector('english', campaign_name) @@ to_tsquery('english', 'solution')

-- ANSWER 6
-- Run SELECT * FROM pg_stat_user_indexes WHERE idx_scan = 0; to find unused indexes in the database.
SELECT * FROM pg_stat_user_indexes WHERE idx_scan = 0;