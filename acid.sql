-- provide test results here
with testresults as (
  
<<<<<<< HEAD
select 1 as test, result from (   select case when queryresult = 11 then 'T' else 'F' end as result from (   select sum(x) as queryresult from (values(1),(2),(4),(8),(NULL)) s(x) where exists(select * from (values(2),(8)) t(y) where x=y) or (x<3)  ) test ) testcase(result) UNION ALL select 2 as test, result from (  SELECT case when CAST (4.8 AS INTEGER) = 5 AND CAST(4.2 AS INTEGER) = 4 then 'T' else 'F' end as result ) testcase(result) UNION ALL select 3 as test, result from (   select case when (r1=5) and (r2=40) then 'T' else 'F' end as result from (   select sum(case when m then i else 0 end) as r1, sum(case when m is null then i else 0 end) r2 from ( select i, x=some(select a from (values(1,1),(2,2),(3,3),(4,4),(NULL,5)) t(a,b) where b<y) as m from (values(1,4,1),(2,2,2),(4,6,4),(8,8,8),(NULL,0,16),(NULL,8,32)) s(x,y,i) ) s  ) test ) testcase(result) UNION ALL select 4 as test, result from (  SELECT case when '' IS NOT NULL then 'T' else 'F' end AS result ) testcase(result) UNION ALL select 5 as test, result from (   select case when count(x)=8 then 'T' else 'F' end as result from ( (values(1,NULL,2),(1,NULL,3),(2,1,NULL),(2,NULL,2),(2,NULL,3),(3,1,NULL),(3,2,2),(3,NULL,3)) expected(a,b,c) left outer join (    select * from (values(1),(2),(3)) s(x), lateral (select * from (select * from (values(1),(2)) a(y) where y<x) a full outer join (values(2),(3)) b(z) on y=z) t   ) t on a is not distinct from x and b is not distinct from y and c is not distinct from z ) test ) testcase(result) UNION ALL select 6 as test, result from (   select case when s*10000000000000000 = 100000000000000 then 'T' else 'F' end as result from (    select sum(x)/10 as s from (values(0.2),(0.2),(-0.3)) s(x)   ) test ) testcase(result) UNION ALL select 7 as test, result from (   select case when (count(*) = 3) and (count(x) = 3) then 'T' else 'F' end as result from ( (values(2,2),(3,1),(4,1)) expected(a,b) full outer join (    select x, count(*) as c from ((select * from (values(1),(2),(2),(3),(3),(3),(4),(4),(4),(4)) s(x) except all select * from (values(1),(3),(3)) t(x)) intersect all select * from (values(2),(2),(2),(4),(3),(3)) u(x)) s group by x  ) s on (x=a and c=b) ) test ) testcase(result) UNION ALL select 8 as test, result from (   select case when s = 'abcdef' then 'T' else 'F' end as result from (   select 'abc' || 'def'  ) _(s) ) testcase(result) UNION ALL select 9 as test, result from (  SELECT case when 	su = 70003 AND 	mi = 20001 AND 	ma = 30001 AND 	av BETWEEN 23334.3 AND 23334.4 AND 	ct = 3 AND 	cs = 4 AND 	mis = '20001' AND 	mas = '30001' AND 	sd = 50002 AND 	cd = 2 AND 	CAST(ad as INTEGER) = 25001 	then 'T' else 'F' end AS result FROM (  SELECT 	sum(x) as su,  	min(x) as mi,  	max(x) as ma, 	avg(x) as av,  	count(x) as ct,  	count(*) as cs,  	min(CAST (x as VARCHAR)) as mis,  	max(CAST (x as VARCHAR)) as mas, 	sum(distinct x) as sd,  	count(distinct x) as cd, 	avg(distinct x) as ad  FROM (VALUES(CAST(30001 AS SMALLINT)), (CAST(20001 AS SMALLINT)), (CAST(20001 AS SMALLINT)), (NULL)) s(x)  ) test ) testcase(result) UNION ALL select 10 as test, result from (  SELECT case when CAST('123' AS char(4)) =  CAST('123 ' AS char(4))          AND        CAST('123' AS text)    <> CAST('123 ' AS text) then 'T' else 'F' end AS result ) testcase(result) UNION ALL select 11 as test, result from (SELECT case when AVG(x)>0 then 'T' else 'F' end AS result FROM ( 	SELECT CAST(9223372036854775807 AS BIGINT) AS x 	UNION ALL 	SELECT CAST(9223372036854775807 AS BIGINT) ) AS t ) testcase(result) UNION ALL select 12 as test, result from ( SELECT case when (SELECT SUM(x))=42 then 'T' else 'F' end AS result FROM (VALUES (42)) AS t(x) ) testcase(result) UNION ALL select 13 as test, result from (   select case when (state='924875136138624795765391842546713928812469357397582614651238479489157263273946581') then 'T' else 'F' end as result from (    with recursive    digits(value,ch) as (values(1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9')),    sudoku(state, next) as    (select state, position(' ' in state) as next     from (select '9     1 6   62 79   5  1   54     2 81  6935739 5826 46      7   915   32 3 46   ') s(state)    union all    select state, position(' ' in state) as next    from (select substring(state from 1 for next-1) || try || substring(state from next+1) as state          from sudoku, (select ch as try from digits) g          where next > 0 and          not exists(select 1 from (select value as pos from digits) s                     where try = substring(state from cast(floor((next-1)/9) as integer)*9+pos for 1)                     or    try = substring(state from mod((next-1),9)+9*pos-8 for 1)                     or    try = substring(state from mod(cast(floor((next-1)/3) as integer),3)*3+cast(floor((next-1)/27) as integer)*27+pos+cast(floor((pos-1)/3) as integer)*6 for 1))         ) c) select state from sudoku where next=0  ) test ) testcase(result) UNION ALL select 14 as test, result from ( select case when ( 	 	(1+2*3) = (1+(2*3)) and  	 	(2-3/4) = (2-(3/4)) and  	 	(2/3/3) = ((2/3)/3) and 	(2/3*3) = ((2/3)*3) and  	 	(1+2 < 2+2) = ((1+2) < (2+2))  and 	(1+2 <= 1+2) = ((1+2) <= (1+2))  and 	(2+2 > 1+2) = ((2+2) > (1+2))  and 	(2+2 >= 1+2) = ((2+2) >= (1+2))  and 	(2+2 <> 1+2) = ((2+2) <> (1+2))	and  	 	(2 between 2-1 and 2+1) and 	(2 + 3 in (3+2)) and  	 	(not true or true) = ((not true) or true) ) then 'T' else 'F' end as result ) testcase(result) UNION ALL select 15 as test, result from ( SELECT case when     NULL OR x>0     AND     NOT (NULL AND x<0) then 'T' else 'F' end AS result FROM (VALUES (42)) AS t(x) ) testcase(result) UNION ALL select index as test, 'T' as result from generate_series(16,260) s(index) 
=======
-- check that the engine handles existential queries in disjunctions

-- result header
select 1 as test, queryresult = 11 as result
from (

-- the query itself
select sum(x) as queryresult
from (values(1),(2),(4),(8),(NULL)) s(x)
where exists(select * from (values(2),(8)) t(y) where x=y) or (x<3)

) test
UNION ALL
-- test that casting to integer rounds and does not truncate

SELECT 2 as test, CAST (4.8 AS INTEGER) = 5 AND CAST(4.2 AS INTEGER) = 4 as result
UNION ALL
-- check that that quantified expressions return NULL values as needed

-- result header
select 3 as test, (r1=5) and (r2=40) as result
from (

-- the query itself
select sum(case when m then i else 0 end) as r1, sum(case when m is null then i else 0 end) r2
from (
select i, x=some(select a from (values(1,1),(2,2),(3,3),(4,4),(NULL,5)) t(a,b) where b<y) as m
from (values(1,4,1),(2,2,2),(4,6,4),(8,8,8),(NULL,0,16),(NULL,8,32)) s(x,y,i)
) s

) test
UNION ALL
-- a string may be empty but that doesn't make it NULL

SELECT 4 AS test, '' IS NOT NULL AS result
UNION ALL
-- check that full outer joins are decorrelated correctly

-- result header
select 5 as test, count(x)=8 as result
from (
(values(1,NULL,2),(1,NULL,3),(2,1,NULL),(2,NULL,2),(2,NULL,3),(3,1,NULL),(3,2,2),(3,NULL,3)) expected(a,b,c)
left outer join (


-- the query itself
select * from (values(1),(2),(3)) s(x), lateral (select * from (select * from (values(1),(2)) a(y) where y<x) a full outer join (values(2),(3)) b(z) on y=z) t


) t on a is not distinct from x and b is not distinct from y and c is not distinct from z
) test
UNION ALL
-- check that decimal number behave sane

-- result header
select 6 as test, s*10000000000000000 = 100000000000000 as result
from (


-- the query itself
select sum(x)/10 as s from (values(0.2),(0.2),(-0.3)) s(x)


) test
UNION ALL
-- check that multi set operations are supported

-- result header
select 7 as test, (count(*) = 3) and (count(x) = 3) as result
from (
(values(2,2),(3,1),(4,1)) expected(a,b)
full outer join (


-- the query itself
select x, count(*) as c
from ((select * from (values(1),(2),(2),(3),(3),(3),(4),(4),(4),(4)) s(x) except all select * from (values(1),(3),(3)) t(x)) intersect all select * from (values(2),(2),(2),(4),(3),(3)) u(x)) s
group by x

) s on (x=a and c=b)
) test
UNION ALL
-- check that || is actually the string concat operator...

-- result header
select 8 as test, s = 'abcdef' as result
from (

-- the query itself
select 'abc' || 'def'

) somealias(s)
UNION ALL
-- check aggregate behavior
-- result header
SELECT 9 AS test,
	su = 70003 AND
	mi = 20001 AND
	ma = 30001 AND
	av BETWEEN 23334.3 AND 23334.4 AND
	ct = 3 AND
	cs = 4 AND
	mis = '20001' AND
	mas = '30001' AND
	sd = 50002 AND
	cd = 2 AND
	CAST(ad as INTEGER) = 25001
	 AS result
FROM (

SELECT 
	sum(x) as su, -- this should not overflow nor throw an error
	min(x) as mi, -- those two should just work
	max(x) as ma,
	avg(x) as av, -- should not be an integer average
	count(x) as ct, -- NULL should be excluded here
	count(*) as cs, -- NULL should be included here
	min(CAST (x as VARCHAR)) as mis, -- min/max should work on strings
	max(CAST (x as VARCHAR)) as mas,
	sum(distinct x) as sd, -- distinct aggregates should work
	count(distinct x) as cd,
	avg(distinct x) as ad

FROM (VALUES(CAST(30001 AS SMALLINT)), (CAST(20001 AS SMALLINT)), (CAST(20001 AS SMALLINT)), (NULL)) s(x)

) test
UNION ALL
-- check for the space-padding semantics of type char(n)

SELECT 10 AS test,
       CAST('123' AS char(4)) =  CAST('123 ' AS char(4))
         AND
       CAST('123' AS text)    <> CAST('123 ' AS text) AS result
UNION ALL
SELECT 11 AS test, AVG(x)>0 AS result
FROM (
	SELECT CAST(9223372036854775807 AS BIGINT) AS x
	UNION ALL
	SELECT CAST(9223372036854775807 AS BIGINT)
) AS t
UNION ALL
select index as test, true as result from generate_series(12,260) s(index) 
>>>>>>> 78334bb (fixacid)
)
-- render the result
select case when state = 1048575 then image else 'XXXXXXXXXXXXXXXXXXXX' end as output from (values
(0, '+-----------------+'),
(1, '|......#####......|'),
(2, '|....##.....##....|'),
(3, '|...#.........#...|'),
(4, '|..#..()...()..#..|'),
(5, '|..#.....o.....#..|'),
(6, '|.#.............#.|'),
(7, '|..#..\...../..#..|'),
(8, '|..#...-----...#..|'),
(9, '|...#.........#...|'),
(10,'|....##.....##....|'),
(11,'|......#####......|'),
(12,'+-----------------+')
) image(line, image) left outer join (
select line, sum(cast(power(2,ofs) as integer)) as state
  from (select line, test-1-20*line as ofs, test, result
  from (select cast(floor((test-1)/20) as integer) as line, test, result from testresults where result = 'T') s
  ) s group by line) s
on image.line=s.line order by image.line;
