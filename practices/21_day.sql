-- Problem 1: Rank employees by salary within their department
SELECT
    first_name,
    last_name,
    department_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees
ORDER BY
    department_id,
    salary_rank

-- Problem 2: Row number per customer, ordered by order_date
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_number
FROM orders
ORDER BY
    customer_id,
    order_number

---- Problem 3: Each customer's most recent order
WITH numbered_orders AS (
    SELECT customer_id, order_id, order_date, total_amount,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY order_date DESC
           ) AS recency
    FROM orders
)
SELECT customer_id, order_id, order_date, total_amount
FROM numbered_orders
WHERE recency = 1
ORDER BY customer_id

-- Problem 4: Top 2 highest-paid employees in each department
WITH ranked_employees AS (
    SELECT first_name, last_name, department_id, salary,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_position
    FROM employees
)
SELECT first_name, last_name, department_id, salary, salary_position
FROM ranked_employees
WHERE salary_position <= 2
ORDER BY department_id, salary_position;

-- Problem 5: Rank products by price within their category
SELECT product_name, category_id, price,
       RANK() OVER (
           PARTITION BY category_id
           ORDER BY price DESC
       ) AS price_rank
FROM products
ORDER BY category_id, price_rank;