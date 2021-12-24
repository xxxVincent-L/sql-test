-- 4、查询平均成绩小于60分的同学的学生编号和学生姓名和平均成绩
-- (包括有成绩的和无成绩的)

# My version:
SELECT student.s_id,student.s_name,t.s FROM student, (SELECT s_id, ROUND(AVG(s_score),1) as s FROM score
GROUP BY s_id) as t
WHERE student.s_id = t.s_id
AND t.s <60
UNION
SELECT student.s_id, student.s_name, 0 as s FROM student
WHERE s_id in
(SELECT s_id FROM student
WHERE s_id NOT in (SELECT DISTINCT s_id FROM score))

# Online solution
-- select b.s_id,b.s_name,ROUND(AVG(a.s_score),2) as avg_score from 
-- 	student b 
-- 	left join score a on b.s_id = a.s_id
-- 	GROUP BY b.s_id,b.s_name HAVING avg_score <60
-- 	union
-- select a.s_id,a.s_name,0 as avg_score from 
-- 	student a 
-- 	where a.s_id not in (
-- 				select distinct s_id from score);
-- 
