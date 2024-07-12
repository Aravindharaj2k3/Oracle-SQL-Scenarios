--String functions--
---lower---Converts the Character into lower case
select lower('IBRIDGE360') from dual
select lower(emp_name) from emps

---upper---Converts the Character into upper case
select upper('ibridge360') from dual

--lenght--counts the number of charcters--
select emp_name,length(emp_name)
from emps


--ltrim ---Remove unwanted spaces from left side
select emp_name,length(emp_name),length(ltrim(emp_name))
from emps

--rtrim ---Remove unwanted spaces from right side
select rtrim('ibride360                    ') from dual--rtrim ---Remove unwanted spaces from right side



--substr--it gives part of the string--syntax(string,start,how many characters you need to read)
select substr('ibridge360',1,7) from dual
select substr('ibridge360',8,3) from dual

--instr--checks the position of a charater
select instr('ibridge360','i',2) from dual

select * from actor

emial is -aditiprahu@gmail.come

select substr(email,1,instr(email,'@')-1 )
from actor


--INITCAP-----First charcter as Capital rest all small letter
select initcap(emp_name) from emps

--lpad --Function takes a text value and pas it to left side by adding extra character based required length
select lpad('ibridge360',15,'*') from dual

--rpad --Function takes a text value and pas it to left side by adding extra character based required length
select rpad('ibridge360',15,'*') from dual


---Number Functions---
abs --Which converts negative value into positive value
select abs(-12) from dual


power --It gives you the power of value
select power(2,3) from dual

sqrt --It gives square root of given value
select sqrt(25) from dual

mod --Remainder from division
select mod(15,4) from dual;

floor --ROunded up any +ve or -ve decimal value down to the next integer
select floor(15.1553453) from dual


ceil -- ROunded up any +ve or -ve decimal value up to the next integer
select ceil(15.1553453) from dual

round -- rounded decimal points based on the decimal point need to show
select round(15.45656565398563,2) from dual


----------------------------------------------
--Date functions
sysdate --GIves the system date
select sysdate from dual


add_months --it adds number of months for a date
select add_months(sysdate,3) from dual



months_between -- tells the months difference between 2 dates
select months_between(sysdate,'23-4-2024') from dual


last_day --tells you the last date of this current month
select last_day(sysdate) from dual

next_day --it tells you the date of next day
select next_day(sysdate,'fri') from dual

trunc --Gives you first day of the year
select trunc(sysdate,'YYYY') from dual
select trunc(sysdate,'mon') from dual

to_char --FUnction which converts the date format based on the required condition basically it converts date to string
select sysdate from dual
select to_char(sysdate,'dd/mm/yy hh:mm:ss') from dual
select to_char(sysdate,'dd-mm-yyyy') from dual
select to_char(sysdate,'dd-mon-yyyy') from dual
select to_char(sysdate,'dd-month-yyyy') from dual
select to_char(sysdate,'day-mon-yyyy') from dual
select to_char(sysdate,'dy') from dual
select to_char(sysdate,'q') from dual
select to_char(sysdate,'w') from dual
select to_char(sysdate,'yyyy')-2 from dual

select * from emps
--display employees who hired in the 3 years back--
select emp_name,date_of_join
from emps
where to_char(date_of_join,'yyyy') = to_char(sysdate,'yyyy')-3

---display employee who born in this month--
select emp_name,date_of_birth
from emps
where to_char(date_of_birth,'mon')= to_char(sysdate,'mon')

--display who born on august month--
select emp_name,date_of_birth
from emps
where to_char(date_of_birth,'mon')= 'aug'

---To date function -- which converts string to date--
select to_date('31-02-23') from dual
select to_date('28-02-23') from dual

select * from emps



