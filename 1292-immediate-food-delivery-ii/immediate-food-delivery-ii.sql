# Write your MySQL query statement below
with first_orders as (
    select 
        delivery_id, 
        customer_id, 
        order_date, 
        customer_pref_delivery_date, 
        row_number() over(partition by customer_id order by order_date) as order_rank 
    from Delivery)

select round(sum(order_date=customer_pref_delivery_date)*100 / count(delivery_id),2) as immediate_percentage
from first_orders
where order_rank=1;