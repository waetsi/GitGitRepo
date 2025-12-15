-- create the tables, database schema design:

create table Customers(
	customer_id int primary key,
	name text,
	email text unique
);

create table Products(
	product_id int primary key,
	name text,
	price decimal,
	category text
);

create table orders(
	order_id int primary key,
	customer_id int REFERENCES Customers(customer_id),
	order_date date
);

create table orderItems(
	order_item_id int primary key,
	order_id int REFERENCES orders(order_id),
	product_id int REFERENCES products(product_id),
	quantity int
);

-- Data manipulation language
-- insert
-- adding a new product
INSERT INTO products (product_id, name, price, category) VALUES (1001, 'New gadget', 299.99, 'Electronics')

INSERT INTO Customers (customer_id, name, email) VALUES (501, 'Patty Anyanwu', 'pattyaa@gmail.com')

SELECT *
FROM customers
WHERE customer_id > 499;

-- UPDATE
-- updating a customer's email
UPDATE customers 
SET email = 'pattya@gmail.com' 
WHERE name = 'Patty Anyanwu'

-- DELETE
-- Delete a product
DELETE FROM products 
WHERE name = 'New gadget'

-- Deleting orders before a specific Date

SELECT * FROM public.orders
WHERE order_date >= '2022-01-01' and order_date <= '2022-01-31'
ORDER BY order_id;

-- delete the ones in the first week of January
DELETE FROM orderitems 
WHERE order_id 
	IN (SELECT order_id
		FROM orders
		WHERE order_date >= '2022-01-01'
		AND order_date <= '2022-01-07');
DELETE FROM orders 
WHERE order_date >= '2022-01-01' 
AND order_date <=  '2022-01-07'
