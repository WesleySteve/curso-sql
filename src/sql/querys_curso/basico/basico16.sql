SELECT
  seller_state,
  COUNT(DISTINCT (seller_city)) AS qtde_cidades_unicas
FROM
  olist_sellers
GROUP BY
  seller_state