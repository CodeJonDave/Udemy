-- UNION, UNION ALL, INTERSECT, EXCEPT commands

-- 1. Create 4 snapshots from sales_order table

/*
create table if not exists public.sales_order_snap1 as 
select customer_id, sum(gross_sales_amount) gross_sales_amount
from public.sales_order
group by customer_id
having sum(gross_sales_amount) < 1000
limit 100;
*/

/*
create table if not exists public.sales_order_snap2 as 
select customer_id, sum(gross_sales_amount) gross_sales_amount
from public.sales_order
group by customer_id
having sum(gross_sales_amount) < 100
limit 100;
*/

/*
create table if not exists public.sales_order_snap3 as 
select customer_id, sum(gross_sales_amount) gross_sales_amount
from public.sales_order
group by customer_id
having sum(gross_sales_amount) > 5000
limit 100;
*/

/*
create table if not exists public.sales_order_snap4 as 
select customer_id, order_num, sum(gross_sales_amount) gross_sales_amount
from public.sales_order
group by customer_id,order_num
having sum(gross_sales_amount) > 5000
limit 100;
*/

-- UNION ALL

-- 2. Get the row counts from each table

/*
select 'snap1' as table_name, count(1) as row_count from public.sales_order_snap1
union all
select 'snap2' as table_name, count(1) as row_count from public.sales_order_snap2
union all
select 'snap3' as table_name, count(1) as row_count from public.sales_order_snap3
union all
select 'snap4' as table_name, count(1) as row_count from public.sales_order_snap4;
*/

-- UNION 

-- 3. Union for snap1 and snap2 ommits duplicates from the results

/*
select * from public.sales_order_snap1
union
select * from public.sales_order_snap2;
*/

-- INTERSECT

-- 4. find the common valuse between 2 tables

/*
select customer_id, gross_sales_amount from public.sales_order_snap1
intersect
select customer_id, gross_sales_amount from public.sales_order_snap2;
*/

-- EXCEPT

-- 5. get all the records of the first table omitting the
-- common records between the first table and the second table

/*
select customer_id, gross_sales_amount from public.sales_order_snap1
except
select customer_id, gross_sales_amount from public.sales_order_snap2;
*/