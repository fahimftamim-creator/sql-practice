--Select all products, sorted by price from lowest to highest.
SELECT
    product_id,
    product_name,
    price 
FROM products
ORDER BY price ASC


--Select all employees, sorted by last_name alphabetically.
SELECT 
    last_name
FROM employees
ORDER BY last_name ASC

-- Select all orders sorted by order_date descending (newest first).
SELECT
    order_id,
    order_date
FROM orders
ORDER BY order_date DESC

-- Select all products sorted by category ASC, then price DESC.
SELECT
    product_id,
    product_name,
    price,
    category_id
FROM products
ORDER BY
    category_id ASC,
    price DESC

-- Find all customers in 'Dhaka', sorted by their name A-Z.
SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM customers
WHERE
    city = 'Dhaka'
ORDER BY
    first_name,
    last_name 


