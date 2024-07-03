-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
select * from sales.funnel
select * from sales.products

SELECT prod.brand,
		COUNT(prod.brand)
FROM sales.funnel as fun
LEFT JOIN sales.products as prod
	ON fun.product_id = prod.product_id
GROUP BY prod.brand
ORDER BY COUNT(prod.brand) DESC

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

SELECT fun.store_id,
	stor.store_name,
	COUNT(fun.store_id)
FROM sales.funnel as fun
LEFT JOIN sales.stores as stor
	ON fun.store_id = stor.store_id
GROUP BY fun.store_id, stor.store_name
ORDER BY COUNT(fun.store_id) DESC

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
SELECT * FROM sales.customers
SELECT * FROM temp_tables.regions

SELECT reg.size,
	COUNT (*) as "Contagem"
FROM sales.customers as cus
LEFT JOIN temp_tables.regions as reg
	ON LOWER(cus.city) = LOWER(reg.city)
	AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY reg.size
ORDER BY "Contagem" DESC
