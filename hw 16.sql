CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    RegistrationDate DATE
);

-- Staff table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Items table
CREATE TABLE Items (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Price DECIMAL(10,2),
    StockQuantity INT
);

-- Purchases table
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY,
    ClientID INT,
    StaffID INT,
    PurchaseDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
INSERT INTO Clients (ClientID, FullName, Email, RegistrationDate)
VALUES 
(1, 'John Doe', 'john@example.com', '2023-01-10'),
(2, 'Jane Smith', 'jane.smith@example.com', '2022-11-15'),
(3, 'Michael Brown', 'michael.brown@example.com', '2021-09-20'),
(4, 'Sarah Johnson', 'sarah.johnson@example.com', '2023-03-05'),
(5, 'David Williams', 'david.williams@example.com', '2024-02-01');

INSERT INTO Staff (StaffID, FullName, Department, Salary)
VALUES 
(1, 'Alice Green', 'Sales', 5000.00),
(2, 'Bob White', 'Sales', 5200.00),
(3, 'Carol Black', 'Support', 4800.00),
(4, 'Daniel Blue', 'IT', 6000.00),
(5, 'Emily Red', 'Finance', 5500.00);
INSERT INTO Items (ItemID, ItemName, Price, StockQuantity)
VALUES 
(1, 'Laptop', 1200.00, 50),
(2, 'Mouse', 25.00, 200),
(3, 'Keyboard', 45.00, 150),
(4, 'Monitor', 300.00, 80),
(5, 'Chair', 100.00, 120);
INSERT INTO Purchases (PurchaseID, ClientID, StaffID, PurchaseDate, TotalAmount, Status)
VALUES 
(1, 1, 1, '2024-01-15', 1270.00, 'Completed'),
(2, 2, 1, '2024-02-10', 1525.00, 'Completed'),
(3, 3, 2, '2025-02-11', 45.00, 'Completed'),
(4, 4, 3, '2024-03-01', 300.00, 'Pending'),
(5, 5, 2, '2024-03-05', 100.00, 'Completed'),
(6, 1, 1, '2025-03-06', 25.00, 'Completed'),
(7, 2, 4, '2024-03-07', 6000.00, 'Completed'),
(8, 3, 1, '2024-03-07', 1200.00, 'Completed');

Select * from Clients
Select * from Staff
Select * from Items;
Select * from Purchases;


------1 exercise----
create view vwItems as
select itemname, price from items;

select * from vwItems


---2 exercise--
create table #temppurchases (id int unique, productname varchar(20), price int)
insert into #temppurchases values (1, 'milk', '$10')
insert into #temppurchases values (2, 'bread', '$4')
insert into #temppurchases values (3, 'banana', '$8')

select * from #temppurchases;

--3 exercise---
declare @currentRevenue int;

select @currentRevenue = SUM(TotalAmount) from Purchases
where month(GETDATE()) = month(purchasedate) and year(GETDATE()) = year(PurchaseDate)


select @currentRevenue as currentrevenue



---4 exercise--
create function fnsquare(@number int)
returns int
as
begin 
      return @number * @number

end

select dbo.fnsquare(11)

---5 exercise--
create procedure spGClients
as 
begin
select ClientID, fullname, RegistrationDate from Clients
end

spgclients

--6 exercise--
select * from Purchases
select * from Clients

merge clients as t
using purchases as s
on t.clientid = s.clientid
when matched then
update set 

---7 exercise---
create table #staffinfo (staffid int unique, fullname varchar(50) primary key, department varchar(20), salary int)
insert into #staffinfo values(1, 'jaylen brown', 'it', '30000')
insert into #staffinfo values(3, 'stanley pince', 'accounting', '20000')
insert into #staffinfo values(4, 'kevin harts', 'movie', '370000')
insert into #staffinfo values(5, 'steve harvey', 'entertainment', '30078400')

select * from #staffinfo

---8 exercise--
create function fnnumbertype (@number int)
returns varchar(20)
as
begin
return
    case
          when @number % 2 = 0 then 'even'
	      else 'odd'

      end
end;

select dbo.fnnumbertype(12)

---9 exercise--
create procedure spMonthlyRevenue
as
begin
select sum(TotalAmount) as total from Purchases
where year(GETDATE()) = year(PurchaseDate) and month(getdate()) = month(PurchaseDate)
end

spmonthlyrevenue

select * from Purchases

--10 exercise--