/*
视图的理解：
1.视图中涉及的表成为基表
2.视图并不是表，理解为虚拟的表，视图的本质是存储起来的select语句
3.针对对视图的DML操作，会影响基表的数据，修改基表的数据，也会影响视图
4.删除视图，不会删除基表中的数据
5.针对小型项目，不推荐使用视图，对大型项目，要使用视图
*/



#创建视图

#举例1：同创建表，AS后加丰富的查询语句
CREATE VIEW view1
AS
SELECT last_name,salary
FROM employees;

SELECT *
FROM view1;

#举例2：确定视图的字段名1：查询语句的字段的别名，会作为视图的字段名
CREATE VIEW view2
AS
SELECT last_name AS 'name',salary AS 'month_salary'
FROM employees;

SELECT *
FROM view2;

#举例3：确定视图的字段名2：在视图名后面加字段名，注意字段个数要相同
CREATE VIEW view3(`name`,month_salary)
AS
SELECT last_name,salary
FROM employees;

SELECT *
FROM view3;



#举例4：基于视图，创建视图
CREATE VIEW view4(last_name)
AS
SELECT last_name
FROM view1;


#查看视图

#查看数据库中有哪些表，视图
SHOW TABLES;#能查看表和视图

#查看视图结构:字段，数据类型，约束，
DESC view2;

#查看视图的属性信息:引擎，视图版本
SHOW TABLE STATUS LIKE 'view2';

#查看视图创建时的信息
SHOW CREATE TABLE view2;



#视图的DML
#见课件
#SELECT 字段 FROM 表 WHERE 过滤条件;
#UPDATE 表 SET 新数据 WHERE 过滤条件;添加时一定要注意视图的字段，否则有时会失败
                                    #如部门,平均工资，修改平均工资就失败
#DELETE FROM 表 WHERE 过滤条件;
#INSERT INTO 表 VALUES 数据;  


#视图的DDL

#修改视图
#方式一：
#ALTER VIEW 表  AS
#方式二：
#CREATE OR REPLACE VIEW 视图名 AS 查询语句;
#没有视图就创建，有视图就替换

#删除视图
#DROP VIEW IF EXISTS view2;

#说明：基于视图a、b创建了新的视图c，如果将视图a或者视图b删除，会导致视图c的查询失败。这
#样的视图c需要手动删除或修改，否则影响使用。



#视图的优点：见课件
#视图的缺点：见课件