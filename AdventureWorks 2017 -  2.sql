-- Desafio: Obter o ProductId dos 10 produtos mais caros cadastrados no sistema,
-- listando do mais caro para o mais barato
select top 10 ProductID,Name, ListPrice  from Production.Product
order by ListPrice desc;

select top 10 ProductID,Name, ListPrice  from Production.Product  
order by ListPrice desc;


 --                       -------------------------------------------------         ----------------
 select * from Person.Person where BusinessEntityID not in(10,20,30);
/* Desafio 1: Quantos produtos temos cadastrados que custam > 1500 doláres? */
select count(ListPrice) as 'Qt products more than $1.500' from Production.Product
where ListPrice > 1500;
 /*Desafio 2: Quantas pessoas temos com o sobrenome que inicia com a letra P? */
 select count(LastName) as 'Qt LastNames like P' from Person.Person 
 where LastName Like 'p%';
 /*Desafio 3: Em quantas cidas únidas estão cadastrados nossos clientes 8? */
select count(distinct City) as 'Quantidade of Cities'  from Person.Address;
/*Desafio 4: Quais são as cidades únicas que temos cadastradas em nosso sistema? */
select distinct city from Person.Address;
/*Desafio 5: Quantos produtos vermelhos tem preço entre 500 a 100 doláres? */
select color, ListPrice from Production.Product
where color = 'Red' and ListPrice between 500 and 1000;

select count(color) as 'Quantidade of Products' from Production.Product
where color = 'Red' and ListPrice between 500 and 1000;
/*Desafio 6: Quantos produtos cadastrados tem a palavra 'road' no nome deles? */
select count(name) as 'Quantidade of product road' from Production.Product where name like '%road%';

 --                       -------------------------------------------------         ----------------
-- Group By
/* Exemplo: na tabela production.product eu quero saber a média de preço para os produtos
	da cor silver */
/*Desafio 1: A empresa precisa saber quantas pessoas tem o mesmo MiddleName agrupadas por Middlename */
select MiddleName, count(MiddleName) as 'Quantidade'
from Person.Person
GROUP BY MiddleName;
-- Brinde, lastName
select lastName, count(lastName) as 'Quantidade'
from Person.Person
GROUP BY LastName;

/*Desafio 2: A empresa precisa saber em média qual é a quantidade(quantity) que cada produto é vendido na loja */
select * from Sales.SalesOrderDetail where ProductID = 776 ;
select ProductID, avg(OrderQty) as 'Average of Sales'
from Sales.SalesOrderDetail
GROUP by ProductID;
/*Desafio 3: A empresa quer saber quais foram as 10 vendas que no total tiveram os maiores valores
de venda (line total) por produto do maior valor para o menor */
select top 10 ProductId, sum(LineTotal) as 'Total'
from sales.SalesOrderDetail
group by ProductId
order by Total desc;
/*Desafio 4: A empresa precisa saber quantos produtos e qual a quantidade média de produtos
temos cadastrados nas ordens de serviço (Workorder), agrupados por ProductId */
select ProductID, OrderQty, StockedQty, WorkOrderID from production.workorder where ProductID = 717 ;

select ProductID, count(productId) as 'Contagem de Produto',
avg(OrderQty) as 'média'
from Production.WorkOrder
group by ProductID;

--  -------------------    ---------------------    ------------------    -----------   ------
 -- HAVING
 select FirstName, count(FirstName) as 'Quantidade'
 from Person.Person
 GROUP by FirstName
	HAVING count(FirstName) >= 90;

/* exemplo: A empresa quer saber quais produtos que no total de vendas
	estão entre 162k a 500k */
	
	select ProductID, sum(lineTotal) as 'Total'
	from Sales.SalesOrderDetail
	GROUP BY ProductID
	HAVING sum(lineTotal) between 162000 and 500000;
/*Exemplo: A empresa quer saber quais nomes no sistema tem ocorrência maior que 10	
	porém somente aonde o title for 'Mr's' */
	Select FirstName, count(FirstName) from Person.Person
	where title = 'Mr.'
	Group by FirstName
	having count(firstName) >= 10;

	


	

