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


## Dia 3: Quarta-feira, 30/07 - O Poder do Python e Pandas

**Foco do Dia:** Sair do ambiente SQL e trazer a análise RFM para o Python para manipulação de dados mais flexível.

**O que eu fiz:**
1.  Exportei a tabela RFM final do BigQuery para um arquivo CSV.
2.  Configurei o ambiente de análise dentro do VS Code, utilizando a extensão do Jupyter para rodar notebooks (`.ipynb`).
3.  Carreguei os dados com o Pandas e executei os primeiros comandos de exploração (`.head()`, `.info()`, `.describe()`).
4.  Realizei agregações com `.groupby().agg()` para sumarizar as métricas de cada segmento, recriando a análise que havíamos feito no SQL.

**Desafios que Enfrentei:**
* **Erro de Importação do Pandas:** O VS Code não estava reconhecendo a biblioteca (`PylancereportMissingModuleSource`). O problema era que o Kernel do notebook não estava corretamente apontado para o ambiente do Anaconda.
* **Solução:** Usei a Paleta de Comandos (`Ctrl+Shift+P`) para selecionar o interpretador Python correto, sincronizando o VS Code com a instalação do Anaconda.

**Principais Aprendizados:**
* A importância de configurar corretamente o ambiente e o interpretador no VS Code.
* O poder do `.groupby().agg()` no Pandas para criar tabelas de resumo de forma rápida e legível.

---

## Dias 4 e 5: Quinta e Sexta (31/07 e 01/08) - Data Viz e Dashboards Interativos

**Foco do Dia:** Transformar os números da análise em visualizações de dados claras e criar uma ferramenta interativa para explorar os segmentos de clientes.

**O que eu fiz:**
1.  **Data Viz Estático:** Usei as bibliotecas Matplotlib e Seaborn no notebook para criar gráficos de barras, visualizando a contagem de clientes e o valor médio gasto por segmento.
2.  **Aprendizado de Streamlit:** Decidi criar uma versão interativa da análise. Instalei a biblioteca Streamlit e aprendi os comandos básicos (`st.title`, `st.dataframe`, `st.sidebar`).
3.  **Construção do Dashboard:** Criei um script Python (`.py`) que carrega os dados e gera um dashboard web com KPIs (Big Numbers), uma tabela detalhada e gráficos dinâmicos.
4.  **Interatividade:** Adicionei um filtro multisseleção na barra lateral para permitir que o usuário explore os dados de segmentos específicos, com o dashboard se atualizando em tempo real.

**Principais Aprendizados:**
* Como usar o Seaborn para criar gráficos informativos com poucas linhas de código.
* O fluxo de trabalho para criar e executar uma aplicação Streamlit (`streamlit run seu_script.py`).
* A diferença fundamental entre uma análise estática (Jupyter Notebook) e uma ferramenta interativa (Dashboard Streamlit).