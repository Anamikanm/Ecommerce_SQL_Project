CREATE DATABASE ecommerce_project;
USE ecommerce_project;

-- TABLE 1: CUSTOMERS
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE
);

INSERT INTO Customers VALUES
(1, 'Ananya', 'Kochi', 'Kerala', 'ananya@gmail.com', '2025-01-10'),
(2, 'Rahul', 'Thrissur', 'Kerala', 'rahul@gmail.com', '2025-01-15'),
(3, 'Sneha', 'Bangalore', 'Karnataka', 'sneha@gmail.com', '2025-02-01'),
(4, 'Arjun', 'Chennai', 'Tamil Nadu', 'arjun@gmail.com', '2025-02-10'),
(5, 'Meera', 'Kozhikode', 'Kerala', 'meera@gmail.com', '2025-02-20'),
(6, 'Vishnu', 'Bangalore', 'Karnataka', 'vishnu@gmail.com', '2025-03-01'),
(7, 'Diya', 'Kochi', 'Kerala', 'diya@gmail.com', '2025-03-05'),
(8, 'Akhil', 'Hyderabad', 'Telangana', 'akhil@gmail.com', '2025-03-12'),
(9, 'Nila', 'Thrissur', 'Kerala', 'nila@gmail.com', '2025-04-01'),
(10, 'Kiran', 'Chennai', 'Tamil Nadu', 'kiran@gmail.com', '2025-04-15');

-- TABLE 2: PRODUCTS
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 55000, 15),
(102, 'Smartphone', 'Electronics', 25000, 30),
(103, 'Headphones', 'Electronics', 2000, 50),
(104, 'T-Shirt', 'Fashion', 800, 100),
(105, 'Jeans', 'Fashion', 1500, 60),
(106, 'Shoes', 'Fashion', 3000, 40),
(107, 'Office Chair', 'Furniture', 7000, 20),
(108, 'Study Table', 'Furniture', 5000, 12),
(109, 'Backpack', 'Accessories', 1200, 45),
(110, 'Smart Watch', 'Electronics', 4500, 25);

-- TABLE 3: ORDERS
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_method VARCHAR(30),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(1001, 1, '2025-05-01', 'UPI', 'Delivered'),
(1002, 2, '2025-05-03', 'Credit Card', 'Delivered'),
(1003, 3, '2025-05-05', 'UPI', 'Delivered'),
(1004, 1, '2025-05-10', 'Debit Card', 'Delivered'),
(1005, 4, '2025-05-12', 'UPI', 'Cancelled'),
(1006, 5, '2025-05-15', 'Credit Card', 'Delivered'),
(1007, 6, '2025-05-18', 'UPI', 'Shipped'),
(1008, 7, '2025-05-20', 'Debit Card', 'Delivered'),
(1009, 8, '2025-05-22', 'UPI', 'Delivered'),
(1010, 9, '2025-05-25', 'Credit Card', 'Pending'),
(1011, 2, '2025-06-01', 'UPI', 'Delivered'),
(1012, 3, '2025-06-03', 'Debit Card', 'Delivered'),
(1013, 10, '2025-06-05', 'Credit Card', 'Shipped'),
(1014, 5, '2025-06-08', 'UPI', 'Delivered'),
(1015, 1, '2025-06-10', 'Credit Card', 'Delivered');

-- TABLE 4: ORDER_ITEMS
CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES
(1, 1001, 102, 1),
(2, 1001, 103, 2),
(3, 1002, 104, 3),
(4, 1002, 105, 1),
(5, 1003, 101, 1),
(6, 1003, 103, 1),
(7, 1004, 106, 1),
(8, 1004, 109, 2),
(9, 1005, 102, 1),
(10, 1006, 107, 1),
(11, 1006, 108, 1),
(12, 1007, 110, 2),
(13, 1007, 103, 1),
(14, 1008, 104, 2),
(15, 1008, 106, 1),
(16, 1009, 102, 2),
(17, 1009, 109, 1),
(18, 1010, 105, 2),
(19, 1011, 101, 1),
(20, 1011, 103, 2),
(21, 1012, 110, 1),
(22, 1012, 104, 1),
(23, 1013, 107, 2),
(24, 1014, 106, 2),
(25, 1014, 109, 1),
(26, 1015, 102, 1),
(27, 1015, 110, 1);

-- CHECK THE DATA
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
