show databases;
use employee;
Create table employee3 (
emp_id int,
name varchar(50),
salary int,
primary key(emp_id,salary))
partition by range(salary)
(partition p1 values less than (50000),
partition p2 values less than (100000),
partition p3 values less than (150000));

