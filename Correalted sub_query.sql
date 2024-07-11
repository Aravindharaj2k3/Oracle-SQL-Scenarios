CREATE TABLE Depart00 (
    DEPT_ID NUMBER PRIMARY KEY,
    DEPT_NAME VARCHAR2(50) NOT NULL,
    LOCATION VARCHAR2(100)
);

INSERT ALL
    INTO Depart00 (DEPT_ID, DEPT_NAME, LOCATION) VALUES (1, 'Human Resources', 'New York')
    INTO Depart00 (DEPT_ID, DEPT_NAME, LOCATION) VALUES (2, 'Finance', 'London')
    INTO Depart00 (DEPT_ID, DEPT_NAME, LOCATION) VALUES (3, 'IT', 'San Francisco')
    INTO Depart00 (DEPT_ID, DEPT_NAME, LOCATION) VALUES (4, 'Marketing', 'Paris')
    INTO Depart00 (DEPT_ID, DEPT_NAME, LOCATION) VALUES (5, 'Sales', 'Tokyo')
SELECT * FROM DUAL;


CREATE TABLE EMPS800 (
    EMP_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    EMAIL VARCHAR2(100) UNIQUE,
    PHONE_NUMBER VARCHAR2(20),
    HIRE_DATE DATE,
    JOB_ID VARCHAR2(10),
    SALARY NUMBER(8, 2),
    DEPT_ID NUMBER
);

INSERT ALL
    INTO EMPS800 (EMP_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, DEPT_ID) 
    VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'DEV', 60000, 3)
    INTO EMPS800 (EMP_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, DEPT_ID) 
    VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '098-765-4321', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'QA', 50000, 2)
    INTO EMPS800 (EMP_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, DEPT_ID) 
    VALUES (3, 'Mike', 'Johnson', 'mike.johnson@example.com', '555-555-5555', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'PM', 70000, 1)
    INTO EMPS800 (EMP_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, DEPT_ID) 
    VALUES (4, 'Alice', 'Brown', 'alice.brown@example.com', '444-444-4444', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'HR', 55000, 1)
    INTO EMPS800 (EMP_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, DEPT_ID) 
    VALUES (5, 'Bob', 'Davis', 'bob.davis@example.com', '333-333-3333', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'FIN', 65000, 2)
SELECT * FROM DUAL;


select * from depart00;
select * from emps800;

--which department employee morethen avg salary 

select d.dept_name,e.first_name,e.salary as morethen_avg_salary
from depart00 d
inner join emps800 e on d.dept_id = e.dept_id
where salary > (select avg(salary) from emps800 e1 
where e1.dept_id = e.dept_id);

--max salary 

select d.dept_name,e.first_name,e.salary as Depart_Max_salary
from depart00 d
inner join emps800 e on d.dept_id = e.dept_id
where salary = (select max(salary) from emps800 e1 
where e1.dept_id = e.dept_id);

--min salary
select d.dept_name,e.first_name,e.salary as Depart_min_salary
from depart00 d
inner join emps800 e on d.dept_id = e.dept_id 
where salary = (select min(salary) from emps800 ee 
where e.dept_id = ee.dept_id);

--Single table correalted sub query
select d.dept_name,e.first_name,e.last_name,e.salary
from emps800 e
inner join depart00 d on e.dept_id = d.dept_id
where salary = (select max(salary) from emps800 e1 
where e1.dept_id = e.dept_id);


SELECT first_name,last_name, salary
FROM emps800 e
WHERE salary =(SELECT MAX(salary)
                FROM emps800 e1
                WHERE e1.dept_id = e.dept_id);
commit;
