# 查询没学过"张三"老师讲授的任一门课程的学生姓名

# My version
SELECT s_name from student
WHERE s_id not in
(SELECT s_id from score
WHERE c_id in
(SELECT c_id FROM course
WHERE t_id in
(SELECT t_id FROM teacher
WHERE t_name = '张三')
)
)

# Another version
-- select a.s_name from student a where a.s_id not in (
-- 	select s_id from score where c_id = 
-- 				(select c_id from course where t_id =(
-- 					select t_id from teacher where t_name = '张三')));
