SELECT
  t3.seller_state,
  SUM(t2.price) AS valor_total
FROM
  olist_orders AS t1
  LEFT JOIN olist_order_items AS t2 ON t1.order_id = t2.order_id
  LEFT JOIN olist_sellers AS t3 ON t2.seller_id = t3.seller_id
  LEFT JOIN olist_order_reviews AS t4 ON t1.order_id = t4.order_id
WHERE
  t4.review_score >= 4
GROUP BY
  1
ORDER BY
  2 DESC