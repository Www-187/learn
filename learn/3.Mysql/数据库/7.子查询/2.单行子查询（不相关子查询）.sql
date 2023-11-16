#1.单行操作符
#<,>,>=,<=,<>,=

#子查询编写思路：
#从外往里写和从里往外写

#题目1：查询工资大于149号员工工资的员工的信息
#注意内查询不能有 l;
SELECT last_name,salary
FROM employees
WHERE salary >(
	SELECT salary
	FROM employees e
	WHERE e.`employee_id`=149               
);

#题目2：返回job_id与141号员工相同，salary比143号员工多的
       #员工姓名，job_id和工资
SELECT last_name,job_id,salary
FROM employees
WHERE job_id=(
	SELECT job_id
	FROM employees
	WHERE employee_id=144
) AND salary> (
	SELECT salary
	FROM employees
	WHERE employee_id=144
	);      
       
#题目3：返回公司工资最少的员工的last_name,job_id和salary

SELECT last_name,job_id,salary
FROM employees
WHERE salary=(
	SELECT MIN(salary)
	FROM employees
);

#题目4：查询与141号的manager_id和department_id
#相同的其他员工的employee_id，manager_id，department_id
#从外往里写
SELECT employee_id,manager_id,department_id
FROM employees 
WHERE manager_id=(
	SELECT manager_id
	FROM employees
	WHERE employee_id =141	
) AND department_id=(
	SELECT department_id
	FROM employees
	WHERE employee_id =141
) AND employee_id != 141;

#题目5：查询最低工资大于50号部门最低工资的部门id和其最低工资
SELECT e.`department_id`,MIN(e.`salary`)
FROM employees e 
GROUP BY e.`department_id`
HAVING MIN(salary)>(
	SELECT MIN(salary)
	FROM employees e1
	WHERE e1.`department_id`=50
);

