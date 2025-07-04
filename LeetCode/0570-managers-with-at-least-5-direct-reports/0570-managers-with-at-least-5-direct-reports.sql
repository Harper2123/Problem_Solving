-- Select the names of employees who are managers with at least 5 direct reports
SELECT
    name
FROM
    Employee
WHERE
    id IN (
        SELECT
            e2.managerId
        FROM (
            SELECT
                managerId,
                COUNT(*) AS report_count
            FROM
                Employee
            GROUP BY
                managerId
            HAVING
                COUNT(*) >= 5
        ) AS e2
    );
