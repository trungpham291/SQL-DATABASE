create database Example6 
go
use Example6
go

create table Category(
	IdSP int primary key ,
	NameSP varchar(40)
)
insert into Category(IdSP, NameSP) values (234, 'AO')
insert into Category(IdSP, NameSP) values (456, 'Quan')
insert into Category(IdSP, NameSP) values (789, 'BALO')
go
select * from Category
go
create table Product (
	ID int primary key identity,
	Name varchar(40),
	price int,
	cat_id int,
	constraint fk1 foreign key (cat_id) references Category(IdSP)
)
insert into Product (Name, price, cat_id) values ('Ao thun', 100, 234)
go
select * from Product
go
drop table Product