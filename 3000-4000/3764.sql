/* Write your T-SQL query statement below */



with cte as (
select  user_id ,course_name as first_course  ,count(*)over (partition by user_id  )as cnt ,avg(course_rating*1.00) over(partition by user_id) as average ,
lead(course_name) over (partition by user_id order by completion_date asc) as second_course    
from course_completions 
)


select first_course ,second_course ,count(*) as transition_count 
from cte 
where cnt >4 and average>=4 and second_course is not null 
group by  first_course ,second_course  
order by transition_count desc ,first_course asc ,second_course asc 
