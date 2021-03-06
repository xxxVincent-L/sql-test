
# Day 5 : )

## **Test 13**:

> Fail -> Out of time limit   : (
- Description:

  > 查询和"01"号的同学学习的课程完全相同的其他同学的信息

- Solution:
  ```sql

  --@ouyang_1993的写法
  SELECT
  Student.*
  FROM
  Student
  WHERE
  s_id IN (SELECT s_id FROM Score GROUP BY s_id HAVING COUNT(s_id) = (
      #下面的语句是找到'01'同学学习的课程数
      SELECT COUNT(c_id) FROM Score WHERE s_id = '01'
    )
  )
  AND s_id NOT IN (
  #下面的语句是找到学过‘01’同学没学过的课程，有哪些同学。并排除他们
  SELECT s_id FROM Score
  WHERE c_id IN(
    #下面的语句是找到‘01’同学没学过的课程
    SELECT DISTINCT c_id FROM Score
    WHERE c_id NOT IN (
      #下面的语句是找出‘01’同学学习的课程
      SELECT c_id FROM Score WHERE s_id = '01'
      )
    ) GROUP BY s_id
  ) #下面的条件是排除01同学
  AND s_id NOT IN ('01')
  --@k1051785839的写法
  SELECT
  t3.*
  FROM
  (
    SELECT
    s_id,
    group_concat(c_id ORDER BY c_id) group1
    FROM
    score
    WHERE
    s_id &lt;> '01'
    GROUP BY
    s_id
  ) t1
  INNER JOIN (
  SELECT
    group_concat(c_id ORDER BY c_id) group2
  FROM
    score
  WHERE
    s_id = '01'
  GROUP BY
    s_id
  ) t2 ON t1.group1 = t2.group2
  INNER JOIN student t3 ON t1.s_id = t3.s_id

  ```
  > The first one is easier to understand.


## **Test 14**:

- Description:

  > 查询没学过"张三"老师讲授的任一门课程的学生姓名

- Solution:
  ```sql

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
  ```

## **Test 15**:

- Description:

  > 查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩

- Solution:
  ```sql
  # My version
  SELECT student.s_id,student.s_name,t.a_score FROM student NATURAL JOIN
  (SELECT s_id , ROUND(AVG(s_score), 1) as a_score,count(*) as num from score
  WHERE s_score < 60
  GROUP BY s_id HAVING num >= 2) as t

  # 先想能不能调整select的个数
  -- SELECT s_id ,count(*) as num from score
  -- WHERE s_score < 60
  -- -- GROUP BY s_id HAVING num >= 2

  # Another version
  -- select a.s_id,a.s_name,ROUND(AVG(b.s_score)) from
  -- 	student a
  -- 	left join score b on a.s_id = b.s_id
  -- 	where a.s_id in(
  -- 			select s_id from score where s_score<60 GROUP BY  s_id having count(1)>=2)
  -- 	GROUP BY a.s_id,a.s_name

  ```
