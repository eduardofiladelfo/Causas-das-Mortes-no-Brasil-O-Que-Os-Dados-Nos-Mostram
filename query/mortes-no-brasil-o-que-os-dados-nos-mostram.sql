-- Criando tabela

CREATE TABLE causes(
	cause_name varchar (44),
	cause_description varchar (88),
	death_numbers int,
	entity varchar (32),
	country_code varchar(8),
	year int
);	

-- Verificando se a tabela foi criada e os dados imputados

SELECT * 
FROM causes

-- Verificando os valores nulos na coluna entity
SELECT * 
FROM causes 
WHERE entity is NULL;

--Não existem valores nulos nos países

-- Verificando se existem nulos na country_code 

SELECT * 
FROM causes 
WHERE country_code is null;

-- Podemos notar que temos valores em branco na coluna country_code

-- Deixando apenas o que for Brasil 
DELETE FROM causes
WHERE country_code <> 'BRA';

-- Analisando valores nulos da coluna 'country_code'
SELECT entity, country_code
FROM causes
WHERE country_code is null
GROUP BY 1,2;

-- Temos 4 registros de entity. Logo, alguns países não possuem código, excepcionalmente a America, que é o continente.

-- Excluir valores que são nulos 
DELETE FROM causes
WHERE country_code is null;

-- Removendo coluna cause_description

ALTER TABLE causes
DROP COLUMN cause_description;


-- Verificar base 
SELECT entity, country_code
FROM causes
GROUP BY 1,2;

-- Causas das mortes 

SELECT cause_name
FROM causes
GROUP BY 1;

-- Temos 33 tipos de causas diferentes

-- Comparação proporcional por causa das mortes acumuladas ao longo dos anos e sua porcentagem

SELECT 
	cause_name,
	SUM(death_numbers) AS total_quantity_of_deaths,
	ROUND(
		(SUM(death_numbers)* 100.0 / SUM(SUM(death_numbers)) OVER()),
		2
	) AS total_percentage_of_deaths
FROM  causes
GROUP BY 1
ORDER BY 2 DESC; 

-- A "Amnesty International" que é a Anistia Internacional (pena de morte), veio com o valor nulo que, neste caso, não se aplica ao Brasil.
-- As mortes por doença cardiovasculares ocupam quase 30% do total geral
-- Outro dado curioso é a quantidade de mortes por violência interpessoal, que ocupa o quinto lugar das causas de morte mais populares.

-- Removendo linha que contém Anistia Internacional

DELETE FROM causes
WHERE death_numbers IS NULL;

-- Qtd de mortes por ano. Qual o ano deve a maior quantidade de mortes?

SELECT 
	year,
	SUM(death_numbers) AS total_of_deaths
FROM causes
GROUP BY 1 
ORDER BY 2 DESC;

-- O ano com a maior quantidade de mortes foi em 2019

-- As doenças cardiovasculares matam quantos % ao longo dos anos?

SELECT 
	cause_name,
	SUM(death_numbers),
	year,
	ROUND(
		(SUM(death_numbers)* 100.0 / SUM(SUM(death_numbers)) OVER()),
		2
	) AS total_percentage_of_deaths	
FROM causes 
WHERE cause_name = 'Cardiovascular diseases'
GROUP BY 1,3
ORDER BY 3 DESC;

-- A quantidade de mortes por doenças cardiovasculares aumentaram ao longo dos anos

-- Descobrir média do aumento dessas mortes ao longo dos anos

WITH cardiovascular_deaths AS (
    SELECT 
        year, 
        SUM(death_numbers) AS total_deaths,
        (SUM(death_numbers) - LAG(SUM(death_numbers)) OVER (ORDER BY year)) * 100.0 
        / NULLIF(LAG(SUM(death_numbers)) OVER (ORDER BY year), 0) AS percentage_change
    FROM causes
    WHERE cause_name = 'Cardiovascular diseases'
    GROUP BY 1
)
SELECT 
    ROUND(AVG(percentage_change), 2) AS avg_percentage_increase
FROM cardiovascular_deaths;

-- As mortes por doenças cardiovasculares aumentam 1.36% ao longo dos anos aproximadamente

-- Quantidade por mortes por HIV ao longo dos anos. Qual ano mais matou?

SELECT 
	cause_name,
	death_numbers,
	year	
FROM causes
WHERE cause_name LIKE '%HIV%'
ORDER BY 2 DESC;

-- Em 1995 foi o ano com maior registro de mortes por HIV.

-- Verificar se existem causas de morte que diminuíram.

WITH total_deaths_per_year AS (
    SELECT 
        cause_name,
        year,
        SUM(death_numbers) AS total_deaths
    FROM causes
    GROUP BY 1, 2 
),
changes_over_years AS (
    SELECT 
        cause_name,
        FIRST_VALUE(total_deaths) OVER (PARTITION BY cause_name ORDER BY year ASC) AS initial_deaths,
        LAST_VALUE(total_deaths) OVER (PARTITION BY cause_name ORDER BY year ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS final_deaths
    FROM total_deaths_per_year
),
causes_with_reduction AS (
    SELECT 
        cause_name,
        initial_deaths,
        final_deaths,
        ROUND(((final_deaths - initial_deaths) * 100.0 / NULLIF(initial_deaths, 0)), 2) AS percentage_change
    FROM changes_over_years
    GROUP BY 1, 2, 3
    HAVING final_deaths < initial_deaths
)
SELECT 
    cause_name,
    percentage_change
FROM causes_with_reduction
ORDER BY 2 ASC;

-- Algumas causas diminuíram ao longo do tempo, como a tuberculose, a malária e a meningite