-- CAST 
--  transforma variaveis (inteiras, float, data)
-- CAST(variavel as int64)
-- CAST(variavel as float64)
-- CAST(variavel as date)
--
-- ROUND
--  para fazer arredondamento
--  ROUND(campo, qtde_casas_decimais)
SELECT
  product_id,
  CAST(
    (product_height_cm * product_width_cm) / 7 AS int64
  ) AS caste,
  ROUND((product_height_cm * product_width_cm) / 7, 2) AS rounde
FROM
  olist_products