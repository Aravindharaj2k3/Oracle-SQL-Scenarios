-- Customers Table
CREATE TABLE Customers11 (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) ,
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    country VARCHAR(50)
);

-- Products Table
CREATE TABLE Products111 (
    product_id INT PRIMARY KEY ,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2) ,
    stock_quantity INT 
);

-- Stores Table
CREATE TABLE Stores11 (
    store_id INT PRIMARY KEY ,
    store_name VARCHAR(100) ,
    location VARCHAR(100)
);

-- Time Table
CREATE TABLE Time11 (
    time_id INT PRIMARY KEY,
    time_date DATE,
    time_month INT,
    time_quarter INT,
    time_year INT,
    day_of_week VARCHAR(10)
);


-- Sales Table
CREATE TABLE Sales111 (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    store_id INT,
    time_id INT,
    quantity INT ,
    total_amount DECIMAL(10, 2)
);

INSERT INTO Customers11 (customer_id,first_name, last_name, email, phone, address, city, state, zip_code, country) 
VALUES (1,'Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India');

INSERT INTO Customers11 (customer_id,first_name, last_name, email, phone, address, city, state, zip_code, country) 
VALUES (2,'Priya', 'Singh', 'priya.singh@example.com', '9123456789', '456 Park Street', 'Delhi', 'Delhi', '110001', 'India');



INSERT INTO Products111 (product_id,product_name, category, price, stock_quantity) 
VALUES (1,'Widget', 'Gadgets', 19.99, 100);

INSERT INTO Products111 (product_id,product_name, category, price, stock_quantity) 
VALUES (2,'Gizmo', 'Gadgets', 29.99, 50);



INSERT INTO Stores11 (store_id,store_name, location) 
VALUES (1,'Store A', 'Mumbai');

INSERT INTO Stores11 (store_id,store_name, location) 
VALUES (2,'Store B', 'Delhi');

INSERT INTO Time11 (time_id, time_date, time_month, time_quarter, time_year, day_of_week) 
VALUES (1, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 7, 3, 2023, 'Saturday');

INSERT INTO Time11 (time_id, time_date, time_month, time_quarter, time_year, day_of_week) 
VALUES (2, TO_DATE('2023-07-02', 'YYYY-MM-DD'), 7, 3, 2023, 'Sunday');

INSERT INTO Sales111 (sale_id, customer_id, product_id, store_id, time_id, quantity, total_amount) 
VALUES (1, 1, 1, 1, 2, 1, 39.98);

INSERT INTO Sales111 (sale_id, customer_id, product_id, store_id, time_id, quantity, total_amount) 
VALUES (2, 2, 2, 2, 2, 1, 59.98);



select * from customers11;
select * from products111;
select * from stores11;
select * from time11;
select * from sales111;

--------
--Queries
--Total Sales Amount for Each Product
select p.product_name,sum(s.total_amount)as tot_sales_of_each_product
from products111 p
inner join sales111 s on p.product_id = s.product_id
group by  p.product_name;

--Total Sales Amount for Each Store
select ss.store_name,sum(s.total_amount) as tot_sales_of_each_store
from stores11 ss
inner join sales111 s on ss.store_id = s.store_id
group by ss.store_name;

--Total Sales Quantity for Each Product
select p.product_name,sum(s.quantity)as tot_sales_quantity_of_each_product
from products111 p
inner join sales111 s on p.product_id = s.product_id
group by p.product_name;

--Monthly Sales for the Current Year

select t.time_month, sum(s.total_amount)
from time11 t 
inner join sales111 s on t.time_id = s.time_id
where time_year ='2023'
group  by t.time_month;


--Top 5 Customers by Total Sales Amount
select c.first_name as customer_name,sum(s.total_amount) as tot_sales_wise_customer
from customers11 c 
inner join sales111 s on c.customer_id = s.customer_id
group by c.first_name
order by tot_sales_wise_customer desc
fetch first 5 row only;

--Average Order Value per Store

select ss.store_name,avg(s.quantity) as average_order_wise_per_store
from stores11 ss 
inner join sales111 s on ss.store_id = s.store_id
group by ss.store_name;

--Total Sales Amount by Day of the Week

select t.day_of_week,sum(s.total_amount) as total_sales
from time11 t 
join sales111 s on t.time_id = s.time_id
group by t.day_of_week;


--Total Sales Amount for Each Customer
select c.first_name as customer_name,sum(s.total_amount) as tot_sales_wise_customer
from customers11 c 
inner join sales111 s on c.customer_id = s.customer_id
group by c.first_name;

--Total Sales Amount for Each Product in Each Store
select p.product_name,ss.store_name,sum(s.total_amount) as tot_sales_wise_each_product_store
from products111 p 
inner join sales111 s on p.product_id = s.product_id
inner join stores11 ss on s.store_id = ss.store_id
group by p.product_name,ss.store_name;

--Total Sales Amount by Quarter

select t.time_quarter,sum(s.total_amount) as total_sales_wise_quarter
from time11 t 
join sales111 s on t.time_id = s.time_id
group by t.time_quarter;

commit;
