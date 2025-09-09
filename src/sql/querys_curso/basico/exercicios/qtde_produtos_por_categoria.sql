SELECT
  product_category_name,
  COUNT(product_id) AS qtde_produtos FROM1 olist_products
WHERE
  product_category_name = 'artes'
GROUP BY
  1