create database company;

use company;

create table customer(
Customer_ID int identity (1,1) primary key,
Name varchar(50),
Nationality varchar(50) default 'Egyptian',
Zip int check (Zip > 0),
Email varchar(50)
);

exec sp_rename 'customer.Name','First_Name'

alter table customer
add Last_Name varchar(50);

alter table customer
add constraint UQ_Last_Name unique (Last_Name) ;

alter table customer drop constraint UQ_Last_Name;

insert into customer(First_Name,Nationality,Zip,Email)
values ('James', default, 98310, 'jmorgan@cti.net'), 
       ('Kate', 'Palestinian', 64068, 'picadillyk@monet.com'),
	   ('Rex', 'Libyan', 59701, 'rexbell@xyz.com')

select * from customer

alter table customer  
drop constraint CK__customer__Zip__4AB81AF0;

alter table customer 
drop column Zip;

exec sp_rename 'customer', 'cust';

drop table cust;

alter database company
modify name = co;

drop database co;
