# 查询"李"姓老师的数量 
SELECT count(*) AS Number 
FROM teacher
WHERE t_name LIKE '李%'