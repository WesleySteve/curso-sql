SELECT
  product_id,
  product_category_name,
  product_length_cm * product_height_cm * product_width_cm AS volume_cm3
FROM
  olist_products