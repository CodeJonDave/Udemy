create table if not exists public.sales_order
(
	platform text collate pg_catalog."default",
	order_placed_dt date,
	order_num text collate pg_catalog."default",
	customer_id text collate pg_catalog."default",
	quantity integer,
	gross_sales_amount double precision,
	discount double precision,
	tax_amount double precision,
	return_ind integer
)
tablespace pg_default;