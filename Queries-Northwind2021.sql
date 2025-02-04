use Northwind2021
----------------------------------------------------------------
--1 
--Display a list of all Customer
select * from Customer 
----------------------------------------------------------------

--2 
--Display a list of Customer id ,name and city 
select id , (FirstName +' '  + lastname )As  Name  , City  from Customer

----------------------------------------------------------------

--3
--Display a list of  full name for customer live in 'Mexico'
select (FirstName +' '  + lastname)as "Full Name" , phone from Customer
where Country = 'Mexico' 

----------------------------------------------------------------
-- 4
-- For products with prices over 50$,
--display the product name, package and price after Taxes. Note: taxes = %15;

select productname , package, unitprice * 1.15  as "price After Taxes"
from product 
where unitprice > 50

----------------------------------------------------------------

-- 5
--For suppliers, outside 'USA' and 'UK',
--display a list of company name, city and phone.

select companyname , city , phone , Country
from supplier
where country not in('USA', 'UK')
----------------------------------------------------------------

--6 
-- For suppliers located in "USA", 
--display a list of company name, product names and unitPrice sorted Alphabetically.
select companyname , productname , unitPrice
from supplier S join product P
on S.Id=P.SupplierId
where Country ='USA'
order by  companyname 

----------------------------------------------------------------

--7
-- For each customer,
-- display a list of customer full name and how many orders he made
--and how much he totally paid.

select (FirstName +' '  + lastname)as "Full Name" , Count(*) "Number of orders" ,
Sum(Totalamount) " Total amount"
from customer C join orders O
on C.Id=O.CustomerId
group by FirstName,lastname

----------------------------------------------------------------

--8
-- For suppliers, who supplied more than 3 products,
-- display a list of company name and how many products it
--supplied , sorted by the number of products in descending order.

select  companyname  , count(*) as "Number of products"
from supplier S join product P
on S.Id =P.SupplierId
group by  companyname 
Having  count(*) > 3
order by  count(*) desc

----------------------------------------------------------------

--9
--Display a top 5 list of the most expensive products.

Select top 5 productname,unitprice
from product 
order by unitprice desc ;

----------------------------------------------------------------

--10
-- Display a list of the top 3 best-selling products.

SELECT top 3 Productid, count(*) 
FROM OrderItem OI 
group by Productid
order by count(*) desc

----------------------------------------------------------------

--11
--Display a list of products with prices more than the average price.
select * from Product 
where unitprice> (select avg(unitprice) from Product)

----------------------------------------------------------------

--12
--Display a list of customers who bought one or more products that Mr'Horst' already bought

select Distinct firstname , lastname 
from Customer C join  Orders O
on C.Id= O.CustomerId 
join OrderItem OI
on O.Id=OI.orderid
where OI.ProductId in ( 
select Distinct ProductId
from Customer C join  Orders O
on C.Id= O.CustomerId 
join OrderItem OI
on O.Id=OI.orderid and firstname='Horst'
)


----------------------------------------------------------------








