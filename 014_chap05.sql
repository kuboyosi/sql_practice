WITH sales_with_quarter AS 
    ( SELECT 
    product_id
    , CASE
        WHEN (date(date_time) >= date(2019,7,1)) AND ((date(date_time) <= date(2019,9,30))) THEN "2019_3Q"
        WHEN (date(date_time) >= date(2019,10,1)) AND ((date(date_time) <= date(2019,12,31))) THEN "2019_4Q"
        ELSE "2020"
        END AS quarter
    , quantity
    FROM `sql-book-336704.sample.sales` 
    ),

table_2019_3Q AS (
    SELECT 
    product_id
        , SUM(quantity) AS ttl_3Q
    FROM sales_with_quarter
    WHERE quarter = "2019_3Q"
    GROUP BY product_id
),

table_2019_4Q AS (
    SELECT 
    product_id
        , SUM(quantity) AS ttl_4Q
    FROM sales_with_quarter
    WHERE quarter = "2019_4Q"
    GROUP BY product_id
)

SELECT
    t3.product_id
    , t3.ttl_3Q
    , t4.ttl_4Q
FROM table_2019_3Q AS t3
LEFT OUTER JOIN table_2019_4Q AS t4
ON t3.product_id = t4.product_id
WHERE t3.ttl_3Q >= 10 AND t4.ttl_4Q <= 10
