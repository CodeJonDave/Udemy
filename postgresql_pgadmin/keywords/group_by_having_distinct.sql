-- group by and having for aggregating data


-- 1. using group by for aggregate functions
-- select platform, sum(gross_sales_amount) as gross_sales_amount
-- from public.sales_order
-- group by platform;

-- 2. having used to determine condition for filtering
-- select platform, sum(gross_sales_amount) as gross_sales_amount
-- from public.sales_order
-- group by platform
-- having sum(gross_sales_amount) < 1000000;

-- 3. grouping by year
-- select platform, date_part('year',order_placed_dt) as order_year,
-- sum(gross_sales_amount) as gross_sales_amount
-- from public.sales_order
-- group by platform, date_part('year',order_placed_dt)
-- having sum(gross_sales_amount) <100000;

-- 4. use of distinct with aggregate functions
-- select count(distinct customer_id) 
-- from public.sales_order;