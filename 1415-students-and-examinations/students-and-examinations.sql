# Write your MySQL query statement below
select st.student_id, st.student_name, su.subject_name, (count(ex.subject_name)) as attended_exams
from Subjects su
cross join Students st
left join Examinations ex
    ON su.subject_name = ex.subject_name
   AND st.student_id = ex.student_id
group by st.student_id, st.student_name, su.subject_name
order by st.student_id asc, su.subject_name asc;