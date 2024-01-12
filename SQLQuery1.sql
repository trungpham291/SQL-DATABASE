IF Exists (Select * From sys.databases Where Name = 'Example5')
Drop Database Example5

go
create database Example5 
go
use Example5
go
--Tạo bảng Lớp học
create table LopHoc(
	MaLopHoc Int Primary Key Identity,
	TenLopHoc Varchar(10)
)
go
--Tạo bảng Sinh viên có khóa ngoại là cột MaLopHoc, nối với bảng LopHoc
create table SinhVien(
	MaSV int Primary Key,
	TenSV varchar(40),
	MaLopHoc int,
	Constraint fk Foreign Key (MaLopHoc) References LopHoc(MaLopHoc)
)
go
--Tạo bảng SanPham với một cột NULL, một cột NOT NULL
create Table SanPham (
	MaSP int NOT NULL,
	TenSP varchar(40) NULL
)
go
--Tạo bảng với thuộc tính default cho cột Price
create table StoreProduct (
	ProductID int NOT NULL,
	Name varchar(40) NOT NULL,
	Price money NOT NULL Default (100) 
)
--Thử kiểm tra xem giá trị default có được sử dụng hay không
insert into StoreProduct(ProductID, Name) Values (111, 'Rivets')
go
--Tạo bảng ContactPhone với thuộc tính IDENTITY
 create table ContactPhone (
	Person_ID int Identity(500,1) NOT NULL,
	MobileNumber bigint NOT NULL
 )
 go
 --Tạo cột nhận dạng duy nhất tổng thể
 create table CellularPhone (
	Person_ID uniqueidentifier Default NEWID() NOT NULL,
	PersonName varchar(60) NOT NULL
 )
 --Chèn một record vào
 Insert Into CellularPhone(PersonName) Values ('William Smith')
 go
 --Kiểm tra giá trị của cột Person_ID tự động sinh
Select * from CellularPhone
go
--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
Create Table ContactPhone2 (
	Person_ID int primary key,
	MobileNumber bigint Unique,
	ServiceProvider varchar(30),
	LandlineNumber bigint Unique)
--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và LanlieNumber để quan sát lỗi

Insert Into ContactPhone2 values (106, 98334234, 'Hutch', 123)
Insert Into ContactPhone2 values (103, 98334564, 'Alex', NULL)
go
select * from ContactPhone2
go
--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
create table PhoneExpenses1 (
	Expense_ID int primary key,
	MobileNumber bigint foreign Key References ContactPhone2 (MobileNumber),
	Amount bigint Check (Amount > 0)
)
go
--Chỉnh sửa cột trong bảng
Alter Table ContactPhone2 
	Alter column ServiceProvider varchar(45)
go
--Xóa cột trong bảng
alter table ContactPhone
	Drop Column ServiceProvider 
go
---Them một ràng buộc vào bảng
Alter table ContactPhone Add Constraint CHK_RC Check (RentalCharge > 0)
go
--Xóa một ràng buộc
alter table Person.ContactPhone
	Drop constraint CHK_RC