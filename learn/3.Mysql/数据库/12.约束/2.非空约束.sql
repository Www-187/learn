#非空约束


#1.如何查看表中的约束
#information_schema数据库名（系统库）
#table_constraints表名称（专门存储各个表的约束）
SELECT * FROM information_schema.table_constraints
WHERE table_name = '表名称';

#2.非空约束
#关键字：NOT NULL
#在赋值或修改时时，该字段不能为空NULL
#只能是列级约束，不能是表级约束


#举例：在创建表时添加非空约束
CREATE TABLE test1(
	id INT NOT NULL,
	last_name VARCHAR(15) NOT NULL,
	email VARCHAR(25),
	salary DECIMAL(10,2)
);
DESC test1;

INSERT INTO test1 
VALUES(3,NULL,NULL,1000);#失败，Column 'last_name' cannot be null


#举例：在修改表时添加非空约束

ALTER TABLE test1
MODIFY email VARCHAR(25) NOT NULL;
#当已有的数据的修改的字段存在NULL值，则修改失败
#如：想要把email字段设置为NOT NULL，但是现有的数据的人员的email有NULL，则修改表失败


#举例：在修改表时删除非空约束
ALTER TABLE test1
MODIFY email VARCHAR(25);






