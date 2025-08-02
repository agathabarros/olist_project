SELECT * FROM `study-434523.olist_ecommerce.orders` LIMIT 10;

-- Query 2: Quantos pedidos existem para cada status (entregue, cancelado, etc.)?
SELECT
  order_status,
  COUNT(*) AS quantidade_de_pedidos
FROM
  `olist_ecommerce.orders`
GROUP BY
  order_status
ORDER BY
  quantidade_de_pedidos DESC;

-- Query 3: Qual o valor médio de pedido e a nota média de avaliação por estado do cliente?
SELECT
  c.customer_state,
  AVG(p.payment_value) AS valor_medio_pedido,
 -- AVG(r.review_score) AS nota_media_avaliacao,
  COUNT(DISTINCT o.order_id) as total_pedidos -- Bônus: contando os pedidos
FROM
  `olist_ecommerce.orders` AS o
JOIN
  `olist_ecommerce.customers` AS c ON o.customer_id = c.customer_id
JOIN
  `olist_ecommerce.order_payments` AS p ON o.order_id = p.order_id

WHERE
    o.order_status = 'delivered' -- Boa prática: analisar apenas os pedidos concluídos
GROUP BY
  c.customer_state
ORDER BY
  total_pedidos DESC;