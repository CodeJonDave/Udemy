create table if not exists public.product_detail
(
	item_id text collate pg_catalog."default",
	product_name text collate pg_catalog."default",
	catgory text collate pg_catalog."default",
	sub_category text collate pg_catalog."default"
)
tablespace pg_default;