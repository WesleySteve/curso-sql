SELECT
  COUNT(product_id)
FROM
  olist_products
WHERE
  product_category_name LIKE '%construcao%'
  AND product_weight_g > 350