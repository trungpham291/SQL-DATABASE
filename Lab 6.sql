--Lấy ra dữ liệu của bảng Contact có ContactID>= 00 và ContactID<=200 
SELECT * FROM Person.ContactType
WHERE ContactTypeID >= 1 AND ContactTypeID <= 200
--Lấy ra dữ liệu của bảng Contact có ContactID trong khoảng [100, 200] 
SELECT * FROM Person.ContactType
WHERE ContactTypeID BETWEEN 1 AND 200
--Lấy ra những Contact có LastName kết thúc bởi ký tự e
SELECT * FROM Person.ContactType
WHERE Name LIKE '%e'
--Lấy ra những Contact có LastName bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e 
SELECT * FROM Person.ContactType
WHERE Name LIKE '[RA]%e'
--Lấy ra những Contact có LastName có 4 ký tự bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e 
SELECT * FROM Person.ContactType
WHERE Name LIKE '[RA]__e'
--Sử dụng INNER JOIN 
SELECT Person.ContactType.* FROM Person.ContactType INNER JOIN HumanResources.Employee ON
Person.ContactType.ContactTypeID=HumanResources.Employee.ContactTypeID
SELECT Title, COUNT(*) [Title Number]
FROM Person.Contact 
WHERE Title LIKE 'Mr%'
GROUP BY ALL Title
--GROUP BY với HAVING: mệnh đề HAVING sẽ lọc kết quả trong lúc được gộp nhóm 
SELECT Title, COUNT(*) [Title Number]
FROM Person.Contact
GROUP BY ALL Title
HAVING Title LIKE 'Mr%'

select COUNT(*) as procolor, Color From Production.Product
group by Color

select * from Production.Product

select * from Person.Person
where BusinessEntityID in (Select BusinessEntityID from Sales.SalesPerson)

select * from Person.Person inner join Sales.SalesPerson
on Person.BusinessEntityID = SalesPerson.BusinessEntityID

select Person.Contact From Person.Contact Left outer join HumanResources.Employee
On Person.Contact.ContactID = HumanResources.Employee.ContactID

select Per.BusinessEntityID, Per.FirstName, Phone.PhoneNumber
from Person.Person Per
left outer join Person.PersonPhone Phone 
On Per.BusinessEntityID = Phone.BusinessEntityID

select Per.BusinessEntityID, Per.FirstName, Phone.PhoneNumber
from Person.Person Per
right outer join Person.PersonPhone phone
On Per.BusinessEntityID = Phone.BusinessEntityID
