-- monte uma tabela cos os seguintes valores
-- seller_id  | valor_total | cartao_credito  | boleto  | voucher | cartao_debit
WITH
  sellers AS (
    SELECT
      seller_id,
      order_id,
      SUM(price) + SUM(freight_value) AS valor_total
    FROM
      fato_orders
    WHERE
      seller_id IS NOT NULL
    GROUP BY
      1,
      2
  ),
  tipo_pagamento AS (
    SELECT
      order_id,
      payment_type,
      SUM(payment_value) AS valor_pago
    FROM
      dim_payments
    GROUP BY
      1,
      2
  ),
  cruzamento AS (
    SELECT
      t1.seller_id,
      t1.valor_total,
      t2.payment_type
    FROM
      sellers AS t1
      LEFT JOIN tipo_pagamento AS t2 ON t1.order_id = t2.order_id
  ),
  tratamento AS (
    SELECT
      seller_id,
      SUM(valor_total) AS valor_total,
      CASE
        WHEN payment_type = 'credit_card' THEN SUM(valor_total)
      END AS cartao_credito,
      CASE
        WHEN payment_type = 'boleto' THEN SUM(valor_total)
      END AS boleto,
      CASE
        WHEN payment_type = 'voucher' THEN SUM(valor_total)
      END AS voucher,
      CASE
        WHEN payment_type = 'debit_card' THEN SUM(valor_total)
      END AS cartao_debito
    FROM
      cruzamento
    GROUP BY
      seller_id,
      payment_type
  )
SELECT
  seller_id,
  SUM(valor_total) AS valor_total,
  COALESCE(
    ROUND(SUM(cartao_credito) / SUM(valor_total), 1),
    0
  ) AS cartao_credito,
  COALESCE(ROUND(SUM(boleto) / SUM(valor_total), 1), 0) AS boleto,
  COALESCE(ROUND(SUM(voucher) / SUM(valor_total), 1), 0) AS voucher,
  COALESCE(
    ROUND(SUM(cartao_debito) / SUM(valor_total), 1),
    0
  ) AS cartao_debito
FROM
  tratamento
GROUP BY
  1