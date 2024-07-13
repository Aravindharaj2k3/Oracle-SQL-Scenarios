CREATE TABLE department(
dept_id varchar2(4) primary key,
dept_name varchar2(20),
dept_loc varchar2(20)
);

CREATE TABLE jobs(
job_id varchar2(4) primary key,
job_role varchar2(20),
job_desc varchar2(50),
min_ctc number(10),
max_ctc number(10)
);
drop table jobs;


CREATE TABLE employee(
emp_id varchar2(4) primary key,
emp_name varchar2(20),
dept_id varchar2(4),
ctc number(10),
date_of_join date,
date_of_birth date,
job_id varchar2(4),
Gender varchar2(4),
FOREIGN KEY (dept_id) REFERENCES department(dept_id),
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
SELECT * from employee;

INSERT ALL
    INTO department VALUES(10,'Accounting','Bangalore')
    INTO department VALUES(11,'IT','Bangalore')
    INTO department VALUES(12,'Production','Mysore')
SELECT * FROM Dual;

INSERT ALL
    INTO jobs VALUES (50, 'Accountant', 'Book Keeping', 300000, 500000)
    INTO jobs VALUES (51, 'Operations Executive', 'Oversees Operations', 100000, 200000)
    INTO jobs VALUES (52, 'Software Engineer', 'Develop Applications', 400000, 800000)
    INTO jobs VALUES (53, 'Finance Analyst', 'Supporting Management Team', 400000, 700000)
    INTO jobs VALUES (54, 'CFO', 'Responsible for entire finance in the company', 800000, 1400000)
SELECT * FROM dual;

INSERT ALL
    INTO employee VALUES (100, 'RAM', 10, 340000, TO_DATE('10-Jan-18', 'DD-Mon-YY'), TO_DATE('8-Nov-98', 'DD-Mon-YY'), 50, 'M')
    INTO employee VALUES (101, 'TIM', 11, 500000, TO_DATE('15-Apr-19', 'DD-Mon-YY'), TO_DATE('18-Jan-80', 'DD-Mon-YY'), 52, 'M')
    INTO employee VALUES (102, 'UMA', 10, 475000, TO_DATE('18-Nov-18', 'DD-Mon-YY'), TO_DATE('22-Apr-84', 'DD-Mon-YY'), 50, 'F')
    INTO employee VALUES (103, 'KUMAR', 10, 500000, TO_DATE('10-Jan-21', 'DD-Mon-YY'), TO_DATE('1-Apr-92', 'DD-Mon-YY'), 53, 'M')
    INTO employee VALUES (104, 'MAHESH', 11, 600000, TO_DATE('14-Jan-21', 'DD-Mon-YY'), TO_DATE('4-Aug-90', 'DD-Mon-YY'), 52, 'M')
    INTO employee VALUES (105, 'RAMA', 10, 150000, TO_DATE('15-Jan-20', 'DD-Mon-YY'), TO_DATE('14-Nov-95', 'DD-Mon-YY'), 51, 'F')
    INTO employee VALUES (106, 'SURAJ', 11, 200000, TO_DATE('14-Mar-19', 'DD-Mon-YY'), TO_DATE('17-May-93', 'DD-Mon-YY'), 51, 'M')
SELECT * FROM dual;


commit;

--Quries:

--1	Display the highest paid employee name
SELECT emp_id, emp_name, max(ctc) as MAX_CTC
FROM employee 
GROUP BY emp_id, emp_name
order by max_ctc desc
FETCH FIRST 1 ROW ONLY;

--2	Display dept name and employee name of all departments
SELECT d.dept_name, e.emp_name 
FROM employee e
JOIN department d ON d.dept_id = e.dept_id
order BY d.dept_name;

--3	Display which job role we don’t have any employee
SELECT j.job_id, j.job_role FROM jobs j
LEFT JOIN employee e ON j.job_id = e.job_id
WHERE e.emp_id is null;

Select job_role From jobs 
WHERE job_id not in (SELECT job_id FROM Employee);

--4	Display how many Male employee for the Job role "Accountant"
SELECT j.job_role, count(*)
FROM employee e
JOIN jobs j ON j.job_id = e.job_id
WHERE e.gender ='M' and j.job_role = 'Accountant'
GROUP BY j.job_role;

--5	Which job role is Paid Highest
SELECT job_role, MAX(max_ctc)as Maximum_Ctc FROM Jobs
GROUP BY job_role
ORDER BY Maximum_Ctc DESC
FETCH FIRST 1 ROW ONLY;

--6	Display Department Names, Employee Name, Job Desc to all female employees who are in Accounting Department
SELECT dept_name, emp_name, job_desc FROM employee e
JOIN department d ON d.dept_id = e.dept_id
JOIN jobs j ON e.job_id = j.job_id
WHERE e.gender ='F'and  d.dept_name= 'Accounting';

--7	Display the department where we have the oldest person in the office
SELECT d.dept_name,min(e.date_of_birth)as Oldest FROM employee e
JOIN department d ON d.dept_id = e.dept_id
GROUP BY d.dept_name
Order By Oldest 
FETCH FIRST 1 ROW ONLY;


select dept_name
from department
where dept_id = (select dept_id
from employee
where date_of_birth = 
(select min(date_of_birth)
from employee))

--Each departement oldest employee
SELECT d.dept_name, min(e.date_of_birth)as Oldest FROM employee e
JOIN department d ON d.dept_id = e.dept_id
GROUP BY d.dept_name



--8	Display Yougest employee Job role
SELECT j.job_role, max(e.date_of_birth)as Youngest FROM employee e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_role
Order By Youngest desc
FETCH FIRST 1 ROW ONLY;

--9	Display Which department we have Finance Analyst
SELECT e.emp_name, d.dept_name FROM employee e
JOIN department d ON d.dept_id = e.dept_id
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_role = 'Finance Analyst';


--10	Disply to tal employee joined in between 2019 to 2020
SELECT emp_name FROM employee 
WHERE date_of_join between  '01-Jan-2019' and '01-Jan-2020';