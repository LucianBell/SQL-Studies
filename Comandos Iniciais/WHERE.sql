-- PARA QUE SERVE ##################################################################
-- Serve para filtrar linhas de acordo com uma condição
-- Tipo um if

-- SINTAXE #########################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
where condição_x=true


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
SELECT DISTINCT state -- Identificando como estado está registrado no banco de dados
FROM sales.customers

SELECT email, state
FROM sales.customers
WHERE state = 'SC'

-- (Exemplo 2) Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul
SELECT email, state
FROM sales.customers
WHERE state = 'SC' OR state = 'MS'


-- (Exemplo 3) Filtro de condição com data
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos
SELECT DISTINCT birth_date
FROM sales.customers -- Checando formado da data 
	
SELECT email, state, birth_date
FROM sales.customers
WHERE (state = 'SC' OR state = 'MS') AND birth_date < '01-07-1994'
-- Quando fazemos operações com data, vamos colocar ela entre aspas e seguindo o formato do db
-- SEMPRE verificar como os dados estão armazenados antes de fazer a consulta

-- RESUMO ##########################################################################
-- (1) Comando utilizado para filtrar linhas de acordo com uma condição
-- (2) No PostgreSQL são utilizadas aspas simples para delimitar strings 
-- (3) string = sequência de caracteres = texto
-- (4) Pode-se combinar mais de uma condição utilizando os operadores lógicos
-- (5) No PostgreSQL as datas são escritas no formato 'YYYY-MM-DD' ou 'YYYYMMDD'
