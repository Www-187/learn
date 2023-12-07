#1.内连接（无多余数据）
#关键字：JOIN ON
SELECT employee_id,department_name
FROM employees e 
JOIN departments d ON e.`department_id`=d.`department_id`;

#2.左外连接
#关键字：LEFT JOIN ON
SELECT employee_id,department_name
FROM employees e 
LEFT  JOIN departments d ON e.`department_id`=d.`department_id`;

#3.右外连接
#关键字：RIGHT JOIN ON
SELECT employee_id,department_name
FROM employees e 
RIGHT JOIN departments d ON e.`department_id`=d.`department_id`;

#4.左外连接减去内连接
#关键字：LEFT JOIN ON 和WHRER过滤结果
SELECT employee_id,department_name
FROM employees e 
LEFT  JOIN departments d ON e.`department_id`=d.`department_id`
WHERE d.department_id IS NULL;

SELECT *
FROM employees e 
LEFT  JOIN departments d ON e.`department_id`=d.`department_id`;
#5.右外连接减去内连接
#关键字：RIGHT JOIN ON 和WHRER过滤结果
SELECT employee_id,department_name
FROM employees e 
RIGHT JOIN departments d ON e.`department_id`=d.`department_id`
WHERE e.`department_id` IS NULL;

#6.满外连接
#6.1方式一：左外连接 加 右外连接减去内连接
#关键字：UNION ALL
#要求查询的字段数和名要一致
SELECT employee_id,department_name
FROM employees e 
LEFT  JOIN departments d ON e.`department_id`=d.`department_id`
UNION ALL
SELECT employee_id,department_name
FROM employees e 
RIGHT JOIN departments d ON e.`department_id`=d.`department_id`
WHERE e.`department_id` IS NULL;

#6.2方式二：右外连接 加 左外连接减去内连接
#关键字：UNION ALL
#要求查询的字段数和名要一致
SELECT employee_id,department_name
FROM employees e 
RIGHT JOIN departments d ON e.`department_id`=d.`department_id`
UNION ALL
SELECT employee_id,department_name
FROM employees e 
LEFT  JOIN departments d ON e.`department_id`=d.`department_id`
WHERE d.department_name IS NULL;

#满外连接减去内连接
#左外连接减去内连接 加 右外连接减去内连接
SELECT employee_id,department_name
FROM employees e 
LEFT  JOIN departments d ON e.`department_id`=d.`department_id`
WHERE d.department_name IS NULL
UNION ALL
SELECT employee_id,department_name
FROM employees e 
RIGHT JOIN departments d ON e.`department_id`=d.`department_id`
WHERE e.`department_id` IS NULL;
