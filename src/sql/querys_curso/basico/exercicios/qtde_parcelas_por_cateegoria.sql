SELECT
  payment_type,
  SUM(payment_installments) AS parcelas_totais,
  SUM(payment_value) AS valor_total,
  SUM(payment_value) / SUM(payment_installments) AS valor_medio_parcelas
FROM
  olist_order_payments
WHERE
  payment_type = 'credit_card'
GROUP BY
  1