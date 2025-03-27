create database NF;
use nf;

create table students(
student_id int primary key,
name varchar(100),
phone_numbers varchar(100));

insert into students values
(1, 'Alice', '9897564362, 8787645623'),
(2, 'Bob', '6675632462, 6773836482, 5564738264');

select * from students;

-- phone no should not be stored as comma-saperated values

-- 1 converting it to 1NF

drop table students;

create table Students (
student_id int primary key,
name varchar(100));

create table studentPhones (
phone_id int primary key auto_increment,
student_id int,
phone_number varchar(15),
foreign key (student_id) references students(student_id));

insert into students values (1, 'Aditya'), (2, 'Bob');

insert into studentPhones(student_id, phone_number) values
(1, '900907654'),
(1, '900907650'),
(2, '900907653'),
(2, '900907655'),
(2, '900907652');

select s.student_id, s.name, sp.phone_number from students s join studentphones sp on s.student_id = sp.student_id;