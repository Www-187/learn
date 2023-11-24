#1.查询和Zlotkey相同部门的员工姓名和工资
#子查询:Zlotkey的部门
#外查询：其他员工的姓名和工资
SELECT e1.`last_name`,e1.`salary`
FROM employees e1
WHERE e1.`department_id`=(
	SELECT e.`department_id`
	FROM employees e
	WHERE e.`last_name`='Zlotkey'
);

#2.查询工资比公司平均工资高的员工的员工号，姓名和工资。
#内查询：公司平均工资
#外查询：员工的员工号，姓名和工资。
#条件：员工工资大于平均工资
SELECT e1.`employee_id`,e1.`last_name`,e1.`salary`
FROM employees e1
WHERE  e1.`salary`>(
	SELECT AVG(salary)
	FROM employees
);

#3.选择工资大于所有JOB_ID = 'SA_MAN'的员工的工资的员工
#的last_name, job_id, salary
#多行不相关子查询：所有JOB_ID = 'SA_MAN'的员工的工资
#                  要使用多行操作符
#外查询：大于所有...的员工
SELECT e.`last_name`,e.`job_id`,e.`salary`
FROM employees e
WHERE e.`salary`> ALL(
	SELECT salary
	FROM employees
	WHERE job_id='SA_MAN'
);

#4.查询和姓名中包含字母u的员工在相同部门的员工的员工号和姓名
#相关多行子查询：要使用多行子查询操作符，员工姓名有u，
#外查询：查询员工的姓名和id
#条件：在相同部门
SELECT e.`employee_id`,last_name
FROM employees e
WHERE e.`department_id`=ANY(
	SELECT department_id
	FROM employees e2
	WHERE e.`department_id`=e2.`department_id` AND e2.`last_name` LIKE '%u%'
);

#5.查询在部门的location_id为1700的部门工作的员工的员工号
#两种写法：
#1.多行操作符以及连接条件是:IN，等于列表中的任意一个
#子查询查出的数据有多行，
SELECT e1.`employee_id`
FROM employees e1
WHERE e1.`department_id`IN (
	SELECT d1.`department_id`
	FROM departments d1
	WHERE d1.`location_id`=1700
);
#2.多行操作符以及连接条件是:=ANY，
#需要和单行比较操作符一起使用，和子查询返回的某一个值比较
SELECT employee_id
FROM employees
WHERE department_id =ANY (
	SELECT department_id
	FROM departments
	WHERE location_id = 1700
);

#6.查询管理者是King的员工姓名和工资


#7.查询工资最低的员工信息: last_name, salary


#8.查询平均工资最低的部门信息


#9.查询平均工资最低的部门信息和该部门的平均工资（相关子查询）


#10.查询平均工资最高的 job 信息


#11.查询平均工资高于公司平均工资的部门有哪些?


#12.查询出公司中所有 manager 的详细信息


#13.各个部门中 最高工资中最低的那个部门的 最低工资是多少?


#14.查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email, salary


#15. 查询部门的部门号，其中不包括job_id是"ST_CLERK"的部门号
#16. 选择所有没有管理者的员工的last_name


#17．查询员工号、姓名、雇用时间、工资，其中员工的管理者为 'De Haan'


#18.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资（相关子查询）



#19.查询每个部门下的部门人数大于 5 的部门名称（相关子查询）


#20.查询每个国家下的部门个数大于 2 的国家编号（相关子查询）
