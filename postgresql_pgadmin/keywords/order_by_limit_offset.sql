-- order by and limit clauses

-- 1. order by comes after the where clause
-- default is ascending declare descending when needed
-- select * 
-- from public.sales_order
-- where (gross_sales_amount between 1000 and 2000)
-- and quantity < 10
-- order by gross_sales_amount DESC;

-- 2. multiple order bys seperate with commas
-- will order by column order
-- each will column will default to asc unless declared otherwise
-- select * 
-- from public.sales_order
-- where (gross_sales_amount between 1000 and 2000)
-- and quantity < 10
-- order by platform DESC, gross_sales_amount DESC;

-- 3. limit will give the specified number of entries
-- select * 
-- from public.sales_order
-- where (gross_sales_amount between 1000 and 2000)
-- and quantity < 10
-- order by platform DESC, gross_sales_amount DESC
-- limit 10;

-- 4. use offset to skipp the specified number of entries
-- select * 
-- from public.sales_order
-- where (gross_sales_amount between 1000 and 2000)
-- and quantity < 10
-- order by platform DESC, gross_sales_amount DESC
-- limit 10 offset 13;


