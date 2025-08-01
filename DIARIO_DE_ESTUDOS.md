# Diário de Estudos - Sprint de Análise de Dados

## Dia 1: Segunda-feira, 28/07 - Kick-off e Exploração com SQL

**Foco do Dia:** Preparar o ambiente de análise no Google BigQuery e conduzir as primeiras explorações nos dados para entender a estrutura e o conteúdo do dataset Olist.

**O que eu fiz:**
1.  Criei uma conta no Kaggle e baixei o dataset "Brazilian E-Commerce by Olist".
2.  Configurei um novo projeto no Google Cloud e um conjunto de dados no BigQuery.
3.  Fiz o upload dos 5 principais arquivos CSV (`customers`, `orders`, `order_items`, `payments`, `products`) para o BigQuery.
4.  Executei queries SQL básicas para visualizar e contar os dados.
5.  Construí uma query complexa usando `JOIN` para unir 4 tabelas e gerar meus primeiros insights sobre o valor médio de pedido por estado.

**Desafios que Enfrentei:**
* **Erro no Upload do CSV `order_reviews`:** A detecção automática de esquema do BigQuery falhou devido a erros no arquivo.
* **Solução:** Tentei definir o esquema manualmente, mas um novo erro de colunas faltantes apareceu na linha 773.
* **Diagnóstico:** O problema era uma quebra de linha dentro de um campo de texto (`review_comment_message`).
* **Solução Final:** Abri o arquivo no Google Sheets, corrigi a linha quebrada manualmente, salvei um novo CSV e fiz o upload novamente, desta vez com sucesso após também mudar as colunas de data para `STRING` para aceitar valores vazios.

**Principais Aprendizados:**
* A importância de não confiar 100% na detecção automática de esquemas. Definir manualmente dá mais controle.
* Como diagnosticar erros de upload no BigQuery lendo a mensagem de erro detalhada (número da linha, tipo de erro).
* Dados do mundo real são "sujos" e a limpeza/preparação é uma etapa fundamental e inevitável do trabalho.
* A sintaxe de `JOIN` para conectar múltiplas tabelas e `GROUP BY` para agregar os resultados.