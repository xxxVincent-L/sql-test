# 检索"01"课程分数小于60，按分数降序排列的学生信息

SELECT * FROM student
WHERE s_id in
(
SELECT s_id FROM score
WHERE c_id = '01'
AND s_score < 60
ORDER BY s_score DESC
)

# Online version
-- select a.*,b.c_id,b.s_score from 
-- 	student a,score b 
-- 	where a.s_id = b.s_id and b.c_id='01' and b.s_score<60 ORDER BY b.s_score DESC;

# PS: I think that the discription of this problem is aimed to only output the student infomation. 

# My method is using 'in' while online method is using 'a.s_id = b.s_id'