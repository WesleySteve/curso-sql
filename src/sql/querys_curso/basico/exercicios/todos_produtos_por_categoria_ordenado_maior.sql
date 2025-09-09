SELECT
  product_id,
  product_category_name,
  product_weight_g
FROM
  olist_products
WHERE
  product_category_name = 'perfumaria'
ORDER BY
  product_weight_g DESC