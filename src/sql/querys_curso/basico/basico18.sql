SELECT
  order_id,
  COUNT(product_id) AS qtde_produtos_vendidos,
  SUM(price) AS valor_total_pedido,
  SUM(price) / COUNT(product_id) AS tkt_medio
FROM
  olist_order_items
GROUP BY
  1