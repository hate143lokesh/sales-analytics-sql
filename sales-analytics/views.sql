USE sales_db;

CREATE VIEW customer_order_details AS
SELECT
    c.cutomer_name,
    p.product_name,
    oi.quantity,
    o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orders_item oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT * FROM customer_order_details;


-- Revenue View


CREATE VIEW customer_revenue AS
SELECT
    c.cutomer_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orders_item oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.cutomer_name;


SELECT * FROM customer_revenue
ORDER BY total_revenue DESC;

-- Category Revenue View
CREATE VIEW category_revenue AS
SELECT
    p.category,
    SUM(p.price * oi.quantity) AS revenue
FROM orders_item oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

SELECT * FROM category_revenue;

CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_order_id ON orders_item(order_id);
CREATE INDEX idx_product_id ON orders_item(product_id);

SELECT * FROM customers;

