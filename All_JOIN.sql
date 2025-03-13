-- Step 1: Create Database
DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

-- Step 2: Create the department1 table
DROP TABLE IF EXISTS department1;
CREATE TABLE department1 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Step 3: Insert sample data into department1 table
INSERT INTO department1 (dept_id, dept_name)
VALUES (1, 'HR'), (2, 'Finance'), (3, 'IT'), (4, 'Marketing');

-- Step 4: Create the employee1 table
DROP TABLE IF EXISTS employee1;
CREATE TABLE employee1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    email VARCHAR(100),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES department1(dept_id) ON DELETE SET NULL
);

-- Step 5: Insert sample data into employee1 table
INSERT INTO employee1 (full_name, salary, department_id, email, hire_date)
VALUES 
('Alice Johnson', 50000, 1, 'alice@example.com', '2022-06-15'),
('Bob Smith', 70000, 2, 'bob@example.com', '2021-05-20'),
('Charlie Brown', 60000, 3, 'charlie@example.com', '2020-08-30'),
('David Lee', 55000, 4, 'david@example.com', '2023-01-10'),
('Eve Adams', 62000, NULL, 'eve@example.com', '2022-09-12');

-- Step 6: LEFT JOIN - Retrieve all employees and their department names
SELECT e.full_name, d.dept_name 
FROM employee1 e 
LEFT JOIN department1 d ON e.department_id = d.dept_id;

-- Step 7: RIGHT JOIN - Retrieve all departments and employees associated with them
SELECT e.full_name, d.dept_name 
FROM employee1 e 
RIGHT JOIN department1 d ON e.department_id = d.dept_id;

-- Step 8: UNION of LEFT JOIN and RIGHT JOIN results
SELECT e.full_name, d.dept_name 
FROM employee1 e 
LEFT JOIN department1 d ON e.department_id = d.dept_id
UNION
SELECT e.full_name, d.dept_name 
FROM employee1 e 
RIGHT JOIN department1 d ON e.department_id = d.dept_id;

-- Step 9: Corrected RIGHT JOIN Query (fixing dept column)
SELECT e.full_name, d.dept_name 
FROM employee1 e  
RIGHT JOIN department1 d ON e.department_id = d.dept_id;

-- Step 10: Self Join to find employees from the same department with different IDs
SELECT e1.full_name AS employee1, e2.full_name AS employee2 
FROM employee1 e1, employee1 e2 
WHERE e1.department_id = e2.department_id AND e1.id != e2.id;

-- Step 11: Verify data in employee1 table
SELECT * FROM employee1;

-- Step 12: Verify data in department1 table
SELECT * FROM department1;

-- Step 1: Select all records from employee1
SELECT * FROM employee1;

-- Step 2: Self-Join to find employees from the same department with different IDs
SELECT e1.full_name AS employee1, e2.full_name AS employee2 
FROM employee1 e1, employee1 e2 
WHERE e1.department_id = e2.department_id AND e1.id != e2.id;

-- Step 3: Select all records from employees table
SELECT * FROM employees;

-- Step 4: Calculate the average salary from employees table
SELECT AVG(salary) FROM employees;

-- Step 5: Select employees with a salary higher than the average salary
SELECT full_name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Step 6: Select employees from departments where the average salary is greater than 55000
SELECT full_name, department, salary 
FROM employees 
WHERE department IN (
    SELECT department 
    FROM employees 
    GROUP BY department 
    HAVING AVG(salary) > 55000
);

-- Step 7: Select salaries from the Finance department
SELECT salary FROM employees WHERE department = 'Finance';

-- Step 8: Select employees whose salary is higher than **any** salary in the Finance department
SELECT full_name, salary, department 
FROM employees 
WHERE salary > ANY (
    SELECT salary FROM employees WHERE department = 'Finance'
);

SELECT name, salary 
FROM employee1 
WHERE salary > ALL (
    SELECT salary 
    FROM employee1 
    WHERE department = 'HR'
);

SELECT e2.salary 
FROM employee1 e2 
JOIN department1 d ON e2.department_id = d.dept_id 
WHERE d.dept_name = 'HR'


SELECT full_name, salary 
FROM employee1 
WHERE salary > ALL (
    SELECT salary 
    FROM employee1 
    WHERE department_id = (
        SELECT dept_id FROM department1 WHERE dept_name = 'HR'
    )
);
