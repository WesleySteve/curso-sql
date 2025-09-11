-- monte uma tabela que mostre o customer_id, 
-- a categoria do produto 'mais vendido',
-- a quantidade d vendas desse produto e o valor total de vendas
WITH
  customers AS (
    SELECT
      t1.customer_unique_id,
      t4.product_category_name,
      COUNT(t2.order_id) AS qtde_compras,
      SUM(t3.price) AS valor_total
    FROM
      olist_customers AS t1
      LEFT JOIN olist_orders AS t2 ON t1.customer_id = t2.customer_id
      LEFT JOIN olist_order_items AS t3 ON t2.order_id = t3.order_id
      LEFT JOIN olist_products AS t4 ON t3.product_id = t4.product_id
    GROUP BY
      1,
      2
    ORDER BY
      customer_unique_id,
      qtde_compras DESC
  ),
  rankiamento AS (
    SELECT
      *,
      ROW_NUMBER() OVER (
        PARTITION BY
          customer_unique_id
        ORDER BY
          qtde_compras DESC,
          valor_total DESC
      ) AS rank
    FROM
      customers
  )
SELECT
  *
FROM
  rankiamento
WHERE
  rank = 1