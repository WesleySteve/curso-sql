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
  data_limite AS (
    SELECT
      order_id,
      strftime ('%Y-%m-%d', shipping_limit_date) AS data_limite
    FROM
      olist_order_items
  ),
  data_entrega AS (
    SELECT
      order_id,
      strftime ('%Y-%m-%d', order_delivered_customer_date) AS data_entrega
    FROM
      olist_orders
  )
SELECT
  t1.order_id,
  t1.data_limite,
  t2.data_entrega
FROM
  data_limite AS t1
  LEFT JOIN data_entrega AS t2 ON t1.order_id = t2.order_id
  and t1.data_limite >= t2.data_entrega
WHERE
  t2.data_entrega IS NOT NULL