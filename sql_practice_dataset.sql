-- ============================================================
--  SQL PRACTICE DATASET  —  30-Day Course
--  Works with: MySQL, PostgreSQL, SQLite, SQL Server
--  Paste into: https://sqliteonline.com  OR  https://dbfiddle.uk
-- ============================================================

-- ============================================================
--  TABLE 1: departments
-- ============================================================
CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(50),
    location        VARCHAR(50)
);

INSERT INTO departments VALUES
(1,  'Sales',     'Dhaka'),
(2,  'IT',        'Dhaka'),
(3,  'HR',        'Chittagong'),
(4,  'Finance',   'Dhaka'),
(5,  'Marketing', 'Sylhet'),
(6,  'Logistics', 'Khulna');

-- ============================================================
--  TABLE 2: employees
-- ============================================================
CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    department_id INT,
    manager_id    INT,
    salary        DECIMAL(10,2),
    hire_date     DATE,
    phone         VARCHAR(20),
    employment_type VARCHAR(20)
);

INSERT INTO employees VALUES
(1,  'Rahim',    'Uddin',     1, NULL, 75000, '2019-03-10', '01711-000001', 'Full-Time'),
(2,  'Karim',    'Hossain',   1, 1,    45000, '2020-07-15', '01711-000002', 'Full-Time'),
(3,  'Sumaiya',  'Begum',     1, 1,    52000, '2021-01-20', NULL,           'Full-Time'),
(4,  'Tariq',    'Islam',     2, NULL, 85000, '2018-06-01', '01711-000004', 'Full-Time'),
(5,  'Nasrin',   'Akter',     2, 4,    60000, '2022-03-11', '01711-000005', 'Full-Time'),
(6,  'Jahangir', 'Khan',      2, 4,    58000, '2021-09-05', NULL,           'Full-Time'),
(7,  'Parveen',  'Sultana',   3, NULL, 48000, '2020-11-01', '01711-000007', 'Full-Time'),
(8,  'Monir',    'Chowdhury', 3, 7,    35000, '2023-02-14', '01711-000008', 'Part-Time'),
(9,  'Dilnoza',  'Rahman',    4, NULL, 90000, '2017-04-22', '01711-000009', 'Full-Time'),
(10, 'Arif',     'Mahmud',    4, 9,    55000, '2022-08-30', '01711-000010', 'Full-Time'),
(11, 'Sadia',    'Islam',     5, NULL, 62000, '2020-05-17', NULL,           'Full-Time'),
(12, 'Rashed',   'Ali',       5, 11,   40000, '2023-06-01', '01711-000012', 'Full-Time'),
(13, 'Farhana',  'Yesmin',    6, NULL, 44000, '2021-12-10', '01711-000013', 'Full-Time'),
(14, 'Imran',    'Hasan',     6, 13,   38000, '2024-01-15', NULL,           'Part-Time'),
(15, 'Nusrat',   'Jahan',     1, 1,    47000, '2024-03-01', '01711-000015', 'Full-Time');

-- ============================================================
--  TABLE 3: categories
-- ============================================================
CREATE TABLE categories (
    category_id   INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home & Kitchen'),
(5, 'Sports'),
(6, 'Stationery');

-- ============================================================
--  TABLE 4: products
-- ============================================================
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id  INT,
    price        DECIMAL(10,2),
    stock        INT,
    description  VARCHAR(200)
);

INSERT INTO products VALUES
(1,  'Laptop Pro 15',      1, 850.00,  30,  'High-performance laptop'),
(2,  'Wireless Mouse',     1, 25.00,   150, 'Ergonomic wireless mouse'),
(3,  'USB-C Hub',          1, 45.00,   80,  'Multi-port USB-C hub'),
(4,  'Smartphone X12',     1, 620.00,  50,  'Latest Android smartphone'),
(5,  'Headphones Pro',     1, 110.00,  60,  'Noise cancelling headphones'),
(6,  'Cotton T-Shirt',     2, 12.00,   200, NULL),
(7,  'Formal Shirt',       2, 28.00,   120, 'Slim fit formal shirt'),
(8,  'Denim Jeans',        2, 35.00,   90,  NULL),
(9,  'Winter Jacket',      2, 75.00,   40,  'Warm winter jacket'),
(10, 'Learn SQL Fast',     3, 18.00,   300, 'Beginner SQL textbook'),
(11, 'Python Mastery',     3, 22.00,   250, 'Python programming guide'),
(12, 'Data Science 101',   3, 30.00,   180, NULL),
(13, 'Rice Cooker 5L',     4, 55.00,   70,  'Electric rice cooker'),
(14, 'Non-Stick Pan Set',  4, 40.00,   55,  '3-piece pan set'),
(15, 'Blender Pro',        4, 65.00,   45,  NULL),
(16, 'Cricket Bat',        5, 48.00,   35,  'Professional cricket bat'),
(17, 'Football',           5, 20.00,   100, 'Size 5 football'),
(18, 'Yoga Mat',           5, 15.00,   80,  NULL),
(19, 'Notebook A4 (Pack)', 6, 8.00,   500,  'Pack of 5 notebooks'),
(20, 'Ballpen Box',        6, 5.00,   400,  'Box of 12 ballpens');

-- ============================================================
--  TABLE 5: customers
-- ============================================================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(100),
    city        VARCHAR(50),
    country     VARCHAR(50),
    phone       VARCHAR(20)
);

INSERT INTO customers VALUES
(1,  'Abdullah', 'Mamun',    'abdullah@email.com',  'Dhaka',      'Bangladesh', '01811-111001'),
(2,  'Fatema',   'Khatun',   'fatema@email.com',    'Chittagong', 'Bangladesh', '01811-111002'),
(3,  'Samir',    'Das',      'samir@email.com',     'Dhaka',      'Bangladesh', NULL),
(4,  'Riya',     'Sharma',   'riya@email.com',      'Sylhet',     'Bangladesh', '01811-111004'),
(5,  'Jakaria',  'Ahmed',    'jakaria@email.com',   'Dhaka',      'Bangladesh', '01811-111005'),
(6,  'Mitu',     'Roy',      NULL,                  'Khulna',     'Bangladesh', '01811-111006'),
(7,  'Tanvir',   'Hossain',  'tanvir@email.com',    'Dhaka',      'Bangladesh', '01811-111007'),
(8,  'Priya',    'Sen',      'priya@email.com',     'Rajshahi',   'Bangladesh', NULL),
(9,  'Nipu',     'Akhter',   'nipu@email.com',      'Dhaka',      'Bangladesh', '01811-111009'),
(10, 'Rafiq',    'Mia',      'rafiq@email.com',     'Comilla',    'Bangladesh', '01811-111010'),
(11, 'Israt',    'Jahan',    NULL,                  'Dhaka',      'Bangladesh', '01811-111011'),
(12, 'Kawsar',   'Alam',     'kawsar@email.com',    'Chittagong', 'Bangladesh', '01811-111012');

-- ============================================================
--  TABLE 6: orders
-- ============================================================
CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date  DATE,
    shipped_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1,  1,  2,  '2023-02-10', '2023-02-13', 875.00),
(2,  3,  2,  '2023-04-22', '2023-04-25', 45.00),
(3,  5,  3,  '2023-06-15', '2023-06-18', 660.00),
(4,  2,  2,  '2023-08-01', NULL,          130.00),
(5,  1,  3,  '2023-09-20', '2023-09-23', 110.00),
(6,  7,  15, '2023-11-05', '2023-11-08', 55.00),
(7,  4,  2,  '2023-12-12', '2023-12-15', 226.00),
(8,  9,  3,  '2024-01-08', '2024-01-11', 48.00),
(9,  5,  15, '2024-02-14', '2024-02-17', 850.00),
(10, 1,  2,  '2024-03-01', '2024-03-04', 33.00),
(11, 3,  3,  '2024-04-10', NULL,          620.00),
(12, 6,  15, '2024-05-22', '2024-05-25', 75.00),
(13, 7,  2,  '2024-06-30', '2024-07-03', 40.00),
(14, 9,  3,  '2024-07-15', '2024-07-18', 200.00),
(15, 10, 2,  '2024-08-20', NULL,          26.00),
(16, 11, 15, '2024-09-05', '2024-09-08', 18.00),
(17, 2,  3,  '2024-10-01', '2024-10-04', 63.00),
(18, 1,  2,  '2024-11-11', '2024-11-14', 130.00),
(19, 5,  15, '2024-12-25', NULL,          45.00),
(20, 8,  3,  '2025-01-10', '2025-01-13', 960.00);

-- ============================================================
--  TABLE 7: order_items
-- ============================================================
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    unit_price    DECIMAL(10,2)
);

INSERT INTO order_items VALUES
(1,  1,  1,  1,  850.00),
(2,  1,  2,  1,  25.00),
(3,  2,  3,  1,  45.00),
(4,  3,  4,  1,  620.00),
(5,  3,  17, 2,  20.00),
(6,  4,  9,  1,  75.00),
(7,  4,  7,  2,  28.00),
(8,  5,  5,  1,  110.00),
(9,  6,  13, 1,  55.00),
(10, 7,  11, 2,  22.00),
(11, 7,  10, 1,  18.00),
(12, 7,  12, 1,  30.00),
(13, 7,  19, 4,  8.00),
(14, 8,  16, 1,  48.00),
(15, 9,  1,  1,  850.00),
(16, 10, 20, 1,  5.00),
(17, 10, 19, 2,  8.00),
(18, 10, 20, 1,  5.00),
(19, 11, 4,  1,  620.00),
(20, 12, 9,  1,  75.00),
(21, 13, 14, 1,  40.00),
(22, 14, 2,  2,  25.00),
(23, 14, 18, 3,  15.00),
(24, 14, 20, 5,  5.00),
(25, 15, 20, 1,  5.00),
(26, 15, 19, 1,  8.00),
(27, 16, 10, 1,  18.00),
(28, 17, 8,  1,  35.00),
(29, 17, 18, 1,  15.00),
(30, 18, 5,  1,  110.00),
(31, 18, 19, 2,  8.00),
(32, 19, 3,  1,  45.00),
(33, 20, 1,  1,  850.00),
(34, 20, 5,  1,  110.00);

-- ============================================================
--  QUICK PREVIEW — run these to check tables loaded correctly
-- ============================================================
 SELECT * FROM departments;
 SELECT * FROM employees;
 SELECT * FROM categories;
 SELECT * FROM products;
 SELECT * FROM customers;
 SELECT * FROM orders;
 SELECT * FROM order_items;

