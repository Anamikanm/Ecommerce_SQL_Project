-- Advanced sales analysis
-- 41. Calculate the total value of each order.
SELECT o.order_id,
       SUM(oi.quantity * p.price) AS order_value
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id;

-- 42. Find the top five customers by total order value, excluding cancelled orders.
SELECT c.customer_id, c.customer_name,
       SUM(oi.quantity * p.price) AS total_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE o.order_status <> 'Cancelled'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_value DESC
LIMIT 5;

-- 43. Find the best-selling products by total quantity sold, excluding cancelled orders.
SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC;

-- 44. Calculate revenue by product category, excluding cancelled orders.
SELECT p.category,
       SUM(oi.quantity * p.price) AS revenue
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY p.category
ORDER BY revenue DESC;

-- 45. Find each customer's latest order date.
SELECT c.customer_name,
       MAX(o.order_date) AS latest_order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 46. Find customers whose total order value is above ₹30,000, excluding cancelled orders.
SELECT c.customer_id, c.customer_name,
       SUM(oi.quantity * p.price) AS total_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE o.order_status <> 'Cancelled'
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * p.price) > 30000;

-- 47. Find products that have never been ordered.
SELECT p.*
FROM Products p
LEFT JOIN Order_Items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- CTEs and window functions
-- 48. Use a CTE to calculate revenue by category.
WITH CategoryRevenue AS (
    SELECT p.category,
           SUM(oi.quantity * p.price) AS revenue
    FROM Products p
    JOIN Order_Items oi ON p.product_id = oi.product_id
    JOIN Orders o ON oi.order_id = o.order_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY p.category
)
SELECT *
FROM CategoryRevenue
ORDER BY revenue DESC;

-- 49. Rank products by price from highest to lowest.
SELECT product_name, price,
       RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Products;

-- 50. Number each customer's orders from earliest to latest.
SELECT customer_id, order_id, order_date,
       ROW_NUMBER() OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS order_number
FROM Orders;

-- 51. Calculate the running total of order values by date.
WITH OrderValues AS (
    SELECT o.order_id, o.order_date,
           SUM(oi.quantity * p.price) AS order_value
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY o.order_id, o.order_date
)
SELECT order_id, order_date, order_value,
       SUM(order_value) OVER (
           ORDER BY order_date, order_id
       ) AS running_total
FROM OrderValues;

-- 52. Find the second-highest distinct product price.
SELECT MAX(price) AS second_highest_price
FROM Products
WHERE price < (
    SELECT MAX(price)
    FROM Products
);

-- 53. Find the most expensive product in each category.
WITH RankedProducts AS (
    SELECT product_name, category, price,
           RANK() OVER (
               PARTITION BY category
               ORDER BY price DESC
           ) AS price_rank
    FROM Products
)
SELECT *
FROM RankedProducts
WHERE price_rank = 1;

-- 54. Calculate the percentage of each payment method's orders.
SELECT payment_method,
       COUNT(*) AS total_orders,
       ROUND(
           COUNT(*) * 100.0 /
           (SELECT COUNT(*) FROM Orders), 2
       ) AS percentage
FROM Orders
GROUP BY payment_method;

-- Advanced reporting and views
-- 55. Compare each product's price with its category's average price.
SELECT product_name, category, price,
       AVG(price) OVER (
           PARTITION BY category
       ) AS category_average
FROM Products;

-- 56. Find customers who placed at least two orders.
WITH CustomerOrders AS (
    SELECT customer_id, COUNT(*) AS total_orders
    FROM Orders
    GROUP BY customer_id
)
SELECT c.customer_name, co.total_orders
FROM Customers c
JOIN CustomerOrders co
ON c.customer_id = co.customer_id
WHERE co.total_orders >= 2;

-- 57. Create a view showing each order's customer and status.
CREATE VIEW OrderSummary AS
SELECT o.order_id, c.customer_name,
       o.order_date, o.order_status
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id;

SELECT * FROM OrderSummary;

-- 58. Create a view showing product-level sales revenue.
CREATE VIEW ProductSales AS
SELECT p.product_id, p.product_name,
       SUM(oi.quantity) AS total_quantity,
       SUM(oi.quantity * p.price) AS total_value
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY p.product_id, p.product_name;

SELECT * FROM ProductSales
ORDER BY total_value DESC;

-- 59. Find the percentage contribution of each category to total non-cancelled order value.
WITH CategoryRevenue AS (
    SELECT p.category,
           SUM(oi.quantity * p.price) AS revenue
    FROM Products p
    JOIN Order_Items oi ON p.product_id = oi.product_id
    JOIN Orders o ON oi.order_id = o.order_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY p.category
)
SELECT category, revenue,
       ROUND(
           revenue * 100.0 /
           SUM(revenue) OVER (), 2
       ) AS revenue_percentage
FROM CategoryRevenue;

-- 60. Create a view for delivered-order revenue by customer.
CREATE VIEW DeliveredCustomerRevenue AS
SELECT c.customer_id, c.customer_name,
       SUM(oi.quantity * p.price) AS total_revenue
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name;

SELECT *
FROM DeliveredCustomerRevenue
ORDER BY total_revenue DESC;
