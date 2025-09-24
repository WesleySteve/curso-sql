-- todos os pedidos que foram entregues 
--  antes da data limite estipulada e apresentada pro cliente
--
-- a data order_delivered_customer_date
-- tem q ser < shipping_limit_date
--
--  tabela orders
--    order_delivered_customer_date (pedido entregue)
--  tabela order_items
--    shipping_limit_date (limite de entrega)
WITH
  datas AS (
    SELECT
      order_id,
      strftime ('%Y-%m-%d', shipping_limit_date) AS data_limite,
      strftime ('%Y-%m-%d', order_delivered_customer_date) AS data_entrega
    FROM
      fato_orders
  )
SELECT
  order_id,
  data_limite,
  data_entrega
FROM
  datas
WHERE
  data_entrega IS NOT NULL
  AND data_limite >= data_entrega