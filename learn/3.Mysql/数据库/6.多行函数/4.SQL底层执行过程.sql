#SQL底层执行原理
/*
SELECT............(存在聚合函数)

FROM........
(LIFT/RIGHT)JOIN.. ON....
WHERE 多表查询的连接条件 AND 不包含聚合函数的过滤条件
GROUP BY ...
HAVING..包含聚合函数的过滤条件

ORDER BY..(ASC/DESC)
LIMIT........

执行的顺序分成了三部分：FROM(先找表)-->JOIN ON(有多张表先进行交叉连接，再用ON过滤)-->WHERE(继续过滤条件)-->GROUP BY(按照一定条件分组)-->
HAVING(执行聚合函数)-->SELECT(选择显示的字段)-->ORDER BY(排序)-->LIMIT(分页显示) 

在分组后在使用聚合函数，聚合函数在HAVIGN中，根据语句的执行顺序，不能写在WHERE中，
放在WHERE中，还没进行分组就使用聚合函数，不合逻辑

WHERE先于HAVING：为了查询的效率，先WHERE过滤数据，在使用HAVING中聚合函数，此时就少了很多不需要的数据
如果都放在HAVING中，还要对不需要的数据进行分组，浪费资源

字段别名是同理：与执行顺序有关
*/






