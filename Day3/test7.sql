# 查询学过"张三"老师授课的同学的信息

# My version
SELECT * FROM student
WHERE s_id in
(SELECT s_id FROM score 
WHERE c_id in
(SELECT c_id FROM course
WHERE t_id  in
(SELECT t_id FROM teacher
WHERE t_name = '张三'))
)

# Another version
-- select a.* from 
-- 	student a 
-- 	join score b on a.s_id=b.s_id where b.c_id in(
-- 		select c_id from course where t_id =(
-- 			select t_id from teacher where t_name = '张三'));

# 1. Remember if you accomplish a part, put a ()

# 2. The essence of this two is the same, just I donot use the 'join'.