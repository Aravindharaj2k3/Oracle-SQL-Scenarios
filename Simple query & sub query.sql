CREATE TABLE bus00 (
    bus_id NUMBER PRIMARY KEY,
    bus_name VARCHAR2(50),
    capacity NUMBER,
    manufacturer VARCHAR2(50),
    year_of_manufacture NUMBER
);

select * from bus00;


INSERT INTO bus00 (bus_id, bus_registration_no, bus_code, bus_type, registered_on, no_of_seats)
VALUES (104, 'ABC123', 'BC123', 'City', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 40);

INSERT INTO bus00 (bus_id, bus_registration_no, bus_code, bus_type, registered_on, no_of_seats)
VALUES (105, 'XYZ456', 'DE789', 'Tourist', TO_DATE('2022-09-20', 'YYYY-MM-DD'), 30);

-- ... Insert more rows as needed


select * from bus00;

update bus00 set bus_type = 'AC-SEATER' where bus_type='City';

update bus00 set bus_type = 'AC-SLEEPER' where bus_type='Tourist';

--1)Display all the information related to bus
select * from bus00;

--2)Retrieve Bus Information for a Specific Bus Type:AC-SEATER
select * from bus00
where bus_type = 'AC-SEATER'

--3)Display the bus information registered b/w 2022 to 2023
select * from bus00
where registered_on between  '01/01/2022' and '31/12/2023'

select * from bus00
where registered_on >= '01/01/2022' and registered_on <='31/12/2023'


--4)Retrieve Buses with No. of seats Above 35:
select * from bus00
where no_of_seats > 35

--5)Retrieve Buses with Registration Numbers Starting with 'ABC':
select * from bus00
where bus_registration_no like 'ABC%'

--6)display bus information only related to 'AC-Seater' or 'AC Sleeper'
select * from bus00
where bus_type in ('AC-SEATER','AC-SLEEPER')

select * from bus00
where bus_type = 'AC-SEATER' or bus_type = 'AC-SLEEPER'


insert into bus00 values (106,'DE123','ASD123','AC-SEEATER',sysdate,25)
commit

--7)Display bus info where bus code starts with k and no of seats is greater than 35
select * from bus00
where no_of_seats > 35 and bus_code like 'K%'

--8)display all bus infomation having no_seats greter than 'ABC123'
select * from bus00
where no_of_seats > 
(select no_of_seats
from bus00
where bus_registration_no = 'ABC123')

--9)display which bus as highest seats
select * from bus
where no_of_seats = 
(select max(no_of_seats)
from bus00);

--10)Display count of buses for AC seater
select count(Bus_id) as bus_count
from bus00
where bus_type = 'AC-SEATER'


--11)display bus info where no_seats is greater than 'AC-SLEEPER'
select * from bus
where no_of_seats >
(select max(no_of_seats)
from bus00
where bus_type = 'AC-SLEEPER') 

(select max(no_of_seats)
from bus00
where bus_type = 'AC-SLEEPER') 

12)display how many no of buses are there with seating capacity 40 
select count(bus_code)
from bus00
where no_of_seats = 40

13)display recent registed bus
select * from bus00
where registered_on = (select max(registered_on)
from bus00)

14)select last regitered bus
select * from bus00
where registered_on = (select min(registered_on)
from bus00)


commit;