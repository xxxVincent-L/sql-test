# 查询没有学全所有课程的同学的信息 

# My version
SELECT * FROM student
WHERE s_id in
(SELECT s_id FROM score
GROUP BY s_id HAVING count(*) !=3)

UNION 
SELECT * FROM student
WHERE s_id not in (SELECT DISTINCT s_id FROM score)

-- --@wendiepei的写法
-- select s.* from student s 
-- left join Score s1 on s1.s_id=s.s_id
-- group by s.s_id having count(s1.c_id)<(select count(*) from course)	
-- --@k1051785839的写法
-- select *
-- from student
-- where s_id not in(
-- select s_id from score t1  
-- group by s_id having count(*) =(select count(distinct c_id)  from course)) 
