-- 21. Count customers in each city.
SELECT city, COUNT(*) AS total_customers
FROM Customers
GROUP BY city;

-- 22. Count products in each category.
SELECT category, COUNT(*) AS total_products
FROM Products
GROUP BY category;

-- 23. Find the average price of products in each category.
SELECT category, AVG(price) AS average_price
FROM Products
GROUP BY category;

-- 24. Find the total stock in each category.
SELECT category, SUM(stock) AS total_stock
FROM Products
GROUP BY category;

-- 25. Count orders by payment method.
SELECT payment_method, COUNT(*) AS total_orders
FROM Orders
GROUP BY payment_method;

-- 26. Count orders by status.
SELECT order_status, COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status;

-- 27. Find customers who placed more than one order.
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 28. Find categories with an average product price above ₹5,000.
SELECT category, AVG(price) AS average_price
FROM Products
GROUP BY category
HAVING AVG(price) > 5000;

-- 29. Display each order with the customer's name.
SELECT o.order_id, c.customer_name, o.order_date
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id;
    
-- 30. Display each order with its product names and quantities.
SELECT oi.order_id, p.product_name, oi.quantity
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id;
    
-- 31. Display customer names, order IDs, and order statuses.
SELECT c.customer_name, o.order_id, o.order_status
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;
    
-- 32. Calculate the value of every order item.
SELECT oi.order_id, p.product_name,
oi.quantity, p.price,
oi.quantity * p.price AS item_value
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id;

-- 33. Display each customer's total number of orders, including customers with zero orders.
SELECT c.customer_id, c.customer_name,
COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 34. Display the complete product details for items in order 1001.
SELECT o.order_id, p.product_name,
p.price, oi.quantity
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
WHERE o.order_id = 1001;

-- Subqueries and CASE
-- 35. Find products priced above the average product price.
SELECT *
FROM Products
WHERE price > (
SELECT AVG(price)
FROM Products
);

-- 36. Find the most expensive product.
SELECT *
FROM Products
WHERE price = (
SELECT MAX(price)
FROM Products
);

-- 37. Find customers who have placed at least one order.
SELECT *
FROM Customers c
WHERE EXISTS (
SELECT 1
FROM Orders o
WHERE o.customer_id = c.customer_id
);

-- 38. Label products as Expensive or Affordable using CASE.
SELECT product_name, price,
    CASE
        WHEN price >= 10000 THEN 'Expensive'
        ELSE 'Affordable'
    END AS price_category
FROM Products;

-- 39. Count how many orders are Delivered and how many are not Delivered.
SELECT
    SUM(CASE
        WHEN order_status = 'Delivered' THEN 1
        ELSE 0
    END) AS delivered_orders,
    SUM(CASE
        WHEN order_status <> 'Delivered' THEN 1
        ELSE 0
    END) AS other_orders
FROM Orders;

-- 40. Find customers who have never placed an order.
SELECT *
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);




