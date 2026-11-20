--1.List all unique cities where customers live.
SELECT
    COUNT(DISTINCT city) AS unique_cities
FROM
    customers;

--2.Find all unique department IDs in the employees table.
SELECT
    COUNT(DISTINCT department_id) AS unique_id
FROM
    employees;

-- 3.Count how many distinct customers have placed at least one order.
SELECT
    COUNT(DISTINCT customer_id) as one_order_customer
FROM
    orders
WHERE
    total_amount >= 1

--4.List all unique product category IDs that appear in order_items
SELECT DISTINCT
    product_id
FROM order_items
ORDER BY
    product_id asc

-- 5.How many distinct countries are in the customers table?
SELECT
    COUNT(DISTINCT country) AS unique_countrys
FROM
    customers;