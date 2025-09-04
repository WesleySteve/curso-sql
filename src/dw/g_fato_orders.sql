SELECT
  t1.order_id,
  t1.customer_id,
  t1.order_status,
  t1.order_purchase_timestamp,
  t1.order_approved_at,
  t1.order_delivered_carrier_date,
  t1.order_delivered_customer_date,
  t1.order_estimated_delivery_date,
  t2.order_item_id,
  t2.product_id,
  t2.seller_id,
  t2.shipping_limit_date,
  t2.price,
  t2.freight_value
FROM
  olist_orders t1
  LEFT JOIN olist_order_items t2 ON t1.order_id = t2.order_id