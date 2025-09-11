WITH
  sellers AS (
    SELECT
      t1.seller_id,
      t1.product_id,
      t2.product_category_name,
      COUNT(DISTINCT (t1.order_id)) AS qtde_pedidos,
      SUM(t1.price) AS valor_vendas
    FROM
      olist_order_items AS t1
      LEFT JOIN olist_products AS t2 ON t1.product_id = t2.product_id
    GROUP BY
      1,
      2,
      3
  ),
  rankiamento AS (
    SELECT
      *,
      ROW_NUMBER() OVER (
        PARTITION BY
          seller_id
        ORDER BY
          product_id DESC,
          valor_vendas DESC
      ) AS rank
    from
      sellers
  )
SELECT
  *
FROM
  rankiamento
WHERE
  rank = 1