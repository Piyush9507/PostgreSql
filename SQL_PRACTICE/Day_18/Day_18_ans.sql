-- ANSWER 1
EXPLAIN ANALYZE
select * from customers.customers where email like '%gmail%'

"Index Scan using customers_pkey on customers  (cost=0.29..8.31 rows=1 width=61) (actual time=1.141..1.144 rows=1.00 loops=1)"
"  Index Cond: (customer_id = 42)"
"  Index Searches: 1"
"  Buffers: shared hit=3"
"Planning Time: 6.786 ms"
"Execution Time: 3.186 ms"

EXPLAIN ANALYZE
select * from customers.customers where email like '%gmail%'

"Seq Scan on customers  (cost=0.00..1233.00 rows=8586 width=61) (actual time=0.292..40.300 rows=8369.00 loops=1)"
"  Filter: ((email)::text ~~ '%gmail%'::text)"
"  Rows Removed by Filter: 41631"
"  Buffers: shared hit=608"
"Planning Time: 3.315 ms"
"Execution Time: 42.576 ms"

-- ANSWER 2
EXPLAIN
ANALYZE
SELECT
	*
FROM
	SALES.ORDERS
	JOIN SALES.ORDER_ITEMS USING (ORDER_ID)
	-- HASH JOIN

-- ANSWER 3
-- Correlated Subquery
EXPLAIN (
	ANALYZE,
	BUFFERS
)
SELECT
	O.ORDER_ID,
	O.NET_TOTAL,
	(
		SELECT
			S.STORE_NAME
		FROM
			STORES.STORES S
		WHERE
			S.STORE_ID = O.STORE_ID
	) AS STORE_NAME
FROM
	SALES.ORDERS O
WHERE
	O.ORDER_DATE >= '2025-01-01';

-- Execution Time: 1787.348 ms



-- Equivalent CTE
EXPLAIN (
	ANALYZE,
	BUFFERS
)
WITH
	ORDER_DATA AS (
		SELECT
			ORDER_ID,
			NET_TOTAL,
			STORE_ID
		FROM
			SALES.ORDERS
		WHERE
			ORDER_DATE >= '2025-01-01'
	)
SELECT
	O.ORDER_ID,
	O.NET_TOTAL,
	S.STORE_NAME
FROM
	ORDER_DATA O
	JOIN STORES.STORES S ON O.STORE_ID = S.STORE_ID;

-- preparing tables are using hash join (no extra looping)
-- Execution Time: 35.798 ms

-- ANSWER 4
EXPLAIN (
	ANALYZE,
	BUFFERS
)
SELECT
	*
FROM
	SALES.ORDERS
WHERE
	ORDER_DATE > '2025-01-01'
 -- Buffers: shared hit=1488
 -- NO SHARE READ AVAILABLE

--  ANSWER 5
EXPLAIN (ANALYZE, BUFFERS)
select * from sales.orders
-- "Planning Time: 0.265 ms"
-- "Execution Time: 15.781 ms"

EXPLAIN (ANALYZE, BUFFERS)
select order_id from sales.orders
-- "Planning Time: 0.158 ms"
-- "Execution Time: 23.984 ms"

-- ANSWER 6
EXPLAIN (ANALYZE,BUFFERS)
SELECT * FROM STORES.EMPLOYEES
WHERE LOWER(FIRST_NAME) = 'karan'
	-- "Planning Time: 8.759 ms"
	-- "Execution Time: 4.462 ms"

EXPLAIN (ANALYZE, BUFFERS)
select * from stores.employees
where first_name = 'Karan'
-- "Planning Time: 0.428 ms"
-- "Execution Time: 0.503 ms"

-- ANSWER 7
EXPLAIN (ANALYZE, BUFFERS)
select * from customers.customers
where customer_id NOT IN(
	select cust_id from sales.orders
)
-- "Planning Time: 0.992 ms"
-- "Execution Time: 117.521 ms"

EXPLAIN (ANALYZE, BUFFERS)
SELECT * 
FROM customers.customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM sales.orders o 
    WHERE o.cust_id = c.customer_id
);
-- "Planning Time: 5.708 ms"
-- "Execution Time: 88.845 ms"

-- ANSWER 8
EXPLAIN (ANALYZE, BUFFERS)
select * from sales.orders
where cust_id = 100 OR store_id = 5
-- "Planning Time: 0.590 ms"
-- "Execution Time: 7.218 ms"

EXPLAIN (ANALYZE, BUFFERS)
select * from sales.orders
where cust_id = 100
UNION ALL 
select * from sales.orders
where store_id = 5
-- "Planning Time: 0.268 ms"
-- "Execution Time: 0.774 ms"

-- ANSWER 9
EXPLAIN (ANALYZE, BUFFERS)
select * from sales.orders
WHERE DATE_TRUNC('month', order_date) = '2025-03-01'


EXPLAIN (ANALYZE, BUFFERS)
select * from sales.orders
WHERE order_date >= '2025-03-01' AND order_date < '2025-04-01'

-- ANSWER 10
WITH ranked as (
	select * from sales.orders
	WHERE order_date >= '2025-01-01' AND order_date < '2026-01-01'
	ORDER BY net_total DESC
	LIMIT 5
)

select r.*, s.store_name from ranked r
JOIN stores.stores s USING(store_id)

-- ANSWER 11
EXPLAIN (ANALYZE, BUFFERS)
select *,
(
	select store_name from stores.stores s 
	WHERE s.store_id = o.store_id
)
from sales.orders o
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
-- Execution Time: 1488.891 ms

EXPLAIN (ANALYZE, BUFFERS)
WITH filtered as (
	select *
	from sales.orders o
	WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
)
select * from filtered
JOIN stores.stores s USING(store_id)
-- Execution Time: 37.152 ms

-- ANSWER 12
EXPLAIN
ANALYZE
WITH
	CLEAN AS (
		SELECT
			DATE_TRUNC('day', ORDER_DATE) AS DATE,
			COUNT(*) AS TOTAL_ORDERS
		FROM
			SALES.ORDERS
		GROUP BY
			DATE_TRUNC('day', ORDER_DATE)
	)
SELECT
	*,
	ROUND(
		AVG(TOTAL_ORDERS) OVER (
			ROWS BETWEEN 6 PRECEDING
			AND CURRENT ROW
		),
		2
	) AS AVG_7_DAY
FROM
	CLEAN
-- step1: parallel sequal scan on table 
	-- worker A: 1-5
	-- worker B: 6 -10

-- step2: Partial Agg - generate aggregated values (DATE_TRUNC, total_orders)
	-- worker A: gen agg table1
	-- worker B: gen agg table2

-- step3: Gather - gathers all data (dup availble)
	-- worker A: 2025-01-02 - 6
	-- worker B: 2025-01-02 - 2

-- step4: Final Agg - elliminates dupes in step3 by agg
	-- Final: 2025-01-02 - 8

-- step 5: Window agg for moving avg_7_day respecting frame