#检查约束
#关键字：CHECK
#只能在MYSQL8.0中使用
#MYSQL5.7不支持

#举例1：在创建表时添加检查约束
CREATE TABLE employee(
	eid INT PRIMARY KEY,
	ename VARCHAR(5),
	gender CHAR CHECK ('男' OR '女'),
	salary DECIMAL(10,2) CHECK(salary>2000)
);




#默认值约束
#关键字：DEFAULT
#举例：在创建表时添加默认值约束
CREATE TABLE employee(
	eid INT PRIMARY KEY,
	ename VARCHAR(20) NOT NULL,
	gender CHAR DEFAULT '男',
	salary INT NOT NULL DEFAULT 2000 
);

#举例：在修改表时添加默认值约束
ALTER TABLE employee
MODIFY salary INT NOT NULL DEFAULT 2000;


#举例：在修改表时删除默认值约束
ALTER TABLE employee
MODIFY salary INT NOT NULL;







