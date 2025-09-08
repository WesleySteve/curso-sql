SELECT
  COUNT(order_id) AS nro_pedidos_total,
  COUNT(DISTINCT (order_id)) AS nro_pedidos_unicos
FROM
  olist_order_items