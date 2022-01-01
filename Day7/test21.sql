-- 21、查询不同老师所教不同课程平均分从高到低显示 
-- -- 		

# My version
SELECT teacher.t_name,score.c_id, AVG(s_score) as avg_s FROM score, course, teacher
WHERE  course.c_id = score.c_id
AND course.t_id = teacher.t_id
GROUP BY c_id 
ORDER BY avg_s DESC

# ONLINE version
-- 	select a.t_id,c.t_name,a.c_id,ROUND(avg(s_score),2) as avg_score from course a
-- 		left join score b on a.c_id=b.c_id 
-- 		left join teacher c on a.t_id=c.t_id
-- 		GROUP BY a.c_id,a.t_id,c.t_name ORDER BY avg_score DESC;