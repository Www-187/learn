#唯一性约束
#关键字：UNIQUE
#允许NULL值

#举例1：创建表时添加唯一性约束

CREATE TABLE test2(
	id INT UNIQUE,#列级约束
	last_name VARCHAR(15),
	email VARCHAR(25),
	salary DECIMAL(10,2),#当设置表级约束时，记得加逗号
	
	#表级约束：给email字段加UNIQUE约束
	
	#方式1：给这个约束起个名字
	CONSISTENT uk_test2_email UNIQUE(email)
	
        #方式2：不给这个约束起个名字，就默认约束的名字和列名相同
        #UNIQUE(email)
);

/*
解释：
CONSISTENT：汉语意思：约束，在定义约束时使用
uk_test2_email：这是给这个约束起的名字，用户自定义的
UNIQUE(email)：定义约束
*/

#可以向UNIQUE字段添加NULL值，且多次添加NULL值
INSERT INTO test2
VALUES(2,'yom',NULL,2000);#成功

INSERT INTO test2
VALUES(3,'yom2',NULL,2000);#成功




#举例2：修改表时添加约束
#方式1：
ALTER TABLE test2
MODIFY email VARCHAR(25) UNIQUE;

#方式2：
ALTER TABLE test2
ADD CONSTRAINT uk_test_email UNIQUE(email);


#举例3：复合的唯一性约束（多列约束：id+name）

CREATE TABLE `user`(
	id INT,
	`name` VARCHAR(15),
	`password` VARCHAR(25),
	#表级约束，多列约束
	CONSTRAINT uk_user_name_and_password UNIQUE(`name`,`password`)
);


#4.删除唯一性约束
/*
4.1添加唯一性约束的列上也会自动创建唯一索引。
4.2删除唯一约束只能通过删除唯一索引的方式删除。
4.3删除时需要指定唯一索引名，唯一索引名和唯一约束名一样。
4.4如果创建唯一约束时未指定名称，如果是单列，就默认和列名相同；如果是组合列，
那么默认和()中排在第一个的列名相同。也可以自定义唯一性约束名。
*/

#总结：删除唯一索引(索引名和约束名相同)
#INDEX：索引
ALTER TABLE test2
DROP INDEX uk_user_name_and_password;








