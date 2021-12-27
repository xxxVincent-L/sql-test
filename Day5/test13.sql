# 查询和"01"号的同学学习的课程完全相同的其他同学的信息
SELECT * FROM student
WHERE
(SELECT c_id FROM score
WHERE s_id = '01')