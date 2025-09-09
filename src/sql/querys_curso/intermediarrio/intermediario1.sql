SELECT DISTINCT
  CASE
    WHEN product_category_name LIKE '%artes%' THEN 'artes'
    WHEN product_category_name LIKE '%alimentos%' THEN 'alimentos'
    WHEN product_category_name LIKE '%construcao%' THEN 'construcao'
    WHEN product_category_name LIKE '%casa%' THEN 'casa'
    WHEN product_category_name LIKE '%eletrodomesticos%' THEN 'eletrodomesticos'
    WHEN product_category_name LIKE '%livros%' THEN 'livros'
    WHEN product_category_name LIKE '%moveis%' THEN 'moveis'
    WHEN product_category_name LIKE '%telefonia%' THEN 'telefonia'
    WHEN product_category_name IS NULL THEN 'produto sem categoria'
    ELSE product_category_name
  END AS categorias_tratadas
FROM
  olist_products
ORDER BY
  1