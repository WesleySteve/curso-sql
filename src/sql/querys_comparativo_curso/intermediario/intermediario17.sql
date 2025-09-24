WITH
  vendas AS (
    SELECT
      seller_id,
      strftime ('%Y-%m-%d', order_approved_at) AS data_venda,
      SUM(price) AS valor_vendas
    FROM
      fato_orders
    WHERE
      seller_id IS NOT NULL
    GROUP BY
      1,
      2
    ORDER BY
      1,
      2 ASC
  )
SELECT
  *,
  SUM(valor_vendas) OVER (
    PARTITION BY
      seller_id
    ORDER BY
      data_venda ASC
  ) AS venda_acc
FROM
  vendas