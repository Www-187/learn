#1.创建表(creat)
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


#2.修改表(alter table)

#修改字段

#2.1添加字段(add)

#DOULE(10,2)，一共有10位，小数点后有2位
ALTER TABLE myemp1
ADD salary DOUBLE(10,2);#默认添加到表中的最后一个字段

ALTER TABLE myemp1
ADD phone_number VARCHAR(20) FIRST;#此时就添加到了第一个

ALTER TABLE myemp1
ADD email VARCHAR(45) AFTER emp_name;#此时就放在了emp_name字段后面

#2.2修改字段(modify)：数据类型，长度，默认值
#通常不会修改数据类型
#修改字段长度，并设置默认值
ALTER TABLE myemp1
MODIFY emp_name VARCHAR(25) DEFAULT 'aaa';


#2.3字段重命名(change)
ALTER TABLE myemp1
CHANGE salary month_salary DOUBLE(10,2);

#2.4删除字段(DROP COLUMN)
ALTER TABLE myemp1
DROP COLUMN email;


#修改表

#重命名表（reaname）

RENAME TABLE myemp1
TO myemp11;


ALTER TABLE 

#删除表（drop table）
#删除数据和表结构
#if  exists
#回滚不了，要有备份
DROP TABLE IF EXISTS myemp2;



#清空表（TRUNCATE TABLE）
#删数据，不删结构
TRUNCATE TABLE myemp1;

