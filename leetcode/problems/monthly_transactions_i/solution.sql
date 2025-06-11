# Write your MySQL query statement below
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') as month,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state="approved" THEN 1 END) as approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state="approved" THEN amount ELSE 0 END) as approved_total_amount
FROM
    Transactions
GROUP BY
    month,
    country;