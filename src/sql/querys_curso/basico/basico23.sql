SELECT
  order_id,
  SUM(price) AS valor_total
FROM
  olist_order_items
GROUP BY
  1
HAVING
  valor_total >= 4000
ORDER BY
  2 DESC