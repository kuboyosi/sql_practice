WITH qty_3q AS (
    SELECT
        product_id
    FROM `sql-book-336704.sample.sales`
    WHERE date_time BETWEEN "2019-07-1" AND "2019-09-30"
    GROUP BY product_id
    HAVING SUM(quantity) >= 10
),

qty_4q AS (
    SELECT
        product_id
    FROM `sql-book-336704.sample.sales`
    WHERE date_time BETWEEN "2019-10-1" AND "2019-12-31"
    GROUP BY product_id
    HAVING SUM(quantity) >= 10
)

SELECT product_id FROM qty_3q 
EXCEPT DISTINCT
SELECT product_id FROM qty_4q