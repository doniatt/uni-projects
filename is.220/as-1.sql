  create database company;

use company;

create table customer(
Customer_ID varchar(50) primary key,
Name varchar(50),
Nationality varchar(50) default 'Egyptian',
Zip int check (Zip > 0),
age int check (age >= 18),
Email varchar(50)
);

insert into customer
values ('MOR9117', 'James', default, 98310, 18, 'jmorgan@cti.net'), 
       ('PIC3760','Kate', 'Palestinian', 64068, 20, 'picadillyk@monet.com'),
	   ('BEL2456','Rex', 'Libyan', 59701, 30, 'rexbell@xyz.com')

update customer
set Zip=56785 where Customer_ID='MOR9117';

update customer
set Nationality='Tunisian' where Customer_ID='BEL2456';

select * from customer

select *, age_in_2029=age+4 from customer


select Name, Nationality from customer

select Name, Customer_ID from customer
where Nationality='Egyptian';

select * from customer
where Age < 20;

delete from customer;
truncate table customer;
