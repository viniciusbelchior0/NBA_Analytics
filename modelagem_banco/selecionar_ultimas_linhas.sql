SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER () AS row
    FROM factboxscores
) sub
ORDER BY row DESC
LIMIT 10;