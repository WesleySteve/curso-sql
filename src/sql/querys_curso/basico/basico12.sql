SELECT
  review_id,
  order_id,
  review_comment_title,
  review_comment_message
FROM
  olist_order_reviews
WHERE
  review_comment_title IS NULL
  AND review_comment_message IS NOT NULL