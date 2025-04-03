use nf;

create table supplier_parts_projects (
supplier_id int,
part_id int,
project_id int,
primary key (supplier_id, part_id, project_id));

insert into supplier_parts_projects values 
(1, 101, 1001),
(1, 101, 1002),
(1, 102, 1001),
(2, 101, 1001),
(2, 101, 1002);

-- problem statement

create table supplier_parts (
supplier_id int,
part_id int,
primary key (supplier_id, part_id));

create table supplier_projects (
supplier_id int,
project_id int,
primary key (supplier_id,project_id));

create table parts_projects (
part_id int,
project_id int,
primary key (part_id, project_id));


insert into supplier_parts values 
(1, 101), (1,102),(2,101),(2,102);
insert into supplier_projects values 
(1,101),(1,1002),(2,1001),(2,1002);
insert into parts_projects values
(101, 1001), (1001,1002),(102,1001),(102,1002);

select sp.supplier_id, pp.part_id, pp.project_id 
from supplier_parts sp
join parts_projects pp on sp.part_id = pp.part_id
join supplier_projects spj on
sp.supplier_id = spj.supplier_id and pp.project_id = spj.project_id;
