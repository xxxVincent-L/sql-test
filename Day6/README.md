
# Day 6 : )

## **Test 16**:

- Description:

  > 检索"01"课程分数小于60，按分数降序排列的学生信息

- Solution:
  ```sql

  SELECT * FROM student
  WHERE s_id in
  (
  SELECT s_id FROM score
  WHERE c_id = '01'
  AND s_score < 60
  ORDER BY s_score DESC
  )

  # Online version
  -- select a.*,b.c_id,b.s_score from
  -- 	student a,score b
  -- 	where a.s_id = b.s_id and b.c_id='01' and b.s_score<60 ORDER BY b.s_score DESC;

  # PS: I think that the discription of this problem is aimed to only output the student infomation.

  # My method is using 'in' while online method is using 'a.s_id = b.s_id'
  ```



## **Test 17**:

- Description:

  > 按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩

- Solution:
  ```sql
  # My version
  SELECT
  (select s_score from score where s_id=a.s_id and c_id='01') as Class1,
  (select s_score from score where s_id=a.s_id and c_id='02') as Class2,
  (select s_score from score where s_id=a.s_id and c_id='03') as Class3,
  AVG(s_score) as a_score
  FROM score as a
  GROUP BY s_id
  ORDER BY s_score desc

  # Online version
  -- select a.s_id,(select s_score from score where s_id=a.s_id and c_id='01') as 语文,
  -- 				(select s_score from score where s_id=a.s_id and c_id='02') as 数学,
  -- 				(select s_score from score where s_id=a.s_id and c_id='03') as 英语,
  -- 			round(avg(s_score),2) as 平均分 from score a  GROUP BY a.s_id ORDER BY 平均分 DESC;
  # Another version
  -- @喝完这杯还有一箱的写法
  -- SELECT a.s_id,MAX(CASE a.c_id WHEN '01' THEN a.s_score END ) 语文,
  -- MAX(CASE a.c_id WHEN '02' THEN a.s_score END ) 数学,
  -- MAX(CASE a.c_id WHEN '03' THEN a.s_score END ) 英语,
  -- avg(a.s_score),b.s_name FROM Score a JOIN Student b ON a.s_id=b.s_id GROUP BY a.s_id ORDER BY 5 DESC

  ```

## **Test 18**:

- Description:

  > -- 查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率(及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90)

- Solution:
  ```sql

  select a.c_id,b.c_name,MAX(s_score),MIN(s_score),ROUND(AVG(s_score),2),
      (ROUND(100*(SUM(case when a.s_score>=60 then 1 else 0 end)/SUM(case when a.s_score then 1 else 0 end)),2) as 及格率,
    ROUND(100*(SUM(case when a.s_score>=70 and a.s_score<=80 then 1 else 0 end)/SUM(case when a.s_score then 1 else 0 end)),2) as 中等率,
    ROUND(100*(SUM(case when a.s_score>=80 and a.s_score<=90 then 1 else 0 end)/SUM(case when a.s_score then 1 else 0 end)),2) as 优良率,
    ROUND(100*(SUM(case when a.s_score>=90 then 1 else 0 end)/SUM(case when a.s_score then 1 else 0 end)),2) as 优秀率
    from score a left join course b on a.c_id = b.c_id GROUP BY a.c_id,b.c_name
  --
  ```
  > 这个我偷懒了...
