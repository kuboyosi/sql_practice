SELECT
  name,
FROM `sql-book-336704.sample.customers`
WHERE REGEXP_CONTAINS(name, r"^山.*子$") --- シンプルにに LIKEを使って LIKE "山%子" でもOK
