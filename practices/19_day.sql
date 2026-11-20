-- Problem 1: Employees earning more than the average salary
SELECT
    CONCAT(employees.first_name,' ',employees.last_name) AS employee_name,
    salary
FROM
    employees
WHERE
    salary <(
        SELECT
             ROUND(AVG(salary),2) AS average_salaries
        FROM
            employees)
ORDER BY
    salary 

---- Problem 2: Products costing more than the average product price
SELECT
    product_name,
    price
FROM
    products
WHERE
    price >(
        SELECT
            ROUND(AVG(price),2) as average_price
        FROM
            Products)
ORDER BY
    price desc

---3.Customers who have placed at least one order
SELECT
    CONCAT(customers.first_name,' ',customers.last_name) AS customer_name,
    customer_id
FROM
    Customers
WHERE
    customer_id  in
           ( SELECT
                customer_id
            FROM
                orders )

-- Problem 4: Employees who are not in the Sales department
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Sales'
);

-- Problem 5: The order with the highest total_amount
SELECT order_id, customer_id, total_amount
FROM orders
WHERE total_amount = (
    SELECT MAX(total_amount)
    FROM orders
)