#使用t_dept门派表   t_emp人员表
#1.所有有门派的人员信息
#（ A、B两表共有）
SELECT *
FROM t_dept d 
JOIN t_emp e ON e.`deptId`=d.`id`;

#2.列出所有用户，并显示其机构信息
#（A的全集）
SELECT *
FROM t_dept d 
RIGHT JOIN t_emp e ON e.`deptId`=d.`id`;

#3.列出所有门派
#（B的全集）
SELECT *
FROM t_dept d ;

#4.所有不入门派的人员
#（A的独有）
SELECT *
FROM t_emp e LEFT JOIN t_dept d ON e.`deptId`=d.`id`
WHERE e.`deptId` IS NULL;

#5.所有没人入的门派
#（B的独有）
SELECT *
FROM t_dept b LEFT JOIN t_emp a
ON a.deptId = b.id
WHERE a.deptId IS NULL;


#6.列出所有人员和机构的对照关系
#(AB全有)
#MySQL Full Join的实现 因为MySQL不支持FULL JOIN,下面是替代方法
#left join + union(可去除重复数据)+ right join
#左外连接+右外连接减内连接
SELECT *
FROM t_emp e 
LEFT JOIN t_dept d ON e.`deptId`=d.`id`
UNION ALL
SELECT *
FROM t_emp e
RIGHT JOIN t_dept d ON e.`deptId`=d.`id`
WHERE e.`deptId` IS NULL;
#7.列出所有没入派的人员和没人入的门派
#（A的独有+B的独有）
SELECT *
FROM t_emp e
LEFT JOIN t_dept d ON e.`deptId`=d.`id`
WHERE d.`id` IS NULL
UNION 
SELECT *
FROM t_emp e
RIGHT JOIN t_dept d ON e.`deptId`=d.`id`
WHERE e.`deptId` IS NULL;
