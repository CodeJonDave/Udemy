-- 1. greater than use for where
-- select * from public.sales_order
-- where gross_sales_amount > 1000;

-- select * 
-- from public.sales_order
-- where gross_sales_amount > 1000 and gross_sales_amount < 2000;

-- 2. between use case 
-- select * from public.sales_order
-- where gross_sales_amount between 1000 and 2000;

-- 3. use case with multiple conditions
-- SELECT *
-- from public.sales_order
-- where (gross_sales_amount > 1000 and gross_sales_amount < 2000)
-- or quantity < 10;

-- SELECT * 
-- from public.sales_order
-- where (gross_sales_amount > 1000 and gross_sales_amount < 2000)
-- and quantity < 10;

-- 5. to filter through text fields
-- not equals use either <> or !=
-- select * 
-- from public.sales_order 
-- where platform <> 'Desktop';

-- 6. filter based on null values
-- select * 
-- from public.sales_order 
-- where customer_id is not null;

-- 7. use case with wildcards
-- use % before to look for match at end of text
-- use % after to look for match at beggining of text

-- select * 
-- from public.sales_order
-- where order_num like 'CA%';

-- use _ to define a single character

-- select * 
-- from public.sales_order
-- where order_num like '__________4_2%';

-- 8. use case in keyword
-- in defines a list of parameters for value matching
-- use not to filter out matching values

-- select * 
-- from public.sales_order
-- where quantity not in (1,4,6,11,66)
-- and gross_sales_amount > 1000
-- and order_num like 'CA%';

-- 9. where using and conditional with the or conditional, use parentheses
-- example:
-- 	where (con1 and con2 and con3)
-- 	or((con5 and con2)or(con1 and con4));