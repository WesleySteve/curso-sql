SELECT
  t3.customer_state,
  SUM(t2.price) AS valor_total
FROM
  olist_orders AS t1
  LEFT JOIN olist_order_items AS t2 ON t1.order_id = t2.order_id
  LEFT JOIN olist_customers AS t3 ON t1.customer_id = t3.customer_id
  LEFT JOIN olist_products AS t4 ON t2.product_id = t4.product_id
WHERE
  t4.product_category_name = 'perfumaria'
GROUP BY
  1
ORDER BY
  2 DESC