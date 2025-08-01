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