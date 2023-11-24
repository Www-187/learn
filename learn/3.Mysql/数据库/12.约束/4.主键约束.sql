#主键约束
#关键字：PRIMARY KEY
#作用：非空且唯一（NOT NULL+UNIQUE），用来唯一标识一条记录


#1.举例：创建表时添加主键约束
#使用列级约束的方式创建主键约束
#一个表中最多只能有一个主键约束
CREATE TABLE test3(
	id INT PRIMARY KEY,
	last_name VARCHAR(15),
	salary DECIMAL(10,2),
	email VARCHAR(25)
);


#2.举例：创建表时添加主键约束
#使用表级约束创建表级约束
CREATE TABLE test4(
	id INT PRIMARY KEY,
	last_name VARCHAR(15),
	salary DECIMAL(10,2),
	email VARCHAR(25),
	#表级约束
	#主键在创建时即使自己起名字，依旧是'PRIMARY KEY'
	#因此，创建主键时没必要起名字
	#consistent pk_test5_id primary key(id)
	PRIMARY KEY(id)
);

#3.举例：创建复合的主键约束
#主键约束的字段都不允许为空
CREATE TABLE test5(
	id INT PRIMARY KEY,
	last_name VARCHAR(15),
	salary DECIMAL(10,2),
	email VARCHAR(25),
	PRIMARY KEY(id,last_name)
);



#4.举例：在修改表时添加约束
CREATE TABLE test6(
	id INT,
	last_name VARCHAR(15),
	salary DECIMAL(10,2),
	email VARCHAR(25),
);

ALTER TABLE test6
ADD PRIMARY KEY(id);


#5.举例：删除主键约束
#主键名是固定的，直接使用即可
#在实际开发中不能做
ALTER TABLE test6
DROP PRIMARY KEY;






#自增长列
#AUTO_INCREMENT
#设置条件：①一个表只能有一个自增长列
#          ②设置自增长的字段必须是主键或者唯一性键
#          ③设置自增长的字段必须是INT数据类型

#注意点1：再添加数据时，不要给该字段赋值，如果真的赋值了，下一次在赋值会
#继续延续赋值的值，如手动赋值id=5，下一次id就是6

#注意点2：再添加数据时，如果真的赋值了0或者NULL，不会是0或者NULL
#而是沿着上一次的数值，不会添加0和NULL


#举例：在创建表时添加自增列
CREATE TABLE test7(
id INT PRIMARY AUTO_INCREMENT,
`name` VARCHAR(15)
);

#举例：在修改表时添加自增列
ALTER TABLE test7
MODIFY id PRIMARY KEY AUTO_INCREMENT;

#举例：在修改表时删除自增列
ALTER TABLE test7
MODIFY id PRIMARY KEY;


#MYSQL8.0自增列的新特性：自增变量的持久化

#在5.7中，加入添加了5条数据，id就是1,2,3,4,5
#我删除了id=5，下一次添加时id=6，除非在删除id=5后，重启mysql
#服务器，下一次添加时id=5

#在8.0中，...即使重启服务器，下一次添加时id=6







