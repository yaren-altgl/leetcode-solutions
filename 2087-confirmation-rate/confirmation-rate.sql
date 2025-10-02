# Write your MySQL query statement below
with count_table as (select s.user_id, c.action
    from Signups s
    left join Confirmations c
    on s.user_id=c.user_id)
select user_id, round(coalesce(confirmeds,0)/total,2) as confirmation_rate
from (select user_id, count(user_id) as total, sum(action="confirmed") as confirmeds
    from count_table
    group by user_id) other_table;