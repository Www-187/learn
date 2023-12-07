# 1.显示所有员工的姓名，部门号和部门名称。
#显示的是所有员工，有的员工没部门号，则是左外连接
SELECT last_name,e.department_id,department_name
FROM employees e 
LEFT JOIN departments d ON e.`department_id`=d.`department_id`;

# 2.查询90号部门员工的job_id和90号部门的location_id
SELECT e.job_id,d.location_id
FROM employees e
JOIN departments d ON e.`department_id` = d.`department_id` 
WHERE e.`department_id` = 90;

# 3.选择所有有奖金的员工的 last_name , department_name , location_id , city
#由于是所有奖金的员工，使用左连接
SELECT e.`last_name`,d.`department_name`,d.`location_id`,l.`city`
FROM employees e 
LEFT JOIN departments d ON e.`department_id`=d.`department_id`
LEFT JOIN locations l ON d.`location_id`=l.`location_id`
WHERE e.`commission_pct`IS NOT NULL;

# 4.选择city在Toronto工作的员工的 last_name , job_id , department_id
# , department_name
SELECT last_name,job_id,d.department_id
FROM employees e
JOIN departments d ON e.`department_id`=d.`department_id`
JOIN locations l ON d.`location_id`=l.`location_id`
WHERE l.`city`='Toronto';

# 5.查询员工所在的部门名称、部门地址、姓名、工作、工资，
#其中员工所在部门的部门名称为’Executive’
SELECT d.`department_name`,l.`street_address`,e.`last_name`,e.`job_id`,e.`salary`
FROM employees e JOIN departments d ON e.`department_id`=d.`department_id`
JOIN locations l ON l.`location_id`=d.`location_id`
WHERE department_name = 'Executive';

# 6.选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，
#结果类似于下面的格式
#employees Emp# manager Mgr#
#kochhar 101 king 100
#由于有的人没有管理者，是左外连接
SELECT e1.last_name AS employees,e1.employee_id AS Emp,e2.`last_name` AS manger,
e2.`employee_id` AS Mgr
FROM employees e1 LEFT JOIN employees e2 ON e1.`manager_id`=e2.`employee_id`;


# 7.查询哪些部门没有员工（思考）
#右外连接减去内连接
#为什么WHERE e.`department_id` IS  NULL
#内连接查询的结果：所有员工的部门id和名字
#右外连接查询的结果：所有员工的部门id和名字，以及没人的部门
#由于笛卡尔积，会产生emp的字段为空的dept，e.`department_id` IS  NULL排除了全部的员工
SELECT  *
FROM employees e  
RIGHT JOIN departments d ON e.`department_id`=d.`department_id`
WHERE e.`department_id` IS  NULL;



# 8. 查询哪个城市没有部门
SELECT l.`city`
FROM departments d RIGHT JOIN locations l ON d.`location_id`=l.`location_id`
WHERE d.`location_id` IS NULL;

# 9. 查询部门名为 Sales 或 IT 的员工信息
SELECT e.`last_name`,d.`department_id`,d.`department_name`
FROM employees e 
JOIN departments d ON e.`department_id`=d.`department_id` 
WHERE d.`department_name`='Sales' || d.`department_name`='IT';
