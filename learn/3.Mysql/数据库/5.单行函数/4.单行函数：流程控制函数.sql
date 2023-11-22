#流程控制函数
#IF(value,value1,value2)，如果value的值为TRUE，返回value1，否则返回value2
SELECT IF(1 > 0,'正确','错误');

#IFNULL(value1, value2)，如果value1不为NULL，返回value1，否则返回value2
SELECT IFNULL(1,2);
SELECT IFNULL(NULL,2);

#CASE WHEN 条件1 THEN 结果1 WHEN 条件2 THEN 结果2.... [ELSE resultn] END
#                     相当于Java的if...else if...else...
SELECT CASE
WHEN 1 > 0
THEN '1 > 0'
WHEN 2 > 0
THEN '2 > 0'
ELSE '3 > 0'
END;

SELECT employee_id,salary, 
CASE WHEN salary>=15000 THEN '高薪'
WHEN salary>=10000 THEN '潜力'
WHEN salary>=8000 THEN '丝'
ELSE '根' END AS "描述" #把这个case when then 看做是一个整体的字段
FROM employees;

#CASE expr WHEN 常量值1 THEN 值1 WHEN 常量值1 THEN 值1 .... [ELSE 值n] END
#                     相当于Java的switch...case...
#查询部门号为 10,20, 30 的员工信息, 若部门号为 10, 则打印其工资的 1.1 倍, 20 号部门, 则打印其
#工资的 1.2 倍, 30 号部门打印其工资的 1.3 倍数
SELECT employee_id,department_id,last_name,salary,
CASE department_id
WHEN 10 THEN salary*1.1
WHEN 20 THEN salary*1.2
WHEN 30 THEN salary*1.3
END AS 'detils'
FROM employees
WHERE department_id IN(10,20,30);






