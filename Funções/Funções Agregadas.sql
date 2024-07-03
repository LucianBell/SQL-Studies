-- PARA QUE SERVE ##################################################################
-- Servem para executar operações aritmética nos registros de uma coluna 


-- TIPOS DE FUNÇÕES AGREGADAS ######################################################
-- COUNT()
-- SUM()
-- MIN()
-- MAX()
-- AVG()


-- EXEMPLOS ########################################################################

-- COUNT() -------------------------------------------------------------------------

-- (Exemplo 1) Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia
SELECT COUNT(*)
FROM sales.funnel
-- Contagem de quantas linhas tem em uma tabela ou 
-- quantos registros temos é o primeiro passo da análise exploratória

-- (Exemplo 2) Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel 
SELECT COUNT(paid_date) -- A contagem NÃO CONSIDERA as células com valor null
FROM sales.funnel

-- (Exemplo 3) Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em jan/21
SELECT COUNT(DISTINCT product_id) -- Quando usamos o distinct, vamos usar ele dentro do count
FROM sales.funnel
WHERE visit_page_date BETWEEN '2021-01-01' AND '2021-01-31'


-- OUTRAS FUNÇÕES ------------------------------------------------------------------

-- (Exemplo 4) Calcule o preço mínimo, máximo e médio dos productos da tabela products
SELECT MIN(price) as "Preço mínimo", MAX(price) as "Preço máximo", AVG(price) as "Preço médio"
FROM sales.products

-- (Exemplo 5) Informe qual é o veículo mais caro da tabela products
SELECT MAX(price) FROM sales.products

SELECT *
FROM sales.products
WHERE price = (SELECT MAX(price) FROM sales.products)
-- Precisamos usar subqueries para trazer informações automaticamente da base de dados baseado
-- em funções agregadoras.

-- RESUMO ##########################################################################
-- (1) Servem para executar operações aritmética nos registros de uma coluna 
-- (2) Funções agregadas não computam células vazias (NULL) como zero
-- (3) Na função COUNT() pode-se utilizar o asterisco (*) para contar os registros
-- (4) COUNT(DISTINCT ) irá contar apenas os valores exclusivos
