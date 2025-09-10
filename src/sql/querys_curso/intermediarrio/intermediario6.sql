SELECT
  t1.order_id,
  t1.order_status,
  t2.payment_type
FROM
  olist_orders AS t1
  LEFT JOIN olist_order_payments AS t2 ON t1.order_id = t2.order_id