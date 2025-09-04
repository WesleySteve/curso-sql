-- payment_installments >= 3
-- payment_installments <= 4
-- payment_installments < 5
SELECT
  *
FROM
  olist_order_payments
WHERE
  payment_installments > 3