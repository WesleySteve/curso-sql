SELECT
  *
FROM
  olist_order_payments
WHERE
  payment_value > 100
  AND (
    payment_type = 'voucher'
    OR payment_type = 'boleto'
  )