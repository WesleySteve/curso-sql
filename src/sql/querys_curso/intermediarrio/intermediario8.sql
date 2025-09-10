WITH
  categorias AS (
    SELECT
      product_category_name,
      COUNT(DISTINCT (product_id)) AS qtde_produtos
    FROM
      olist_products
    GROUP BY
      1
    ORDER BY
      2 DESC
  )
SELECT
  *
FROM
  categorias
WHERE
  qtde_produtos >= 1400