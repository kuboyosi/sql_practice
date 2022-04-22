SELECT 
    CASE 
        WHEN c.gender = 1 THEN "男性"
        WHEN c.gender = 2 THEN "女性"
    ELSE "不明" END AS customer_gender
    , p.product_category
    , SUM(revenue) AS sum_revenue
    FROM `sql-book-336704.sample.sales` AS s
    INNER JOIN `sql-book-336704.sample.products` AS p
    ON s.product_id = p.product_id
    INNER JOIN `sql-book-336704.sample.customers` AS c
    ON s.user_id = c.user_id
    GROUP BY customer_gender, p.product_category
    ORDER BY customer_gender ASC, sum_revenue DESC
