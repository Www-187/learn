#字符串类型
#CHAR 、 VARCHAR 、 TINYTEXT 、 TEXT 、 MEDIUMTEXT 、LONGTEXT 、 ENUM 、 SET

#1.CHAR
CREATE TABLE test_char1(
	c1 CHAR,#默认存一个字符
	c2 CHAR(5)
);

DESC test_char1;

INSERT INTO test_char1
VALUES('a','Tom');#c2定义的长度是5，默认用空格去填充，但是在查询时不显示空格

SELECT * FROM test_char1;

INSERT INTO test_char1(c2)
VALUES('a ');#这里的空格被出去了，存进去的依旧是a

SELECT CHAR_LENGTH(c2)
FROM test_char1;


#2.VARCHAR
#定义时必须指明宽度


CREATE TABLE test_varchar1(
	`NAME` VARCHAR #错误
);


#最大长度可不是65535，而是21845,3倍关系，存21845个汉字
#Column length too big for column 'NAME' (max = 21845);
CREATE TABLE test_varchar2(
	NAME VARCHAR(65535) #错误
);


#正确写法
CREATE TABLE test_varchar3(
	NAME VARCHAR(5)
);
INSERT INTO test_varchar3
VALUES('尚硅谷'),('尚  11');

SELECT * FROM test_varchar3;

#Data too long for column 'NAME' at row 1
INSERT INTO test_varchar3
VALUES('尚硅谷IT教育');

#对比CHAR和VARCHAR()



#3. TINYTEXT 、 TEXT 、 MEDIUMTEXT 、LONGTEXT

CREATE TABLE test_text(
	tx TEXT
);

INSERT INTO test_text
VALUES('atguigu ');

SELECT CHAR_LENGTH(tx)
FROM test_text; #8 此时是加上了空格，说明在存储时并没有删除空格


#4.ENUM类型
#在定义时，与java相同，即有限个对象
CREATE TABLE test_enum(
	season ENUM('春','夏','秋','冬','unknow')
);

#在向表中添加数据时，只能添加定义好的数据
INSERT INTO test_enum
VALUES('春'),('秋');


#不能在一个字段中添加多个
INSERT INTO test_enum
VALUES('春','秋');

# 忽略大小写
INSERT INTO test_enum
VALUES('UNKNOW');

# 允许按照角标的方式获取指定索引位置的枚举值
#注意角标是从1开始的
INSERT INTO test_enum
VALUES('1'),(3);

# Data truncated for column 'season' at row 1
INSERT INTO test_enum
VALUES('ab');

# 当ENUM类型的字段没有声明为NOT NULL非空时，插入NULL也是有效的
INSERT INTO test_enum
VALUES(NULL);




#5.SET类型（看成是可多选的ENUM）
CREATE TABLE test_set(
	s SET ('A', 'B', 'C')
);


INSERT INTO test_set (s) 
VALUES ('A'), ('A,B');

#插入重复的SET类型成员时，MySQL会自动删除重复的成员
INSERT INTO test_set (s) 
VALUES ('A,B,C,A');

#向SET类型的字段插入SET成员中不存在的值时，MySQL会抛出错误。
INSERT INTO test_set (s) 
VALUES ('A,B,C,D');

SELECT *
FROM test_set;









