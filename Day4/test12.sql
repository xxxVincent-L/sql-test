# 查询至少有一门课与学号为"01"的同学所学相同的同学的信息 

# My version
SELECT * FROM student
WHERE s_id in 
(SELECT s_id from score
WHERE c_id in
(SELECT c_id FROM score
WHERE s_id = '01')
)


# Another version
-- select * from student where s_id in(
-- 	select distinct a.s_id from score a where a.c_id in(select a.c_id from score a where a.s_id='01')
-- 	);
-- 