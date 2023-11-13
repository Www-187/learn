#二：分页

#1.关键字：LIMIT 偏移量,条目数
#LIMIT后面：0指的是偏移量，20值的是显示的条目数

#举例：每页显示20条记录，此时显示第1页
SELECT employee_id,last_name
FROM employees
LIMIT 0,20;

#举例：每页显示20条记录，此时显示第2页
#偏移量计算：（页数-1）*条目数
SELECT employee_id,last_name
FROM employees
LIMIT 20,20;


#三：结合排序与分页
#排序与分页声明顺序：ORDER BY 和LIMIT一直是垫底写

#举例：
SELECT employee_id,last_name,salary
FROM employees
WHERE salary>6000
ORDER BY salary DESC
LIMIT 0,5;

#举例：显示第32,33条数据
SELECT *
FROM employees
LIMIT 31,2;

#Mysql8.0新特性
#LIMIT 条目数 OFFSET 偏移量
#举例
SELECT employee_id,last_name
FROM employees
LIMIT 20 OFFSET 0;

