# Write your MySQL query statement below
with odd as (select id, movie, description, rating
from Cinema
where id%2=1)

select id, movie, description, rating
from odd
where description != "boring"
order by rating desc;