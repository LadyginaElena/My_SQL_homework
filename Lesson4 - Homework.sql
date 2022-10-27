-- ---------------------------------------------------			
-- Homework for Lesson #4 
-- Part #1 classicmodels database 
-- (write sql for #6, 8, 9, 10, 11, 14, 16, 17, 21) -- easy questions

-- 1.how many vendors, product lines, and products exist in the database?
select *
from classicmodels.productlines; -- --7;
select *
from classicmodels.products; -- --50


-- 2.what is the average price, buy price, MSRP per vendor?
-- 3.what is the average price, buy price, MSRP per customer?
-- 4.what product was sold the most?
-- 5.how much money was made between buyPrice and MSRP?
-- 6.which vendor sells 1966 Shelby Cobra?
select productName, productVendor
from classicmodels.products
where productName like '1966%';

-- 7.which vendor sells more products?
-- 8.which product is the most and least expensive?
select productName, buyPrice
from classicmodels.products
order by buyPrice
limit 1;

select productName, buyPrice
from classicmodels.products
order by buyPrice desc
limit 1;

-- 9.which product has the most quantityInStock?
select productName, quantityInStock
from classicmodels.products
order by quantityInStock desc
limit 1;

-- 10.list all products that have quantity in stock less than 20
select productName, quantityInStock
from classicmodels.products
where quantityInStock < 20;

-- 11.which customer has the highest and lowest credit limit?
select customerName, customerNumber, creditLimit
from classicmodels.customers
order by creditLimit desc
limit 1;

select customerName, customerNumber, creditLimit
from classicmodels.customers
order by creditLimit
limit 1;


-- 12.rank customers by credit limit
-- 13.list the most sold product by city
-- 14.customers in what city are the most profitable to the company?
select c.customerNumber, c.city, p.amount
from classicmodels.customers as c
join classicmodels.payments as p
on c.customerNumber = p.customerNumber
order by amount desc;

-- 15.what is the average number of orders per customer?
-- 16.who is the best customer?
select customerNumber, amount
from classicmodels.payments
order by amount desc
limit 1;

-- 17.customers without payment
select c.customerNumber, checkNumber, paymentDate
from classicmodels.customers as c
left join classicmodels.payments p
on c.customerNumber = p.customerNumber
where paymentDate is null;


-- 18.what is the average number of days between the order date and ship date?
-- 19.sales by year
-- 20.how many orders are not shipped?
-- 21.list all employees by their (full name: first + last) in alpabetical order
select firstName, lastName
from classicmodels.employees
order by firstName;

-- 22.list of employees  by how much they sold in 2003?
-- 23.which city has the most number of employees?
-- 24.which office has the biggest sales?

-- Part #2  -- library_simple database
-- 1.find all information (query each table seporately for book_id = 252)
select *
from library_simple.author_has_book
where book_id = 252;
select *
from library_simple.book
where id = 252;
select *
from library_simple.category_has_book
where book_id = 252;
select *
from library_simple.copy
where book_id = 252;

-- 2.which books did Van Parks write?
select *
from library_simple.author as a
join library_simple.author_has_book as h
on a.id = h.author_id
where a.first_name like '%Van%' and a.last_name like '%Parks%';


-- 3.which books where published in 2003?
select id, pub_year
from library_simple.book
where pub_year = 2003;


