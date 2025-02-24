create database homework_11
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');


INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2024-10-01', 200.00),
(2, 1, '2024-10-05', 150.00),
(3, 2, '2024-10-07', 300.00),
(4, 2, '2024-10-08', 100.00),
(5, 3, '2024-10-09', 500.00);

--Using the customers and orders tables below, write a query to find the total amount spent by each customer. Include only those customers who have placed at least one order.

select * from customers
select * from orders

select customers.customer_name, sum(orders.total_amount) as total_amount
from customers inner join orders
on
customers.customer_id = orders.customer_id
group by customers.customer_name

select AVG(total_amount) as avg_amount from orders

select c.customer_name 
from customers c inner join orders o
on
o.customer_id = c.customer_id
group by c.customer_name
having sum(o.total_amount) > avg(o.total_amount)




