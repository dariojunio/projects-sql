# Dados

O arquivo CSV usado no projeto vem do dataset publico:

[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

Para reproduzir a analise:

1. Baixe o CSV simplificado.
2. Importe o arquivo no SQLite Online.
3. Use a primeira linha como cabecalho.
4. Nomeie a tabela como `DF`.
5. Execute `sql/00_configuracao.sql` para criar a tabela tratada `ecommerce`.

O CSV completo nao foi incluido no projeto para evitar um repositorio pesado. O arquivo original possui cerca de 56 MB.
