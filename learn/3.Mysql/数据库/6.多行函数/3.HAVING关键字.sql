#HAVING
#用于过滤数据
#1.举例：查询各个部门中的最高工资，比10000高的 部门信息
#使用分组
#错误写法：
SELECT e.`department_id`,MAX(salary)
FROM employees e
WHERE MAX(salary)>10000
GROUP BY e.`department_id`;

#原因：要求1：如果过滤条件使用了聚合函数，就必须使用HAVING替换WHERE，否则报错
#      要求2：HAVING就必须放在GROUP BY后面
#      建议：HAVING通常依赖于GROUP BY，是在一起使用的
SELECT e.`department_id`,MAX(salary)
FROM employees e
HAVING MAX(salary)>10000
GROUP BY e.`department_id`;


#2.举例：查询部门id为(10,20,30,40)，这4个部门，最高工资比10000高的部门
#方式1：更推荐使用，执行效率高：
SELECT e.`department_id`,MAX(salary)
FROM employees e
WHERE e.`department_id` IN(10,20,30,40)
GROUP BY e.`department_id`
HAVING MAX(salary)>10000;
#方式2：把过滤条件结合，也行
SELECT e.`department_id`,MAX(salary)
FROM employees e
GROUP BY e.`department_id`
HAVING MAX(salary)>10000 AND e.`department_id` IN(10,20,30,40);

#结论：当过滤条件中有聚合函数，必须使用HAVING，其他过滤条件建议使用WHERE，因为效率高
     # 结合使用
     
     
#3.HAVING和WHERE对比
/*
1.HAVING使用的范围更广，因为过滤条件能用聚合函数
2.WHERE执行效率高
*/





