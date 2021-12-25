
# Day 3 : )

## **Test 7**:

- Description:

  > 查询学过"张三"老师授课的同学的信息

- Solution:
  ```sql
  # My version
  SELECT * FROM student
  WHERE s_id in
  (SELECT s_id FROM score
  WHERE c_id in
  (SELECT c_id FROM course
  WHERE t_id  in
  (SELECT t_id FROM teacher
  WHERE t_name = '张三'))
  )

  # Another version
  -- select a.* from
  -- 	student a
  -- 	join score b on a.s_id=b.s_id where b.c_id in(
  -- 		select c_id from course where t_id =(
  -- 			select t_id from teacher where t_name = '张三'));

  # 1. Remember if you accomplish a part, put a ()

  # 2. The essence of this two is the same, just I donot use the 'join'.
  ```



## **Test 8**:

- Description:

  > 查询没学过"张三"老师授课的同学的信息

- Solution:
  ```sql
  # My version
  SELECT * FROM student
  WHERE s_id Not in
  (SELECT s_id FROM score
  WHERE c_id in
  (SELECT c_id FROM course
  WHERE t_id  in
  (SELECT t_id FROM teacher
  WHERE t_name = '张三'))
  )

  # Another version
  -- select * from
  --     student c
  --     where c.s_id not in(
  --         select a.s_id from student a join score b on a.s_id=b.s_id where b.c_id in(
  --         select a.c_id from course a join teacher b on a.t_id = b.t_id where t_name ='张三'));


  ```

## **Test 9**:

- Description:

  > 查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息

- Solution:
  ```sql
  SELECT * FROM student NATURAL JOIN
  (SELECT s_id FROM score
  WHERE c_id = '01' ) as a NATURAL JOIN
  (SELECT s_id FROM score
  WHERE c_id = '02' ) as b
  WHERE
  a.s_id = b.s_id
  AND student.s_id = a.s_id
  --

  # Another VERSION
  -- select a.* from
  -- 	student a,score b,score c
  -- 	where a.s_id = b.s_id  and a.s_id = c.s_id and b.c_id='01' and c.c_id='02';


  # Another VERSION()
  -- select st.* from student st
  -- inner join score sc on sc.s_id = st.s_id
  -- inner join course c on c.c_id=sc.c_id and c.c_id="01"
  -- where st.s_id in (
  -- select st2.s_id from student st2
  -- inner join score sc2 on sc2.s_id = st2.s_id
  -- inner join course c2 on c2.c_id=sc2.c_id and c2.c_id="02"
  )
  ```
