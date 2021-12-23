# Check the **information and course scores** of students with lower grades in "01" courses than in "02" courses.
SELECT * FROM student NATURAL JOIN(SELECT a.s_id,a.s_score as score1,b.s_score as score2 FROM (SELECT s_id, s_score FROM score WHERE score.c_id="01")as a ,(SELECT s_id, s_score FROM score WHERE score.c_id="02")as b
WHERE a.s_id = b.s_id
AND a.s_score < b.s_score) as t