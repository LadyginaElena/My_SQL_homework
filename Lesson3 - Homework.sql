-- Homework #3  
-- Part 1 - mywork database
-- Write sql 
-- 	1. Add column 'country' to dept table in mywork database
-- select * from mywork.dept;
 ALTER TABLE mywork.dept add column country varchar (50);
-- создаем databsey mywork
CREATE DATABASE mywork;
-- создаем таблицу emploee_test
CREATE TABLE mywork.EMPLOYEE_TEST (
EMPLOYEE_ID int not null,
FIRST_NAME varchar (75),
LAST_NAME varchar (75),
ADDRESS varchar (100),
CITY varchar (30),
STATE  varchar (20),
ZIP_CODE varchar (20),
PHONE varchar (25),
COUNTRY varchar (50),
HIREDATE date,
SALARY decimal (6,2),
PRIMARY KEY (EMPLOYEE_ID));
-- создаем таблицу  emp
CREATE TABLE mywork.emp (
empno INT (10) NOT NULL,
ename VARCHAR(10) DEFAULT NULL,
job VARCHAR(9) DEFAULT NULL,
mgr INT(10) DEFAULT NULL,
hiredate DATE,
sal NUMERIC(7,2),
comm NUMERIC(7,2) NULL,
dept INT (10),
 PRIMARY KEY (empno));
 -- добавляем данные в таблицу dept 
insert into mywork.emp (empno,ename,job,mgr,hiredate,sal,comm,dept)
values
    (1,'JOHNSON','ADMIN',6,'1990-12-17',18000,NULL,4); 
    insert into mywork.emp (empno,ename,job,mgr,hiredate,sal,comm,dept)
values
    (2,'HARDING','MANAGER',9,'1990-12-17',52000,300,3),
	(3,'TAFT','SALES I',2,'1995-12-17',25000,500,3),
    (4,'HOOVER','SALES I',2,'1990-04-02',27000,NULL,3),
    (5,'LINCOLN','TECH',6,'1994-06-23',22500,1400,4),
    (6,'GARFIELD','MANAGER',9,'1993-05-01',54000,NULL,4),
    (7,'POLK','TECH',6,'1997-09-22',25000,NULL,4),
    (8,'GRANT','ENGINEER',10,'1997-03-30',32000,NULL,2),
    (9,'JACKSON','CEO',NULL,'1990-01-01',75000,NULL,4),
    (10,'FILLMORE','MANAGER',9,'1994-08-09',56000,NULL,2),
    (11,'ADAMS','ENGINEER',10,'1996-03-15',34000,NULL,2),
    (12,'WASHINGTON','ADMIN',6,'1998-04-16',18000,NULL,4),
    (13,'MONROE','ENGINEER',10,'2000-12-03',30000,NULL,2),
    (14,'ROOSEVELT','CPA',9,'1995-10-12',35000,NULL,1);
    
 -- создаем таблицу dept
 CREATE TABLE IF NOT EXISTS mywork.dept (
deptno INT NOT NULL,
dname VARCHAR(14),
loc VARCHAR(13),
 PRIMARY KEY (deptno));
-- добавляем данные в таблицу dept 
insert into mywork.dept values (1,'ACCOUNTING','ST LOUIS');
insert into mywork.dept values (2,'RESEARCH','NEW YORK');
insert into mywork.dept values (3,'SALES','ATLANTA');
insert into mywork.dept values (4,'OPERATIONS','SEATTLE');

-- создаем foreing key
ALTER TABLE mywork.emp
ADD FOREIGN KEY fk_dept(dept)
REFERENCES dept(deptno)
ON DELETE NO ACTION
ON UPDATE CASCADE;


-- 	2. Rename column 'loc' to 'city'
alter table mywork.dept rename column loc to city;
-- 	3. Add three more departments: HR, Engineering, Marketing
insert into mywork.dept values (5,'HR','ST LOUIS');
insert into mywork.dept values (6,'Engineering','ST LOUIS');
insert into mywork.dept values (7,'Marketing','ST LOUIS');

-- 	4. Write sql statement to show which department is in Atlanta
select dname, city 
from mywork.dept
where city = "Atlanta";

--     Save your work in Homework3_Answers.sql


-- Part 2  - library_simple database
-- Run library_simple.sql script  (takes a few minutes)
-- (source: https://github.com/amyasnov/stepic-db-intro/tree/2650f9a7f9c72e1219ea93cb4c4e410cca046e54 )

-- Look at table relationships in EER Diagram

-- Write sql 
-- 	1. What is the first name of the author with the last name Swanson?
select *
from library_simple.author
where last_name = "Swanson";

-- 	2. How many pages are in Men Without Fear book?
select page_num, `name`
from library_simple.book
where `name` like '%Men Without Fear%';

-- 	3. Show all book categories that start with with letter 'W'
select *
from library_simple.category
where `name` like 'W%';
