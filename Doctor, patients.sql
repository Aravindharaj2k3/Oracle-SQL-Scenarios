-- Create DOCTORS table
CREATE TABLE DOCTORS000 (
    DOC_ID NUMBER PRIMARY KEY,
    DOC_NM VARCHAR2(50),
    DOC_SPECIALITY VARCHAR(50)
);

-- Create LOCATION table
CREATE TABLE LOCATIONS00 (
    LOC_ID NUMBER PRIMARY KEY,
    LOC_CODE VARCHAR2(50),
    LOC_CITY VARCHAR2(50),
    LOC_STATE VARCHAR2(50),
    LOC_ZIP_CODE NUMBER
);

-- Create PATIENTS table
CREATE TABLE PATIENTS00 (
    PAT_ID NUMBER PRIMARY KEY,
    PAT_NM VARCHAR2(50),
    PAT_DOB TIMESTAMP,
    GENDER CHAR(1),
    LOC_ID NUMBER,
    PHONE_NO VARCHAR2(15),
    INSURENCE_FLAG CHAR(1)
);

-- Create PAT_TREATMENT table
CREATE TABLE PAT_TREATMENT00 (
    PAT_TREAT_ID NUMBER PRIMARY KEY,
    TREAT_ID NUMBER,
    TREAT_DATE TIMESTAMP,
    PAT_ID NUMBER,
    DOC_ID NUMBER,
    TREAT_DUR_DAYS NUMBER
   
);
INSERT ALL
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (201, 'Sanjana Patel', 'Ortho')
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (202, 'Vikram Singh', 'Cardiologists')
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (203, 'Priya Desai', 'Nasyam specialists')
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (204, 'Aryan Kumar', 'Ayurvedic therapists')
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (205, 'Nandini Rao', 'Isopathy specialists')
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (206, 'Aditi Sharma', 'Gastroenterologists')
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (207, 'Rohit Gupta', 'Tissue salts specialists')
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (208, 'Neha Sharma', 'Neurologists')
    INTO DOCTORS000 (DOC_ID, DOC_NM, DOC_SPECIALITY) VALUES (209, 'Rohini Menon', 'Oncologists')
SELECT * FROM DUAL;

INSERT ALL
    INTO LOCATIONS00 (LOC_ID, LOC_CODE, LOC_CITY, LOC_STATE, LOC_ZIP_CODE) VALUES (100, 'IN-TN-CHN', 'Chennai', 'Tamil Nadu', '600001')
    INTO LOCATIONS00 (LOC_ID, LOC_CODE, LOC_CITY, LOC_STATE, LOC_ZIP_CODE) VALUES (101, 'IN-TN-CBT', 'Coimbatore', 'Tamil Nadu', '630004')
    INTO LOCATIONS00 (LOC_ID, LOC_CODE, LOC_CITY, LOC_STATE, LOC_ZIP_CODE) VALUES (102, 'IN-KA-BLR', 'Bangalore', 'Karnataka', '560002')
    INTO LOCATIONS00 (LOC_ID, LOC_CODE, LOC_CITY, LOC_STATE, LOC_ZIP_CODE) VALUES (103, 'IN-KA-MYS', 'Mysore', 'Karnataka', '550044')
SELECT * FROM DUAL;
INSERT ALL
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1001, 'Rahul Sharma', TO_DATE('1994-03-12', 'YYYY-MM-DD'), 'M', 101, '9786574560', 'Y')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1002, 'Anjali', TO_DATE('1974-05-14', 'YYYY-MM-DD'), 'F', 102, '9486654563', 'N')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1003, 'Priya Patel', TO_DATE('1984-03-13', 'YYYY-MM-DD'), 'F', 103, '9534745680', 'N')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1004, 'Rakesh Singh', TO_DATE('1974-06-16', 'YYYY-MM-DD'), 'M', 104, '9984574563', 'N')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1005, 'Neha Gupta', TO_DATE('1984-07-17', 'YYYY-MM-DD'), 'F', 105, '8745645641', 'Y')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1006, 'Sunil Kumar', TO_DATE('1994-08-18', 'YYYY-MM-DD'), 'M', 101, '9665745632', 'Y')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1007, 'Preeti Varma', TO_DATE('1984-09-19', 'YYYY-MM-DD'), 'F', 101, '7956745645', 'N')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1008, 'Amit Joshi', TO_DATE('1994-05-20', 'YYYY-MM-DD'), 'M', 102, '9765734613', 'Y')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1009, 'Sangeeta Patel', TO_DATE('1997-03-21', 'YYYY-MM-DD'), 'F', 103, '9865743456', 'Y')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1010, 'Neha Sharma', TO_DATE('1998-10-22', 'YYYY-MM-DD'), 'F', 104, '7665783632', 'Y')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1011, 'Abhishek Gupta', TO_DATE('1999-11-23', 'YYYY-MM-DD'), 'M', 105, '8865576642', 'N')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1012, 'Deepak Kumar', TO_DATE('2000-12-24', 'YYYY-MM-DD'), 'M', 105, '7845789635', 'N')
    INTO Patients00 (PAT_ID, PAT_NM, PAT_DOB, GENDER, LOC_ID, PHONE_NO, INSURENCE_FLAG) VALUES (1013, 'Jaya Patel', TO_DATE('2001-01-25', 'YYYY-MM-DD'), 'F', 104, '9865634531', 'Y')
SELECT * FROM DUAL;

INSERT ALL
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7001, 501, TO_DATE('2022-08-12', 'YYYY-MM-DD'), 1001, 201, 3)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7002, 503, TO_DATE('2021-07-15', 'YYYY-MM-DD'), 1003, 202, 10)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7003, 504, TO_DATE('2021-06-12', 'YYYY-MM-DD'), 1004, 203, 1)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7004, 505, TO_DATE('2020-07-11', 'YYYY-MM-DD'), 1002, 204, 2)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7005, 506, TO_DATE('2020-07-20', 'YYYY-MM-DD'), 1005, 205, 8)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7006, 507, TO_DATE('2019-09-12', 'YYYY-MM-DD'), 1006, 206, 5)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7007, 508, TO_DATE('2018-08-16', 'YYYY-MM-DD'), 1007, 207, 10)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7008, 508, TO_DATE('2021-11-10', 'YYYY-MM-DD'), 1008, 207, 4)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7009, 506, TO_DATE('2020-05-22', 'YYYY-MM-DD'), 1009, 205, 10)
    INTO pat_treatment00 (PAT_TREAT_ID, TREAT_ID, TREAT_DATE, PAT_ID, DOC_ID, TREAT_DUR_DAYS) VALUES (7010, 502, TO_DATE('2022-08-16', 'YYYY-MM-DD'), 1008, 203, 4)
SELECT * FROM DUAL;

--Display the values
select * from doctors000;
select * from locations00;
select * from patients00;
select * from pat_treatment00;

--Questions 
--1	Display all the doctors who have provided the treatments or not.	

select d.doc_nm,p.pat_nm as Not_treatments
from doctors000 d
left join pat_treatment00 pt on d.doc_id = pt.doc_id 
left join patients00 p on pt.pat_id = p.pat_id
where p.pat_nm is null;


--2	Display the doctors who did not provide any treatments in the last year.

select d.doc_nm,pt.treat_date as last_yr_didnot_any_treatments
from doctors000 d
left join pat_treatment00 pt on d.doc_id = pt.doc_id
where pt.treat_date is null or pt.treat_date < trunc(sysdate,'yyyy')- interval '1' year;  

--3	Display the number of patients in each city.	
select L.Loc_city,count(p.pat_nm) as no_of_patient_each_country
from locations00 L 
inner join patients00 p on L.loc_id = p.loc_id
group by L.Loc_city
order by L.Loc_city;

--4	Display the number of patients treated in every month for the current year.	
select d.doc_nm,to_char(pt.treat_date,'mon'),count(p.pat_nm) as every_month_for_the_current_year
from doctors000 d
inner join pat_treatment00 pt on d.doc_id = pt.doc_id
inner join patients00 p on pt.pat_id = p.pat_id
where to_char(pt.treat_date,'yyyy')= to_char(sysdate,'yyyy')-2
group by d.doc_nm,to_char(pt.treat_date,'mon');

--5	Display the patients who has taken the highest number of treatments from last 3 years.

select pt.treat_date,max(p.pat_nm) as Highest_number_of_treatments
from patients00 p
inner join pat_treatment00 pt on p.pat_id = pt.pat_id 
where to_char(pt.treat_date,'yyyy') = to_char(sysdate,'yyyy')-3
group by pt.treat_date
order by pt.treat_date desc
fetch first row only;



--6	Display the top3 years based on the number of patients treated.	

select to_char(pt.treat_date,'yyyy'),count(p.pat_id) as top3_based_number_of_patients
from patients00 p
inner join pat_treatment00 pt on p.pat_id = pt.pat_id 
group by to_char(pt.treat_date,'yyyy')
order by count(distinct p.pat_id ) desc
fetch first 3 row only;


--7	Display the year, no of patients and no of doctors.
select to_char (pt.treat_date,'yyyy'),count(p.pat_id),count(d.doc_id)
from pat_treatment00 pt 
inner join patients p on pt.pat_id = p.pat_id 
inner join doctors000 d on pt.doc_id = d.doc_id
group by to_char (pt.treat_date,'yyyy')
order by to_char (pt.treat_date,'yyyy');

--9	Display male and Female Patiens count
select pat_nm,
count(case when gender ='M' then pat_id end)as Male_count,
count(case when gender ='F' then pat_id end)as Female_count
from patients00
group by pat_nm;

--10	Display Common Patient treated by Dr. Rohit Gupta and Dr.Priya Desai

select d.doc_nm,p.pat_nm
from doctors000  d
inner join pat_treatment00 pt on d.doc_id = pt.doc_id
inner join patients00 p on pt.pat_id = p.pat_id
where doc_nm ='Rohit Gupta' or doc_nm ='Priya Desai';

commit;
