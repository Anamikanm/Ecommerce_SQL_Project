**#E-Commerce Sales and Customer Analytics Using SQL**

**##Project Overview**

This project uses MySQL to analyse e-commerce customers, products, orders, and order items. It demonstrates how SQL can be used to answer business questions related to customer behaviour, product performance, order statuses, and sales revenue.

The project includes a relational database with four tables and a collection of basic, intermediate, and advanced SQL queries.

**##Objectives**

-Analyse customer demographics and signup information.

-Explore product categories, prices, and stock levels.

-Examine order statuses and payment methods.

-Calculate order values and estimated sales revenue.

-Identify repeat customers and high-value customers.

-Practise SQL concepts commonly used in data analytics.

**##Tools and Technologies**

**MySQL 8.0**

**MySQL Workbench**

**SQL**

**GitHub**

#**Database Schema**

The project contains four tables:

**Customers:** Customer details and registration information.

**Products:** Product names, categories, prices, and stock.

**Orders:** Order dates, customer references, payment methods, and statuses.

**Order_Items:** Products and quantities associated with each order.

##**Relationships**

Customers to Orders: One-to-many.

Orders to Order_Items: One-to-many.

Products to Order_Items: One-to-many.

The primary and foreign keys maintain relationships between the tables.

#**SQL Concepts Covered**

##**Basic SQL**

SELECT and WHERE

DISTINCT

ORDER BY and LIMIT

LIKE and BETWEEN

Aggregate functions

**##Intermediate SQL**

GROUP BY and HAVING

INNER JOIN and LEFT JOIN

Subqueries and EXISTS

CASE statements

Conditional aggregation

**##Advanced SQL**

Common Table Expressions (CTEs)

Window functions

Ranking and running totals

Revenue and customer analysis

Views

**##Business Questions**

This project explores questions such as:

Which products have the highest prices?

Which categories contain the most products?

Which payment methods are most frequently used?

Which customers place repeat orders?

Which products generate the highest estimated sales value?

What is the estimated order value for each order?

Which customers contribute the most to non-cancelled order value?

What percentage of order value comes from each category?

**##Dataset Information**

The project uses a small, illustrative dataset created for SQL learning and portfolio demonstration. It contains customer records, product records, orders, and order-item records.

The dataset is not a real company's transaction data.

Analytical Considerations

Cancelled orders should generally be excluded from completed-sales analysis.

Order-item value is calculated as product price multiplied by quantity.

The dataset does not include discounts, taxes, shipping charges, refunds, or historical product prices.

Revenue figures should therefore be interpreted as estimated order-item values rather than audited business revenue.

**##Project Outcome**

This project demonstrates relational database design, SQL querying, data aggregation, multi-table analysis, and business-oriented problem-solving.

It provides a foundation for further data analytics projects using larger datasets and visualization tools.

**##Future Improvements**

Expand the dataset with more customers, products, and orders.

Import a larger real-world e-commerce dataset.

Build a Power BI dashboard using the SQL analysis.

Add data quality checks and additional business metrics.

Author

**Anamika NM**

BCA graduate specializing in Artificial Intelligence, Cloud Computing, and DevOps.

GitHub: https://github.com/Anamikanm

LinkedIn: https://linkedin.com/in/anamika-nm
