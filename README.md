# Análise de E-commerce - Dataset Olist

## Sobre o Projeto
Este repositório documenta um sprint de estudos de 1 semana focado em análise de dados, utilizando o dataset público da Olist. O objetivo é aplicar e desenvolver habilidades em SQL, Python, Data Visualization e na geração de insights de negócio a partir de dados brutos.

O projeto cobre desde a exploração inicial e limpeza dos dados até a segmentação de clientes (RFM) e a comunicação dos resultados.

## Fonte de Dados
O dataset utilizado é o [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), disponível no Kaggle.


## 🚀 Dashboard Interativo

Uma versão interativa desta análise foi desenvolvida com Streamlit. Ela permite a exploração dinâmica dos segmentos de clientes.


### Como Executar o Dashboard Localmente
1.  Clone este repositório.
2.  Instale as dependências: `pip install -r requirements.txt`
3.  Execute o comando no seu terminal: `streamlit run dashboard_rfm.py`

---

## Análise Realizada

A análise foi estruturada da seguinte forma:

* **Dia 1: Exploração e Limpeza de Dados com SQL:** Conexão com o Google BigQuery, upload e limpeza inicial dos dados, primeiras queries exploratórias com `JOINs`.
* **Dia 2: Segmentação de Clientes com SQL Avançado:** Construção de uma tabela de clientes completa com métricas de Recência, Frequência e Monetário (RFM) e criação dos segmentos.
* **Dia 3: Manipulação de Dados com Python e Pandas:** Migração da análise para um ambiente Python (VS Code com Jupyter Notebooks) para agregações e manipulações mais flexíveis.
* **Dia 4: Visualização de Dados e Desenvolvimento do Dashboard:** Criação de gráficos com Seaborn/Matplotlib e desenvolvimento de uma aplicação web interativa com Streamlit para apresentar os resultados.

## Insights Estratégicos
A análise revelou três pontos principais sobre a base de clientes:
1.  **O Poder da Minoria:** Os segmentos de alto valor ("Campeões" e "Leais"), embora pequenos em número, são responsáveis pela maior parte da receita, confirmando o princípio 80/20.
2.  **O Tesouro Adormecido:** Uma grande parte da base de clientes está inativa ("Em Risco" e "Hibernando"), representando uma enorme oportunidade para campanhas de reativação.
3.  **O Futuro nos Novos Clientes:** O segmento "Novos e Promissores" é a chave para o crescimento futuro, e a principal meta do negócio deve ser incentivar a segunda compra deste grupo.

## Ferramentas e Estrutura
* **Linguagens:** SQL (Google BigQuery), Python (Pandas, Matplotlib, Seaborn)
* **Ferramentas:** VS Code, Jupyter Notebook, Streamlit, GitHub
* **/sql/**: Contém as queries SQL de exploração e da criação do modelo RFM.
* **`analise_dia_03.ipynb`**: Notebook com a análise exploratória e gráficos estáticos.
* **`dashboard_rfm.py`**: Script da aplicação interativa Streamlit.
* **`DIARIO_DE_ESTUDOS.md`**: Log pessoal com desafios e aprendizados de cada dia.