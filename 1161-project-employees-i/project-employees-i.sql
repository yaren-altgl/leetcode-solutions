# Write your MySQL query statement below
with final as (select p.project_id, e.experience_years
from Project p
left join Employee e
on p.employee_id=e.employee_id)

select round(avg(experience_years),2) as average_years, project_id
from final
group by project_id;