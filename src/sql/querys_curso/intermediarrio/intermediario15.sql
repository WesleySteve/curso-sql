WITH
  sellers AS (
    SELECT
      seller_id,
      product_id,
      COUNT(DISTINCT (order_id)) AS qtde_vendas,
      SUM(price) AS valor_venda
    FROM
      olist_order_items
    GROUP BY
      1,
      2
    ORDER BY
      1
  )
SELECT
  *,
  ROW_NUMBER() OVER (
    PARTITION BY
      seller_id
    ORDER BY
      qtde_vendas DESC,
      valor_venda DESC
  ) AS ranking
FROM
  sellers