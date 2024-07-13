CREATE TABLE emps500 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    email VARCHAR(50),
    phone_number VARCHAR(15),
    address VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (1, 'Alice', 1, 'Manager', 75000.00, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'alice@example.com', '123-456-7890', '123 Maple St', 'Springfield');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (2, 'Bob', 2, 'Developer', 65000.00, TO_DATE('2021-03-10', 'YYYY-MM-DD'), 'bob@example.com', '234-567-8901', '456 Oak St', 'Shelbyville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (3, 'Charlie', 1, 'Analyst', 60000.00, TO_DATE('2020-05-20', 'YYYY-MM-DD'), 'charlie@example.com', '345-678-9012', '789 Pine St', 'Ogdenville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (4, 'David', 3, 'Tester', 55000.00, TO_DATE('2019-07-25', 'YYYY-MM-DD'), 'david@example.com', '456-789-0123', '101 Birch St', 'Capitol City');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (5, 'Eve', 2, 'HR', 62000.00, TO_DATE('2021-09-30', 'YYYY-MM-DD'), 'eve@example.com', '567-890-1234', '202 Cedar St', 'Springfield');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (6, 'Frank', 3, 'Support', 48000.00, TO_DATE('2018-11-05', 'YYYY-MM-DD'), 'frank@example.com', '678-901-2345', '303 Spruce St', 'Shelbyville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (7, 'Grace', 1, 'Manager', 75000.00, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'grace@example.com', '789-012-3456', '123 Maple St', 'Springfield');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (8, 'Hank', 2, 'Developer', 65000.00, TO_DATE('2021-03-10', 'YYYY-MM-DD'), 'hank@example.com', '890-123-4567', '456 Oak St', 'Shelbyville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (9, 'Ivy', 1, 'Analyst', 60000.00, TO_DATE('2020-05-20', 'YYYY-MM-DD'), 'ivy@example.com', '901-234-5678', '789 Pine St', 'Ogdenville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (10, 'Jack', 3, 'Tester', 55000.00, TO_DATE('2019-07-25', 'YYYY-MM-DD'), 'jack@example.com', '012-345-6789', '101 Birch St', 'Capitol City');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (11, 'Kathy', 2, 'HR', 62000.00, TO_DATE('2021-09-30', 'YYYY-MM-DD'), 'kathy@example.com', '123-456-7890', '202 Cedar St', 'Springfield');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (12, 'Leo', 3, 'Support', 48000.00, TO_DATE('2018-11-05', 'YYYY-MM-DD'), 'leo@example.com', '234-567-8901', '303 Spruce St', 'Shelbyville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (13, 'Mona', 1, 'Manager', 75000.00, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'mona@example.com', '345-678-9012', '123 Maple St', 'Springfield');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (14, 'Nina', 2, 'Developer', 65000.00, TO_DATE('2021-03-10', 'YYYY-MM-DD'), 'nina@example.com', '456-789-0123', '456 Oak St', 'Shelbyville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (15, 'Oscar', 1, 'Analyst', 60000.00, TO_DATE('2020-05-20', 'YYYY-MM-DD'), 'oscar@example.com', '567-890-1234', '789 Pine St', 'Ogdenville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (16, 'Paul', 3, 'Tester', 55000.00, TO_DATE('2019-07-25', 'YYYY-MM-DD'), 'paul@example.com', '678-901-2345', '101 Birch St', 'Capitol City');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (17, 'Quincy', 2, 'HR', 62000.00, TO_DATE('2021-09-30', 'YYYY-MM-DD'), 'quincy@example.com', '789-012-3456', '202 Cedar St', 'Springfield');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (18, 'Rachel', 3, 'Support', 48000.00, TO_DATE('2018-11-05', 'YYYY-MM-DD'), 'rachel@example.com', '890-123-4567', '303 Spruce St', 'Shelbyville');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (19, 'Steve', 1, 'Manager', 75000.00, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'steve@example.com', '901-234-5678', '123 Maple St', 'Springfield');

INSERT INTO emps500 (employee_id, name, department_id, position, salary, hire_date, email, phone_number, address, city)
VALUES (20, 'Trudy', 2, 'Developer', 65000.00, TO_DATE('2021-03-10', 'YYYY-MM-DD'), 'trudy@example.com', '012-345-6789', '456 Oak St', 'Shelbyville');
select * from emps500;
select * from emps800;

--Rank function

Select name,position,department_id,salary,
Rank() over( order by salary desc)
from emps500;


Select name,position,department_id,salary,
Rank() over( partition by position order by salary desc)
from emps500;


select name,position; 

--Dense Rank
select name,position,salary,
dense_rank() over( order by salary asc)
from emps500;

--Lead

select name,position,salary,email,
lead( salary,1) over(order by salary desc)
from emps500;

--lead partition
select name,position,salary,email,
lead(salary,1)
over(partition by position order by salary)as salary_wise_lead
from emps500;


---lag
select name,position,salary,email,
lag(salary,1)
over (order by salary desc)
from emps500;

---lag with partition

select name,position,department_id,salary,
lag(salary,1)
over(partition by position order by salary desc)
from emps500;

---first_value
select distinct(department_id),
first_value(department_id)
over(order by department_id asc)
from emps500;
---last value
select distinct(department_id),
last_value(department_id)
over(order by department_id)
from emps500;

commit;
select substr('Aravind@gmail.com',8,12) from dual;



