# 19、按各科成绩进行排序，并显示排名
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
