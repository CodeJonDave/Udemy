-- Subqueries 

-- 1. get all the order numbers and gross sales amounts where the amount 
-- is greater than the average

-- select order_num, gross_sales_amount
-- from public.sales_order
-- where gross_sales_amount > (select avg(gross_sales_amount) from public.sales_order);

-- 2. Operators that are used with sub-queries

-- EXISTS
-- ANY
-- ALL

-- 3. EXISTS Get the customer_id's associated with the CRM campaign

-- SELECT a.customer_id
-- FROM public.sales_order a
-- WHERE EXISTS(
-- SELECT 1 FROM public.visit_detail b
-- WHERE a.customer_id = b.customer_id
-- AND b.campaign_id = 'CRM'
-- )
-- GROUP BY a.customer_id;

-- 4. ANY Get the age of the customers older than the average age

-- SELECT d.customer_id, d.age, d.state
-- FROM public.demographics d
-- WHERE age > ANY (SELECT AVG(age) FROM public.demographics WHERE d.region = 'South' GROUP BY d.state);