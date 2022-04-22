SELECT 
    p.product_category AS category
    , SUM(s.revenue)  AS total_revenue
FROM `sql-book-336704.sample.sales` AS s
INNER JOIN  `sql-book-336704.sample.products` AS p
ON s.product_id = p.product_id
GROUP BY category
ORDER BY total_revenue DESC