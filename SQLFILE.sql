select * from employee;
desc employee;
SHOW DATABASES;
use employee23;




dept_id int primary key,
dept_name varchar(50));

insert into department (dept_id,dept_name)
values(1,'HR'),(2,'finance'),(3,'IT');

-- inner join
select e.id,e.full_name,d.dept_name
from employee e
inner join department d
on e.department = d.dept_name

select * from employee 
Where department = 'it' and salary >5000;

select * from employee where salary != 5000;

-- wildcard characters (filtering with patterns)(%) (_)

select * from employee where full_name like '%A';
select * from employee where full_name like 'e%';

select * from employee where full_name like '_O_';   -- check for in between name the presence of O 

select * from employee where department in ('HR','IT');

select *from employee whwre hire_date between 2022-01-01 and '2023-12-31';


select * from employee where salary between 50000 and 7000;

insert into employee values 
select * from employee;


insert into department(id,full_name,salary,department,email)
values(6,'wali',40000,'Marketing','Adityasharma@gmail.com');
select * from employee where salary is null;
SELECT * FROM employee WHERE salary = 70000 OR salary IS NOT NULL;
select * from employee where department ='IT' and salary between 7000 and 5000;
select department, sum(salary) from employee group by department;
select department, sum(salary) as total_salary
from employee
group by department having sum(salary) > 1000000;

select employee.full_name, departments.department_name from employee left join departments on employee.department_id = departments.department_id;

select employee.full_name, department.department_name from employee right join department on employee.department_id = departments.department_id;



select employee.full_name, departments.department_name from employee left join departments on employee.department_id = departments.department_id;
union
select employee.full_name, department.department_name from employee right join department on employee.department_id = departments.department_id;



-- LEFT JOIN: Retrieve all employees and their department names
SELECT e.full_name, d.dept_name 
FROM employee e 
LEFT JOIN department d ON e.department_id = d.dept_id;

-- RIGHT JOIN: Retrieve all departments and employees associated with them
SELECT e.full_name, d.dept_name 
FROM employee e 
RIGHT JOIN department d ON e.department_id = d.dept_id;

-- UNION of LEFT JOIN and RIGHT JOIN results
SELECT e.full_name, d.dept_name 
FROM employee e 
LEFT JOIN department d ON e.department_id = d.dept_id
UNION
SELECT e.full_name, d.dept_name 
FROM employee e 
RIGHT JOIN department d ON e.department_id = d.dept_id;

SELECT e.FULL_NAME, d.dept 
FROM employee e  
RIGHT JOIN department d ON e.department_id = d.dept_id;



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


select name, salary from employee1 where salary > all (select salary from employee1 where department  'HR');