SELECT
  t1.order_id,
  t1.payment_sequential,
  t1.payment_type,
  t1.payment_installments,
  t1.payment_value
FROM
  olist_order_payments AS t1