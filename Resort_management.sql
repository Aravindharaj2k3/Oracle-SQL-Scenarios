CREATE TABLE country00 (
    country_id NUMBER PRIMARY KEY,
    country_name VARCHAR2(50)
);

CREATE TABLE resort00 (
    resort_id NUMBER PRIMARY KEY,
    resort_name VARCHAR2(50),
    country_id NUMBER
);

CREATE TABLE customer00 (
    cust_id NUMBER PRIMARY KEY,
    cust_name VARCHAR2(50),
    phone VARCHAR2(15),
    country_id NUMBER
);


INSERT ALL
    INTO country00 (country_id, country_name) VALUES (1, 'US')
    INTO country00 (country_id, country_name) VALUES (2, 'India')
    INTO country00 (country_id, country_name) VALUES (3, 'Srilanka')
    INTO country00 (country_id, country_name) VALUES (4, 'Maldives')
SELECT * FROM dual;

INSERT ALL
    INTO resort00 (resort_id, resort_name, country_id) VALUES (50, 'Beach front', 4)
    INTO resort00 (resort_id, resort_name, country_id) VALUES (51, 'Oberai, Goa', 2)
    INTO resort00 (resort_id, resort_name, country_id) VALUES (52, 'Taj Maldives', 4)
    INTO resort00 (resort_id, resort_name, country_id) VALUES (53, 'Taj Chennai', 2)
SELECT * FROM dual;

INSERT ALL
    INTO customer00 (cust_id, cust_name, phone, country_id) VALUES (1001, 'Tim Downey', '123456789', 1)
    INTO customer00 (cust_id, cust_name, phone, country_id) VALUES (1002, 'Ramesh K', '596869689', 2)
    INTO customer00 (cust_id, cust_name, phone, country_id) VALUES (1003, 'Bill Price', '74849498', 1)
    INTO customer00 (cust_id, cust_name, phone, country_id) VALUES (1004, 'Malinga', '837393938', 3)
    INTO customer00 (cust_id, cust_name, phone, country_id) VALUES (1005, 'Farooq', '8958498', 4)
SELECT * FROM dual;

---display the values

select * from country00;
select * from resort00;
select * from customer00;

--Query to find out country-wise resort count.

select c.country_name,count(resort_id)
from country00 c 
inner join resort00 r on c.country_id = r.country_id
group by c.country_name;

select c.country_name,r.resort_name
from country00 c 
inner join resort00 r on c.country_id = r.country_id
where r.resort_id = (select count(r.resort_id) from resort00);


--Query to display country-wise customer count.

select c.country_name,count(cc.cust_id)
from country00 c 
inner join customer00 cc on c.country_id = cc.country_id
group by c.country_name;

--Display countries in which we don’t have any resorts.

select c.country_name,r.resort_id
from country00 c 
left join resort00 r on c.country_id = r.country_id
where r.resort_id is null;


--Display countries in which we have a minimum of 2 customers.
select c.country_name,count(cc.cust_id)
from country00 c 
inner join customer00 cc on c.country_id = cc.country_id
group by c.country_name
having count(cc.cust_id)>1;



--Display how many resorts we have in the country where the resort 'Beach front' is.

select c.country_name,count(r.resort_id)as no_of_country_in_resort_of_beach_front
from country00 c 
inner join resort00 r on c.country_id = r.country_id
where r.resort_name ='Beach front'
group by c.country_name;

--Display customers whose name starts with F or R and who are either from India or Sri Lanka.

select c.cust_name,cc.country_name 
from customer00 c 
inner join country00 cc on c.country_id =cc.country_id
where (c.cust_name like 'F%' or c.cust_name like 'R%')
and(cc.country_name ='India' or cc.country_name ='Sri Lanka');

--Display customer names who are from the US and do not have any phone numbers.
select c.cust_name,c.phone,cc.country_name
from customer00 c 
inner join country00 cc on c.country_id = cc.country_id
where cc.country_name ='US'
and c.phone is null;


--Display resort name belongs to US and INDIA.

select c.country_name,r.resort_name
from country00 c 
left join resort00 r on c.country_id = r.country_id
where c.country_name ='US' or  c.country_name ='India';

--Which country has the maximum resorts?
select c.country_name,max(r.resort_id)
from country00 c 
join resort00 r on c.country_id = r.country_id
group by c.country_name;

select c.country_name,r.resort_id
from country00 c 
join resort00 r on c.country_id = r.country_id
where r.resort_id = (select max(r.resort_id) from resort00 r);

--Display the other resort name where have a similar country to 'Taj Maldives.'
select r.resort_name,c.country_name
from resort00 r
join country00 c on r.country_id = c.country_id
where r.resort_name = 'Taj Maldives';
                    

--Display all country names whether we have a resort or not.

select c.country_name,r.resort_name
from country00 c 
left join resort00 r on c.country_id = r.country_id
where r.resort_id is null;


--Display country name and resort name if the resort is not associated with the country means display it as no resorts.
select r.resort_name,c.country_name
from resort00 r
inner join country00 c on c.country_id = r.country_id
where r.country_id is null;

--Display the total number of customers belonging to the US.

select c.country_name,count(cc.cust_id)
from country00 c 
inner join customer00 cc on c.country_id = cc.country_id
where c.country_name ='US'
group by c.country_name;

--Display the country where we have 2 customers.
select c.country_name,count(cc.cust_id)
from country00 c 
inner join customer00 cc on c.country_id = cc.country_id
group by c.country_name
having count(cc.cust_id) =1;


--Display other customer names whose country is the same as 'Tim Downey'.

select state_name
from state
where state_name like 'a%'or state_name 
                 like 'a%'or state_name like 'a%'or
                 like state_name like 'a%'and state_name like '%aeious'

commit;






