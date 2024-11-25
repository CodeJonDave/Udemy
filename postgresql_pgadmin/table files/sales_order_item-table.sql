create table if not exists public.sales_order_item
(
	platform text collate pg_catalog."default",
	order_placed_dt date,
	order_num text collate pg_catalog."default",
	quantity integer,
	item_id text collate pg_catalog."default",
	item_price double precision,
	return_ind integer
)
tablespace pg_default;