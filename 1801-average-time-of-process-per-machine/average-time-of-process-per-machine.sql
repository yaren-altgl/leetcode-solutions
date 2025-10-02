# Write your MySQL query statement below
with per_process as(
    select starts.machine_id, starts.process_id,
    ( ends.timestamp - starts.timestamp ) AS proc_time
    from Activity as starts
    join Activity as ends
    on starts.machine_id=ends.machine_id and starts.process_id=ends.process_id
    where starts.activity_type="start" and ends.activity_type="end")
select machine_id,
round(avg(proc_time),3 ) AS processing_time
from per_process
group by machine_id;