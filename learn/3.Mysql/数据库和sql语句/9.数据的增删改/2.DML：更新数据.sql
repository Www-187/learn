#更新数据
#关键字：UPDATE 表名 set 新数据 where 
#不加where，都会进行更新
#注意修改数据时注意外键约束，比如修改部门id为10000
UPDATE emp1
SET hire_date=NOW()
WHERE `name`='Tome';

SELECT *
FROM emp1;