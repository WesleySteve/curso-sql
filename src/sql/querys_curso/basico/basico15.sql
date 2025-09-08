SELECT
  *,
  product_name_lenght + product_description_lenght AS soma_colunas,
  product_description_lenght - product_name_lenght AS subtracao_colunas,
  product_description_lenght * product_name_lenght AS multiplicacao_colunas,
  product_description_lenght / product_name_lenght AS divisao_colunas,
  product_description_lenght / 2 AS divisao,
  (product_description_lenght * product_name_lenght) / 2 AS multi_div2_colunas,
  (product_description_lenght + product_name_lenght) / product_description_lenght AS soma
FROM
  olist_products