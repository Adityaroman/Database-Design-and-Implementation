use nf;
create table Student_courses_Skills (
student_id int,
course_id varchar(10),
skill varchar(50),
primary key(student_id, course_id, skill));

insert into Student_courses_skills values 
(1, 'CS101','Sql'),
(1,'CS101', 'python'),
(1,'CS102', 'SQL'),
(1,'CS102', 'Data Analysis');

select * from Student_courses_skills;

-- problem statement above
-- by 4NF

create table student_courses (
student_id int,
course_id varchar(10),
primary key (student_id, course_id));

create table student_skills (
student_id int,
skill varchar(50),
primary key (student_id, skill));

insert into student_courses values
(1, 'CS101'),
(1,'CS102');
insert into Student_skills values
(1, 'SQL'),
(1,'python'),
(1,'data Analysis');
