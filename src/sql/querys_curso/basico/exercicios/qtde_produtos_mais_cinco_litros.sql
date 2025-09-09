SELECT
  product_id,
  (
    product_length_cm * product_height_cm * product_width_cm
  ) / 1000 AS volume_litros
FROM
  olist_products
WHERE
  (
    product_length_cm * product_height_cm * product_width_cm
  ) / 1000 >= 5