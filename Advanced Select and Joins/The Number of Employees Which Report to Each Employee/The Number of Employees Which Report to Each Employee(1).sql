WITH grouped_table AS (
    SELECT reports_to, COUNT(*) AS reports_count, round(AVG(age)) AS average_age
    FROM Employees
    GROUP BY reports_to
)
SELECT e.employee_id, e.name, g.reports_count, g.average_age
FROM Employees e
INNER JOIN grouped_table g ON e.employee_id = g.reports_to
order by employee_id;
