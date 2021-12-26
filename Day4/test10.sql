# 查询学过编号为"01"但是没有学过编号为"02"的课程的同学的信息

# My version
SELECT  * FROM student 
WHERE s_id in
  (SELECT s_id FROM score
  WHERE c_id = '01' ) 
AND s_id Not in
  (SELECT s_id FROM score
  WHERE c_id = '02' ) 

# 1. The use scope of "In"
# 2. check the table that you wanna query from whether contains your ideal parameters.

  # Another VERSION
-- select a.* from 
-- 	student a 
-- 	where a.s_id in (select s_id from score where c_id='01' ) and a.s_id not in(select s_id from score where c_id='02')