# Analise de E-commerce Brasileiro com SQLite

Projeto de SQL para portfolio com dados reais de e-commerce brasileiro. A proposta e analisar vendas, clientes, categorias de produtos, pagamentos e entregas usando consultas SQL no SQLite Online.

## Objetivo

Responder perguntas de negocio a partir de uma base transacional:

- Qual foi a receita total do periodo?
- Quais estados concentraram mais pedidos e receita?
- Quais categorias de produto tiveram melhor desempenho?
- Como as vendas evoluiram ao longo do tempo?
- Quais formas de pagamento foram mais utilizadas?
- Como o prazo de entrega varia entre pedidos no prazo e atrasados?

## Dataset

Fonte: [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

Foi utilizada uma versao simplificada do dataset, consolidada em um unico arquivo CSV. A base contem informacoes de pedidos, clientes, produtos, vendedores, pagamentos, datas de compra e entrega.

Periodo analisado: outubro de 2016 a agosto de 2018.

| Metrica | Valor |
|---|---:|
| Linhas | 113.390 |
| Pedidos unicos | 95.128 |
| Clientes unicos | 92.081 |
| Vendedores unicos | 2.914 |
| Categorias de produto | 73 |
| Receita de produtos | R$ 13.627.670,23 |
| Frete total | R$ 2.270.519,65 |
| Receita total estimada | R$ 15.898.189,88 |
| Ticket medio por pedido | R$ 167,12 |

> Receita total estimada = `price + freight_value`.

## Ferramenta

As consultas foram feitas para SQLite e testadas considerando o comportamento do SQLite Online, que pode encurtar nomes longos de colunas no momento da importacao do CSV.

O projeto usa duas tabelas:

```sql
DF          -- tabela bruta importada do CSV
ecommerce   -- tabela tratada criada no arquivo 00_configuracao.sql
```

A tabela `DF` e mantida como base original. O arquivo `00_configuracao.sql` cria a tabela `ecommerce` com nomes de colunas mais legiveis e campos auxiliares para receita, mes da compra e prazo de entrega.

## Como Executar

1. Abra o SQLite Online.
2. Importe o arquivo CSV.
3. Marque a opcao para usar a primeira linha como cabecalho.
4. Nomeie a tabela importada como `DF`.
5. Rode o arquivo `sql/00_configuracao.sql` para criar a tabela `ecommerce`.
6. Rode os demais arquivos da pasta `sql/`.

Para validar a configuracao inicial:

```sql
SELECT
    COUNT(*) AS total_linhas,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item), 2) AS receita_total
FROM ecommerce;
```

Resultado esperado:

| total_linhas | total_pedidos | receita_total |
|---:|---:|---:|
| 113390 | 95128 | 15898189.88 |

## Estrutura do Projeto

```text
projeto-sql-ecommerce-olist/
|-- README.md
|-- .gitignore
|-- data/
|   `-- README.md
|-- insights/
|   `-- insights.md
`-- sql/
    |-- 00_configuracao.sql
    |-- 01_exploracao.sql
    |-- 02_analise_vendas.sql
    |-- 03_analise_geografica.sql
    |-- 04_analise_produtos.sql
    `-- 05_analise_pagamentos_logistica.sql
```

## Principais Resultados

Sao Paulo foi o estado com maior receita estimada, somando aproximadamente R$ 5,96 milhoes. Rio de Janeiro e Minas Gerais aparecem em seguida, com cerca de R$ 2,13 milhoes e R$ 1,86 milhao, respectivamente.

As categorias com maior receita foram `beleza_saude`, `relogios_presentes`, `cama_mesa_banho`, `esporte_lazer` e `informatica_acessorios`.

Em 2018, a receita estimada foi de aproximadamente R$ 8,70 milhoes, superando 2017, que registrou cerca de R$ 7,15 milhoes.

Cartao de credito foi a forma de pagamento mais frequente, presente em 73.267 pedidos unicos.

Pedidos atrasados tiveram prazo medio de entrega de aproximadamente 31,4 dias, enquanto pedidos entregues no prazo tiveram media de aproximadamente 10,9 dias.

## Habilidades Demonstradas

- Importacao e exploracao de dados em SQLite.
- Criacao de tabela tratada com `CREATE TABLE AS SELECT`.
- Analise de receita, ticket medio e evolucao temporal.
- Segmentacao por estado, cidade, categoria e forma de pagamento.
- Calculo de prazo de entrega usando `julianday`.
- Uso de `COUNT`, `SUM`, `AVG`, `GROUP BY`, `CASE`, `ORDER BY` e `LIMIT`.
- Transformacao de consultas SQL em insights de negocio.

## Observacoes

O CSV completo nao esta incluido neste repositorio para manter o projeto leve. Para reproduzir a analise, baixe o dataset no Kaggle e importe o arquivo no SQLite Online.

A coluna `payment_value` pode aparecer repetida em algumas analises por causa da granularidade do CSV simplificado. Por isso, a receita principal do projeto foi calculada com `price + freight_value`.
