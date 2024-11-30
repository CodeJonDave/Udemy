-- Assignment submission
-- Save or submit your work
-- Assignment submitted

-- Questions:
-- What is the correct sequence in which you write a query using the below keywords?
-- WHERE, LIMIT, SELECT, ORDER BY, FROM, DESC

-- SELECT
-- FROM
-- WHERE
-- ORDER BY
-- DESC
-- LIMIT

-- Identify the categorical and numeric variables in the sales_order table.

-- categorical:
-- platform
-- order_placed_dt
-- order_num
-- cutomer_id

-- numeric:
-- quantity
-- gross_sales_amount
-- discount
-- tax_amount
-- return_ind


-- Get the top 10 highest gross selling orders for Desktop which got returned from the sales_order table

-- select *
-- from public.sales_order
-- where platform = 'Desktop'
-- and return_ind = 1
-- order by gross_sales_amount desc
-- limit 10;



-- Get the all those orders of 2017 where the tax amounts to more than 50% of the gross sales from the sales_order table.

-- select*
-- from public.sales_order
-- where order_placed_dt > '2017-01-01'
-- and order_placed_dt < '2018-01-01'
-- and tax_amount > (gross_sales_amount / 2);


-- List down all the order_num and quantity where the order_num ends with an even digit from the sales_order table.

-- select order_num, quantity
-- from public.sales_order
-- where order_number LIKE '%0'
--    or order_number LIKE '%2'
--    or order_number LIKE '%4'
--    or order_number LIKE '%6'
--    or order_number LIKE '%8';

-- regex
-- select order_num, quantity
-- from public.sales_order
-- where order_num ~'[02468]$';

