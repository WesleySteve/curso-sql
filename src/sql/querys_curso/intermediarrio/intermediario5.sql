SELECT
  t1.product_id,
  t1.product_category_name,
  t2.price
FROM
  olist_products AS t1
  LEFT JOIN olist_order_items AS t2 ON t1.product_id = t2.product_id