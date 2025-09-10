SELECT
  t2.seller_state,
  SUM(t1.price)
FROM
  olist_order_items AS t1
  LEFT JOIN olist_sellers AS t2 ON t1.seller_id = t2.seller_id
  LEFT JOIN olist_products AS t3 ON t3.product_id = t1.product_id
WHERE
  t3.product_category_name = 'perfumaria'
GROUP BY
  1
ORDER BY
  2 DESC