#多行子查询
#运算符
#IN：等于列表中的任意一个
#ANY/SOME：需要和单行比较操作符一起使用，和子查询返回的某一个值比较
#ALL：需要和单行比较操作符一起使用，和子查询返回的所有值比较

#IN：举例1：查询各部门的最低工资，看哪些员工的工资等于最低工资
SELECT employee_id,last_name,department_id
FROM employees
WHERE salary IN(
	SELECT MIN(salary)
	FROM employees
	GROUP BY department_id
);

#ANY/SOME：举例2：返回其它job_id中比job_id为‘IT_PROG’部门
#任一工资低的员工的员工号、姓名、job_id 以及salary
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < ANY (
	SELECT salary
	FROM employees
	WHERE job_id='IT_PROG'
) AND job_id !='IT_PROG';

#ALL:题目：返回其它job_id中比job_id为‘IT_PROG’部门
#所有工资都低的员工的员工号、姓名、job_id以及salary
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < ALL (
	SELECT salary
	FROM employees
	WHERE job_id='IT_PROG'
) AND job_id !='IT_PROG';




#题目：查询平均工资最低的部门id
#方式一：
#在FROM中使用子查询：
#把子查询的结果当做是一张表（注意里面的字段要起别名），对这张表也要起别名
#再在SELECT中使用单行函数，就能查出结果
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary)=(SELECT MIN(avg_salary)
FROM(
	SELECT AVG(salary) AS avg_salary
	FROM employees
	GROUP BY department_id
) AS dept_avg_salary);

#方式二：
#<=，就相当于是找最小的了
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) <= ALL (
	SELECT AVG(salary) avg_sal
	FROM employees
	GROUP BY department_id
);








