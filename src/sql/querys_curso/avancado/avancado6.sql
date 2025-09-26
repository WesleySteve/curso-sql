-- De acordo com o resultado da tabela gerado no caso 5.
-- crie uma coluna a mais que indique o seguinte:
--  quando o seller ainda não havia feito nenhuma enda no mes referencia, 
--  classifique ele como: 'Prior Eentry'.
--  no mes da primeira venda dele, classifique=o como 'Novo'
--  nos meses posteriores a primeira venda, caso ele continue vendendo, 
--    classifiquei-o como 'Regular'
--  após as primeiras endas, caso ele fique um ou mais meses sem fazer vendas, 
--    classifique-o como 'Churn'
--  caso ele tenha sido classificado como ' churn ' e,
--    no próximo mes ele olte a fazer vendas, classifique-o como 'Recuprado'
WITH
  meses AS (
    SELECT DISTINCT
      strftime ('%Y-%m-01', order_approved_at) AS mes_referencia,
      1 AS KEY
    FROM
      olist_orders
    WHERE
      mes_referencia IS NOT NULL
    ORDER BY
      1 ASC
  ),
  sellers AS (
    SELECT
      t1.seller_id,
      min(strftime ('%Y-%m-01', t2.order_approved_at)) AS mes_primeira_venda,
      1 AS KEY
    FROM
      olist_order_items AS t1
      LEFT JOIN olist_orders AS t2 ON t1.order_id = t2.order_id
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
      t1.seller_id,
      strftime ('%Y-%m-01', t2.order_approved_at) AS mes_venda,
      SUM(t1.price) + SUM(t1.freight_value) AS valor_venda
    FROM
      olist_order_items AS t1
      LEFT JOIN olist_orders AS t2 on t1.order_id = t2.order_id
    GROUP BY
      1,
      2
  ),
  vendas_seller AS (
    SELECT
      t1.mes_referencia,
      t1.seller_id,
      t1.mes_primeira_venda,
      COALESCE(SUM(t2.valor_venda), 0) AS valor_venda
    FROM
      cruzamento AS t1
      LEFT JOIN vendas AS t2 ON t1.seller_id = t2.seller_id
      AND t1.mes_referencia = t2.mes_venda
    GROUP BY
      1,
      2,
      3
    ORDER BY
      t1.seller_id,
      t1.mes_referencia
  ),
  ativo AS (
    SELECT
      *,
      CASE
        WHEN valor_venda > 0 THEN 1
        ELSE 0
      END AS 'ativo'
    FROM
      vendas_seller
  ),
  ativo_lag AS (
    SELECT
      *,
      LAG (ativo) OVER (
        PARTITION BY
          seller_id
        ORDER BY
          mes_referencia
      ) AS ativo_lag
    FROM
      ativo
  ),
  final AS (
    SELECT
      *,
      CASE
        WHEN mes_primeira_venda > mes_referencia THEN 'Prior Entry'
        WHEN mes_primeira_venda = mes_referencia THEN 'Novo'
        WHEN ativo = 1
        AND ativo_lag = 1 THEN 'Regular'
        WHEN ativo = 0 THEN 'Churn'
        WHEN ativo = 1
        AND ativo_lag = 0 THEN 'Recuperado'
      END AS classificacao
    FROM
      ativo_lag
  )
SELECT
  mes_referencia,
  seller_id,
  mes_primeira_venda,
  valor_venda,
  classificacao
FROM
  final