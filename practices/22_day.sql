---- Problem 1: Each order with the previous order's amount
SELECT
    order_id,
    order_date,
    total_amount,
LAG(total_amount)
OVER(ORDER BY order_date) AS previous_amount
FROM
    orders
ORDER BY
    order_date

---- Problem 2: Running total of total_amount by date
SELECT
    order_id,
    order_date,
    total_amount,
SUM(total_amount)
OVER(ORDER BY order_date) AS total_amount
FROM
    orders
ORDER BY
    order_date

-- Problem 3: Each employee's salary next to their department's average
SELECT
    department_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    salary,
    ROUND(
        AVG(salary) OVER (
            PARTITION BY department_id
        ), 2
    ) AS average_department_salary
FROM employees
ORDER BY
    department_id,
    salary DESC;

-- Problem 4: Each order as a percentage of all revenue
SELECT order_id, total_amount,
       ROUND(100.0 * total_amount / SUM(total_amount) OVER (), 2) AS percent_of_revenue
FROM orders
ORDER BY order_id, percent_of_revenue DESC;

-- Problem 5: Change from the same customer's previous order
SELECT customer_id, order_id, order_date, total_amount,
       total_amount - LAG(total_amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS change_from_previous
FROM orders
ORDER BY customer_id, order_date;