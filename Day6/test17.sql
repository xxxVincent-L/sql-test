# 按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩

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
