create table payroll(
	payroll_id serial,
	emp_name varchar(100) not null,
	base_salary numeric(12,2) not null check (base_salary >=15000),
	bonus numeric(10,2) not null default 0 check (bonus>=0),
	emp_type varchar(20) not null check(emp_type in ('full time','part time','contract')),
	pay_date date not null,
	period_start date not null,
	period_end date not null,
	constraint valid_pay_period check(period_end > period_start),
	constraint bonus_within_salary check(bonus <= base_salary),
	constraint valid_user_pay_month unique(emp_name,pay_date)
);

insert into payroll(emp_name,base_salary,bonus,emp_type,pay_date,period_start,period_end)
values ('Neha Gupa',85000.00,10000.00,'full time','2025-01-31','2025-01-01','2025-01-31');

select * from payroll;