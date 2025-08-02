import streamlit as st
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

st.set_page_config(layout="wide") 
st.title('Dashboard Interativo de Segmentação RFM 🏆')

@st.cache_data
def carregar_dados():
	df = pd.read_csv('05_segmentacao_rfm_final.sql.csv')
	return df

df_rfm = carregar_dados()

st.sidebar.header('Filtros')

seg_select = st.sidebar.multiselect(
	'Selecione os Segmentos',
	options=df_rfm['segmento'].unique(),
	default=df_rfm['segmento'].unique()
)

df_select = df_rfm[df_rfm['segmento'].isin(seg_select)]

st.header('Resumo da Seleção')
kpi1, kpi2, kpi3, kpi4 = st.columns(4)
total_clientes = df_select['customer_unique_id'].nunique()
media_recencia = df_select['recencia_dias'].mean()
media_frequencia = df_select['frequencia'].mean()
media_valor_gasto = df_select['valor_total_gasto'].mean()

kpi1.metric(
    label="Total de Clientes",
    value=f"{total_clientes:,}" # Formata o número com separador de milhar
)

kpi2.metric(
    label="Recência Média (dias)",
    value=f"{media_recencia:.1f}" # Formata para 1 casa decimal
)

kpi3.metric(
    label="Frequência Média",
    value=f"{media_frequencia:.2f}" # Formata para 2 casas decimais
)

kpi4.metric(
    label="Gasto Médio (R$)",
    value=f"R$ {media_valor_gasto:,.2f}" # Formata como moeda
)



st.header('Análise Detalhada por Segmento')
analise_por_segmento = df_select.groupby('segmento').agg(
    media_recencia_dias=('recencia_dias', 'mean'),
    media_frequencia=('frequencia', 'mean'),
    media_valor_gasto=('valor_total_gasto', 'mean'),
    contagem_clientes=('customer_unique_id', 'count')
).reset_index().round(2)

st.dataframe(analise_por_segmento, use_container_width=True)

st.header('Análise Visual dos Segmentos')

col1, col2 = st.columns(2)



with col1:
    # GRÁFICO 1: Quantidade de Clientes por Segmento
    st.subheader('Quantidade de Clientes por Segmento')
    fig1, ax1 = plt.subplots(figsize=(10, 8))
    sns.countplot(
        data=df_select, 
        y='segmento', 
        order=df_select['segmento'].value_counts().index, 
        palette='viridis',
        ax=ax1
    )
    ax1.set_xlabel('Quantidade de Clientes')
    ax1.set_ylabel('Segmento')
    # st.pyplot() é como mostramos um gráfico do matplotlib/seaborn no Streamlit
    st.pyplot(fig1)

with col2:
    # GRÁFICO 2: Valor Médio Gasto por Segmento
    st.subheader('Valor Médio Gasto por Segmento')
    # Agrupamos os dados selectdf_selects para calcular a média
    media_gasto_segmento = df_select.groupby('segmento')['valor_total_gasto'].mean().sort_values(ascending=False)
    
    fig2, ax2 = plt.subplots(figsize=(10, 8))
    sns.barplot(
        x=media_gasto_segmento.values,
        y=media_gasto_segmento.index,
        palette='plasma',
        ax=ax2
    )
    ax2.set_xlabel('Valor Médio Gasto (R$)')
    ax2.set_ylabel('Segmento')
    st.pyplot(fig2)


