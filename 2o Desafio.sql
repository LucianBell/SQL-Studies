-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos
SELECT COUNT(*) as "Clientes com menos de 30 anos"
FROM sales.customers
WHERE ((current_date - birth_date) / 365) < 30  

-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers
SELECT
	MIN(((current_date - birth_date) / 365)),
	MAX(((current_date - birth_date) / 365))
FROM sales.customers

-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)
SELECT MAX(income)
FROM sales.customers

SELECT *
FROM sales.customers
WHERE income = (SELECT MAX(income) FROM sales.customers)
	
-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca
SELECT brand, count(*)
FROM sales.products
GROUP BY brand
ORDER BY brand

-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo
SELECT brand, model_year, count(*)
FROM sales.products
GROUP BY brand, model_year
ORDER BY brand, model_year


-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados
SELECT brand, COUNT(*) as "Contagem"
FROM sales.products
GROUP BY brand
HAVING COUNT(*) > 10
ORDER BY COUNT(*) DESC

