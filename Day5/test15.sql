# 查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩 

# My version
SELECT student.s_id,student.s_name,t.a_score FROM student NATURAL JOIN
(SELECT s_id , ROUND(AVG(s_score), 1) as a_score,count(*) as num from score
WHERE s_score < 60
GROUP BY s_id HAVING num >= 2) as t

# 先想能不能调整select的个数
-- SELECT s_id ,count(*) as num from score
-- WHERE s_score < 60
-- -- GROUP BY s_id HAVING num >= 2

# Another version
-- select a.s_id,a.s_name,ROUND(AVG(b.s_score)) from 
-- 	student a 
-- 	left join score b on a.s_id = b.s_id
-- 	where a.s_id in(
-- 			select s_id from score where s_score<60 GROUP BY  s_id having count(1)>=2)
-- 	GROUP BY a.s_id,a.s_name
