-- Granularity the level of detail at which data is stored in the table
-- query to see which is the granularity
-- if query returns any records it is not the 'smallest grain'
-- if records returned is 0 is a potential candidate
-- usecase: primay key not declared in schema
select (column_to_check), count(1)
from public.sales_order
group by column_to_check
having count(1)>1;