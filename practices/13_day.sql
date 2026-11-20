-- Problem 1: First and last names in UPPER case

SELECT UPPER(first_name) AS first_name_upper,
       UPPER(last_name)  AS last_name_upper
FROM employees;

-- Problem 2: Product names in lower case
SELECT LOWER(product_name) AS product_name_lower
FROM products;

-- Problem 3: First 3 characters of each customer's last name
SELECT last_name,
       LEFT(last_name, 3) AS first_3_chars
FROM customers;

-- Problem 4: Full name in one column
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;