
WITH 
recencia AS (
  SELECT
    c.customer_unique_id,
    DATE_DIFF(
      (SELECT MAX(DATE(order_purchase_timestamp)) FROM `olist_ecommerce.orders`),
      MAX(DATE(o.order_purchase_timestamp)),
      DAY
    ) AS recencia_dias
  FROM `olist_ecommerce.orders` AS o
  JOIN `olist_ecommerce.customers` AS c ON o.customer_id = c.customer_id
  WHERE o.order_status = 'delivered'
  GROUP BY c.customer_unique_id
),
frequencia AS (
  SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS frequencia
  FROM `olist_ecommerce.customers` AS c
  JOIN `olist_ecommerce.orders` AS o ON c.customer_id = o.customer_id
  WHERE o.order_status = 'delivered'
  GROUP BY c.customer_unique_id
),
monetario AS (
  SELECT
    c.customer_unique_id,
    SUM(p.payment_value) AS valor_total_gasto
  FROM `olist_ecommerce.customers` AS c
  JOIN `olist_ecommerce.orders` AS o ON c.customer_id = o.customer_id
  JOIN `olist_ecommerce.order_payments` AS p ON o.order_id = p.order_id
  WHERE o.order_status = 'delivered'
  GROUP BY c.customer_unique_id
)
SELECT
  r.customer_unique_id,
  r.recencia_dias,
  COALESCE(f.frequencia, 0) AS frequencia,
  COALESCE(m.valor_total_gasto, 0) AS valor_total_gasto
FROM
  recencia AS r
JOIN
  frequencia AS f ON r.customer_unique_id = f.customer_unique_id
JOIN
  monetario AS m ON r.customer_unique_id = m.customer_unique_id
ORDER BY
  r.recencia_dias ASC,
  m.valor_total_gasto DESC;





WITH 

tabela_rfm_final AS (
    SELECT
        r.customer_unique_id,
        r.recencia_dias,
        COALESCE(f.frequencia, 0) AS frequencia,
        COALESCE(m.valor_total_gasto, 0) AS valor_total_gasto
    FROM
        (SELECT c.customer_unique_id, DATE_DIFF((SELECT MAX(DATE(order_purchase_timestamp)) FROM `olist_ecommerce.orders`), MAX(DATE(o.order_purchase_timestamp)), DAY) AS recencia_dias FROM `olist_ecommerce.orders` AS o JOIN `olist_ecommerce.customers` AS c ON o.customer_id = c.customer_id WHERE o.order_status = 'delivered' GROUP BY c.customer_unique_id) AS r
    LEFT JOIN 
        (SELECT c.customer_unique_id, COUNT(o.order_id) AS frequencia FROM `olist_ecommerce.customers` AS c JOIN `olist_ecommerce.orders` AS o ON c.customer_id = o.customer_id WHERE o.order_status = 'delivered' GROUP BY c.customer_unique_id) AS f ON r.customer_unique_id = f.customer_unique_id
    LEFT JOIN 
        (SELECT c.customer_unique_id, SUM(p.payment_value) AS valor_total_gasto FROM `olist_ecommerce.customers` AS c JOIN `olist_ecommerce.orders` AS o ON c.customer_id = o.customer_id JOIN `olist_ecommerce.order_payments` AS p ON o.order_id = p.order_id WHERE o.order_status = 'delivered' GROUP BY c.customer_unique_id) AS m ON r.customer_unique_id = m.customer_unique_id
),

-- CTE 2: Adiciona os scores de 1 a 5 usando a função NTILE()
rfm_com_scores AS (
  SELECT
    customer_unique_id,
    recencia_dias,
    frequencia,
    valor_total_gasto,
    -- Score de Recência: Ordena do maior para o menor (DESC), para que os menores dias (mais recentes) recebam a maior nota.
    NTILE(5) OVER (ORDER BY recencia_dias DESC) AS r_score,
    -- Score de Frequência: Ordena do menor para o maior (ASC), para que as maiores frequências recebam a maior nota.
    NTILE(5) OVER (ORDER BY frequencia ASC) AS f_score,
    -- Score Monetário: Ordena do menor para o maior (ASC), para que os maiores valores recebam a maior nota.
    NTILE(5) OVER (ORDER BY valor_total_gasto ASC) AS m_score
  FROM
    tabela_rfm_final
)

-- Query Final: Usa CASE WHEN para criar os nomes dos segmentos
SELECT
  s.*,
  -- Concatena os scores para criar um "RFM Score" único
  CONCAT(s.r_score, s.f_score, s.m_score) AS rfm_score_completo,
  -- Atribui nomes aos segmentos com base nas regras de negócio
  CASE
    WHEN s.r_score = 5 AND s.f_score >= 4 THEN 'Campeões'
    WHEN s.r_score >= 4 AND s.f_score >= 4 THEN 'Clientes Leais'
    WHEN s.r_score <= 2 AND s.f_score <= 2 THEN 'Em Risco'
    ELSE 'Precisam de Atenção'
  END AS segmento
FROM
  rfm_com_scores AS s
ORDER BY
  r_score DESC, f_score DESC, m_score DESC;