# Check the student number and student name and average scores of students with average scores greater than or equal to 60
-- SELECT s_id  FROM student,score

# My version
SELECT student.s_id, s_name,a.s FROM student,(SELECT s_id,avg(s_score) as s FROM score

GROUP BY s_id) as a

WHERE a.s>60

AND student.s_id = a.s_id

# Another version
-- select b.s_id,b.s_name,ROUND(AVG(a.s_score),2) as avg_score from 
-- 	student b 
-- 	join score a on b.s_id = a.s_id
-- 	GROUP BY b.s_id,b.s_name HAVING avg_score >=60;
