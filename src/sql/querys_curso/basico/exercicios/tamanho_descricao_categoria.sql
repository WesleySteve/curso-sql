SELECT
  product_category_name,
  AVG(product_description_lenght) AS tamanho_medio_desc,
  MAX(product_description_lenght) AS tamanho_max_desc,
  MIN(product_description_lenght) AS tamanho_min_desc
FROM
  olist_products
GROUP BY
  1