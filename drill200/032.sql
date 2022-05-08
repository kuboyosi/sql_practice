SELECT * FROM `sql-book-336704.sample.customers` ORDER BY user_id LIMIT 3 OFFSET (CAST(RAND()*496 AS INT64))

-- SELECT CAST(RAND()*496 AS INT64)

-- customers の uniqueなuser_id の数は497
