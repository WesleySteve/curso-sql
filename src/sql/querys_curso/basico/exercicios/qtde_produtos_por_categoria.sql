SELECT
  product_category_name,
  COUNT(product_id) AS qtde_produtos
FROM
  olist_products
WHERE
  product_category_name = 'artes'
GROUP BY
  1