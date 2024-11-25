create table if not exists public.demographics
(
	customer_id text collate pg_catalog."default",
	name text collate pg_catalog."default",
	type text collate pg_catalog."default",
	country text collate pg_catalog."default",
	city text collate pg_catalog."default",
	state text collate pg_catalog."default",
	zipcode text collate pg_catalog."default",
	region text collate pg_catalog."default",
	age integer,
	household_income double precision,
	household_size integer,
	ethnicity text collate pg_catalog."default",
	urbanicity text collate pg_catalog."default",
	profession text collate pg_catalog."default",
	language text collate pg_catalog."default"
)
tablespace pg_default;