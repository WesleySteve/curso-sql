SELECT
  product_category_name,
  COUNT(product_id) AS qtde_categorias
FROM
  olist_products
WHERE
  product_category_name IS NOT NULL
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  5