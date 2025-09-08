-- esse 1 -> posicao do campo no select
SELECT
  order_id,
  COUNT(product_id)
FROM
  olist_order_items
GROUP BY
  1