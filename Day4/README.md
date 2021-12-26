
# Day 4 : )

## **Test 10**:

- Description:

  > 查询学过编号为"01"但是没有学过编号为"02"的课程的同学的信息

- Solution:
  ```sql
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
  ```



## **Test 11**:

- Description:

  > 查询没有学全所有课程的同学的信息

- Solution:
  ```sql
  # My version
  SELECT * FROM student
  WHERE s_id in
  (SELECT s_id FROM score
  GROUP BY s_id HAVING count(*) !=3)

  UNION
  SELECT * FROM student
  WHERE s_id not in (SELECT DISTINCT s_id FROM score)

  -- --@wendiepei的写法
  -- select s.* from student s
  -- left join Score s1 on s1.s_id=s.s_id
  -- group by s.s_id having count(s1.c_id)<(select count(*) from course)
  -- --@k1051785839的写法
  -- select *
  -- from student
  -- where s_id not in(
  -- select s_id from score t1
  -- group by s_id having count(*) =(select count(distinct c_id)  from course))


  ```

## **Test 12**:

- Description:

  > 查询至少有一门课与学号为"01"的同学所学相同的同学的信息

- Solution:
  ```sql
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
  ```
