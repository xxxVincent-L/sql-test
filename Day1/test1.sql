-- Check the information and course scores of students with higher grades in "01" courses than in "02" courses.

# Right Solution
SELECT * FROM student NATURAL JOIN(SELECT a.s_id,a.s_score as score1,b.s_score as score2 FROM (SELECT s_id, s_score FROM score WHERE score.c_id="01")as a ,(SELECT s_id, s_score FROM score WHERE score.c_id="02")as b
WHERE a.s_id = b.s_id
AND a.s_score > b.s_score) as t

# THis one stuck me in....
-- SELECT * FROM student
-- WHERE s_id in (SELECT a.s_id FROM (SELECT s_id, s_score FROM score WHERE score.c_id="01")as a ,(SELECT s_id, s_score FROM score WHERE score.c_id="02")as b
-- WHERE a.s_id = b.s_id
-- AND a.s_score > b.s_score)
-- 