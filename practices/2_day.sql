--Find all employees whose department is 'Sales'.
SELECT first_name, last_name, salary
FROM employees
WHERE department_id = (
    SELECT department_id FROM departments
    WHERE department_name = 'Sales'
);


--Find all customers who live in the city 'Dhaka'.
SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM customers
WHERE
    city = 'Dhaka'

--Find all orders placed after January 1, 2024.
SELECT
    order_id,
    order_date
FROM orders
WHERE
    order_date > '2024-01-01';

-- Find all employees whose salary is between 30000 and 60000 (use BETWEEN).
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE
    salary  BETWEEN 30000 and 60000