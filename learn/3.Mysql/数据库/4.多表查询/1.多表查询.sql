#多表查询

#1.举例：查询employee_id,department_name
SELECT employee_id,department_name
FROM employees,departments;
#查询出了几千条记录，因为每个员工与每个部门都匹配了一遍，出现了笛卡尔积的错误

#2.正确的多表查询：需要有连接条件
#2.1如果几张表存在相同的字段，要指明那张表的字段
#2.2建议在多表查询时都指明每个字段的表
#2.3建议给表起别名，简化代码
#2.4表的别名不能用''，字段可以，建议不用''了
#2.5起了别名后必须用别名，不能用原表名
SELECT emp.employee_id AS 'id',dept.department_name,emp.`department_id`
FROM employees AS emp,departments AS dept
WHERE emp.`department_id`=dept.`department_id`;

#3.举例：查询员工的employee_id,last_name,department_id,department_name,city
SELECT emp.`employee_id`,emp.`last_name`,emp.`department_id`,dept.`department_name`,loca.`city`
FROM employees AS emp,departments AS dept,locations AS loca
WHERE emp.`department_id`=dept.`department_id` AND dept.`location_id`=loca.`location_id`;

