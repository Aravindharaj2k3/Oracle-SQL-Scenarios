create table product(
p_id number(4),
p_name varchar2(20),
p_family varchar2(20),
price number(5),
cost number(5),
launch_date date);

insert all
into product values(100,'Marker','stationary',75,60,'15-jan-18')
into product values(101,'Mouse','computer',1000,750,'16-apr-17')
into product values(102,'Whiteboard','stationary',450,375,'20-aug-10')
into product values(103,'desktop','computer',20000,25000,'21-sep-10')
into product values(104,'Laptop','computer',40000,45000,'21-dec-10')
select * from dual;

SELECT * FROM product;
SELECT p_name, p_family FROM product WHERE p_family in ('computer', 'electronics');
SELECT * FROM PRODUCT where p_price between 400 and 1000

SELECT * FROM PRODUCTS where 