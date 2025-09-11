-- strftime -> para formatar datas
SELECT
  order_id,
  strftime ('%Y-%m-%d', order_approved_at) AS order_approved_at
FROM
  olist_orders