-- Challenge 1
-- Find the top 3 highest paid employees
-- who are NOT in department 1 (Sales)
-- and have a phone number on record

SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    phone,
    salary
FROM employees
WHERE
    department_id <> 1
    AND phone IS NOT NULL
ORDER BY
    salary DESC
LIMIT 3

-- Challenge 2
-- Find all products priced between 20 and 100
-- that are NOT in category 1 (Electronics)
-- sorted cheapest first
-- show only the first 5


SELECT product_id,
    product_name,
    price,
    category_id
FROM products
where price BETWEEN 20 and 100
    AND category_id <> 1
ORDER BY price
LIMIT 5


-- Challenge 3
-- Find all orders that have NOT been shipped yet
-- placed in 2024
-- sorted by order date, newest first

SELECT
    order_id,
    order_date,
    shipped_date
FROM orders
WHERE
    order_date >= '2024-01-01'
    AND shipped_date IS NULL
ORDER BY
    order_date DESC;