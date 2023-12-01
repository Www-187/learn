#外键约束
#关键字：FOREIGN KEY(从表字段) REFERENCES 主表(字段)
#主表（部门表）的主键关联从表（员工表）的外键，从表（员工表），再添加数据时
#的部门号必须在主表（部门表）中存在


#主表：部门表
#从表：员工表

#外键的特点：
#见课件

#举例1：在创建从表时添加外键约束（主表必须创建完成）
#主表：
CREATE TABLE dept(
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(15)
)

#从表
CREATE TABLE emp(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
emp_name VARCHAR(15),
department_id INT,
#表级约束
CONSISTENT fk_emp1_dept_id FOREIGN KEY(department_id) REFERENCES dept(dept_id)
);
#从表的外键关联的一定是主表的主键/唯一键
#注意先添加主表的数据，再添加从表的数据


#举例2：在修改表时添加外键约束
ALTER TABLE emp
ADD CONSISTENT fk_emp1_dept_id FOREIGN KEY(deptment_id) REFERENCES dept(dept_id);




#约束等级
#Cascade方式 ：在父表上update/delete记录时，同步update/delete掉子表的匹配记录
#Set null方式 ：在父表上update/delete记录时，将子表上匹配记录的列设为null，但是要注意子
#表的外键列不能为not null



#举例3：在修改表时删除外键约束
#可能存在多个外键，再删除时，要删除外键和外键的索引

#1.先删除外键约束（依照外键约束的名）
ALTER TABLE emp1
DROP FOREIGN KEY fk_emp1_dept_id;

#2.再删除外键的索引（依照外键约束的名）
ALTER TABLE emp1
DROP INDEX fk_emp1_dept_id;








