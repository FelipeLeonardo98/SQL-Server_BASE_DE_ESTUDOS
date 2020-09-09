 -- select DISTINCT FirstName from  Person.Person where FirstName like  '_ayl%';
-- select DISTINCT FirstName from Person.Person WHERE FirstName LIKE '_al%';
--  select  FirstName from Person.Person  WHERE FirstName LIKE '_al%';
-- Atividade
	 --select DISTINCT LastName from Person.Person;
	 select productId, name, ProductNumber, Listprice from Production.Product;

--Desafio 1
	-- A equipe de produção de produtos precisa do nome de todas as pelas que pesam
	--mais que 500kg mas não mais que 700kg para inspeção
	select productID, Name, Weight from Production.Product
		where Weight between 500 and 700;
/* Desafio 2: Foi pedido pelo marketing uma relação de todos os empregados(employees) que são casados (married)
 e são assalariados(salaried) */
	-- exec sp_help "[AdventureWorks2017].[Person.Person]" ;
	-- select * from information_schema.COLUMNS where TABLE_NAME='Person.Person';
 select BusinessEntityID, JobTitle, MaritalStatus, SalariedFlag from HumanResources.Employee
 where MaritalStatus = 'M' and SalariedFlag = 1;


 --Desafio 3: Um usuário chamado Peter Krebs está devendo um pagamento, consiga o email dele para cobrança
 select BusinessEntityID, FirstName, LastName from Person.Person where FirstName = 'Peter' and LastName = 'Krebs';
 select BusinessEntityID, EmailAddressID, EmailAddress from Person.EmailAddress where EmailAddress like 'peter%';
 select BusinessEntityID, EmailAddressID, EmailAddress from Person.EmailAddress where BusinessEntityID = 26;
 -- bem interessante, vários testes


 --Desafio: Quantos produtos tem cadastrados na tabela produtos (production.product)
 select count(name) from Production.product;
 -- quantos tamanhos de produtos tem cadastrado na tabela
 select count(DISTINCT Size) as 'Quantidade de tamanhos' from Production.product;
 select DISTINCT size from Production.product where size != 'null';