SELECT
  payment_type,
  SUM(payment_value) AS valor_total
FROM
  olist_order_payments
GROUP BY
  1