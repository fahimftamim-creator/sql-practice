-- Get the 5 most expensive products.
SELECT 
    product_id,
    product_name,
    price
FROM products
ORDER BY
    price DESC
LIMIT 5 

-- Get only the first 10 customers.
SELECT
    customer_id,
    first_name,
    last_name
FROM customers
ORDER BY
    customer_id
LIMIT 10

-- Get the top 3 highest-paid employees.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
ORDER BY
    salary DESC
LIMIT 3

-- Get 5 orders, but skip the first 10 (use OFFSET 10).
SELECT
    order_id
FROM orders
ORDER BY
    order_id
OFFSET 10
LIMIT 5

-- Find the single cheapest product.
SELECT 
    product_id,
    product_name,
    price
FROM products
ORDER BY
    price ASC
LIMIT 1