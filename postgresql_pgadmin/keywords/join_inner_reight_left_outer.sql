-- Joins
/*
1. Create a sample table of customer id's from
using sales order table. Includes and indicator
*/

/*
create table public.customer_id_10_sample as 
select customer_id, 1 as top_10_ind
from public.sales_order
group by customer_id
limit 10;
*/

-- 2. Verify the table

-- select * from public.customer_id_10_sample;

-- 3. Creat a sample table of salesd orders

/*
create table public.sales_order_snapshot as 
select * from public.sales_order
limit 1000;
*/

-- INNER JOIN (JOIN)

-- 4. Check the number of records in the sales_orders for each customer

/*
select * 
from public.customer_id_10_sample as a 
join
public.sales_order_snapshot as b
on a.customer_id = b.customer_id;
*/

/*
select a.*, b.platform, b.order_placed_dt, order_num
from public.customer_id_10_sample as a 
join
public.sales_order_snapshot as b
on a.customer_id = b.customer_id;
*/

-- 5 . Create an order number sample table

/*
create table public.order_num_10_sample as
select order_num as order_num_alias, 
'This is a filtered order' as order_ind_text
from public.sales_order_snapshot a
join public.customer_id_10_sample b
on a.customer_id = b.customer_id
group by order_num
limit 10;
*/

-- 6. Select 5 customers whose gross sales amount are greater than 100 with the phone platform 

/*
select a.customer_id, b.platform, sum(gross_sales_amount) as gross_sales_amount
from public.customer_id_10_sample a
join public.sales_order_snapshot as b
on a.customer_id = b.customer_id
join
public.order_num_10_sample c
on b.order_num = c.order_num_alias
where b.platform ='Phone' 
group by a.customer_id, b.platform
having sum(gross_sales_amount) > 100
limit 5;
*/

-- LEFT JOIN

-- 7. use a left join to join the sales order table and 
-- the customer id sample table. this will give us all sales 
-- order records and where the id sample table does not join 
-- the record will hold null values for those fields

/*
select * from public.sales_order_snapshot a
left join 
public.customer_id_10_sample b
on a.customer_id = b.customer_id
order by a.customer_id;
*/

-- RIGHT JOIN

-- 8. Use a right join to join the sales order sample table
-- and the customer id sample table. this will give us all sales
-- orders for the customer ids but will also show all the customer
-- ids even if they do not have a sales order

/*
select *
from public.sales_order_snapshot a
right join
public.customer_id_10_sample b
on a.customer_id = b.customer_id
order by a.customer_id;
*/

-- FULL OUTER JOIN
-- will give you all records from both tables
-- will provide null vales for eaither table where 
-- matching records do not exist

/*
select * 
from public.sales_order_snapshot a
full outer join 
public.customer_id_10_sample b 
on a.customer_id = b.customer_id;
*/