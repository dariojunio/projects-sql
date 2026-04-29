# Análise de E-commerce Brasileiro com SQLite

Projeto de SQL para portfólio com dados reais de e-commerce brasileiro. A proposta é analisar vendas, clientes, categorias de produtos, pagamentos e entregas usando consultas SQL no SQLite Online.

## Objetivo

Responder perguntas de negócio a partir de uma base transacional:

- Qual foi a receita total do período?
- Quais estados concentraram mais pedidos e receita?
- Quais categorias de produto tiveram melhor desempenho?
- Como as vendas evoluíram ao longo do tempo?
- Quais formas de pagamento foram mais utilizadas?
- Como o prazo de entrega varia entre pedidos no prazo e atrasados?

## Dataset

Fonte: [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

Foi utilizada uma versão simplificada do dataset, consolidada em um único arquivo CSV. A base contém informações de pedidos, clientes, produtos, vendedores, pagamentos, datas de compra e entrega.

Período analisado: outubro de 2016 a agosto de 2018.

| Métrica | Valor |
|---|---:|
| Linhas | 113.390 |
| Pedidos únicos | 95.128 |
| Clientes únicos | 92.081 |
| Vendedores únicos | 2.914 |
| Categorias de produto | 73 |
| Receita de produtos | R$ 13.627.670,23 |
| Frete total | R$ 2.270.519,65 |
| Receita total estimada | R$ 15.898.189,88 |
| Ticket médio por pedido | R$ 167,12 |

> Receita total estimada = `price + freight_value`.

## Ferramenta

As consultas foram feitas para SQLite e testadas considerando o comportamento do SQLite Online, que pode encurtar nomes longos de colunas no momento da importação do CSV.

O projeto usa duas tabelas:

```sql
DF          -- tabela bruta importada do CSV
ecommerce   -- tabela tratada criada no arquivo 00_configuracao.sql
