#多行函数（聚合函数）
#聚合函数不能嵌套使用，只能单独使用

#1.1 AVG和SUM
#只适用于数值类型
#AVG()，求平均值，不考虑NULL
#SUM()，求总和，不考虑NULL
SELECT AVG(salary),SUM(salary),SUM(employees.`commission_pct`),AVG(employees.`commission_pct`)
FROM employees;



#1.2 MAX和MIN
#适用于数值，字符串，日期类型
#MAX()，求最大值，不考虑NULL
#MIN，求最小值，不考虑NULL
SELECT MAX(salary),MIN(salary),MAX(last_name),MIN(last_name)
FROM employees;


#1.3 COUNT
#COUNT()，返回表中记录总数

SELECT COUNT(last_name),COUNT(2* salary),#还是107
COUNT(1)#还是107，1是常量，不在表中出现，相当于不是取某一字段，而是把整条数据拿1充当
FROM employees;

#1.3.2
#如何查看表中有多少条记录？
#方式一：COUNT(1),
#方式二：COUNT(*),
#方式三(有条件的)：COUTN(具体字段)，这不计算为NULL的字段，只计算有具体的值的字段

#三者的效率分析
#如果使用MyISAM存储引擎，则三者效率相同，都是O(1)
#如果使用InnoDB存储引擎，则COUNT(*)=COUNT(1)>COUNT(字段)



#1.3.3
#公式：avg=sum/count  ，这些函数都不计算NULL，因此成立，
#注意：计算平均值时是否算进哪些值为NULL的记录
#举例：计算平均奖金率
#错误的
SELECT AVG(e.`commission_pct`),#因为没有除以奖金率为NULL的人
FROM employees e;
#正确的
SELECT SUM(e.`commission_pct`)/COUNT(IFNULL(e.`commission_pct`,0)),
AVG(IFNULL(e.`commission_pct`,0))#这样也是正确的
FROM employees e;















