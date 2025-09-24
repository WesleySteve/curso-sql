-- historico geral de cada vendedor desde antes dele entrar
WITH
  meses AS (
    SELECT DISTINCT
      strftime ('%Y-%m-01', order_approved_at) AS mes_referencia,
      1 AS KEY
    FROM
      fato_orders
    WHERE
      mes_referencia IS NOT NULL
    ORDER BY
      1 ASC
  ),
  sellers AS (
    SELECT
      seller_id,
      min(strftime ('%Y-%m-01', order_approved_at)) AS mes_primeira_venda,
      1 AS KEY
    FROM
      fato_orders
    GROUP BY
      1
  ),
  cruzamento AS (
    SELECT
      t1.mes_referencia,
      t2.seller_id,
      t2.mes_primeira_venda
    FROM
      meses AS t1
      LEFT JOIN sellers AS t2 ON t1.KEY = t2.KEY
  ),
  vendas AS (
    SELECT
      seller_id,
      strftime ('%Y-%m-01', order_approved_at) AS mes_venda,
      SUM(price) + SUM(freight_value) AS valor_venda
    FROM
      fato_orders
    GROUP BY
      1,
      2
  )
SELECT
  t1.mes_referencia,
  t1.seller_id,
  t1.mes_primeira_venda,
  COALESCE(SUM(t2.valor_venda), 0) AS valor_venda
FROM
  cruzamento AS t1
  LEFT JOIN vendas AS t2 ON t1.seller_id = t2.seller_id
  AND t1.mes_referencia = t2.mes_venda
WHERE
  t1.seller_id IS NOT NULL
GROUP BY
  1,
  2,
  3
ORDER BY
  t1.seller_id,
  t1.mes_referencia