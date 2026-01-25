USE sales_db;

-- =====================================================
-- BASIC CHECK QUERIES
-- =====================================================

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orders_item;

-- =====================================================
-- SELECT SPECIFIC COLUMNS
-- =====================================================

SELECT customer_name, city
FROM customers;

SELECT product_name, price
FROM products;

-- =====================================================
-- FILTERING QUERIES
-- =====================================================

-- Customers from India
SELECT *
FROM customers
WHERE country = 'India';

-- Products above 20000
SELECT *
FROM products
WHERE price > 20000;

-- Orders by customer 1
SELECT *
FROM orders
WHERE customer_id = 1;

-- Electronics products above 30000 (case-safe)
SELECT *
FROM products
WHERE UPPER(category) = 'ELECTRONICS'
  AND price > 30000;

-- Customers from Delhi or Mumbai (case-safe)
SELECT *
FROM customers
WHERE UPPER(city) IN ('DELHI', 'MUMBAI');

-- =====================================================
-- ORDER BY & LIMIT
-- =====================================================

SELECT *
FROM products
ORDER BY price;

SELECT *
FROM products
ORDER BY price DESC;

SELECT *
FROM products
ORDER BY price DESC
LIMIT 2;

-- =====================================================
-- JOINS
-- =====================================================

-- Customer → Orders
SELECT
    c.cutomer_name,
    o.order_id,
    o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Orders → Order Items → Products
SELECT
    o.order_id,
    p.product_name,
    oi.quantity
FROM orders o
JOIN orders_item oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Customer + Product + Quantity + Date
SELECT
    c.cutomer_name,
    p.product_name,
    oi.quantity,
    o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orders_item oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- =====================================================
-- REVENUE CALCULATIONS (NULL SAFE)
-- =====================================================

-- Revenue per product per customer
SELECT
    c.cutomer_name,
    p.product_name,
    (COALESCE(p.price,0) * COALESCE(oi.quantity,0)) AS total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orders_item oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Total Revenue
SELECT
    SUM(COALESCE(p.price,0) * COALESCE(oi.quantity,0)) AS total_revenue
FROM orders_item oi
JOIN products p ON oi.product_id = p.product_id;

-- Revenue per customer
SELECT
    c.customer_name,
    SUM(COALESCE(p.price,0) * COALESCE(oi.quantity,0)) AS revenue
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN orders_item oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

-- =====================================================
-- BUSINESS INSIGHTS
-- =====================================================

-- Top customers (spent more than 30000)
SELECT
    c.customer_id,
    c.customer_name,
    SUM(COALESCE(p.price,0) * COALESCE(oi.quantity,0)) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN orders_item oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spent > 30000
ORDER BY total_spent DESC;

-- Best-selling products
SELECT
    p.product_id,
    p.product_name,
    COALESCE(SUM(oi.quantity),0) AS total_quantity_sold
FROM products p
LEFT JOIN orders_item oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

-- High-value orders
SELECT
    o.order_id,
    c.customer_name,
    SUM(COALESCE(p.price,0) * COALESCE(oi.quantity,0)) AS order_value
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN orders_item oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id, c.customer_name
ORDER BY order_value DESC;

-- =====================================================
-- HIGH-VALUE ORDERS USING SUBQUERY
-- =====================================================

SELECT
    order_id,
    order_value
FROM (
    SELECT
        o.order_id,
        SUM(COALESCE(p.price,0) * COALESCE(oi.quantity,0)) AS order_value
    FROM orders o
    JOIN orders_item oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id
) AS order_totals
WHERE order_value >
(
    SELECT AVG(order_value)
    FROM (
        SELECT
            SUM(COALESCE(p.price,0) * COALESCE(oi.quantity,0)) AS order_value
        FROM orders o
        JOIN orders_item oi ON o.order_id = oi.order_id
        JOIN products p ON oi.product_id = p.product_id
        GROUP BY o.order_id
    ) AS avg_orders
);

-- =====================================================
-- TOP 3 CUSTOMERS
-- =====================================================

SELECT
    c.customer_name,
    SUM(COALESCE(p.price,0) * COALESCE(oi.quantity,0)) AS revenue
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN orders_item oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 3;

-- =====================================================
-- PRODUCTS THAT NEVER SOLD
-- =====================================================

SELECT product_id, product_name
FROM products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id
    FROM orders_item
);
