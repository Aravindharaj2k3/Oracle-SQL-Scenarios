CREATE TABLE COUNTRYS(COUNTRY_ID NUMBER(3)PRIMARY KEY,COUNTRY_NAME VARCHAR(30));

insert all
into countrys values(201,'India')
into countrys values(202,'Sri lanka')
into countrys values(203,'Pakistan')
select * from dual;

CREATE TABLE STATES07(ST_ID NUMBER(20) PRIMARY KEY,ST_NAME VARCHAR(30),COUNTRY_ID NUMBER(3),POLITICAL_PARTY VARCHAR(30));

INSERT ALL
    INTO STATES07 VALUES (1, 'Karnataka', 201, 'BJP')
    INTO STATES07 VALUES(2, 'Maharashtra', 201, 'Congress')
    INTO STATES07 VALUES(3, 'Gujarat', 201, 'BJP')
    INTO STATES07 VALUES(4, 'Andhra', 201, 'YSR')
    INTO STATES07 VALUES(5, 'Kerala', 201, 'CPM')
    
    SELECT * FROM DUAL;
    
CREATE TABLE CITY07(CITY_ID NUMBER(3),CITY_NAME VARCHAR(30),POPULATION VARCHAR(30),ST_ID NUMBER(3));

INSERT ALL
INTO CITY07 VALUES  (11, 'Bangalore', 12765000, 1)
INTO CITY07 VALUES (22, 'Mysore', 1234992, 1)
INTO CITY07 VALUES (33, 'Pune', 3891823, 2)
INTO CITY07 VALUES(44, 'Mumbai', 20667656, 2)
INTO CITY07 VALUES(55, 'Surat', 7489742, 3)
INTO CITY07 VALUES(66, 'Hubli', 1136923, 1)
INTO CITY07 VALUES(77, 'Nagpur', 1234992, 2)
SELECT * FROM DUAL;

SELECT * FROM COUNTRYS;
SELECT * FROM STATES07;
SELECT * FROM CITY07;

--1	How many countries we have?
SELECT COUNT(COUNTRY_ID) FROM COUNTRY;


--2	Find the state names which are rulled by CPM or BJP
SELECT ST_NAME 
FROM STATES 
WHERE POLITICAL_PARTY ='CPM' OR  POLITICAL_PARTY ='BJP';


--3	Find the city_name which has more population than Pune
SELECT CITY_NAME 
FROM CITY07
WHERE POPULATION >(SELECT POPULATION FROM CITY07 
WHERE CITY_NAME ='PUNE');

SELECT city_NAME
FROM City07
WHERE population >(SELECT population FROM City07
WHERE city_NAME = 'Pune');

--4	Find the city_names which are in Karnataka state

SELECT CITY_NAME,ST_NAME
FROM CITY07 , STATES
WHERE CITY.ST_ID = STATES.ST_ID AND CITY_NAME ='BANGALORE';

--5	Find the city names which are in Maharashtra and the avg population greater than Surat city
SELECT C.CITY_NAME,S.ST_NAME,C.POPULATION
FROM CITY07 C
INNER JOIN STATES07 S ON C.ST_ID = S.ST_ID
WHERE S.ST_NAME ='Maharashtra'
AND C.POPULATION >(SELECT AVG(C.POPULATION) FROM CITY07 CI
WHERE C.ST_ID = CI.ST_ID);

--6	Find the number of states which are ruled by Congress
SELECT COUNT(ST_NAME) FROM STATES
WHERE POLITICAL_PARTY='CONGRESS';

--7	Find the state names which belongs to India and state name starts with G or M
SELECT C.COUNTRY_NAME,S.ST_NAME
FROM COUNTRY C , STATES S
WHERE C.COUNTRY_ID = S.COUNTRY_ID 
AND ST_NAME LIKE 'G%' OR ST_NAME LIKE 'M%';

--8	Find the city names where the names starts with B or M or P and the populatio between 400000 and 8000000
SELECT CITY_NAME,POPULATION
FROM CITY 
WHERE CITY_NAME LIKE 'B%' OR CITY_NAME LIKE 'M%'  OR CITY_NAME LIKE 'M%' 
AND POPULATION BETWEEN '400000' AND '8000000';

--9	How many cities we have which have population more than Bangalore city
SELECT CITY_NAME,POPULATION
FROM CITY
WHERE POPULATION >(SELECT POPULATION FROM CITY WHERE CITY_NAME='BANGALORE');

--10	Find the country names which does not have any states
SELECT C.COUNTRY_NAME
FROM COUNTRY C 
LEFT JOIN STATES S ON C.COUNTRY_ID = S.COUNTRY_ID
WHERE S.COUNTRY_ID IS NULL;

--11	Find the states which does not have any cities
SELECT ST_NAME
FROM STATES S
LEFT JOIN CITY C ON S.ST_ID = C.ST_ID
WHERE C.ST_ID IS NULL;


--12	Find the cities which are in India####
SELECT CITY_NAME
FROM CITY C
INNER JOIN COUNTRY S ON C.COUNTRY_ID = C.COUNTRY_ID
WHERE C.COUNTRY_NAME='INDIA';
	
commit;	


