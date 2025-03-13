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

-- 1. Write a query to create a view named high_salary_employees that contains employees
-- earning more than 70,000.


CREATE or replace VIEW high_salary_employees AS 
SELECT *
FROM employees
WHERE salary > 70000;

select * from high_salary_employees;

-- 2. Create a view department_summary that shows the total number of employees in each
-- department
CREATE VIEW department_summary AS
SELECT department, COUNT(*) as employee_count
FROM employees
GROUP BY department;

select * from department_summary;

-- 3. Write a query to retrieve all records from a view named high_salary_employees

SELECT * FROM high_salary_employees;

-- 4. Drop the view department_summary from the database.

drop view department_summary;

-- 5. Create a view finance_employees that contains only employees from the Finance
-- department, showing emp_id, name, and salary

CREATE VIEW finance_employees AS
SELECT emp_id,name,salary
FROM employees
WHERE department = 'Finance';

-- 6. Update the salary of an employee in the view high_salary_employees where emp_id = 3
-- to 78,000
UPDATE high_salary_employees
SET salary = 78000
WHERE emp_id = 3;
select * from high_salary_employees;

-- 7. Insert a new row into the finance_employees view with emp_id = 6, name = 'George', and
-- salary = 72,000

UPDATE high_salary_employees
SET salary = 78000
WHERE emp_id = 3;

SELECT * FROM high_salary_employees WHERE emp_id = 3;

-- 8. Create a view manager_list that shows employees with the designation Manager.

CREATE VIEW manager_list AS
SELECT emp_id,name,department,designation,salary
FROM employees
WHERE designation = 'Manager';

SELECT * FROM manager_list;
-- 9. Modify an existing view sales_report to include an additional column commission

-- 10. Create a view dept_avg_salary that displays each department along with the average
-- salary of employees in that department

-- 11. Create a view employee_order_summary that joins employees and orders tables to show
-- emp_id, name, order_id, and total_order_value.
-- 12. Write a query to update an existing view named customer_purchases to include an
-- additional column discounted_price.
-- 13. Create a view it_high_salary that shows IT department employees earning more than the
-- department’s average salary.
-- 14. Create a view that lists the top 5 highest-paid employees using the LIMIT clause.