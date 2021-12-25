# 查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息
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