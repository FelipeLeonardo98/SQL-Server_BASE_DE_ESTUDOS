 --				DESAFIOS HAVING
/* Desafio 1: A empresa quer identificar as provincias(stateProvinceId) com maior
n�mero de cadastros no nosso sistema, ent�o � preciso encontrar quais provincias
(stateProvinceId) est�o registradas no banco de dados mais que 1000 vezes */
select StateProvinceID, count(AddressId) as 'Quantidade' from Person.Address
group by StateProvinceID
HAVING count(AddressID) > 1000;
-- OU usar a solu��o do v�deo que d� na mesma, trocando o campo do Count
select StateProvinceID, count(StateProvinceID) as 'Quantidade' from Person.Address
group by StateProvinceID
HAVING count(AddressID) > 1000;

/*Desafio 2: Sendo que se trata de uma empresa multinacional, os gerentes querem saber quais produtos
(productID) n�o est�o trazendo em m�dia no min�mo 1 milh�o em total de vendas (linetotal) */

select top 10 * from sales.SalesOrderDetail;
select ProductID, avg(LineTotal) as 'M�dia de valor por ProductID'
from Sales.SalesOrderDetail
group by ProductID
having avg(LineTotal) < 1000000;
 --     -----------   ----------       -----------------    --------------      --------
 -- AS
 --Desafio 1: Encontrar o FirstName e Lastname e mudar para portugu�s (person.person)
 select TOP 5 FirstName as 'Primeiro nome', LastName as 'sobrenome' from person.Person;
 -- Desafio 2: ProductNumber da tabela production.product "Numero do produto"
 select TOP 5 ProductNumber as 'N�mero do Produto' from Production.Product;
 --Desafio 3: Sales.SalesOrderDetail unitPrice "Preco Unit�rio"
 select TOP 5 UnitPrice as 'Pre�o Unit�rio' from Sales.SalesOrderDetail;

 /*										JOIN: INNER JOIN							*/
 select TOP 5  *from person.EmailAddress;
 select top 10 P.BusinessEntityID, P.FirstName, P.LastName, E.EmailAddress
 from Person.Person as P inner join Person.EmailAddress as E
 on P.BusinessEntityID = E.BusinessEntityID
 order by P.BusinessEntityID;

 --Exemplo: a empresa quer os nomes dos produtos e as informa��es de suas subcategorias
 select TOP 5  * from Production.Product order by ProductID desc;
 Select Top 5 * from Production.ProductSubcategory;

 SELECT TOP 5 PP.ProductID,PP.Name,PP.ListPrice, PPS.ProductCategoryID, PPS.Name
	from Production.Product as PP INNER JOIN Production.ProductSubcategory as PPS
	 ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
	 order by PP.ProductID desc;

-- de repente voc� quer juntar tudo, todas colunas de duas tabelas
SELECT TOP 10 *
FROM Person.BusinessEntityAddress BA INNER JOIN Person.Address PA
ON PA.AddressID = BA.AddressID;

--  ------------------------------
 -- Desafio 1: 
 Select TOP 10 * from Person.PhoneNumberType;
 select TOP 10 * from Person.PersonPhone;
 -- BusinessEntityID, Name, PhoneNumberTypeID, PhoneNumber
 Select TOP 10 pPhone.BusinessEntityID,pNumber.PhoneNumberTypeID, pNumber.Name, pPhone.PhoneNumber
	from Person.PhoneNumberType as pNumber INNER JOIN Person.PersonPhone as pPhone
	ON pNumber.PhoneNumberTypeID = pPhone.PhoneNumberTypeID;

-- Desafio 2: 
	Select top 10 * from person.StateProvince;
	select top 10 * from person.address;
	--AddressID, City, StateProvincID,Nome Estado
	SELECT TOP 50 pAddress.AddressID, pAddress.City, pState.StateProvinceID, pState.Name
		FROM PERSON.Address AS pAddress INNER JOIN PERSON.StateProvince as pState
		ON pAddress.StateProvinceID = pState.StateProvinceID;

/*							others joins						*/
-- Left Join, Right Join and Outer Join
SELECT * FROM PERSON.Person AS PP
LEFT JOIN SALES.PersonCreditCard AS PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL;
-- INNER JOIN: 19.118
-- LEFT JOIN: 19.972
-- WHERE: 854  ( SELECT 19972 - 19118 );