#1.创建表
#方式1
#IF NOT EXISTS即使有表，也不会报错，默默的结束了
#注意最后一个字段没有 ,
#varchar必须指明长度
#没指名字符集，默认和数据库字符集相同
CREATE TABLE IF NOT EXISTS myemp1(
	id INT,
	emp_name VARCHAR(15),
	hire_date DATE
);
#查看表结构
DESC myemp1;

#方式2
#基于现有的表来创建表
#跟employees表的三个字段的都一样（类型和名字），而且有数据
CREATE TABLE myemp2
AS 
SELECT employee_id,last_name,salary
FROM employees;

DESC myemp2;

#如果不要表数据
#添加过滤条件即可
CREATE TABLE myemp2
AS 
SELECT employee_id,last_name,salary
FROM employees
WHERE 1=2;


#可以将查询到的新数据(使用丰富的查询语句)存放到新的表中
CREATE TABLE myemp4
AS
SELECT employee_id AS emp_id,last_name AS `name`,department_name AS dep_name
FROM employees e1
JOIN departments d1 ON e1.department_id =d1.department_id;



#查看数据表结构
#查看创建表时语句的结构
SHOW CREATE TABLE myemp1;


#2.修改表




