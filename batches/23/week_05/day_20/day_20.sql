CREATE OR REPLACE PROCEDURE customers.award_monthly_bonus()
LANGUAGE plpgsql as $$
DECLARE 
    rec record;
v_count int :=0;
BEGIN
    --For in loop : iterate through customers with orders last 6 month
    FOR rec in (
        SELECT DISTINCT cust_id from sales.orders
        WHERE order_date >= date_trunc('month',current_date - interval '6 month')
        and order_date < date_trunc('month',current_date) and order_status = 'Delivered'
    )loop
    UPDATE customers.loyalty_points
    set 
        total_points = total_points + 100,
        last_updated = CURRENT_DATE
        where cust_id =rec.cust_id;
        v_count:= v_count + 1;
        end loop;
        raise notice 'Awared bonus to % Customers',v_count;
end;
$$;

Select DISTINCT order_date from sales.orders
order by order_date desc

 SELECT DISTINCT cust_id from sales.orders
        WHERE order_date >= date_trunc('month',current_date - interval '6 month')
        and order_date < date_trunc('month',current_date) and order_status = 'Delivered'

select * from customers.loyalty_points where last_updated = current_date;

call customers.award_monthly_bonus()