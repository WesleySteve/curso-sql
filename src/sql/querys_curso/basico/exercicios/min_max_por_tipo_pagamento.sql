SELECT
  payment_type,
  MIN(payment_value) AS pagamento_min,
  MAX(payment_value) AS pagamento_max
FROM
  olist_order_payments
GROUP BY
  1