
# Day 1 : )

## **Test 1**:

- Description:

  > Check the **information and course scores** of students with higher grades in "01" courses than in "02" courses.

- Solution:
  ```sql
  SELECT * FROM student NATURAL JOIN
  (
    SELECT a.s_id,a.s_score as score1,b.s_score as score2
  FROM
  (SELECT s_id, s_score FROM score WHERE score.c_id="01")as a ,
  (SELECT s_id, s_score FROM score WHERE score.c_id="02")as b
  WHERE a.s_id = b.s_id
  AND a.s_score > b.s_score
  ) as t
  ```



## **Test 2**:

- Description:

  > Check the **information and course scores** of students with lower grades in "01" courses than in "02" courses.

- Solution:
  ```sql
  SELECT * FROM student NATURAL JOIN
  (SELECT a.s_id,a.s_score as score1,b.s_score as score2
  FROM (SELECT s_id, s_score FROM score WHERE score.c_id="01")as a ,
  (SELECT s_id, s_score FROM score WHERE score.c_id="02")as b
  WHERE a.s_id = b.s_id
  AND a.s_score < b.s_score) as t
  ```

## **Test 3**:

- Description:

  > Check the **student id and student name and average scores** of students with average scores greater than or equal to 60

- Solution:
  ```sql
    # My version
  SELECT student.s_id, s_name,a.s FROM student,
  (SELECT s_id,avg(s_score) as s FROM score GROUP BY s_id) as a

  WHERE a.s>60

  AND student.s_id = a.s_id

  # Another version
  -- select b.s_id,b.s_name,ROUND(AVG(a.s_score),2) as avg_score from
  -- 	student b
  -- 	join score a on b.s_id = a.s_id
  -- 	GROUP BY b.s_id,b.s_name HAVING avg_score >=60;

  ```
