-- filtrar somente as categorias com produtos cadastrados >= 500
SELECT
  *
FROM
  (
    SELECT
      product_category_name,
      COUNT(DISTINCT (product_id)) AS qtde_produtos
    FROM
      olist_products
    WHERE
      product_category_name IS NOT NULL
    GROUP BY
      product_category_name
    ORDER BY
      2 DESC
  )
WHERE
  qtde_produtos >= 500