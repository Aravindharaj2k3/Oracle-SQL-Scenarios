
Creating and Inserting in to bus_travels table

CREATE TABLE bus_travels (
BUS_ID VARCHAR(10) Primary Key,
BUS_REGISTRATION_NO number(5) NOT NULL,
BUS_CODE VARCHAR(50) not null,
BUS_TYPE VARCHAR(25) not null,
REGISTERED_ON DATE,
NO_OF_SEATS number(10) not null
);

DROP Table bus_travels;

INSERT ALL
into bus_travels values('TN20',101,'TN36A7541','NON-AC-SLEEPER',TO_DATE('1/15/2021', 'MM/DD/YYYY'),45)
into bus_travels values('KL21',102,'KL25S8745','AC-SEATER',TO_DATE('3/20/2021', 'MM/DD/YYYY'),40)
into bus_travels values('KA22',103,'KA33F2587','AC-SLEEPER',TO_DATE('6/2/2022', 'MM/DD/YYYY'),35)
into bus_travels values('BC123',104,'ABC123','AC-SEATER',TO_DATE('1/15/2023', 'MM/DD/YYYY'),40)
into bus_travels values('DE789',105,'XYZ456','AC-SLEEPER',TO_DATE('9/20/2022', 'MM/DD/YYYY'),30)
SELECT * FROM Dual;

SELECT * FROM bus_travels;

--Quries:

1)Display all the information related to bus		
SELECT * FROM bus_travels;

2)Retrieve Bus Information for a Specific BusType:AC-SEATER		
SELECT * FROM bus_travels WHERE bus_type = 'AC-SEATER';

3)Display the bus information registered b/w 2022 to 2023	
SELECT * FROM bus_travels WHERE REGISTERED_ON BETWEEN TO_DATE('01/01/2022', 'DD/MM/YYYY') AND TO_DATE('01/01/2023', 'DD/MM/YYYY');

4)Retrieve Buses with No. of seats Above 35:		
SELECT * FROM bus_travels WHERE NO_OF_SEATS > 35;

5)Retrieve Buses with Registration Numbers Starting with 'ABC':		
SELECT * FROM bus_travels WHERE BUS_CODE like 'ABC%';

6)display bus information only related to 'AC-Seater' or 'AC Sleeper'	
SELECT * FROM bus_travels WHERE bus_type = 'AC-SEATER' OR bus_type = 'AC-SLEEPER';

7)Display bus info where bus code starts with 'K' and no of seats is greater than 35		
SELECT * FROM bus_travels WHERE BUS_CODE like 'K%' AND NO_OF_SEATS > 35;

8)display all bus infomation having no_seats greter than 'ABC123'		
SELECT * FROM bus_travels WHERE (SELECT NO_OF_SEATS FROM bus_travels WHERE BUS_CODE = 'ABC123') < NO_OF_SEATS;

9)display which bus as highest seats	
SELECT * FROM bus_travels WHERE NO_OF_SEATS = (SELECT MAX(NO_OF_SEATS) FROM bus_travels );

10)Display count of buses for AC seater		
SELECT COUNT(BUS_ID)as No_of_AC_Seater_Bus FROM bus_travels WHERE bus_type = 'AC-SEATER';

11)display bus info where no_seats is greater than 'AC-SLEEPER'		
SELECT * FROM bus_travels WHERE NO_OF_SEATS > (SELECT MAX(NO_OF_SEATS) FROM bus_travels WHERE bus_type = 'AC-SLEEPER');
--DOUBT

12)display how many no of buses are there with seating capacity 40 		
SELECT COUNT(BUS_ID) as BUS_WITH_40_SEATS FROM bus_travels WHERE NO_OF_SEATS = 40;

13)display latest Registered Bus	
SELECT * FROM bus_travels WHERE REGISTERED_ON = (SELECT MAX(REGISTERED_ON) FROM bus_travels );



