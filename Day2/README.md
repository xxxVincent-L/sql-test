
# Day 2 : )

## **Test 4**:

- Description:

  > 查询平均成绩小于60分的同学的学生编号和学生姓名和平均成绩 (包括有成绩的和无成绩的)

- Solution:
  ```sql
  # My version:
  SELECT student.s_id,student.s_name,t.s FROM student, (SELECT s_id, ROUND(AVG(s_score),1) as s FROM score
  GROUP BY s_id) as t
  WHERE student.s_id = t.s_id
  AND t.s <60
  UNION
  SELECT student.s_id, student.s_name, 0 as s FROM student
  WHERE s_id in
  (SELECT s_id FROM student
  WHERE s_id NOT in (SELECT DISTINCT s_id FROM score))

  # Online solution
  -- select b.s_id,b.s_name,ROUND(AVG(a.s_score),2) as avg_score from
  -- 	student b
  -- 	left join score a on b.s_id = a.s_id
  -- 	GROUP BY b.s_id,b.s_name HAVING avg_score <60
  -- 	union
  -- select a.s_id,a.s_name,0 as avg_score from
  -- 	student a
  -- 	where a.s_id not in (
  -- 				select distinct s_id from score);
  --
  ```



## **Test 5**:

- Description:

  > 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩

- Solution:
  ```sql
  # My version
  SELECT student.s_id, student.s_name, t.csum, t.ssum FROM student,
  (SELECT count(*) as csum, SUM(s_score) as ssum,s_id
  FROM score
  GROUP BY s_id) as t
  WHERE student.s_id = t.s_id
  UNION
  SELECT student.s_id, student.s_name, 0 as csum, NULL as ssum FROM student
  WHERE s_id in
  (SELECT s_id FROM student
  WHERE s_id NOT in (SELECT DISTINCT s_id FROM score))


  # ONLINE VERSION
  -- select a.s_id,a.s_name,count(b.c_id) as sum_course,sum(b.s_score) as sum_score from
  -- 	student a
  -- 	left join score b on a.s_id=b.s_id
  -- 	GROUP BY a.s_id,a.s_name;

  ```

## **Test 6**:

- Description:

  > 查询"李"姓老师的数量

- Solution:
  ```sql
  SELECT count(*) AS Number
  FROM teacher
  WHERE t_name LIKE '李%'
  ```
