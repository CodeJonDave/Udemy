\COPY sales_order(platform,order_placed_dt,order_num,customer_id,quantity,gross_sales_amount,discount,tax_amount,return_ind) from 'C:\Users\codeJ\OneDrive\Desktop\UDEMY\postgresql_pgadmin\resources\All sample data files\sales_order.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';
-- must be entered into the cmd line to bypass one drive