CREATE DATABASE retail_analytics_db;
USE retail_analytics_db;
SELECT DATABASE();

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);




INSERT INTO customers (customer_name, city, country) VALUES
('Rahul Sharma','Delhi','India'),
('Amit Verma','Mumbai','India'),
('Priya Singh','Bangalore','India'),
('Sneha Kapoor','Chennai','India'),
('Arjun Mehta','Pune','India'),
('Neha Reddy','Hyderabad','India'),
('Vikas Jain','Kolkata','India'),
('Anjali Gupta','Jaipur','India'),
('Rohan Das','Lucknow','India'),
('Meera Iyer','Ahmedabad','India'),
('Karan Malhotra','Delhi','India'),
('Simran Kaur','Chandigarh','India'),
('Aditya Rao','Hyderabad','India'),
('Pooja Nair','Kochi','India'),
('Nikhil Shah','Surat','India'),
('Divya Sinha','Patna','India'),
('Manish Tiwari','Bhopal','India'),
('Ritika Arora','Noida','India'),
('Sahil Khanna','Gurgaon','India'),
('Tanvi Desai','Mumbai','India');

INSERT INTO products (product_name, category, price) VALUES
('Gaming Laptop','Electronics',85000),
('Smart Watch','Electronics',12000),
('Tablet','Electronics',30000),
('LED Monitor','Electronics',15000),
('Office Desk','Furniture',18000),
('Sofa Set','Furniture',45000),
('Refrigerator','Home Appliances',28000),
('Microwave Oven','Home Appliances',12000),
('Air Conditioner','Home Appliances',40000),
('Formal Shoes','Fashion',3500),
('Jacket','Fashion',4500),
('Travel Backpack','Accessories',2500),
('Ceiling Fan','Home Appliances',3000),
('Study Lamp','Home',1500),
('Coffee Maker','Home Appliances',6000);



DELIMITER $$

CREATE PROCEDURE generate_orders()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE random_customer INT;
    DECLARE random_product INT;
    DECLARE random_qty INT;
    DECLARE random_date DATE;
    DECLARE items_count INT;

    WHILE i <= 200 DO

        SET random_customer = FLOOR(1 + (RAND()*20));

        IF RAND() < 0.35 THEN
            SET random_date = DATE_ADD('2024-10-01', INTERVAL FLOOR(RAND()*90) DAY);
        ELSE
            SET random_date = DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND()*270) DAY);
        END IF;

        INSERT INTO orders (customer_id, order_date)
        VALUES (random_customer, random_date);

        SET @last_order_id = LAST_INSERT_ID();

        SET items_count = FLOOR(1 + (RAND()*3));

        WHILE items_count > 0 DO
            SET random_product = FLOOR(1 + (RAND()*15));
            SET random_qty = FLOOR(1 + (RAND()*5));

            INSERT INTO order_items (order_id, product_id, quantity)
            VALUES (@last_order_id, random_product, random_qty);

            SET items_count = items_count - 1;
        END WHILE;

        SET i = i + 1;

    END WHILE;

END$$

DELIMITER ;

CALL generate_orders();
DROP PROCEDURE generate_orders;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
USE retail_analytics_db;
SELECT DATABASE();

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;

USE retail_analytics_db;

INSERT INTO orders (customer_id, order_date)
SELECT 
    FLOOR(1 + (RAND()*20)),
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND()*365) DAY)
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
     UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
     UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15
     UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20
     UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25
     UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 UNION SELECT 30
     UNION SELECT 31 UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 UNION SELECT 35
     UNION SELECT 36 UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 UNION SELECT 40
     UNION SELECT 41 UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 UNION SELECT 45
     UNION SELECT 46 UNION SELECT 47 UNION SELECT 48 UNION SELECT 49 UNION SELECT 50
     UNION SELECT 51 UNION SELECT 52 UNION SELECT 53 UNION SELECT 54 UNION SELECT 55
     UNION SELECT 56 UNION SELECT 57 UNION SELECT 58 UNION SELECT 59 UNION SELECT 60
     UNION SELECT 61 UNION SELECT 62 UNION SELECT 63 UNION SELECT 64 UNION SELECT 65
     UNION SELECT 66 UNION SELECT 67 UNION SELECT 68 UNION SELECT 69 UNION SELECT 70
     UNION SELECT 71 UNION SELECT 72 UNION SELECT 73 UNION SELECT 74 UNION SELECT 75
     UNION SELECT 76 UNION SELECT 77 UNION SELECT 78 UNION SELECT 79 UNION SELECT 80
     UNION SELECT 81 UNION SELECT 82 UNION SELECT 83 UNION SELECT 84 UNION SELECT 85
     UNION SELECT 86 UNION SELECT 87 UNION SELECT 88 UNION SELECT 89 UNION SELECT 90
     UNION SELECT 91 UNION SELECT 92 UNION SELECT 93 UNION SELECT 94 UNION SELECT 95
     UNION SELECT 96 UNION SELECT 97 UNION SELECT 98 UNION SELECT 99 UNION SELECT 100
     UNION SELECT 101 UNION SELECT 102 UNION SELECT 103 UNION SELECT 104 UNION SELECT 105
     UNION SELECT 106 UNION SELECT 107 UNION SELECT 108 UNION SELECT 109 UNION SELECT 110
     UNION SELECT 111 UNION SELECT 112 UNION SELECT 113 UNION SELECT 114 UNION SELECT 115
     UNION SELECT 116 UNION SELECT 117 UNION SELECT 118 UNION SELECT 119 UNION SELECT 120
     UNION SELECT 121 UNION SELECT 122 UNION SELECT 123 UNION SELECT 124 UNION SELECT 125
     UNION SELECT 126 UNION SELECT 127 UNION SELECT 128 UNION SELECT 129 UNION SELECT 130
     UNION SELECT 131 UNION SELECT 132 UNION SELECT 133 UNION SELECT 134 UNION SELECT 135
     UNION SELECT 136 UNION SELECT 137 UNION SELECT 138 UNION SELECT 139 UNION SELECT 140
     UNION SELECT 141 UNION SELECT 142 UNION SELECT 143 UNION SELECT 144 UNION SELECT 145
     UNION SELECT 146 UNION SELECT 147 UNION SELECT 148 UNION SELECT 149 UNION SELECT 150
     UNION SELECT 151 UNION SELECT 152 UNION SELECT 153 UNION SELECT 154 UNION SELECT 155
     UNION SELECT 156 UNION SELECT 157 UNION SELECT 158 UNION SELECT 159 UNION SELECT 160
     UNION SELECT 161 UNION SELECT 162 UNION SELECT 163 UNION SELECT 164 UNION SELECT 165
     UNION SELECT 166 UNION SELECT 167 UNION SELECT 168 UNION SELECT 169 UNION SELECT 170
     UNION SELECT 171 UNION SELECT 172 UNION SELECT 173 UNION SELECT 174 UNION SELECT 175
     UNION SELECT 176 UNION SELECT 177 UNION SELECT 178 UNION SELECT 179 UNION SELECT 180
     UNION SELECT 181 UNION SELECT 182 UNION SELECT 183 UNION SELECT 184 UNION SELECT 185
     UNION SELECT 186 UNION SELECT 187 UNION SELECT 188 UNION SELECT 189 UNION SELECT 190
     UNION SELECT 191 UNION SELECT 192 UNION SELECT 193 UNION SELECT 194 UNION SELECT 195
     UNION SELECT 196 UNION SELECT 197 UNION SELECT 198 UNION SELECT 199 UNION SELECT 200
    ) AS temp;
    
    INSERT INTO order_items (order_id, product_id, quantity)
SELECT 
    o.order_id,
    FLOOR(1 + (RAND()*15)),
    FLOOR(1 + (RAND()*5))
FROM orders o;

SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;


CREATE VIEW sales_summary AS
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT * FROM sales_summary LIMIT 10;

