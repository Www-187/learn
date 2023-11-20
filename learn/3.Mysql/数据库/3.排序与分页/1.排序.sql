#排序与分页

#一：排序

#1.使用ORDER BY关键字进行排序
#默认的是升序操作（ASC），降序（DESC）

#举例：查询员工的姓名和工资，并按照工资记性降序排序
SELECT last_name AS '姓名',salary AS '工资'
FROM employees
ORDER BY salary DESC;


#2.可以使用列的别名进行排序（使用别名进行排序只能在ORDERBY中，不能在WHERE中用）
#原因：首先执行的是FROM和WHERE，之后执行SELECT，之后在其他，所以别名能被ORDERBY
#      看见，不能被WHERE看见

#举例：使用列的别名进行排序
SELECT last_name AS '姓名',salary * 12 AS '工资'
FROM employees
ORDER BY '工资' DESC;


#3.二级排序（多列排序）
#在首次排序后，在按照一定顺序进行排序

#举例：按照department_id的降序排列，在按照salary升序排列
SELECT last_name,salary,department_id
FROM employees
ORDER BY department_id DESC,salary ASC;
















