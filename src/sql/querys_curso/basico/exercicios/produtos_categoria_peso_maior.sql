SELECT
  *
FROM
  olist_products
WHERE
  (
    product_category_name = 'perfumaria'
    OR product_category_name = 'artes'
  )
  AND product_weight_g >= 600