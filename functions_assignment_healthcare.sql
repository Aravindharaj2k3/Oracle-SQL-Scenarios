--HEALTH CARE

    --doctor table
    create table doctor
    (doc_id varchar2(4) primary key,
    fname varchar2(20),
    lname varchar2(20),
    specialty varchar2(20),
    phone number(10)
    );
    
    --patient table
    create table patient
    (pat_id varchar2(4) primary key,
    fname varchar2(20),
    lname varchar2(20),
    ins_comp varchar2(20),
    phone number(10)
    );
    
    --case table
    create table case
    (admission_date date,
    pat_id varchar2(4) references patient(pat_id),
    doc_id varchar2(4) references doctor(doc_id),
    diagnosis varchar2(40),
    constraint con_cpk primary key(admission_date,pat_id)
    );

insert all
into doctor values('d1','arun','patel','ortho',9675093453)
into doctor values('d2','tim','patil','general',9674560453)
into doctor values('d3','abhay','sharma','heart',9675993453)
select * from dual;

insert all
into patient values('p1','akul','shankar','y',9148752347)
into patient values('p2','aman','shetty','y',9512896317)
into patient values('p3','ajay','shetty','n',9987321564)
into patient values('p4','akshay','pandit','y',9112255889)
into patient values('p5','adi','shankar','n',9177788821)
select * from dual;

insert all
into case values('10-jun-16','p1','d1','fracture')
into case values('03-may-16','p2','d1','bone cancer')
into case values('17-apr-16','p2','d2','fever')
into case values('28-oct-15','p3','d2','cough')
into case values('10-jun-16','p3','d1','fracture')
into case values('1-jan-16','p3','d1','bone cramp')
into case values('11-sep-15','p3','d3','heart attack')
into case values('30-nov-15','p4','d3','heart hole')
into case values('10-nov-15','p4','d3','angioplasty')
into case values('1-jan-16','p5','d3','angiogram')
into case values('11-mar-24','p5','d3','angiogram')
into case values('5-mar-24','p5','d3','angiogram')
into case values('12-mar-24','p5','d3','angiogram')
into case values('1-jan-24','p3','d1','physiotherpy')
into case values('1-jan-24','p2','d2','Sore throat')

select * from dual;

SELECT * FROM doctor;
SELECT * FROM patient;
SELECT * FROM case;

commit;


--Quries:
SELECT trunc(sysdate,'W') FROM dual;

--1.	Find all the patients who are treated in the first week of this month.
SELECT p.fname, c.admission_date FROM Patient p
JOIN case c on p.pat_id = c.pat_id
WHERE admission_date between trunc(sysdate, 'mon') and trunc(sysdate, 'mon')+ 7 ;

--2.	Find the patient name (first,last) who got admitted today where the doctor is ‘TIM’
SELECT d.fname, p.fname, p.lname FROM Patient p
JOIN case c on p.pat_id = c.pat_id
JOIN doctor d on c.doc_id = d.doc_id
WHERE d.fname = 'tim';

--3.	Find the Doctors whose phone numbers were not update (phone number is null)
SELECT fname FROM doctor where phone is null;


--4.	Display the doctors whose specialty is same as Doctor ‘TIM’
SELECT fname FROM doctor where specialty = (SELECT specialty FROM doctor where fname='tim') and fname !='tim';

--5.	Display the doctors who don’t have any cases registered this week
SELECT fname from doctor where fname not in (SELECT d.fname From doctor d
left JOIN case c on d.doc_id = c.doc_id
WHERE c.admission_date between trunc(sysdate, 'IW') and trunc(sysdate));

select fname
from doctor
where doc_id not in 
(select distinct d.doc_id
from doctor d inner join case c
on d.doc_id = c.doc_id
WHERE c.admission_date between trunc(sysdate, 'IW') and trunc(sysdate))


select fname
from doctor
where doc_id not in 
(select distinct d.doc_id
from doctor d inner join case c
on d.doc_id = c.doc_id
WHERE to_char(c.admission_date,'w-mon-yyyy') = to_char(sysdate,'w-mon-yyyy'))


select to_char(sysdate,'w-mon-yyyy') from dual

--6.	Display Doctor Name, Patient Name, Diagnosis for all the admissions which happened on 1st of Jan this year
SELECT initcap(d.fname) as doctor, initcap(p.fname) as patient, initcap(c.diagnosis) from case c
JOIN patient p on p.pat_id = c.pat_id
JOIN doctor d on d.doc_id = c.doc_id
where admission_date = trunc(sysdate, 'yyyy');

--7.	Display who are all patients take an treatment this month
SELECT initcap(p.fname) as patient FROM case c
join patient p on p.pat_id = c.pat_id
WHERE to_char(admission_date,'mon') = to_char(trunc(sysdate),'mon');

--8.	Display the doctor who treat for Heart attack
SELECT initcap(d.fname) as Doctor FROM case c
JOIN doctor d on d.doc_id = c.doc_id
WHERE c.diagnosis = 'heart attack';

--9.	Display how many patients consulated doctor abhay
--how to add distinct
SELECT distinct initcap(d.fname) as doctor, initcap(p.fname) as patient from case c
JOIN patient p on p.pat_id = c.pat_id
JOIN doctor d on d.doc_id = c.doc_id
WHERE c.doc_id = (SELECT doc_id from doctor where fname = 'abhay');

--10.	Display patients who got admitted yesterday and who treated them
SELECT initcap(p.fname) as patient, initcap(d.fname) as doctor FROM case c
JOIN patient p on p.pat_id = c.pat_id
JOIN doctor d on d.doc_id = c.doc_id
where admission_date = trunc(sysdate) - 1;




