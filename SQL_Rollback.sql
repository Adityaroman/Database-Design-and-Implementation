-- Create Customers table (Parent)
CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Insert data into Customers
INSERT INTO Customers1 (CustomerID, Name) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Carol White');

-- Create Orders table (Child) with ON DELETE CASCADE
CREATE TABLE Orders2 (
    OrdersID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE ON UPDATE cascade
);

-- Insert data into Orders
INSERT INTO Orders2 (OrdersID, CustomerID, OrderAmount) VALUES
(1, 1, 100),
(2, 2, 200),
(3, 1, 150),
(4, 3, 300);

DELETE FROM Customers WHERE CustomerID = 1;
rollback



