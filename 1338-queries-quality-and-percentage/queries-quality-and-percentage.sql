# Write your MySQL query statement below
select
query_name,
round(sum((rating/position)) / count(distinct result), 2) as quality,
round(count(case when rating<3 then 1 end) * 100 / count(distinct result),2) as poor_query_percentage
from Queries
group by query_name;