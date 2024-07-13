---Set Opereators 

CREATE TABLE Depart00 (
    DEPT_ID NUMBER PRIMARY KEY,
    DEPT_NAME VARCHAR2(50) NOT NULL,
    LOCATION VARCHAR2(100)
);




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



CREATE TABLE emps600 (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    phone_number VARCHAR2(20),
    hire_date DATE,
    job_id VARCHAR2(10),
    salary NUMBER(8,2)
);


INSERT ALL
    INTO emps600 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary) VALUES (4, 'John', 'Doe', 'john.doe@example.com', '1234567890', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'IT_PROG', 60000.00)
    INTO emps600 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary) VALUES (5, 'Jane', 'Smith', 'jane.smith@example.com', '2345678901', TO_DATE('2022-03-22', 'YYYY-MM-DD'), 'HR_REP', 55000.00)
    INTO emps600 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary) VALUES (6, 'Michael', 'Brown', 'michael.brown@example.com', '3456789012', TO_DATE('2021-07-10', 'YYYY-MM-DD'), 'FIN_MGR', 75000.00)
    INTO emps600 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary) VALUES (7, 'Emily', 'Davis', 'emily.davis@example.com', '4567890123', TO_DATE('2020-11-30', 'YYYY-MM-DD'), 'SA_REP', 50000.00)
    INTO emps600 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary) VALUES (8, 'William', 'Wilson', 'william.wilson@example.com', '5678901234', TO_DATE('2019-04-18', 'YYYY-MM-DD'), 'MK_MAN', 68000.00)
    INTO emps600 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary) VALUES (9, 'Olivia', 'Taylor', 'olivia.taylor@example.com', '6789012345', TO_DATE('2018-02-25', 'YYYY-MM-DD'), 'IT_PROG', 62000.00)
    INTO emps600 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary) VALUES (10, 'James', 'Anderson', 'james.anderson@example.com', '7890123456', TO_DATE('2017-09-12', 'YYYY-MM-DD'), 'HR_REP', 53000.00)
    INTO emps600 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary) VALUES (11, 'Sophia', 'Thomas', 'sophia.thomas@example.com', '8901234567', TO_DATE('2016-06-05', 'YYYY-MM-DD'), 'FIN_ANAL', 59000.00)
SELECT * FROM dual;

delete from emps900;
truncate table emps900;

select * from emps800;
select * from emps600;

--At a same time we have min and max values how to getting?
--union
select first_name,last_name,salary as min_max_salary
from emps600
where salary = (select max(salary) from emps600)
union 
select first_name,last_name,salary 
from emps600
where salary = (select min(salary) from emps600);

--Union all
select first_name from emps600
union all
select first_name from emps800;

--Minus!!

select email from emps600
minus
select email from emps800;



--Intersect!! 
-- Only for one select statements and another query also one select statements!!

select first_name,last_name,salary as min_max_salary
from emps600
where salary = (select max(salary) from emps600)
intersect
select first_name,last_name,salary 
from emps600
where salary = (select min(salary) from emps600);

select salary from emps600
intersect
select salary from emps600;


commit;

