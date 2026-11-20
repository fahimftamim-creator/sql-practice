-- Find all employees who are in 'Sales' AND have salary > 50000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE
    department_id=(
        SELECT
            department_id 
        FROM departments
        WHERE
            department_name='Sales'
    ) AND
    salary > 50000

-- Find all products priced under 20 OR with stock quantity equal to 0.
SELECT
    product_id,
    product_name,
    price,
    stock
FROM products
WHERE
    price < 20 OR 
    stock = 0

--Find all customers NOT from 'Dhaka'.
SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM customers
WHERE
    city <> 'Dhaka';

-- Find orders from customer_id 5 placed after 2023-06-01.
SELECT
    order_id,
    customer_id,
    order_date
FROM orders 
WHERE
    customer_id = '5' AND
    order_date > '2023-06-01'

--Find employees who are in 'HR' or 'Finance' departments.

SELECT first_name, last_name, salary
FROM employees
WHERE department_id = 3   -- HR
   OR department_id = 4;  -- Finance

