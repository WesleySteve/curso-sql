SELECT
  customer_state,
  COUNT(DISTINCT (customer_city)) AS qtde_cidadees
FROM
  olist_customers
GROUP BY
  customer_state
ORDER BY
  2 DESC