--Count the total number of employees in the company
SELECT
count (*) AS total_employees
FROM employees

--2.Find the total sum of all order amounts in the orders table.
SELECT
    sum(quantity) AS total_amount
FROM order_items

--3.Find the average salary of all employees. Round to 2 decimal places
SELECT
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees;

--4.Find the highest price in the products table
SELECT
    MAX(price) AS most_valuabe_product
FROM products

--5.Find the earliest order date in the orders table
SELECT
    MIN(order_date) AS earliest_order_date
FROM orders
