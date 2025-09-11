-- no SQLite a funcao concat 
-- representa por ||
-- em outros bancos de dados existe a funcao concate
-- exemplo de uso
--  concat(order_id, customer_id)
-- exemplo de uso no SQLite
-- order_id || customer_id
SELECT
  order_id || ',' || customer_id AS concat
FROM
  olist_orders