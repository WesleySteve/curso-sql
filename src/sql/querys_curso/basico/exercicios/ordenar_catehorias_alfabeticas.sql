SELECT DISTINCT
  (product_category_name) AS categorias_unicas
FROM
  olist_products
WHERE
  product_category_name is NOT NULL
ORDER BY
  product_category_name