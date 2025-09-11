WITH
  vendas AS (
    SELECT
      t1.seller_id,
      strftime ('%Y-%m-%d', t2.order_approved_at) AS data_venda,
      SUM(t1.price) AS valor_vendas
    FROM
      olist_order_items AS t1
      LEFT JOIN olist_orders AS t2 ON t1.order_id = t2.order_id
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