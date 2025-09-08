SELECT
  product_category_name,
  AVG(product_weight_g) AS peso_medio
FROM
  olist_products
WHERE
  product_category_name = 'perfumaria'
GROUP BY
  1