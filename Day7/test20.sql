-- -- 20、查询学生的总成绩并进行排名
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
