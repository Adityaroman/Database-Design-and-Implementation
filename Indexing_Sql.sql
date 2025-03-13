create database new2;
use new2;

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
designation VARCHAR(50),
salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Alice', 'HR', 'Manager', 60000),
(2, 'Bob', 'IT', 'Developer', 75000),
(3, 'Charlie', 'Finance', 'Analyst', 72000),
(4, 'David', 'IT', 'Manager', 80000),
(5, 'Eve', 'HR', 'Executive', 65000),
(6, 'Frank', 'Finance', 'Manager', 85000);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
emp_id INT,
total_order_value DECIMAL(10,2),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO orders VALUES
(101, 1, 5000),
(102, 2, 12000),
(103, 3, 8000),
(104, 4, 15000),
(105, 5, 4000);

-- Create a single index on salary column
create index idx_salary on employees(salary);
select * from employees where salary > 6000;

explain select * from employees where salary > 6000;

-- Create a multi-column index on department and salary
CREATE INDEX idx_department_salary ON employees(department, salary);

-- Create a unique index on emp_id and name
CREATE UNIQUE INDEX idx_unique_emp ON employees(emp_id, name);


show index from employees;

Drop index idx_salary on employees;