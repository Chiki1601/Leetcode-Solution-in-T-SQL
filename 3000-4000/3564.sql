/* Write your T-SQL query statement below */
with cte as (
select * ,case when month(sale_date) in(12,1,2) then 'Winter'
               when  month(sale_date) in(3,4,5) then 'Spring'
               when  month(sale_date) in(6,7,8) then 'Summer'
               else 'Fall' end as season
from sales )

select  season,category, total_quantity ,total_revenue 
from(
select  season,category,sum(quantity) as total_quantity ,sum(quantity*price) as total_revenue
,dense_rank() over (partition by season order by sum(quantity)desc ,sum(quantity*price) desc) rk
from cte c inner join products p 
on c.product_id =p.product_id 
group by season ,category)t 
where t.rk=1
order by season asc
