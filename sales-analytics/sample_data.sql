use sales_db;

-- Customers

insert into customers values
(1, 'Rahul Sharma', 'Delhi', 'India'),
(2, 'Ananya Verma', 'Mumbai', 'India'),
(3, 'John Smith', 'New York', 'USA'),
(4, 'Amit Patel', 'Ahmedabad', 'India');

-- Products
insert into products values
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile Phone', 'Electronics', 25000),
(103, 'Office Chair', 'Furniture', 7000),
(104, 'Table', 'Furniture', 12000);

-- Orders

insert into orders values
(1001, 1,'2025-01-10'),
(1002, 2,'2025-01-12'),
(1003, 1,'2025-01-15'),
(1004, 4,'2025-01-18');
