create table if not exists public.visit_detail
(
	platform text collate pg_catalog."default",
	session_date date,
	customer_id text collate pg_catalog."default",
	campaign_id text collate pg_catalog."default",
	homepage_cnt integer,
	item_page_cnt integer,
	cart_view_cnt integer,
	thank_you_page_cnt integer,
	checkout_pv_cnt integer
)
tablespace pg_default;