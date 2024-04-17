/* Write your T-SQL query statement below */
with cte as
(SELECT s.student_id,
       s.student_name,
       sb.subject_name,
       CASE WHEN e.subject_name = sb.subject_name THEN 1 ELSE 0 END AS attended
FROM Students s
CROSS JOIN Subjects sb
LEFT JOIN Examinations e ON s.student_id = e.student_id)

select student_id, student_name, subject_name, sum(attended) attended_exams
from cte
GROUP BY student_id, student_name, subject_name;
