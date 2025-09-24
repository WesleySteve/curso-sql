SELECT
  t2.seller_state,
  SUM(t1.price) AS valor_venda
FROM
  fato_orders AS t1
  LEFT JOIN dim_sellers AS t2 ON t1.seller_id = t2.seller_id
  LEFT JOIN dim_products AS t3 ON t1.product_id = t3.product_id
WHERE
  t3.product_category_name = 'perfumaria'
GROUP BY
  1
ORDER BY
  2 DESC