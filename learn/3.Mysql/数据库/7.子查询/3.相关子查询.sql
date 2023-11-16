#相关子查询

#题目：查询员工中工资大于本部门平均工资的员工的last_name,salary
#和其department_id
#相关子查询：内查询的依赖于外查询，如本题，先在外查询中取出一条员工的记录，
#在送进内查询要员工的部门号，再计算出该部门的平均工资
#重点：使用表的别名的方式，将外部的数据送进内部
SELECT last_name,salary,department_id
FROM employees e1
WHERE salary>(
	SELECT AVG(salary)
	FROM employees e2
	WHERE e2.department_id=e1.`department_id`
	);


#举例2：查询员工的id,salary,按照department_name 排序
#在ORDER BY中使用子查询
SELECT employee_id,salary
FROM employees e
ORDER BY (
	SELECT department_name
	FROM departments d
	WHERE e.`department_id`=d.`department_id`
)ASC;

#结论：在哪些位置能够使用子查询？
#在select,from,where,having,order by
#除了group by和limit外都能使用子查询

#题目：若employees表中employee_id与job_history表中employee_id
#相同的数目不小于2，输出这些相同id的员工的employee_id,last_name和其job_id
SELECT employee_id,last_name,job_id
FROM employees e
WHERE 2<=(
	SELECT COUNT(*)
	FROM job_history jh
	WHERE e.employee_id=jh.`employee_id`
);



#EXISTS和NOT EXISTS
#存在和不存在
#EXIST：一旦找到了就停止查找,找不到就继续向下找
#题目：查询公司管理者的employee_id，last_name，job_id，department_id信息
#只要有记录就行了，不需要记录的数量
SELECT employee_id,last_name,job_id,department_id
FROM employees e1
WHERE EXISTS (
	SELECT *
	FROM employees e2
	WHERE e1.`employee_id`=e2.`manager_id`
);


#NOT EXISTS
#题目：查询departments表中，不存在于employees表中的部门的department_id
#题目：查询departments表中，存在于employees表中的部门的department_id
#刚好相反
#和department_name

#将外部的记录送进内部，找全，始终都没有找到匹配的记录就选中，就要
#一但找到匹配的记录就不要
SELECT department_id,department_name
FROM departments d1
WHERE NOT EXISTS(
	SELECT *
	FROM employees e1
	WHERE d1.`department_id`=e1.`department_id`
);



