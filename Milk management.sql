CREATE TABLE Farmers (
    farmer_id INT PRIMARY KEY,
    farmer_name VARCHAR2(100) NOT NULL,
    contact_number VARCHAR2(15),
    address VARCHAR2(255)
);

CREATE TABLE Cows (
    cow_id INT PRIMARY KEY,
    farmer_id INT,
    cow_name VARCHAR2(50),
    breed VARCHAR2(50),
    date_of_birth DATE,
    milk_production_capacity DECIMAL(5, 2) -- in liters per day
);

CREATE TABLE MilkProduction (
    production_id INT PRIMARY KEY,
    cow_id INT,
    production_date DATE NOT NULL,
    quantity_produced DECIMAL(5, 2) -- in liters

);

CREATE TABLE MilkProducts (
    product_id INT PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE ProductionDetails (
    detail_id INT PRIMARY KEY,
    product_id INT,
    production_date DATE NOT NULL,
    quantity_produced INT NOT NULL
);

CREATE TABLE Sales12 (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE NOT NULL,
    quantity_sold INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR2(100) NOT NULL,
    contact_number VARCHAR2(15),
    address VARCHAR2(255)
);

CREATE TABLE RawMaterials (
    material_id INT PRIMARY KEY,
    supplier_id INT,
    material_name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);



--insert the values

-- Insert sample data into Farmers
INSERT ALL
    INTO Farmers (farmer_id, farmer_name, contact_number, address) VALUES (1, 'Ramesh Kumar', '9876543210', '123 Green Street, Village A')
    INTO Farmers (farmer_id, farmer_name, contact_number, address) VALUES (2, 'Suresh Patil', '9123456789', '456 Blue Avenue, Village B')
SELECT * FROM dual;

-- Insert sample data into Cows
INSERT ALL
    INTO Cows (cow_id, cow_name, breed, date_of_birth, farmer_id, milk_production_capacity) VALUES (1, 'Gauri', 'Holstein', DATE '2018-05-12', 1, 20.5)
    INTO Cows (cow_id, cow_name, breed, date_of_birth, farmer_id, milk_production_capacity) VALUES (2, 'Lakshmi', 'Jersey', DATE '2019-07-24', 2, 18.0)
SELECT * FROM dual;

-- Insert sample data into MilkProduction
INSERT ALL
    INTO MilkProduction (production_id, cow_id, production_date, quantity_produced) VALUES (1, 1, DATE '2023-07-01', 20.0)
    INTO MilkProduction (production_id, cow_id, production_date, quantity_produced) VALUES (2, 2, DATE '2023-07-01', 18.0)
SELECT * FROM dual;

-- Insert sample data into MilkProducts
INSERT ALL
    INTO MilkProducts (product_id, product_name, category, price, stock_quantity) VALUES (1, 'Whole Milk', 'Milk', 1.99, 100)
    INTO MilkProducts (product_id, product_name, category, price, stock_quantity) VALUES (2, 'Butter', 'Dairy Product', 2.99, 50)
SELECT * FROM dual;

-- Insert sample data into ProductionDetails
INSERT ALL
    INTO ProductionDetails (detail_id, product_id, production_date, quantity_produced) VALUES (1, 1, DATE '2023-07-01', 100)
    INTO ProductionDetails (detail_id, product_id, production_date, quantity_produced) VALUES (2, 2, DATE '2023-07-02', 50)
SELECT * FROM dual;

-- Insert sample data into Sales
INSERT ALL
    INTO Sales12 (sale_id, product_id, sale_date, quantity_sold, total_price) VALUES (1, 1, DATE '2023-07-03', 10, 19.90)
    INTO Sales12 (sale_id, product_id, sale_date, quantity_sold, total_price) VALUES (2, 2, DATE '2023-07-03', 5, 14.95)
SELECT * FROM dual;

insert INTO Sales12 (sale_id, product_id, sale_date, quantity_sold, total_price) VALUES (3,3, DATE '2024-06-03', 7, 17.95);

-- Insert sample data into Suppliers
INSERT ALL
    INTO Suppliers (supplier_id, supplier_name, contact_number, address) VALUES (1, 'ABC Packaging', '9988776655', '789 Yellow Street, City X')
    INTO Suppliers (supplier_id, supplier_name, contact_number, address) VALUES (2, 'XYZ Flavors', '8877665544', '321 Red Avenue, City Y')
SELECT * FROM dual;

-- Insert sample data into RawMaterials
INSERT ALL
    INTO RawMaterials (material_id, supplier_id, material_name, category, price, stock_quantity) VALUES (1, 1, 'Packaging Material', 'Packaging', 0.50, 200)
    INTO RawMaterials (material_id, supplier_id, material_name, category, price, stock_quantity) VALUES (2, 2, 'Flavoring Agent', 'Additives', 1.50, 100)
SELECT * FROM dual;




--display the values 

select * from farmers;
select * from cows;
select * from milkproduction;
select * from milkproducts;
select * from ProductionDetails;
select * from sales12;
select * from suppliers;
select * from rawmaterials;


--Total Milk Production per Farmer

select f.farmer_name,sum(m.quantity_produced)as Milk_Production_per_Farmer
from farmers f
inner join cows c on f.farmer_id = c.farmer_id
inner join milkproduction m on c.cow_id = m.cow_id
group by f.farmer_name;


--Milk Production Details for a Specific Cow
select c.cow_name,m.*
from cows c
inner join milkproduction m on c.cow_id = m.cow_id;

--Total Quantity of Each Milk Product Produced

select mp.category,sum(Pd.Quantity_produced)as tot_qty_milk_product
from milkproducts mp 
inner join productiondetails pd on mp.product_id = pd.product_id
where mp.category ='Milk'
group by mp.category;

--Total Sales Amount for Each Product
select mp.product_name,sum(s.quantity_sold)as total_sales_amount
from milkproducts mp 
inner join sales12 s on mp.product_id = s.product_id
group by mp.product_name;


--Stock Level of Each Milk Product
select category,stock_quantity
from milkproducts
where category ='Milk';

--Sales Transactions for a Specific Product

select mp.product_name,s.*
from milkproducts mp 
inner join sales12 s on mp.product_id = s.product_id;


--Total Revenue Generated in the Last Month

select count(total_price) as total_revenue
from sales12
where sale_date >= trunc(add_months(sysdate,-1),'MM')
and sale_date <trunc(sysdate,'mm');

--Raw Materials Stock Levels
select material_name, stock_quantity,
rank() over(order by stock_quantity desc)
from rawmaterials ;

--Total Quantity of Each Raw Material Used
select material_name,sum(stock_quantity)
from rawmaterials 
group by material_name;

select material_name,
    (select sum(stock_quantity)
    from rawmaterials
    where rawmaterials.material_name = rm.material_name) as total_quantity
from rawmaterials rm
group by material_name;


--Suppliers and Their Raw Materials
select s.supplier_name,r.material_name
from suppliers s
inner join rawmaterials r on s.supplier_id = r.supplier_id;

--Expired Raw Materials

--Top Selling Milk Products
select mk.category,s.total_price
from milkproducts mk
inner join sales12 s on mk.product_id = s.product_id
group by mk.category,s.total_price
order by s.total_price desc
fetch first row only ;

--Milk Production by Breed

select c.breed,mk.*
from cows c
inner join milkproduction mk on c.cow_id = mk.cow_id;

--Average Milk Production per Cow
select c.cow_name,avg(mk.quantity_produced)
from cows c
inner join milkproduction mk on c.cow_id = mk.cow_id
group by c.cow_name;

--Monthly Milk Production sum of quantity
select to_char(production_date,'yyyy-mm'),
sum(quantity_produced)
from milkproduction
group by to_char(production_date,'yyyy-mm')
order by to_char(production_date,'yyyy-mm');

--Sales Details Grouped by Month
select to_char(s.sale_date,'mon'),s.*
from sales12 s
order by to_char(s.sale_date,'mon') desc;


--
commit;