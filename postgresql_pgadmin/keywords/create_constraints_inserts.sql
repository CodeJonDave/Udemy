-- 1. create a new empty table
-- create table public.new_table
-- (
-- id integer,
-- name text,
-- dt date,
-- fraction_val decimal
-- );

-- 2. select statement
-- select * from new_table;

-- 3. insert statement to add to new_table with datatype values
-- insert into public.new_table
-- values(1,'John Cutler','1984-10-28',12.5);

-- 4. insert statement to add to new_table with ~datatype values
-- insert into public.new_table
-- values(2.5, 1111111,'2022-08-16',13);

-- 5. create a table from existing table information
-- create table public.sales_order_copy as
-- select * from public.sales_order;

-- 6. test the query was successful
-- select count(1) from public.sales_order_copy;

-- 7. want to copy the schema but not the data
-- create table public.sales_order_schema_copy as
-- select * from public.sales_order where 1=2;

-- 8. test the query was successful
-- select * from public.sales_order_schema_copy;

-- 9. get the schema of a table
-- select * from information_schema.columns
-- where table_name = 'demographics';

-- 10. get the schema for a table with postgre in cli
-- \d demographics

-- 11. standard key words for constraints
-- primary key
-- not null
-- unique
-- foreign key
-- check
-- serial

-- 12. create the dept table with constraints
-- create table if not exists public.dept_info
-- (
-- dept_num serial primary key,
-- dept_name text not null
-- );

-- 13. create the employee table with constraints
-- create table public.employee_info
-- (
-- 	emp_id serial primary key,
-- 	emp_name text not null,
-- 	salary double precision check(salary>0.0),
-- 	dept_id integer references dept_info(dept_num),
-- 	emp_code integer unique
-- );

-- 12. insert data into new tables
-- insert into dept_info
-- values(default,'Marketing'),(default,'Finance'),(default,'Human Resources'),(default,'Sales');

-- 13. check data
-- select * from dept_info

-- 14. insert data into employee table
-- insert into public.employee_info
-- values (default, 'Mr Fantastic', 2000,2,101);

-- 15. insert multiple rows of data at once
-- insert into public.employee_info
-- values (default, 'Martha Wayne', 200000,1,102),
--  (default, 'Tony Stark', 25000,4,103),
--  (default, 'Stephen Strange', 100000,3,104)
-- ;
select * from employee_info