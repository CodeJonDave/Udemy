-- Use case - Careful while using WHERE with LEFT, RIGHT or FULL OUTER JOIN

-- Problem statement-
/*
Get the first purchase date in year 0214 for each customer and indetify what % of customers making
a second purchase in next 30 days from their first purchase order 
*/

-- 1. Create a table with customer_id and first_purchase_date

-- CREATE TABLE IF NOT EXISTS public.customers_2014_fp_date as 
-- SELECT customer_id, MIN(order_placed_dt) AS fp_dt
-- FROM public.sales_order
-- WHERE date_part('year', order_placed_dt) = 2014
-- GROUP BY customer_id;

-- 2. Get an indicator whether the customer is making another purchase in the next 30 days or not
--
-- CREATE TABLE public.customers_2014_fp_date_2 AS 
-- SELECT 
--     a.customer_id, 
--     a.fp_dt,
--     CASE 
--         WHEN b.customer_id IS NOT NULL THEN 1 
--         ELSE 0 
--     END AS ind_30_day
-- FROM public.customers_2014_fp_date a
-- LEFT JOIN public.sales_order b
--     ON a.customer_id = b.customer_id
--    AND b.order_placed_dt > a.fp_dt 
--    AND b.order_placed_dt <= a.fp_dt + INTERVAL '30 days'
-- GROUP BY 
--     a.customer_id, 
--     a.fp_dt, 
--     CASE 
--         WHEN b.customer_id IS NOT NULL THEN 1 
--         ELSE 0 
--     END;

-- 3. Aggregate and Analyse the results to see repeat rates

-- SELECT
-- COUNT(DISTINCT customer_id) as total_customers,
-- COUNT(DISTINCT CASE WHEN ind_30_day = 1 THEN customer_id END) AS cust_30_day_purchase,
-- (COUNT(DISTINCT CASE WHEN ind_30_day = 1 THEN customer_id END)/COUNT(DISTINCT CUSTOMER_ID))*100 AS cust_30_purc_percentage
-- FROM public.customers_2014_fp_date_2;

-- SELECT 
-- date_part('year', fp_dt) as fp_year, 
-- date_part('month', fp_dt) as fp_month,
-- COUNT(DISTINCT customer_id) AS total_customers, 
-- COUNT(DISTINCT CASE WHEN ind_30_day = 1 THEN customer_id END) AS cust_30_day_purchase,
-- (CAST(COUNT(DISTINCT CASE WHEN ind_30_day = 1 THEN customer_id END) AS double precision)/
-- CAST(COUNT(DISTINCT customer_id) AS double precision))*100 AS cust_30_day_purc_percent 
-- FROM public.custoMErs_2014_fp_date_2
-- GROUP BY 1,2
-- ORDER BY 1,2;