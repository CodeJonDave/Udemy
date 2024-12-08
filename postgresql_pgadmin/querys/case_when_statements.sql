-- CASE WHEN Statements

-- 1. Case when statements are SQL if/else conditionals. 

-- SELECT
-- CASE 
-- WHEN return_ind = 1 AND (quantity BETWEEN 0 AND 2) THEN 'Item Returned Qty < 2'
-- WHEN return_ind = 1 AND (quantity BETWEEN 3 AND 7) THEN 'Item Returned Qty 3-7'
-- WHEN return_ind = 1 AND (quantity >= 8) THEN 'Item Returned Qty > 7'
-- WHEN return_ind = 0 THEN 'Item Not Returned'
-- END AS return_desc,
-- *
-- FROM public.sales_order_item;

-- 2. Case statements can be nested and aggregated

SELECT
	CASE 
		WHEN return_ind = 1 THEN
			CASE 
				WHEN (quantity BETWEEN 0 AND 2) THEN 'Item Returned Qty < 2'
				WHEN quantity >= 8 THEN 'Item Returned Qty > 7' 
				ELSE 'Others' 
			END
		WHEN return_ind = 0 THEN 'Item Not Returned'
		ELSE 'Others' 
	END AS return_desc,
	COUNT(DISTINCT order_num) AS order_ct
FROM public.sales_order_item
GROUP BY
	CASE 
		WHEN return_ind = 1 THEN
			CASE 
				WHEN (quantity BETWEEN 0 AND 2) THEN 'Item Returned Qty < 2'
				WHEN quantity >= 8 THEN 'Item Returned Qty > 7' 
				ELSE 'Others' 
			END
		WHEN return_ind = 0 THEN 'Item Not Returned'
		ELSE 'Others' 
	END;