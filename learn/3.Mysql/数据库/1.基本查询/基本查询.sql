#select 字段1,字段2 from 表名
SELECT * FROM employees;
SELECT last_name,email FROM employees;
SELECT *FROM departments;.

#列的别名
SELECT first_name AS "姓名" FROM employees;


#去除重复行
SELECT DISTINCT department_id FROM employees;



#解决null参与运算的问题
#使用单行函数     IFNULL(列名,值1) 将NULL值替换成值1
SELECT employee_id,salary AS "月工资",salary *(1+IFNULL(commission_pct,0))*12 
 AS "年工资",commission_pct FROM employees;



#着重号
#数字1左边的按键
#order是关键字   使用着重号来表示这是表名 字段名
SELECT *FROM `ORDER`;


#查询常数
SELECT '你好',123,last_name FROM employees;

#表结构
DESCRIBE employees;
DESC employees;


#过滤数据
SELECT * 
FROM employees 
WHERE employee_id=100;


#注意字符串使用单引号 较为严谨
SELECT * 
FROM employees 
WHERE last_name='King';




