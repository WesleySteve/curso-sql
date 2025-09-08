SELECT
  payment_type,
  AVG(payment_installments) AS media_qtde_parcelas,
  AVG(payment_value) AS valor_medio_compra
FROM
  olist_order_payments
WHERE
  payment_type = 'credit_card'
GROUP BY
  1