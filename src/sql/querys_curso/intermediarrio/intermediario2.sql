SELECT
  review_id,
  review_score,
  CASE
    WHEN review_score IN (1, 2) THEN 'Ruim'
    WHEN review_score = 3 THEN 'Neutro'
    WHEN review_score IN (4, 5) THEN 'Bom'
    ELSE 'Sem score'
  END AS review_qualy
FROM
  olist_order_reviews