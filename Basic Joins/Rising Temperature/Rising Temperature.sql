WITH joined AS (
    SELECT w1.id, w1.temperature AS temp1, w2.temperature AS temp2
    FROM Weather w1
    JOIN Weather w2 ON w1.recordDate = w2.recordDate + INTERVAL 1 DAY
)
SELECT id
FROM joined
WHERE temp1 > temp2;
