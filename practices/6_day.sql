--Find all employees who don't have a manager (manager_id IS NULL).
SELECT
    employee_id,
    first_name,
    last_name,
    manager_id
FROM employees
WHERE
    manager_id IS NULL

--Find all products where the description is missing (NULL).
SELECT
    product_id,
    product_name,
    description
FROM products
WHERE
    description  IS NULL

--Find all customers who DO have an email address (IS NOT NULL).
SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customers
WHERE
    email is not NULL

--Select all columns from orders where the shipped_date is NULL (not shipped yet).
Select
    order_id,
    order_date,
    shipped_date,
    total_amount
FROM orders 
WHERE
    shipped_date is NULL

--Count how many employees are missing a phone number.
SELECT
    employee_id,
    first_name,
    last_name,
    phone
FROM employees
WHERE
    phone IS NULL

