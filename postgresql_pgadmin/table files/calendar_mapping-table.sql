create table if not exists public.calendar_mapping
(
	cal_date date,
	cal_mon integer,
	cal_mon_name text collate pg_catalog."default",
	cal_day integer,
	cal_year integer,
	weekday integer,
	weekday_name text collate pg_catalog."default",
	fiscal_year text collate pg_catalog."default",
	qtr_num integer,
	qtr_name text collate pg_catalog."default"
)
tablespace pg_default;