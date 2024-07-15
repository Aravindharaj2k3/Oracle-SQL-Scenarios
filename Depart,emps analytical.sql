-- Create department table
CREATE TABLE departs00 (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(100),
    location VARCHAR2(100)
);

-- Create employee table
CREATE TABLE employee00(
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    emp_salary NUMBER,
    dept_id NUMBER,
    hire_date DATE
);

-- Insert departs00 with location
INSERT ALL
    INTO departs00 (dept_id, dept_name, location) VALUES (1, 'Sales', 'New York')
    INTO departs00 (dept_id, dept_name, location) VALUES (2, 'Marketing', 'San Francisco')
    INTO departs00 (dept_id, dept_name, location) VALUES (3, 'Engineering', 'Seattle')
    INTO departs00 (dept_id, dept_name, location) VALUES (4, 'Finance', 'Chicago')
SELECT * FROM dual;

-- Insert employee00 with hire date
INSERT ALL
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (1, 'John Doe', 50000, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (2, 'Jane Smith', 60000, 2, TO_DATE('2023-02-20', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (3, 'Michael Johnson', 55000, 1, TO_DATE('2023-03-10', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (4, 'Emily Brown', 58000, 2, TO_DATE('2023-04-05', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (5, 'David Wilson', 52000, 3, TO_DATE('2023-05-12', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (6, 'Sarah Lee', 63000, 4, TO_DATE('2023-06-18', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (7, 'James Taylor', 54000, 1, TO_DATE('2023-07-22', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (8, 'Olivia Martin', 59000, 2, TO_DATE('2023-08-30', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (9, 'William Garcia', 51000, 3, TO_DATE('2023-09-14', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (10, 'Sophia Rodriguez', 61000, 4, TO_DATE('2023-10-25', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (11, 'Daniel Martinez', 57000, 1, TO_DATE('2023-11-03', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (12, 'Isabella Hernandez', 64000, 2, TO_DATE('2023-12-08', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (13, 'Alexander Lopez', 53000, 3, TO_DATE('2024-01-17', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (14, 'Mia Gonzalez', 57000, 4, TO_DATE('2024-02-22', 'YYYY-MM-DD'))
    INTO employee00 (emp_id, emp_name, emp_salary, dept_id, hire_date) VALUES (15, 'Ethan Perez', 55000, 1, TO_DATE('2024-03-30', 'YYYY-MM-DD'))
SELECT * FROM dual;


---Display the values
select * from departs00;
select * from employee00;

--List all departments and the number of employees in each department
select distinct (d.dept_name),count(e.emp_id )as number_of_employees_in_each_department
from departs00 d
left join employee00 e on d.dept_id = e.dept_id
group by d.dept_name;


--Calculate the average salary across all departments
select distinct d.dept_name,avg(e.emp_salary) as avg_salary
from departs00 d
inner join employee00 e on d.dept_id = e.dept_id
group by d.dept_name; 

select distinct d.dept_name,e.emp_salary as avg_salary
from departs00 d
inner join employee00 e on d.dept_id = e.dept_id
where e.emp_salary =(select avg(e.emp_salary) from employee00 ee
where e.dept_id = ee.dept_id);


--List the top 3 departments with the highest total salary expenditure:

select distinct d.dept_name,sum(e.emp_salary) as avg_salary
from departs00 d
inner join employee00 e on d.dept_id = e.dept_id
group by  d.dept_name
order by sum(e.emp_salary) desc;

--fetch first row only
select distinct d.dept_name,sum(e.emp_salary) as avg_salary
from departs00 d
inner join employee00 e on d.dept_id = e.dept_id
group by  d.dept_name
order by sum(e.emp_salary) desc
fetch first row only;

--Rank employees based on their salary in descending order within each department:
select  d.dept_name,e.emp_name,e.emp_salary,
rank() over(partition by d.dept_name order by e.emp_salary desc)
from departs00 d 
inner join employee00 e on d.dept_id = e.dept_id;



--Calculate the difference in salary between the highest paid and lowest paid employee in department:
select d.dept_name,max(e.emp_salary) as max_salary,
min(e.emp_salary) as min_salary 
from departs00 d
inner join employee00 e on d.dept_id = e.dept_id
group by d.dept_name;


select d.dept_name,e.emp_name,e.emp_salary as max_min_employe_salary
from departs00 d
inner join employee00 e on d.dept_id = e.dept_id
where e.emp_salary in (select max(e.emp_salary) from employee00 e)
union all
select distinct d.dept_name,e.emp_name,e.emp_salary
from departs00 d
inner join employee00 e on d.dept_id = e.dept_id
where e.emp_salary in (select min(e.emp_salary) from employee00 e);


--List employees who earn more than the average salary of their department:
select d.dept_name,avg(e.emp_salary) as max_avg_employe_salary
from departs00 d
inner join employee00 e on d.dept_id = e.dept_id
group by d.dept_name
where e.emp_name = (select e.emp_name from employee00 e);



select d.dept_name,e.emp_name,e.emp_salary as more_max_employe_salary
from departs00 d
 join employee00 e on d.dept_id = e.dept_id
 where e.emp_salary = (select avg(e.emp_salary) from employee00 ee
                       where  ee.dept_id = e.dept_id);

select e.emp_name,e.emp_salary, d.dept_name
from employee00 e
 join departs00 d on e.dept_id = d.dept_id
 where e.emp_salary = (select avg(e.emp_salary) from employee00 ee
                       where  ee.dept_id = e.dept_id
                       group by e.dept_id  )
                       order by d.dept_name;


--Find the department with the highest average salary
select distinct d.dept_name,e.emp_salary
from departs00 d 
inner join employee00 e on d.dept_id = e.dept_id
where e.emp_salary > (select avg(e.emp_salary) from employee00 e
                      group by d.dept_name)
                      order by e.emp_salary desc
                      fetch first row only;

--Calculate the total number of employees hired each year:

select emp_name,count(emp_id)
from employee00 e
where hire_date between trunc(sysdate,'yyyy') and trunc(sysdate,'yyyy')
group by emp_name;

select to_char(hire_date,'yyyy') as hire_date,
count(emp_id) as number_of_employe
from employee00 
group by to_char(hire_date,'yyyy');

--Identify employees who joined before a specific date (e.g., '2023-01-01'):
select emp_name,hire_date
from employee00
where hire_date < date '2023-03-01';
commit;