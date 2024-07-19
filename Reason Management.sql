CREATE TABLE Reason00 (
    reason_ID NUMBER PRIMARY KEY,
    reason_description VARCHAR2(50)
);

CREATE TABLE Product00 (
    product_ID NUMBER PRIMARY KEY,
    product_name VARCHAR2(50)
);

CREATE TABLE ProjectSite00 (
    site_id NUMBER PRIMARY KEY,
    projectSite_name VARCHAR2(50)
);

CREATE TABLE Product_Scrap00 (
    scrap_gen NUMBER PRIMARY KEY,
    site_id NUMBER,
    product_id NUMBER,
    reason_id NUMBER,
    scrap_length NUMBER,
    scrap_weight NUMBER
);



INSERT ALL
    INTO Reason00 (reason_ID, reason_description) VALUES (32, 'Power Failure')
    INTO Reason00 (reason_ID, reason_description) VALUES (37, 'General Scrap')
    INTO Reason00 (reason_ID, reason_description) VALUES (36, 'Machine Problem')
    INTO Reason00 (reason_ID, reason_description) VALUES (38, 'Sample')
    INTO Reason00 (reason_ID, reason_description) VALUES (50, 'General Quality')
    INTO Reason00 (reason_ID, reason_description) VALUES (84, 'Too full')
    INTO Reason00 (reason_ID, reason_description) VALUES (81, 'Machine failure')
    INTO Reason00 (reason_ID, reason_description) VALUES (97, 'Leftover on drum')
SELECT * FROM dual;

INSERT ALL
    INTO Product00 (product_ID, product_name) VALUES (9, 'Cat5e Core')
    INTO Product00 (product_ID, product_name) VALUES (20, 'Cat6')
    INTO Product00 (product_ID, product_name) VALUES (65, 'G2 (BME std)')
    INTO Product00 (product_ID, product_name) VALUES (52, 'Surface/Harness .71 CU')
    INTO Product00 (product_ID, product_name) VALUES (78, 'Telephone')
    INTO Product00 (product_ID, product_name) VALUES (81, 'Sample')
    INTO Product00 (product_ID, product_name) VALUES (652, 'Sasol-Single Grey Busline')
SELECT * FROM dual;

INSERT ALL
    INTO ProjectSite00 (site_id, projectSite_name) VALUES (3, 'Linmar Factory')
    INTO ProjectSite00 (site_id, projectSite_name) VALUES (2, 'Head Office')
    INTO ProjectSite00 (site_id, projectSite_name) VALUES (123, 'Silcom Manufacturing')
    INTO ProjectSite00 (site_id, projectSite_name) VALUES (1191, 'FORD Durban Office')
SELECT * FROM dual;

INSERT ALL
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (123, 3, 9, 32, 40, 150)
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (124, 2, 20, 37, 0, 200)
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (125, 123, 65, 36, 300, 25)
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (126, 1191, 9, 36, 450, 550)
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (127, 3, 52, 38, 250, 600)
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (128, 1191, 81, 50, 700, 1500)
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (129, 2, 81, 84, 0, 2000)
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (130, 3, 81, 37, 130, 350)
    INTO Product_Scrap00 (scrap_gen, site_id, product_id, reason_id, scrap_length, scrap_weight) VALUES (131, 3, 9, 81, 500, 600)
SELECT * FROM dual;


select * from reason00;
select * from product00;
select * from ProjectSite00;
select * from Product_Scrap00;

--Write a query to give me the reason description and total length of scrap.
select r.reason_description,ps.scrap_length as total_length_of_scrap
from reason00 r 
inner join Product_Scrap00 ps on r.reason_id = ps.reason_id
where scrap_length = (select max(ps.scrap_length) from Product_Scrap00 ps);

--Find the products which are being associated with Linmar Factory.4

select distinct (p.product_name),ps.projectsite_name
from product00 p 
inner join Product_Scrap00 pso on p.product_id = pso.product_id
inner join ProjectSite00 ps on pso.site_id = ps.site_id
where ps.projectsite_name ='Linmar Factory';


--Write a query to get the product which gives the most scrap length in each project site.
select product_name,max(scrap_length)
from product00 p
inner join Product_Scrap00 pso on p.product_id = pso.product_id
group by product_name;

--Find the highest reason of rejection (in terms of transaction count).
select r.reason_description,count(pso.reason_id)
from reason00 r 
inner join Product_Scrap00 pso on r.reason_id = pso.reason_id 
group by r.reason_description
order by count(pso.reason_id) desc
fetch first 2 rows only ;


--What is the total length of scrap for Cat6 and Telephone put together?

select p.product_name,sum(pso.scrap_length)
from product00 p
inner join Product_Scrap00 pso
on p.product_id = pso.product_id
where p.product_name like 'Cat6' or  p.product_name like 'Telephone'
group by p.product_name ;


--Find the product name where we don’t have any scrap.
select p.product_name,pso.scrap_length
from product00 p
left join Product_Scrap00 pso
on p.product_id = pso.product_id
where pso.product_id is null ;

--Display the site name, product name, reason of scrap, length and weight from Head Office.

select ps.projectsite_name,p.product_name,r.reason_description,pso.scrap_length,pso.scrap_weight
from projectsite00 ps 
inner join product_scrap00 pso 
on ps.site_id = pso.site_id
inner join product00 p
on pso.product_id = p.product_id 
inner join reason00 r 
on pso.reason_id = r.reason_id
where ps.projectsite_name ='Head Office';


--Find the product name and site name for all the Power Failure reason associated with.


select p.product_name,ps.projectsite_name,r.reason_description
from product00 p
inner join product_scrap00 pso
on p.product_id = pso.product_id
inner join projectsite00 ps
on pso.site_id = ps.site_id
inner join reason00 r
on pso.reason_id = r.reason_id
where r.reason_description ='Power Failure' ;


--Display the product we have zero scrap length.

select p.product_name,pso.scrap_length
from product00 p
inner join product_scrap00 pso
on p.product_id = pso.product_id
where pso.scrap_length like 0;


commit;

