-- monte a seguinte tabela
--  seller_id | alimentos | construcao | eletrodomesticos | 
--    fashion | livros | moveis | telefonia | outros
WITH
  sellers AS (
    SELECT
      t2.seller_id,
      t1.product_category_name,
      SUM(t2.price) + SUM(t2.freight_value) AS valor_total
    FROM
      olist_products AS t1
      LEFT JOIN olist_order_items AS t2 ON t1.product_id = t2.product_id
    GROUP BY
      1,
      2
  ),
  categoria_produtos AS (
    SELECT
      seller_id,
      CASE
        WHEN product_category_name LIKE '%alimentos%' THEN SUM(valor_total)
      END AS alimentos,
      CASE
        WHEN product_category_name LIKE '%construcao%' THEN SUM(valor_total)
      END AS construcao,
      CASE
        WHEN product_category_name LIKE '%eletrodomesticos%' THEN SUM(valor_total)
      END AS eletrodomesticos,
      CASE
        WHEN product_category_name LIKE '%fashion%' THEN SUM(valor_total)
      END AS fashion,
      CASE
        WHEN product_category_name LIKE '%livros%' THEN SUM(valor_total)
      END AS livros,
      CASE
        WHEN product_category_name LIKE '%moveis%' THEN SUM(valor_total)
      END AS moveis,
      CASE
        WHEN product_category_name LIKE '%telefonia%' THEN SUM(valor_total)
      END AS telefonia,
      CASE
        WHEN product_category_name NOT LIKE '%alimentos%'
        AND product_category_name NOT LIKE '%construcao%'
        AND product_category_name NOT LIKE '%eletrodomesticos%'
        AND product_category_name NOT LIKE '%fashion%'
        AND product_category_name NOT LIKE '%livros%'
        AND product_category_name NOT LIKE '%moveis%'
        AND product_category_name NOT LIKE '%telefonia%' THEN SUM(valor_total)
      END AS outros
    FROM
      sellers
    GROUP BY
      seller_id,
      product_category_name
  ),
  valor_total AS (
    SELECT
      seller_id,
      SUM(valor_total) AS valor_total
    FROM
      sellers
    GROUP BY
      1
  )
SELECT
  t1.seller_id,
  COALESCE(
    ROUND((SUM(t1.alimentos) / t2.valor_total) * 100, 1),
    0
  ) AS alimentos,
  COALESCE(
    ROUND((SUM(t1.construcao) / t2.valor_total) * 100, 1),
    0
  ) AS construcao,
  COALESCE(
    ROUND(
      (SUM(t1.eletrodomesticos) / t2.valor_total) * 100,
      1
    ),
    0
  ) AS eletrodomesticos,
  COALESCE(
    ROUND((SUM(t1.fashion) / t2.valor_total) * 100, 1),
    0
  ) AS fashion,
  COALESCE(
    ROUND((SUM(t1.livros) / t2.valor_total) * 100, 1),
    0
  ) AS livros,
  COALESCE(
    ROUND((SUM(t1.moveis) / t2.valor_total) * 100, 1),
    0
  ) AS moveis,
  COALESCE(
    ROUND((SUM(t1.telefonia) / t2.valor_total) * 100, 1),
    0
  ) AS telefonia,
  COALESCE(
    ROUND((SUM(t1.outros) / t2.valor_total) * 100, 1),
    0
  ) AS outros
FROM
  categoria_produtos AS t1
  LEFT JOIN valor_total AS t2 ON t1.seller_id = t2.seller_id
GROUP BY
  1