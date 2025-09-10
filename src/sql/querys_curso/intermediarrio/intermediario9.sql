WITH
  sellers AS (
    SELECT
      seller_id,
      seller_state
    FROM
      olist_sellers
  ),
  pedidos AS (
    SELECT
      seller_id,
      order_id,
      COUNT(DISTINCT (order_id)) AS qtde_pedidos,
      SUM(price) AS vendas_totais,
      SUM(freight_value) AS frete,
      SUM(price) + SUM(freight_value) AS total_pedidos
    FROM
      olist_order_items
    GROUP BY
      1,
      2
  ),
  tipo_pagamento AS (
    SELECT
      order_id,
      CASE
        WHEN payment_type = 'credit_card' THEN SUM(payment_value)
      END AS cartao_credito,
      CASE
        WHEN payment_type = 'boleto' THEN SUM(payment_value)
      END AS boleto,
      CASE
        WHEN payment_type = 'debit_card' THEN SUM(payment_value)
      END AS debito
    FROM
      olist_order_payments
    GROUP BY
      1
  )
SELECT
  t1.seller_id,
  t1.seller_state,
  SUM(t2.qtde_pedidos) AS qtde_pedidos,
  SUM(t2.vendas_totais) AS vendas_totais,
  SUM(t2.frete) AS frete,
  SUM(t2.total_pedidos) AS total_pedidos,
  COALESCE(SUM(t3.cartao_credito), 0) AS cartao_credito,
  COALESCE(SUM(t3.boleto), 0) AS boleto,
  COALESCE(SUM(t3.debito), 0) AS debito
FROM
  sellers AS t1
  LEFT JOIN pedidos AS t2 ON t1.seller_id = t2.seller_id
  LEFT JOIN tipo_pagamento AS t3 ON t2.order_id = t3.order_id
GROUP BY
  1,
  2