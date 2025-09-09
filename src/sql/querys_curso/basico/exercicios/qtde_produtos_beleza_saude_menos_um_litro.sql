SELECT
  product_id,
  (
    product_length_cm * product_height_cm * product_width_cm
  ) / 1000 AS volume_litros
FROM
  olist_products
WHERE
  product_category_name = 'beleza_saude'
  AND (
    product_length_cm * product_height_cm * product_width_cm
  ) / 1000 <= 1