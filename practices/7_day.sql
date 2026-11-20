--Find all employees in 'Sales' earning over 40000, sorted by salary DESC.
Select
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
from employees
WHERE
department_id=1 AND
salary > 40000
ORDER BY
    salary DESC

-- List the top 5 most expensive products that are still in stock (stock > 0).
Select
    product_id,
    product_name,
    price,
    stock
FROM products
WHERE
    stock > 0
ORDER BY
    price DESC
LIMIT 5

--Find customers NOT from 'Dhaka' whose phone number is missing.
SELECT
    customer_id,
    first_name,
    last_name,
    city,
    phone
FROM customers
WHERE
    city <> 'Dhaka'
    AND phone IS NULL;

--Get orders placed in 2024, sorted by order_date, show only the first 10.
SELECT
    order_id,
    order_date
FROM orders
WHERE
    order_date >= '2024-01-01'
    AND order_date < '2025-01-01'
ORDER BY
    order_date
LIMIT 10;

--Find all products priced between 10 and 100, sorted by price ASC.
SELECT
    product_id,
    product_name,
    price
FROM products
WHERE
    price BETWEEN 10 AND 100
ORDER BY
    price ASC;