WITH sales_with_cost AS (
    SELECT
        s.product_id
        , p.product_name
        , s.quantity
        , s.revenue
        , p.cost
        , s.revenue - p.cost AS profit
    FROM `sql-book-336704.sample.sales` AS s
    LEFT OUTER JOIN `sql-book-336704.sample.products` AS p
    ON s.product_id = p.product_id
)

SELECT
    product_name
    , SUM(quantity) AS sum_quantity
    , SUM(revenue) AS sum_revenue
    , SUM(cost) AS sum_cost
    , SUM(profit) AS sum_profit
FROM sales_with_cost
GROUP BY product_name
ORDER BY sum_profit DESC
