# Write your MySQL query statement below
with final as (select p.product_id, us.units, p.price
from Prices as p
left join UnitsSold as us
on purchase_date BETWEEN start_date AND end_date and us.product_id=p.product_id)

select product_id, ifnull(round(sum(price*units)/sum(units),2),0) as average_price
from final
group by product_id;
