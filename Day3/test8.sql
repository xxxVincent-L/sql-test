# 查询没学过"张三"老师授课的同学的信息 

# My version
SELECT * FROM student
WHERE s_id Not in
(SELECT s_id FROM score 
WHERE c_id in
(SELECT c_id FROM course
WHERE t_id  in
(SELECT t_id FROM teacher
WHERE t_name = '张三'))
)

# Another version
-- select * from 
--     student c 
--     where c.s_id not in(
--         select a.s_id from student a join score b on a.s_id=b.s_id where b.c_id in(
--         select a.c_id from course a join teacher b on a.t_id = b.t_id where t_name ='张三'));
-- 