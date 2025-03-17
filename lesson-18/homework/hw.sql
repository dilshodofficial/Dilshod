--create database hw_18
--use hw_19


----1 exercise---
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select * from Employees;

select * from employees where salary = (select  min(salary) from employees);


---2 exercise---
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);

select * from products where price > (select avg(price) from products)

---exercise 3--

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100),
	department_id INT
);

CREATE TABLE employeess (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name, department_id) VALUES
(1, 'Sales', 1),
(2, 'HR', 2);

INSERT INTO employeess (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);

select * from departments
select * from employeess

select * from employeess e
where exists (select 1 from departments d
where e.department_id = d.department_id and department_name = 'sales')

----exercise 4---
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);

select * from orders
select * from customers

select * from customers c
where not exists (select 1 from orders o
where o.customer_id = c.customer_id)

---5 execise--

CREATE TABLE productss (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO productss (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

select * from productss


select * from productss p1
where price = (select max(price) from productss p2
where p2.category_id = p1.category_id)

----6 exercise--
CREATE TABLE departmentsss (
    id INT PRIMARY KEY,
    department_name VARCHAR(100),
	department_id INT
);

CREATE TABLE employeeees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO departmentsss (id, department_name, department_id) VALUES
(1, 'IT', 1),
(2, 'Sales', 2);

INSERT INTO employeeees (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

select * from departmentsss
select * from employeeees

select * from employeeees where department_id = (
select top 1 department_id from employeeees
group by department_id order by avg(salary) desc
)

---7 exercise---
CREATE TABLE employeez (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employeez (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);

select * from departments
select * from employeez


select * from employeez e3
where salary > (select Avg(salary) from employeez e4
where e3.department_id = e4.department_id
)


----8 exercise--
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);

select * from students
select * from grades

select max(grade) from grades

select * from employeeees where department_id = (
select top 1 department_id from employeeees
group by department_id order by avg(salary) desc
)

select * from grades g1
where grade = (select max(grade) from grades g2
where g1.course_id = g2.course_id)



--- 9 exercise----
CREATE TABLE productsss (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INt
);

INSERT INTO productsss (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);

select * from productsss

