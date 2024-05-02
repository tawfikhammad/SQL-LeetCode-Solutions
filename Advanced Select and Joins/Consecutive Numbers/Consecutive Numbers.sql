WITH Sequences AS (
    SELECT 
        num,
        COUNT(*) OVER (PARTITION BY num, num - ROW_NUMBER() OVER (ORDER BY id)) AS sequence_length
    FROM logs
)
SELECT DISTINCT num
FROM Sequences
WHERE sequence_length >= 3;
