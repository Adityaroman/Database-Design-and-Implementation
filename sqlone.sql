use employee;

desc employee;
create table employees(
id int primary key,
name varchar(100),
salary decimal(10,2),
department varchar(50));
desc  employees;

alter table employees add hier_data date;
alter table employees add email varchar(100);
alter table employees modify salary decimal(12,2);
alter table employees change name  Full_Name varchar(150); 
alter table employees rename column salary to SALARY;
alter table employees rename column SALARY to salary;
alter table employees drop column hier_data;
alter table employees drop column email;
alter table employees add unique(email);
rename table employees to Staff;
rename table Staff to employees;
desc employees;
insert into employees (id, Full_name,salary,department)
values(1,'nokesh',90000,'IT');

insert into employees (id, Full_name,salary,department)
values(2,'Satish',30000,'Finance');
insert into employees (id, Full_name,salary,department)
values(3,'Vishnu',60000,'HR');
insert into employees (id, Full_name,salary,department)
values(4,'Raju',90000,'Sales');
insert into employees (id, Full_name,salary,department)
values(5,'Krishna',40000,'HR'); 

select *from employees where salary>70000;
select *from employees order by salary desc;

select department,sum(salary)as total_salary from employees group by department;
select avg(salary)as Average_salary from employees;
select min(salary)as Minimum_salary from employees;
select max(salary)as Maximum_salary from employees;
select count(*)as total_employees from employees;
select count(*)as total_employees from employees group by department;
select *from employees limit 2;
select *from employees where salary<(select avg(salary)from employees);
select *from employees where(department='HR'or department='IT')and salary>50000;