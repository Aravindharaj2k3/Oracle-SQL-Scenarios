


-- Manufacturers Table
CREATE TABLE Manufacturers (
    manufacturer_id INT PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    country VARCHAR(50)
);

-- Medicines Table
CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY,
    manufacturer_id INT,
    medicine_name VARCHAR(100),
    supplier_id INT,
    category VARCHAR(50),
    price DECIMAL(10, 2) ,
    stock_quantity INT ,
    expiry_date DATE
);

-- Suppliers Table
CREATE TABLE Suppliers1 (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_name VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    country VARCHAR(50)
);

-- Customers Table
CREATE TABLE Customers10 (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    country VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders10 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    status VARCHAR(50),
    total_amount DECIMAL(10, 2) NOT NULL
);
drop table orders10;
-- OrderDetails Table
CREATE TABLE OrderDetails10 (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    medicine_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Production Table
CREATE TABLE Production10 (
    production_id INT PRIMARY KEY,
    medicine_id INT,
    batch_number VARCHAR(50) NOT NULL,
    production_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    quantity_produced INT NOT NULL
);
drop table production10;
-- Ingredients Table
CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY,
    medicine_id INT,
    ingredient_name VARCHAR(100) NOT NULL,
    quantity DECIMAL(10, 2) NOT NULL,
    unit VARCHAR(20) NOT NULL
);
drop table ingredients;

-- Insert sample data into Manufacturers
INSERT ALL
    INTO Manufacturers (manufacturer_id, manufacturer_name, contact_name, phone, address, city, state, zip_code, country)
    VALUES (1, 'Pharma Manufacturing Co.', 'John Doe', '9876543210', '123 Pharma St', 'Mumbai', 'Maharashtra', '400001', 'India')
    INTO Manufacturers (manufacturer_id, manufacturer_name, contact_name, phone, address, city, state, zip_code, country)
    VALUES (2, 'Medicare Industries', 'Jane Smith', '9123456789', '456 Health Rd', 'Delhi', 'Delhi', '110001', 'India')
SELECT * FROM dual;

-- Insert sample data into Medicines
INSERT ALL
    INTO Medicines (medicine_id, manufacturer_id, medicine_name, category, price, stock_quantity, expiry_date)
    VALUES (1, 1, 'Paracetamol', 'Pain Relief', 1.99, 100, TO_DATE('2024-12-31', 'YYYY-MM-DD'))
    INTO Medicines (medicine_id, manufacturer_id, medicine_name, category, price, stock_quantity, expiry_date)
    VALUES (2, 2, 'Ibuprofen', 'Pain Relief', 2.99, 50, TO_DATE('2025-06-30', 'YYYY-MM-DD'))
SELECT * FROM dual;


-- Insert sample data into Suppliers
INSERT ALL
    INTO Suppliers1 (supplier_id, supplier_name, contact_name, phone, address, city, state, zip_code, country)
    VALUES (1, 'Health Suppliers Inc.', 'John Doe', '9876543210', '123 Medical Blvd', 'Mumbai', 'Maharashtra', '400001', 'India')
    INTO Suppliers1 (supplier_id, supplier_name, contact_name, phone, address, city, state, zip_code, country)
    VALUES (2, 'Pharma Distributors Ltd.', 'Jane Smith', '9123456789', '456 Wellness St', 'Delhi', 'Delhi', '110001', 'India')
SELECT * FROM dual;

-- Insert sample data into Customers
INSERT ALL
    INTO Customers10 (customer_id, first_name, last_name, email, phone, address, city, state, zip_code, country)
    VALUES (1, 'Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India')
    INTO Customers10 (customer_id, first_name, last_name, email, phone, address, city, state, zip_code, country)
    VALUES (2, 'Priya', 'Singh', 'priya.singh@example.com', '9123456789', '456 Park Street', 'Delhi', 'Delhi', '110001', 'India')
SELECT * FROM dual;

-- Insert sample data into Orders
INSERT ALL
    INTO Orders10 (order_id, customer_id, order_date, status, total_amount)
    VALUES (1, 1, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 'Pending', 39.98)
    INTO Orders10 (order_id, customer_id, order_date, status, total_amount)
    VALUES (2, 2, TO_DATE('2023-07-02', 'YYYY-MM-DD'), 'Shipped', 59.98)
SELECT * FROM dual;


-- Insert sample data into OrderDetails
INSERT ALL
    INTO OrderDetails10 (order_detail_id, order_id, medicine_id, quantity, price)
    VALUES (1, 1, 1, 2, 1.99)
    INTO OrderDetails10 (order_detail_id, order_id, medicine_id, quantity, price)
    values (2,2,2,3,1.455)
    select * from dual;
    
 --insert the production10   
INSERT ALL
    INTO Production10 (production_id, medicine_id, batch_number, production_date, expiry_date, quantity_produced)
    VALUES (1, 1, 'BATCH001', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), 1000)
    INTO Production10 (production_id, medicine_id, batch_number, production_date, expiry_date, quantity_produced)
    VALUES (2, 2, 'BATCH002', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2025-06-30', 'YYYY-MM-DD'), 500)
SELECT * FROM dual;


-- Insert sample data into Ingredients
INSERT ALL
    INTO Ingredients (ingredient_id, medicine_id, ingredient_name, quantity, unit)
    VALUES (1, 1, 'Acetaminophen', 500, 'mg')
    INTO Ingredients (ingredient_id, medicine_id, ingredient_name, quantity, unit)
    VALUES (2, 1, 'Inactive Ingredient 1', 50, 'mg')
    INTO Ingredients (ingredient_id, medicine_id, ingredient_name, quantity, unit)
    VALUES (3, 2, 'Ibuprofen', 400, 'mg')
    INTO Ingredients (ingredient_id, medicine_id, ingredient_name, quantity, unit)
    VALUES (4, 2, 'Inactive Ingredient 2', 50, 'mg')
 select * from dual; 
 
    
---Display the values 

select * from Manufacturers;
select * from medicines;
select * from suppliers1;
select * from customers10;
select * from orders10;
select * from orderdetails10;
select * from production10;
select * from Ingredients ;


--Total Sales Amount for Each Medicine

select m.medicine_name,(od.price*od.quantity) as total_sales
from medicines m
inner join orderdetails10 od on m.medicine_id = od.medicine_id
group by m.medicine_name,(od.price*od.quantity);

select m.medicine_name,sum(o.total_amount)as Total_sales_wise_each_medchine
from medicines m 
inner join orderdetails10 od on m.medicine_id = od.medicine_id
inner join orders10 o on od.order_id = o.order_id
group by m.medicine_name;

--Total Sales Amount for Each Customer

select concat(c.first_name,c.last_name)as customer_name,(od.price*od.quantity) as Total_sales_wise_each_customer
from customers10 c
inner join orders10 o on c.customer_id = o.customer_id
inner join orderdetails10 od on o.order_id = od.order_id
group by concat(c.first_name,c.last_name),(od.price*od.quantity);

--List of Medicines with Less Than 50 Units in

select medicine_name,stock_quantity as lessthen_50_units
from medicines 
where stock_quantity <=50;


--Customers Who Have Placed More Than One Order

select concat(c.first_name,c.last_name) as customer_name,od.quantity as order_count
from customers10 c
inner join orders10 o on c.customer_id = o.customer_id
inner join orderdetails10 od on o.order_id = od.order_id
where od.quantity >1;

--group by  concat(c.first_name,c.last_name);

---having count(od.quantity) >1;

--Total Quantity of Each Medicine Produced

select m.medicine_name,sum(p.quantity_produced) as Total_quantity
from medicines m 
inner join production10 p on m.medicine_id = p.medicine_id
group by m.medicine_name;


--Total Sales Amount by Month
select to_char(o.order_date,'month'),(od.price*od.quantity) as Month_wise_TotalSales
from orders10 o 
inner join orderdetails10 od on o.order_id = od.order_id;


--Expired Medicines in Stock

select m.medicine_name,p.production_date,p.expiry_date 
from medicines m
inner join production10 p on m.medicine_id = p.medicine_id
where p.expiry_date > trunc(sysdate) ;

--Average Order Value for Each Customer
select concat(c.first_name,c.last_name)as customer_name,avg(od.order_id) as Avg_wise_each_customer
from customers10 c
inner join orders10 o on c.customer_id = o.customer_id
inner join orderdetails10 od on o.order_id = od.order_id
group by concat(c.first_name,c.last_name);

--Top 3 Best-Selling Medicines

select m.medicine_name,od.price as Top_3Best_selling
from medicines m
inner join orderdetails10 od on m.medicine_id = od.medicine_id
group by m.medicine_name,od.price
order by od.price desc
fetch first 3 row only;

--Medicines and Their Ingredients
select distinct (m.medicine_name),i.ingredient_name 
from medicines m
join ingredients i on m.medicine_id = i.medicine_id;

--Total Quantity of Each Ingredient Used in Production

select p.batch_number,i.ingredient_name,sum(i.quantity) as total_quantity_wise_each_ingredients
from production10 p 
inner join ingredients i on p.medicine_id = i.medicine_id
group by p.batch_number,i.ingredient_name;

--Total Number of Orders by Status

select o.status,od.order_detail_id,sum(od.quantity) as tot_number_orders_status
from orders10 o
inner join  orderdetails10 od on o.order_id = od.order_id
group by o.status,od.order_detail_id;

--Medicines Manufactured by Each Manufacturer

select mf.manufacturer_name,m.medicine_name
from manufacturers mf
inner join medicines m on mf.manufacturer_id = m.manufacturer_id;

--Revenue Generated by Each Medicine Category

--Stock Value of Each Medicine
select distinct medicine_name, stock_quantity
from medicines;

--Details of Orders Placed by a Specific Customer
select concat(c.first_name,c.last_name)as Customer_name,o.* 
from customers10 c
inner join orders10 o on c.customer_id = o.customer_id;

--Medicines Close to Expiry

select m.medicine_name,p.production_date,p.expiry_date,(p.production_date - p.expiry_date)as expiry_balence_day
from medicines m 
inner join production10 p on m.medicine_id = p.medicine_id
fetch first 1 row only;
 

--Total Quantity of Each Medicine Sold in the Last Year

select m.medicine_name,to_char(o.order_date,'yyyy')+1 as Last_year,sum(od.quantity)as Total_Quantity
from medicines m 
inner join orderdetails10 od  on m.medicine_id = od.medicine_id
inner join orders10 o on od.order_id = o.order_id
group by m.medicine_name,to_char(o.order_date,'yyyy');

select m.medicine_name,o.order_date as Last_year,sum(od.quantity)as Total_Quantity
from medicines m 
inner join orderdetails10 od  on m.medicine_id = od.medicine_id
inner join orders10 o on od.order_id = o.order_id
where o.order_date between trunc(sysdate,'yyyy')-interval '1' year and trunc(sysdate)-1
group by m.medicine_name,o.order_date;



commit;