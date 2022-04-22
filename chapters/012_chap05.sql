SELECT 
    s.product_id AS product_id
    , SUM(s.quantity) AS sum_qty
    , SUM(s.quantity) / (SELECT SUM(quantity) FROM `sql-book-336704.sample.sales`) AS sales_share
FROM `sql-book-336704.sample.sales` AS s
INNER JOIN `sql-book-336704.sample.products` AS p
ON s.product_id = p.product_id
GROUP BY product_id
ORDER BY sales_share DESC LIMIT 5