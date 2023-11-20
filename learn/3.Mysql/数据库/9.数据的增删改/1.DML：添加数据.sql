#准备工作
CREATE TABLE IF NOT EXISTS emp1(
id INT,
`name` VARCHAR(15),
hire_date DATE,
salary DOUBLE(12,2)
);

SELECT *
FROM emp1;

#注意DML默认是执行完提交的
#要注意设置
SET autocommit=FALSE;

#DML：增
#添加数据
#关键字：INSERT INTO 表名 VALUES(字段1,字段2...)
#是VALUES不是VALUE

#方式1：一条一条添加数据
#注意添加时字段的顺序是按照表字段声明的顺序
INSERT INTO emp1
VALUES(1,'Tome','2000-12-31',2000);

#方式1.5：一条一条添加数据，指明字段的顺序（推荐）
#可以少几个字段，少的字段就是默认值了
INSERT INTO emp1(id,hire_date,salary,`name`)
VALUES(1,'1999-12-31',2000,'Jerry');

#方式1.75：一次添加多条数据
INSERT INTO emp1(id,`name`,salary)
VALUES(2,'a',2000),(3,'b',2000);


#方式2：将查询的结果添加进去

INSERT INTO emp1(id,`name`,salary,hire_date)
#后接查询语句
#查询的字段与添加到的表字段一一对应
SELECT e.`employee_id`,e.`last_name`,e.`salary`,e.`hire_date`
FROM employees e
WHERE e.department_id IN (60,70);

#使用查询添加时，字段类型问题：
#小往大：没问题
#大往小：可能会出问题（在添加之前看清楚字段类型）




