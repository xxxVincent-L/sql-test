# 查询和"01"号的同学学习的课程完全相同的其他同学的信息
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
