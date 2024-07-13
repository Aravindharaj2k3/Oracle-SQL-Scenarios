    CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    cust_city VARCHAR(50),
    cust_state VARCHAR(2),
    cust_dob DATE,
    gender CHAR(1)
);

CREATE TABLE inquiry (
    inquiry_id INT PRIMARY KEY,
    inquiry_date DATE,
    inquiry_type VARCHAR(20),
    Inquiry VARCHAR(50),
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);



INSERT ALL
INTO customer VALUES(100, 'Tim', 'Chennai', 'TN', to_date('2000-02-22','YYYY/MM/DD'),'M')
INTO customer VALUES(101, 'Bill', 'Bangalore', 'KA', to_date('2000-01-04','YYYY/MM/DD'), 'M')
INTO customer VALUES(102, 'Ravi', 'Chennai', 'TN', NULL, 'M')
INTO customer VALUES(103, 'Pallavi', 'Bangalore', 'KA', to_date('1998-04-10','YYYY/MM/DD'), 'F')
INTO customer VALUES(104, 'Prithvi', 'Mumbai', 'MH', to_date('1997-10-18','YYYY/MM/DD'), 'F')
SELECT * FROM Dual;

INSERT ALL 
INTO inquiry VALUES(1, to_date('2021-08-25','YYYY/MM/DD'), 'Internet', 'New Connection', NULL)
INTO inquiry VALUES(2, to_date('2021-08-25','YYYY/MM/DD'), 'Voice', 'Upgrade', 101)
INTO inquiry VALUES(3, to_date('2021-08-14','YYYY/MM/DD'), 'Internet', 'Data Upgrade', 102)
INTO inquiry VALUES(4, to_date('2021-08-15','YYYY/MM/DD'), 'Internet', 'Line Down message', 102)
INTO inquiry VALUES(5, to_date('2021-08-20','YYYY/MM/DD'), 'Voice', 'New Connection', NULL)
INTO inquiry VALUES(6, to_date('2021-08-21','YYYY/MM/DD'), 'Internet', 'Line Down message', 103)
INTO inquiry VALUES(7, to_date('2021-08-22','YYYY/MM/DD'), 'Voice', 'Data Upgrade', 102)
SELECT * FROM Dual;

--Quries
SELECT * FROM CUSTOMER;
SELECT * FROM INQUIRY;
COMMIT;
--1	Display the customer name who are Male and who belongs to KA or MH		
SELECT cust_name FROM customer WHERE (cust_state = 'KA' or cust_state = 'MH') AND GENDER = 'M';

--2	Display the customers who are from same city as Pallavi	
SELECT cust_name FROM customer WHERE cust_city = (SELECT cust_city FROM customer WHERE cust_name = 'Pallavi');

--3	Dispay the number of customers who are in TN state	
SELECT count(cust_name)  FROM customer WHERE cust_state = 'TN';

--4	Display customer made the inquiry which belongs to Voice type and inquiry belings to New Connection		
SELECT cust_name FROM customer WHERE CUST_ID IN (SELECT CUST_ID FROM inquiry WHERE inquiry_type = 'Voice' or inquiry = 'New Connection');


--5	Display the inquiry which does not associate to any registered customer	
SELECT * FROM inquiry where cust_id is NULL;

--6	Display the customers who don’t have any inquiry	
SELECT cust_name FROM customer WHERE cust_name not IN (SELECT cust_name FROM customer WHERE CUST_ID IN (SELECT DISTINCT(CUST_ID) FROM inquiry));

--7	Display the customers whose name starts with P and belings to KA or MH and who are Female customers		
SELECT cust_name FROM customer WHERE cust_name like 'P%' AND (cust_state = 'KA' or cust_state = 'MH') AND GENDER = 'F';

--8	Display the inquiry date, inqury type and inquiry from customers in the year 2021		
SELECT inquiry_date,inquiry_type,inquiry FROM inquiry WHERE inquiry_date >= TO_DATE('01/01/2021', 'DD/MM/YYYY') 
AND inquiry_date < TO_DATE('01/01/2022', 'DD/MM/YYYY');

--9	Display the number of inquiries which came because of Voice inquiry type		
SELECT count(inquiry) FROM inquiry WHERE inquiry_type = 'Voice';

--10	Display Count customer belong to chennai		
SELECT count(cust_name) FROM customer WHERE cust_city = 'Chennai';
--11	Dispay who is the male customer inquired for 'Internet'		
SELECT cust_name FROM customer WHERE cust_id in (SELECT cust_id FROM inquiry WHERE inquiry_type ='Internet') AND Gender = 'M';
--12	How many Inquiry we have for Line Down Message		
SELECT count(inquiry) FROM inquiry WHERE inquiry like '%Line Down%';

--13	Which inquiry we don’t have any customer		
SELECT inquiry_date,inquiry_type,inquiry FROM inquiry where cust_id is NULL;

--14	Diplay Oldest Customer Name from Customer Table		
SELECT cust_name FROM customer WHERE cust_dob = (SELECT min(cust_dob) FROM customer);

--15	Display How made a latest enquiry		
SELECT cust_name FROM customer WHERE cust_id in (SELECT cust_id FROM inquiry where inquiry_date = (SELECT  max(inquiry_date) FROM inquiry ));
--16	How many customer we have in TN		
SELECT count(cust_name) FROM customer WHERE cust_state = 'TN';
--17	which customer dob is not updated		
SELECT cust_name FROM customer WHERE cust_dob is null;

--18	How many inquiry we have between '14/08/21' to '20/08/21'	
SELECT count(inquiry) FROM inquiry WHERE inquiry_date between '14-AUG-21' and '20-AUG-21';
SELECT count(inquiry) FROM inquiry WHERE to_date(inquiry_date,'mm/dd/yyyy') between to_date('08/14/21', 'mm/dd/yyyy') and to_date('08/20/21', 'mm/dd/yyyy');


select to_char(inquiry_date,'dd-mm-yy')
from inquiry
where to_char(inquiry_date,'dd-mm-yy') between '14-08-21' and '20-08-21'

--19	How many Female cusomer we have		
SELECT count(cust_name) FROM customer WHERE GENDER = 'F';


