# Write your MySQL query statement below
with first_day as(
    select player_id, min(event_date) as event_date
    from Activity
    group by player_id
),
came_next_day as(
    select f.player_id
    from first_day f
    join Activity a
    on f.player_id=a.player_id 
    and a.event_date=f.event_date + interval 1 day
)
select
    round((select count(*) from came_next_day)/(select count(*) from first_day),2) as fraction;