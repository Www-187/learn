#GROUP BY关键字
#1.举例：求各个部门的平均工资
#需要对员工按照部门进行分组来求
#对于部门id为NULL的员工自成一组
#注意：放在where后 select-->from-->where-->group by -->ORDER BY -->LIMIT
SELECT e.`department_id`,AVG(salary)
FROM employees e
GROUP BY e.`department_id`;

#查询各个工种的平均工资
SELECT e.`job_id`,AVG(salary)
FROM employees e
GROUP BY e.`job_id`;


#2.进行多个分组
#在关键字后放两个字段即可，顺序不一样也对，无关顺序
#查询一个部门中，各个工种的平均工资
#需要进行两次分组，各个部门分一次组，一个部门中按照工种分一次组
SELECT e.`department_id`,e.`job_id`,AVG(salary)
FROM employees e
GROUP BY e.`department_id`,e.`job_id`;

#注意以下是不对的
#因为job_id不对
#结论：分组中，在select中出现的字段（非函数中的字段，如salary），一定要出现在group by 中，反之不一定
SELECT e.`department_id`,e.`job_id`,AVG(salary)
FROM employees e
GROUP BY e.`department_id`;


#3. WITH ROLLUP
#作用：在计算一下整体的平均工资，并显示在最后一行
#注意：不能与ORDER BY结合使用
SELECT e.`department_id`,AVG(salary)
FROM employees e
GROUP BY e.`department_id` WITH ROLLUP;



