/*						union and union all					*/
SELECT * FROM SALES.PersonCreditCard where ModifiedDate > '2014/01/01'
UNION
SELECT * FROM SALES.PersonCreditCard where ModifiedDate between '2012/01/01' and '2014/01/01';

/*				DATEPART			*/
select SalesOrderID,SalesOrderNumber,SalesPersonID, 
datepart (day,OrderDate) as 'Day', datepart(month,OrderDate) as 'Month', datepart (year, OrderDate) as 'Year' 
from Sales.SalesOrderHeader
where datepart(month,OrderDate) = 8
order by Orderdate asc;

 -- Date and hour of System: SELECT SYSDATETIME(),CURRENT_TIMESTAMP ,GETDATE(); 
 
 -- Average by Month
 select Datepart(month,OrderDate) as 'Month', AVG(TotalDue) as 'Average'
 from Sales.SalesOrderHeader 
 GROUP BY DATEPART(month,OrderDate)
 order by DATEPART(month,OrderDate);
  -- Average by Day
 select Datepart(day,OrderDate) as 'Month', AVG(TotalDue) as 'Average' 
 from Sales.SalesOrderHeader 
 where Datepart(month,OrderDate) = 12
 GROUP BY Datepart(day,OrderDate) 
 order by Datepart(day,OrderDate) ;
 -- 1 registro: 10634 .... teste, acrescente o  where Datepart(month,OrderDate) para saber qual o mês da visualização

 /*					functions of string			*/
 -- CONCAT
 select top 10 CONCAT(Firstname, ' ', MiddleName, ' ' , LastName) as 'Full Name' from Person.Person;
-- LEN
 select top 5 FirstName, LEN(FirstName) as 'Lenght here' from Person.person;
-- LOWER
  select top 5 FirstName, LOWER(FirstName) as 'Lenght here' from Person.person;
 -- UPPER
   select top 5 FirstName, UPPER(FirstName) as 'Lenght here' from Person.person;
 --SUBSTRING
    select top 10 FirstName, SUBSTRING(FirstName,1,2) as 'Lenght here' from Person.person;
  --REPLACE
  SELECT TOP 5 ProductNumber, REPLACE(ProductNumber,'-','$') FROM Production.Product;

  --		MATH FUNCTIONS
  Select LineTotal, Round(LineTotal,2) from Sales.SalesOrderDetail;

  /*				SUBQUERY'S				*/
  -- Exemplo: Monte um relatório com todos produtos cadastrados que tem preço acima da média
  select avg(ListPrice) as 'Média' from Production.Product ;
  -- Average is 438.6662
  select  * from Production.Product 
  where ListPrice > (select avg(ListPrice) from Production.Product );

  -- Exemplo: A empresa quer o nome dos funcionários que tenham cargo de Design Engineer
  -- Meeting the Tables
  select top 5 * from Person.Person;
  select top 5 * from HumanResources.Employee;
  --Getting who have the JobTitle of 'Design Engineer'
  select BusinessEntityID from HumanResources.Employee where JobTitle = 'Design Engineer';
  -- Executing SubQuery
  SELECT BusinessEntityID, FirstName, LastName FROM PERSON.PERSON 
  WHERE BusinessEntityID IN (select BusinessEntityID from HumanResources.Employee where JobTitle = 'Design Engineer');
  --Also, can do it with Join
  select PP.BusinessEntityID, PP.FirstName, HRE.JobTitle
	FROM Person.Person as PP INNER JOIN HumanResources.Employee as HRE
	ON PP.BusinessEntityID = HRE.BusinessEntityID
	WHERE HRE.JobTitle = 'Design Engineer';
	-- With Join, can take JobTitle in Select

/* DESAFIO: A empresa quer saber todos endereços do estado de 'Alberta' */
 -- Meeting all tables
select top 3 * from person.Address;
select top 3 * from Person.StateProvince;
-- Testing
select * from Person.StateProvince where Name = 'Alberta';
-- I found the ID, StateProvinceID = 1
select * from Person.Address 
	WHERE StateProvinceID IN (select StateProvinceID from Person.StateProvince where Name = 'Alberta');
-- And now, let's go with Join
select  PA.AddressID, PA.AddressLine1, PA.AddressLine2,PA.City,PA.StateProvinceID,PA.PostalCode,
	PA.SpatialLocation, PA.rowguid, PA.ModifiedDate, State_Province.name
	FROM Person.Address as PA inner JOIN Person.StateProvince as State_Province
	ON PA.StateProvinceID = State_Province.StateProvinceID
where State_Province.Name = 'Alberta';
