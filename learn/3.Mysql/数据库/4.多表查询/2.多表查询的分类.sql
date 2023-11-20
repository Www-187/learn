#多表查询的分类
#由于多表查询的关键是连接条件，因此根据连接条件进行分类

#1.等值连接与非等值连接
#1.1等值连接：查询条件是使用等号的，略
#1.2非等值连接：查询条件没有等号，是范围
SELECT e.last_name,e.salary,j.grade_level
FROM employees AS e,job_grades AS j
WHERE e.`salary` BETWEEN j.`lowest_sal` AND j.`highest_sal`;


#2.自连接与非自连接
#2.1非自连接：查询的条件是一张表与另外一张表，略
#2.2自连接：查询的条件是一张表与它本身
#举例：查询员工姓名和id，及其管理者的id和姓名
#      利用起别名的方式来区分同一张表，用来查询不同的内容
SELECT  e.`employee_id`,e.last_name,em.`manager_id`,em.last_name
#e是用来查询员工的，em是来查询管理者的
FROM employees AS e,employees AS em
WHERE e.`manager_id`=em.`employee_id`;


#3.内连接与外连接
#举例：查询员工的姓名和部门名
#内连接：之前写的都是内连接，即查询的结果完全符合查询条件，不符合查询条件的结果不显示

#外连接：比如：一个部门没人，或者一个员工没部门，除了查询到符合查询条件的结果集外
#        还查询到了没有部门的人，没人的部门

#外连接的分类：
#左外连接和右外连接和满外连接


#3.1左外连接：查询的结果包含内连接（满足查询条件的结果集），
#也包含左边表不符合查询条件的结果
#举例：查询'所有'的员工的last_name,department_name
#      注意'所有'的字眼，可能是外连接
#这个左，employees在左边，departments在右边
#Mysql不支持92语法的外连接，支持92语法的内连接，要使用99语法的外连接

#先看SQL99语法实现内连接
#关键字：JOIN 表名 ON 查询条件（注意JOIN使用的话为了效率，限制为两个表）
#举例：查询员工的id和部门名称
SELECT employee_id,department_name
FROM employees AS e JOIN departments AS d
ON e.`department_id`=d.`department_id`;
#举例：查询员工的姓名，部门名，和城市名
SELECT last_name,department_name,city
FROM employees AS e JOIN departments AS d
ON e.`department_id`=d.`department_id`
JOIN locations AS s ON d.`location_id`=s.`location_id`;

#使用SQL99语法实现左外连接
#举例：查询'所有'的员工的last_name,department_name，即存在没有部门的员工，员工多
#      注意'所有'的字眼，可能是外连接
SELECT last_name,department_name
FROM employees AS e 
LEFT OUTER JOIN departments AS d ON e.`department_id`=d.`department_id`;


#使用SQL99语法实现右外连接
#举例：查询'所有'的员工的last_name,department_name，即存在没有人的部门，部门多
#      注意'所有'的字眼，可能是外连接
SELECT last_name,department_name
FROM employees AS e 
RIGHT OUTER JOIN departments AS d ON e.`department_id`=d.`department_id`;



#使用SQL99语法实现满外连接（全外连接）
#举例：查询'所有'的员工的last_name,department_name，部门多，人多
#      注意'所有'的字眼，可能是外连接
#Mysql不支持FULL JOIN ON 的写法

#使用UNION ALL关键字结合


