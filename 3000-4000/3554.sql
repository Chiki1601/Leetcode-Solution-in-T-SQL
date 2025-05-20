/* Write your T-SQL query statement below */

select pi1.category as category1,
pi2.category as category2,
count(distinct pp1.user_id) as customer_count
from ProductPurchases pp1,
ProductPurchases pp2,
ProductInfo pi1,
ProductInfo pi2
where pp1.user_id = pp2.user_id
and pi1.category < pi2.category
and pp1.product_id = pi1.product_id
and pp2.product_id = pi2.product_id
group by pi1.category,
pi2.category
having count(distinct pp1.user_id) >= 3
order by 3 desc, 1, 2
