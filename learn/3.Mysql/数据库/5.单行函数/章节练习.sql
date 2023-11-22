# 1.显示系统时间(注：日期+时间)
SELECT NOW(),SYSDATE(),CURRENT_TIMESTAMP(),LOCALTIME(),
UTC_DATE(),UTC_TIME;

# 2.查询员工号，姓名，工资，以及工资提高百分之20%后的结果（new salary）
SELECT e1.`employee_id`,e1.`last_name`,e1.`salary`,salary * 1.2 AS new_salary
FROM employees e1;

# 3.将员工的姓名按首字母排序，并写出姓名的长度（length）
#LENGTH()，计算字节数
SELECT e1.`last_name`,LENGTH(e1.`last_name`) AS `length`
FROM employees e1
ORDER BY e1.`last_name` ASC;

# 4.查询员工id,last_name,salary，并作为一个列输出，别名为OUT_PUT
#作为一个列输出，字符串函数
#CONCAT()，中间可以字符串
SELECT CONCAT(e1.`employee_id`,' ',e1.`last_name`,' ',e1.`salary`) AS OUT_PUT
FROM employees e1;

# 5.查询公司各员工工作的年数、工作的天数，并按工作年数的降序排序
#日期时间函数
#DATEDIFF():返回date1 - date2的日期间隔天数，获得的是天数
SELECT DATEDIFF(SYSDATE(), hire_date) / 365 AS worked_years, DATEDIFF(SYSDATE(),
hire_date) AS worked_days
FROM employees
ORDER BY worked_years DESC;

# 6.查询员工姓名，hire_date , department_id，满足以下条件：雇用时间在1997年之后，department_id
#为80 或 90 或110, commission_pct不为空
#DATEDIFF():返回date1 - date2的日期间隔天数，获得的是天数
#DATE_FORMAT(date,fmt格式)，
#或者：DATE_FORMAT(hire_date,'%Y')>='1997'，注意''的使用
SELECT last_name,hire_date,department_id
FROM employees
WHERE department_id IN(80,90,100) AND commission_pct IS NOT NULL AND
DATE_FORMAT(hire_date,'%Y')>='1997';

# 7.查询公司中入职超过10000天的员工姓名、入职时间
#DATEDIFF():返回date1 - date2的日期间隔天数，获得的是天数
SELECT last_name,hire_date
FROM employees
WHERE DATEDIFF(NOW(),hire_date)>=10000;

# 8.做一个查询，产生下面的结果
-- <last_name> earns `<salary>` monthly but wants <salary*3>
-- Dream Salary
-- King earns 24000 monthly but wants 72000
#CONCAT(str1，str2...)，连接字符串
#TRUNCATE(salary,0)，取整
SELECT CONCAT(last_name, ' earns ', TRUNCATE(salary, 0) , ' monthly but wants ',
TRUNCATE(salary * 3, 0)) AS "Dream Salary"
FROM employees;

#9.使用CASE-WHEN，按照下面的条件：
-- job grade
-- AD_PRES A
-- ST_MAN B
-- IT_PROG C
-- SA_REP D
-- ST_CLERK E
-- 产生下面的结果
-- Last_name   Job_id    Grade
-- king        AD_PRES   A
SELECT last_name,job_id,CASE job_id WHEN 'AD_PRES' THEN 'A'
				    WHEN 'ST_MAN' THEN 'B'
				    WHEN 'IT_PROG' THEN 'C'
				    WHEN 'SA_REP' THEN 'D'
				    WHEN 'ST_CLERK' THEN 'E'
				    END AS 'Grade'
FROM employees;











