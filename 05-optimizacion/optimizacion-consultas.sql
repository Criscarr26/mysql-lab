/*Tarea 1*/
use tienda;
create table products(
id INT PRIMARY KEY,
nombre VARCHAR (10),
category_id INT, 
price DECIMAL,
stock INT 
);

create table categories(
id INT PRIMARY KEY,
nombre VARCHAR(10)
);

create table orders(
id INT PRIMARY KEY, 
order_date DATE, 
customer_id INT
); 

create table order_items(
id INT PRIMARY KEY, 
order_id INT, 
product_id INT, 
quantity INT
);

/*Consulta Original: */
/*La siguiente consulta obtiene el total de ventas por categoría en un año específico:*/
/*sin el explain*/
SELECT c.nombre, SUM(oi.quantity * p.price) AS total_sales
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
WHERE YEAR(o.order_date) = 2023
GROUP BY c.nombre;

/*tarea,sin el explain*/
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_products_category_id ON products(category_id);

SELECT c.nombre AS category_name, SUM(oi.quantity * p.price) AS total_sales
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
WHERE o.order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.nombre;

/*consulta original, con el explain*/
EXPLAIN SELECT c.nombre, SUM(oi.quantity * p.price) AS total_sales
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
WHERE YEAR(o.order_date) = 2023
GROUP BY c.nombre;

/*con el explain*/
EXPLAIN SELECT c.nombre AS category_name, SUM(oi.quantity * p.price) AS total_sales
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
WHERE o.order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.nombre;


/*Tarea 2*/
/*Tienes una base de datos para una red social con las siguientes tablas:*/
create database Social;
use social;
create table users( 
id INT PRIMARY KEY, 
username VARCHAR (25), 
created_at DATE
);

 create table posts(  
id INT PRIMARY KEY, 
user_id INT,
content TEXT, 
created_at DATETIME
);

 create table likes( 
id INT PRIMARY KEY, 
post_id INT, 
user_id INT, 
created_at DATETIME
);

/*Consulta Original:*/ 
/*o La siguiente consulta obtiene los usuarios con el mayor número de "me gusta" en sus 
publicaciones en el último mes:*/ 

SELECT u.username, COUNT(l.id) AS like_count 
FROM users u 
JOIN posts p ON u.id = p.user_id 
JOIN likes l ON p.id = l.post_id 
WHERE l.created_at >= '2023-06-01' AND l.created_at < '2023-07-01' 
GROUP BY u.username 
ORDER BY like_count DESC;

EXPLAIN SELECT u.username, COUNT(l.id) AS like_count
FROM users u
JOIN posts p ON u.id = p.user_id
JOIN likes l ON p.id = l.post_id
WHERE l.created_at >= '2023-06-01' AND l.created_at < '2023-07-01'
GROUP BY u.username
ORDER BY like_count DESC;

CREATE INDEX idx_likes_created_at ON likes(created_at);
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_likes_post_id ON likes(post_id);

SELECT u.username, COUNT(l.id) AS like_count
FROM users u
JOIN posts p ON u.id = p.user_id
JOIN likes l ON p.id = l.post_id
WHERE l.created_at BETWEEN '2023-06-01' AND '2023-06-30'
GROUP BY u.username
ORDER BY like_count DESC;

EXPLAIN SELECT u.username, COUNT(l.id) AS like_count
FROM users u
JOIN posts p ON u.id = p.user_id
JOIN likes l ON p.id = l.post_id
WHERE l.created_at BETWEEN '2023-06-01' AND '2023-06-30'
GROUP BY u.username
ORDER BY like_count DESC;
