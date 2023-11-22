#1.where子句可否使用组函数进行过滤?
#不能，如果使用会报错

#2.查询公司员工工资的最大值，最小值，平均值，总和
SELECT MAX(e1.`salary`),MIN(e1.`salary`),AVG(e1.`salary`),SUM(e1.`salary`)
FROM employees e1;

#3.查询各job_id的员工工资的最大值，最小值，平均值，总和
SELECT MAX(e.`salary`),MIN(e.`salary`),AVG(e.`salary`),SUM(e.`salary`)
FROM employees e
GROUP BY e.job_id;

#4.选择各个job_id的员工人数
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

# 5.查询员工最高工资和最低工资的差距（DIFFERENCE）
SELECT MAX(salary)-MIN(salary) AS 'DIFFERENCE'
FROM employees;

# 6.查询各个管理者手下员工的最低工资，其中最低工资不能低于6000，
#   没有管理者的员工不计算在内
#根据管理者分组
SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000;

# 7.查询所有部门的名字，location_id，员工数量和平均工资，
#并按平均工资降序

#注意点：所有部门，是外连接，且分组时select出现的字段要在GROUP BY
#        中出现，并按平均工资降序
SELECT d.`department_name`,d.`location_id`,COUNT(*),AVG(e.`salary`) AS avg_sal
FROM departments d LEFT JOIN employees e
ON e.`department_id`=d.`department_id`
GROUP BY d.`department_id`,d.`location_id`
ORDER BY avg_sal DESC;

# 8.查询每个工种、每个部门的部门名、工种名和最低工资
SELECT MIN(e.`salary`),d.`department_name`,e.`job_id`
FROM employees e RIGHT JOIN departments d 
ON e.`department_id`=d.`department_id`
GROUP BY d.`department_name`,e.`job_id`;


