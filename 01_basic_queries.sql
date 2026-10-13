-- 1. Display all customers.
SELECT * FROM Customers;

-- 2. Display all products.
SELECT * FROM Products;

-- 3. Display customer names and their cities.
SELECT customer_name, city
FROM Customers;

-- 4. Find all customers living in Kerala.
SELECT *
FROM Customers
WHERE state = 'Kerala';

-- 5. Find products costing more than ₹5,000.
SELECT *
FROM Products
WHERE price > 5000;

-- 6. Find products belonging to the Electronics category.
SELECT *
FROM Products
WHERE category = 'Electronics';

-- 7. Display orders with Delivered status.
SELECT *
FROM Orders
WHERE order_status = 'Delivered';

-- 8. Find customers living in Kochi or Thrissur.
SELECT *
FROM Customers
WHERE city IN ('Kochi', 'Thrissur');

-- 9. Find products priced between ₹1,000 and ₹5,000.
SELECT *
FROM Products
WHERE price BETWEEN 1000 AND 5000;

-- 10. Find products whose names contain the letter 'a'.
SELECT *
FROM Products
WHERE product_name LIKE '%a%';

-- Sorting, counting and calculations
-- 11. Display products from highest to lowest price.
SELECT *
FROM Products
ORDER BY price DESC;

-- 12. Display the five most expensive products.
SELECT *
FROM Products
ORDER BY price DESC
LIMIT 5;

-- 13. Display the different customer cities without duplicates.
SELECT DISTINCT city
FROM Customers;

-- 14. Count the total number of customers.
SELECT COUNT(*) AS total_customers
FROM Customers;

-- 15. Count the total number of products.
SELECT COUNT(*) AS total_products
FROM Products;

-- 16. Find the highest product price.
SELECT MAX(price) AS highest_price
FROM Products;

-- 17. Find the lowest product price.
SELECT MIN(price) AS lowest_price
FROM Products;

-- 18. Calculate the average product price.
SELECT AVG(price) AS average_price
FROM Products;

-- 19. Calculate the total quantity of stock across all products.
SELECT SUM(stock) AS total_stock
FROM Products;

-- 20. Find orders placed during May 2025.
SELECT *
FROM Orders
WHERE order_date BETWEEN '2025-05-01' AND '2025-05-31';


                     
                     



















