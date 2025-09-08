SELECT
  product_category_name,
  SUM(product_photos_qty) AS fotos_totais,
  AVG(product_length_cm) AS comprimento_medio
FROM
  olist_products
WHERE
  product_category_name LIKE '%construcao%'
GROUP BY
  1