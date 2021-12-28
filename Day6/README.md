
# Day 5 : )

## **Test 13**:

- Description:

  > 查询和"01"号的同学学习的课程完全相同的其他同学的信息

- Solution:
  ```sql

  ```



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
