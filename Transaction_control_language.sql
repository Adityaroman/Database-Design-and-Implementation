create table accounts (
account_id int Primary key,
name varchar(50),
balance decimal(10, 2));

insert into accounts values
(1,'Anne',1000.00),
(2,'Peeni',500.00);

start transaction;

update  accounts
set balance = balance - 200
where account_id = 1;

update accounts
set balance = balance + 200
where account_id = 2;

select * from accounts;

-- if balance is < 0 
rollback;

select * from accounts;

-- using savepoint
start transaction;
 update accounts set balance = balance - 100 where account_id = 1;
 
 update accounts set balance = balance + 100 where account_id = 2;
 
 
  -- kind of bookmark
 
 savepoint deduct_money;
 
 ROllback to deduct_money;
 
 select * from accounts;