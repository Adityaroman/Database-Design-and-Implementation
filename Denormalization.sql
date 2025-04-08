use nf;

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Create Orders table with foreign key reference
CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert sample data into Customers table
INSERT INTO Customers (customer_id, name, email) VALUES
    (1, 'Alice', 'alice@example.com'),
    (2, 'Bob', 'bob@example.com');


-- Insert sample data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
    (101, 1, '2024-02-20', 500.00),
    (102, 2, '2024-02-21', 300.00);

-- Join Customers and Orders to fetch combined data
SELECT 
    c.customer_id, 
    c.name, 
    c.email, 
    o.order_id,
    o.order_date, 
    o.total_amount
FROM 
    Customers c
JOIN 
    Orders o 
ON 
    c.customer_id = o.customer_id;

-- 

create table Customers_orders(
order_id int primary key,
customer_id int,
name varchar(100),
email varchar(100),
order_data Date,
total_amount decimal(10,2));

-- Insert combined customer and order data into Customers_Orders table
INSERT INTO Customers_Orders VALUES
    (101, 1, 'Alice', 'alice@example.com', '2024-02-20', 500.00),
    (102, 2, 'Bob', 'bob@example.com', '2024-02-21', 300.00);

-- Query all records directly from Customers_Orders table (no JOIN needed)
SELECT * FROM Customers_Orders;
