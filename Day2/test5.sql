# 5. 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩

SELECT student.s_id, student.s_name, t.csum, t.ssum FROM student,
(SELECT count(*) as csum, SUM(s_score) as ssum,s_id
FROM score 
GROUP BY s_id) as t
WHERE student.s_id = t.s_id
UNION
SELECT student.s_id, student.s_name, 0 as csum, NULL as ssum FROM student
WHERE s_id in
(SELECT s_id FROM student
WHERE s_id NOT in (SELECT DISTINCT s_id FROM score))


# ONLINE VERSION
-- select a.s_id,a.s_name,count(b.c_id) as sum_course,sum(b.s_score) as sum_score from 
-- 	student a 
-- 	left join score b on a.s_id=b.s_id
-- 	GROUP BY a.s_id,a.s_name;
