CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES 
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

INSERT INTO employees VALUES 
(101, 'John', 50000, 1),
(102, 'Sarah', 60000, 1),
(103, 'Mike', 75000, 2),
(104, 'Emma', 80000, 2),
(105, 'David', 90000, 3),
(106, 'Olivia', 70000, 3),
(107, 'Sophia', 65000, 4),
(108, 'Daniel', 72000, 4);

-- find departments with the highest salary employee
select d.dept_name, e.name, e.salary from employees e join departments d on e.dept_id = d.dept_id where e.salary = (Select max(salary) from employees where dept_id = e.dept_id);
 -- retrive the 2nd Highest Salary
 
SELECT name, salary 
FROM employees 
WHERE salary = (
    SELECT DISTINCT salary 
    FROM employees 
    ORDER BY salary DESC 
    LIMIT 1 OFFSET 1
);

-- calculate avg salary per department
SELECT d.dept_name, ROUND(AVG(e.salary), 2) AS avg_salary 
FROM employees e 
JOIN departments d ON e.dept_id = d.dept_id 
GROUP BY d.dept_name;

-- highest of dept after avg
SELECT d.dept_name, ROUND(AVG(e.salary), 2) AS avg_salary 
FROM employees e 
JOIN departments d ON e.dept_id = d.dept_id 
GROUP BY d.dept_name 
ORDER BY avg_salary DESC 
LIMIT 1;

