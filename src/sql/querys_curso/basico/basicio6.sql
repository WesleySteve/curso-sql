SELECT
  *
FROM
  olist_order_payments
WHERE
  payment_installments <= 3
  and payment_type = 'credit_card'
  and payment_value >= 100