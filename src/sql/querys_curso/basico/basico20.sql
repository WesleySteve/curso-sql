SELECT
  product_category_name,
  MIN(product_photos_qty) AS qtde_min_fotos,
  MAX(product_photos_qty) AS qtde_max_fotos
FROM
  olist_products
GROUP BY
  1