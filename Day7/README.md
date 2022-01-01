
# Day 7 : )

## **Test 19**:

- Description:

  > 按各科成绩进行排序，并显示排名

- Solution:
  ```sql
  -- -- mysql没有rank函数
  -- 	select a.s_id,a.c_id,
  --         @i:=@i +1 as i保留排名,
  --         @k:=(case when @score=a.s_score then @k else @i end) as rank不保留排名,
  --         @score:=a.s_score as score
  --     from (
  --         select s_id,c_id,s_score from score GROUP BY s_id,c_id,s_score ORDER BY s_score DESC
  -- )a,(select @k:=0,@i:=0,@score:=0)s
  -- --@k1051785839的写法
  (select * from (select
  t1.c_id,
  t1.s_score,
  (select count(distinct t2.s_score) from score t2 where t2.s_score>=t1.s_score and t2.c_id='01') rank
  FROM score t1 where t1.c_id='01'
  order by t1.s_score desc) t1)
  union
  (select * from (select
  t1.c_id,
  t1.s_score,
  (select count(distinct t2.s_score) from score t2 where t2.s_score>=t1.s_score and t2.c_id='02') rank
  FROM score t1 where t1.c_id='02'
  order by t1.s_score desc) t2)
  union
  (select * from (select
  t1.c_id,
  t1.s_score,
  (select count(distinct t2.s_score) from score t2 where t2.s_score>=t1.s_score and t2.c_id='03') rank
  FROM score t1 where t1.c_id='03'
  order by t1.s_score desc) t3)

  ```



## **Test 20**:

- Description:

  > 查询学生的总成绩并进行排名

- Solution:
  ```sql
  -- select a.s_id,
  -- 	@i:=@i+1 as i,
  -- 	@k:=(case when @score=a.sum_score then @k else @i end) as rank,
  -- 	@score:=a.sum_score as score
  -- from (select s_id,SUM(s_score) as sum_score from score GROUP BY s_id ORDER BY sum_score DESC)a,
  -- 	(select @k:=0,@i:=0,@score:=0)s
  --
  -- SELECT score.s_id,count(distinct score.s_score),SUM(s_score) as s_sum
  FROM score,(SELECT s_id,SUM(s_score) as s_sum FROM score
  GROUP BY s_id
  ORDER BY s_sum desc) t1
  -- WHERE t1.s_id = score.s_id
  -- AND  > t1.s_sum

  ```
  > This one is to be done cause the 'rank'-related things.

## **Test 21**:

- Description:

  > 查询不同老师所教不同课程平均分从高到低显示

- Solution:
  ```sql
  # My version
  SELECT teacher.t_name,score.c_id, AVG(s_score) as avg_s FROM score, course, teacher
  WHERE  course.c_id = score.c_id
  AND course.t_id = teacher.t_id
  GROUP BY c_id
  ORDER BY avg_s DESC

  # ONLINE version
  -- 	select a.t_id,c.t_name,a.c_id,ROUND(avg(s_score),2) as avg_score from course a
  -- 		left join score b on a.c_id=b.c_id
  -- 		left join teacher c on a.t_id=c.t_id
  -- 		GROUP BY a.c_id,a.t_id,c.t_name ORDER BY avg_score DESC;

  ```

