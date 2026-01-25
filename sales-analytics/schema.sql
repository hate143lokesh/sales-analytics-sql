create database sales_db;
use sales_db;


-- creating customers tables

create table customers(
customer_id int primary key,
cutomer_name varchar(50) not null,
city  varchar(50),
country varchar(50)
);

-- creating product tables 
create table products (
product_id int primary key,
product_name varchar(50) not null,
category varchar(50),
price decimal(10,2) not null
);

-- creating order tables 

create table orders (
order_id int primary key,
customer_id int ,
order_date date,
foreign key(customer_id) references customers(customer_id)
);

-- creating order_item tables 

create table orders_item (
orders_item_id int primary key,
order_id int,
product_id int,
quantity int not null,
foreign key(order_id) references orders(order_id),
foreign key(product_id) references products(product_id)
);

