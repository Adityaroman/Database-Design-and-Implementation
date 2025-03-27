create database university;
use university;

create table students(
    roll_no int primary key,
    name varchar(100),
    department varchar(50),
    advisor_id int
);

create table courses (
    course_id varchar(10) primary key,
    course_name varchar(100),
    credits int
);

create table enrollment (
    roll_no int,
    course_id varchar(10),
    grade char(2),
    primary key (roll_no, course_id),
    foreign key (roll_no) references students(roll_no),
    foreign key (course_id) references courses(course_id)
);

-- Insert values into students table
insert into students values
(101, 'Alice', 'Computer Science', 1),
(102, 'Bob', 'Mathematics', 2);

-- Insert values into courses table
insert into courses values
('CS101', 'Database Systems', 4),
('MTH201', 'Calculus', 3);

-- Insert values into enrollment table
insert into enrollment values 
(101, 'CS101', 'A'),
(102, 'MTH201', 'B');

-- Verify functional dependency (roll_no → name, department)
SELECT roll_no, COUNT(DISTINCT name), COUNT(DISTINCT department) 
FROM students 
GROUP BY roll_no;

-- verify (roll_no, course_id ) -> grade
select roll_no, course_id, count(distinct grade) from enrollment group by roll_no, course_id;

-- Example: incorrect data entry

insert into students values(101, 'Alice Jhonson', 'Computer Science', 3);