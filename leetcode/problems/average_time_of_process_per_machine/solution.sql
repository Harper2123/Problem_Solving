# Write your MySQL query statement below
WITH CTE AS (
    SELECT
        w1.machine_id,
        w1.process_id,
        w1.activity_type AS start_activity,
        w1.timestamp AS start_time,
        w2.activity_type AS end_activity,
        w2.timestamp AS end_time,
        (w2.timestamp - w1.timestamp) AS time_spent
    FROM
        Activity w1
    JOIN
        Activity w2
        ON w1.machine_id = w2.machine_id
        AND w1.process_id = w2.process_id
    WHERE
        w1.activity_type = 'start'
        AND w2.activity_type = 'end'
)
SELECT
    machine_id,
    ROUND(AVG(time_spent),3) AS processing_time
FROM
    CTE
GROUP BY
    machine_id;