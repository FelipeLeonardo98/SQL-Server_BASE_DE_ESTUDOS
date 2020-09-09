/*			SELF-JOIN			*/
--Para comparar dentro de uma mesma tabela
SELECT * FROM Customers;
--Todos clientes que estejam na mesma região
select A.ContactName, A.Region, B.ContactName, B.Region
from Customers A, Customers B
where A.Region = B.Region;
--Nome e data de contratação de todos funcionários que foram contratados no mesmo ano
select * from Employees
Select CONCAT( A.FirstName, ' ', A.LastName) as 'Full Name',CONCAT( B.FirstName, ' ', B.LastName) as 'Full Name' ,
datepart(year,A.HireDate) as 'Hire Year'
from Employees A, Employees B
where datepart(year,A.HireDate) = datepart(year,B.HireDate);

/*Desafio: A empresa quer saber na tabela detalhe do pedido [Order Details] quais produtos 
	tem o mesmo percentual de desconto */
exec sp_tables @table_owner = 'dbo';
select * from [Order Details] order by Discount;

SELECT A.PRODUCTID as 'A Product ID', A.DISCOUNT as 'A Product Discount', 
B.PRODUCTID 'B Product ID', B.DISCOUNT as 'B Product Discount'
FROM [Order Details] A, [Order Details] B
where A.Discount = B.Discount;




