create table if not exists public.campaign_detail
(
	date date,
	campaign_name text collate pg_catalog."default",
	campaign_id integer,
	spend integer
)
tablespace pg_default;