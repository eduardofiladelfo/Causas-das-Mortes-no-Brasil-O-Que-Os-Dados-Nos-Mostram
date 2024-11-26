# Causas das Mortes no Brasil: O que os dados nos mostram?

### Overview do Projeto
Este projeto fará um estudo sobre as quantidades de mortes e os motivos publicados pela revista médica The Lancet, entre os anos de 1991 a 2019. A análise nos entrega alguns insights como:
- Causas dos óbitos ao longo dos anos.
- Quantidade desses óbitos.
- A causa de morte mais popular: ela aumenta ou diminui ao longo dos anos?
- Alguma causa diminuiu ao longo dos anos?

### Dataset 
O conjunto de dados usado neste projeto está disponível publicamente no Kaggle:

https://www.kaggle.com/datasets/ivanchvez/causes-of-death-our-world-in-data

Talvez seja necessário criar uma conta do Kaggle para acessar esse conjunto de dados.
### Ferramentas 
PostgreSQL:  Importação do arquivo em CSV e visualização dos dados. 
Microsoft Excel: Visualização da quantidade da maior quantidade colunas que possuem strings para a criação das tabelas no PostgreSQL.

### Dados utilizados
- cause_name: Nome da causa da morte.
- cause_description: Descrição da causa da morte, exibindo a causa, qual gênero foi atingido e a idade.
- death_numbers: Quantidade de mortes por esta doença.
- entity: O nome do país que registrou esta doença.
- country_code: A abreviação do país.
- year: O ano da morte.

### Importação e filtragem dos dados
Nesta fase inicial de preparação, faremos as seguintes tarefas:
1.	Visualização da quantidade de caracteres das colunas para a criação da tabela no SQL
2.	Deixar apenas linhas que tragam informações sobre o Brasil.

### Limpeza e tratamento dos dados
Para o tratamento dos dados, faremos a seguinte tarefa:
1.	Analisar os valores nulos/ em branco.

### Análise exploratória 
A EDA explorará algumas perguntas sobre os óbitos como:
- Quais foram as mortes registradas no Brasil?
- Qual o total acumulado do tipo de óbito ao longo dos anos e sua porcentagem?
- Qual a quantidade de óbitos ao longo dos anos?
- As mortes por doenças cardiovasculares matam quantos por cento ao longo dos anos?
- Qual a média da variação percentual anual das mortes por doenças cardiovasculares?
- Dos óbitos por HIV, qual a quantidade de mortes por ano e qual deles mais matou?
- Existe alguma causa que diminuiu em relação ao primeiro ano registrado e seu último? Se sim, qual foi a redução percentual?

### Resultados
1.	A maior causa de morte são as de doenças cardiovasculares. De 1990 até 2019 acometeu mais de 9 milhões de brasileiros, Sendo responsável por 29% de todas as mortes do período. 
2.	A segunda maior causa são por neoplasias, que no caso são tumores, com 5,6 milhões de óbitos, compondo 17% das mortes do período.
3.	A maior quantidade de óbitos registrada foi em 2019.
4.	As mortes por doenças cardiovasculares aumentam uma média de 1,36% ao longo dos anos.
5.	Sobre as mortes por AIDS/HIV, em 1995 foi registrado o maior número de mortes pela doença.
6.	Das reduções das mortes, podemos citar a redução da tuberculose, que diminuiu aproximadamente 45% desde seu primeiro ano registrado até o último, da hepatite, que em quase 32% e a malária, que foi reduzida em 97%.

### Conclusões/ Recomendações 
- As DCVs (doenças cardiovasculares) ocupam a primeira posição das mortes. Dentre as hipóteses, podem ser citadas o envelhecimento populacional, que fez com que as pessoas chegassem em idades que as DCVs são prevalentes, aumentando o número de casos fatais. Outros fatores que podem contribuir são: sedentarismo, dietas ricas em sódio e gorduras, o tabagismo e o estresse. Além disso, podemos citar também o acesso desigual à saúde para o diagnóstico de alguma doença, especialmente em áreas rurais ou regiões menos favorecidas. 
- Podemos utilizar como ações estratégicas campanhas de prevenção. Investindo na conscientização de hábitos saudáveis, como uma dieta equilibrada e a prática de exercícios físicos. Além de ações educativas em escolas e comunidades, podem ser direcionadas para reduzir o impacto desses fatores na juventude.
- Uma possível forma também de reduzir é ampliando o acesso a diagnósticos precoces e tratamentos com baixo custo, como por exemplo medicamentos para controle de hipertensão.
- Podemos notar também que houve uma melhoria na gestão de doenças infecciosas, o que pode contribuir para a transição das doenças crônicas não transmissíveis (DCNTs), como as DCVs, que agora representam uma proporção maior de óbitos.
- As neoplasias também aumentam ao longo dos anos e, assim como as DCVs, possuem causas em comum, como por exemplo: envelhecimento da população, tabagismo, sedentarismo e maus hábitos alimentares.
- A exposição prolongada a poluentes e substâncias carciogênicas contribui significativamente para este enfermo, especialmente em áreas urbanas ou industriais.
- Como os sistemas de saúde no Brasil melhoraram no monitoramento e diagnóstico de doenças, houve um aumento aparente de casos registrados, refletindo melhor a realidade.
- Das estratégias as quais podemos citar para o controle da enfermidade, é o monitoramento da exposição de poluentes industriais e químicos no ambiente urbano. Outra forma é monitorando também a exposição dos pesticidas.
- Para as doenças infecciosas, o Brasil possui tratamento gratuito para as doenças. Além de realizar os testes diagnósticos, que contribuiu para as complicações e mortes. 
- Um desafio que pode ser citado é que existe a coinfecção de alguma dessas doenças com o HIV/ AIDS: Pessoas portadoras do vírus do HIV enfrentam riscos elevados de tuberculose.
- As mortes por HIV foram aumentando sucessivamente até 1995, no início dos anos 90, o HIV/AIDS era uma doença relativamente nova. Dessa forma, seu baixo conhecimento resultava na falta de diagnóstico e a limitação de seus tratamentos. 
- A partir de 1996 houve uma estabilização do vírus, podemos citar que neste ano houve a disponibilização da terapia antirretrovial para as pessoas portadoras do vírus. Isso resultou na queda da mortalidade.

### Observação
Mesmo que as taxas de incidência e mortalidade possam estar estáveis em algumas causas, o crescimento populacional contribui para um aumento absoluto no número de óbitos.

