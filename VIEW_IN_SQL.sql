use new1;
create table products(
product_id int primary key,
name varchar(50),
category varchar(50),
price decimal(10,2)
);

insert into products values
(1,'Laptop','Electronics',800),
(2,'Phone','Electronics',500),
(3,'Shirt','clothing',40);

create table orders(
order_id int primary key,
product_id int,
quantity int,
Foreign key (product_id) references products(product_id)
);
insert into orders values
(104,1,2);

insert into orders values
(101,1,2);
select * from orders;
-- NOW CREATE A VIEW TO JOIN PRODUCTS AND ORDERS:
 CREATE VIEW ORDER_SUMMERY AS select O.ORDER_ID,P.NAME,P.CATEGORY,O.QUANTITY,(O.QUANTITY*P.PRICE)AS TOTAL_PRICE 
 FROM ORDERS O
 JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID;
 
 SELECT * FROM ORDER_SUMMERY;
 
 CREATE VIEW ELECTRONICS_ONLY AS SELECT* FROM PRODUCTS
 WHERE CATEGORY = 'ELECTRONICS'
 with check option;
 
 insert into electronics_only values(5,'ahoes','clothing',50);
 
 insert into electronics_only values(5,'ahoes','electronics',50);
 
