#1. 查询员工的姓名和部门号和年薪，按年薪降序,按姓名升序显示
SELECT last_name,department_id,salary
FROM employees
ORDER BY last_name ASC;

#2. 选择工资不在 8000 到 17000 的员工的姓名和工资，
#按工资降序，显示第21到40位置的数据
SELECT last_name,salary
FROM employees
WHERE salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC
LIMIT 20,20;

#3. 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，
#再按部门号升序
SELECT *
FROM employees
WHERE email LIKE '%e%'
ORDER BY email DESC,department_id ASC
