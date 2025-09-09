SELECT
  *,
  CASE
    WHEN seller_state = 'SP' THEN 'Sao Paulo'
    WHEN seller_state = 'RJ' THEN 'Rio de Janeiro'
    WHEN seller_state = 'MG' THEN 'Minas Gerais'
    WHEN seller_state = 'GO' THEN 'Goiais'
    WHEN seller_state = 'SC' THEN 'Santa Catarina'
    WHEN seller_state = 'PR' THEN 'Parana'
    WHEN seller_state = 'BA' THEN 'Bahia'
    ELSE 'Estado nao classificado'
  END AS nomes_estado
FROM
  olist_sellers