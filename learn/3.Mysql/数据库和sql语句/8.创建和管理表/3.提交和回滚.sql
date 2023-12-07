#COMMIT和ROLLBACK
#1.COMMIT:提交数据。一但提交数据，则永久保存在数据库中，不可进行
#         回滚


#2.ROLLBACK:回滚数据。实现数据的回滚，回滚到最近的一次COMMIT之后


#对比：truncate table和delete from
#相同点：都可以实现对数据的清除，保留表结构
#不同点：truncate table，执行后不可进行回滚
#        delete from，可以进行回滚 

#对比：DDL和DML
#DDL执行完后一定提交一次，是不可回滚

#DML默认也是不可回滚，但是可以通过修改参数实现回滚
#set autocommit=false;此时就能实现回滚，该指令只对DML有效


#MYSQL8.0 DDL的原子性

CREATE DATABASE mytest;

USE mytest;

CREATE TABLE book1(
book_id INT ,
book_name VARCHAR(255)
);
#这里提交了

SHOW TABLES;

SELECT *
FROM book1;
CREATE TABLE book2(
book_id INT);

DROP TABLE book1,book2,book3;#不成功，回滚到上一次提交，其中表数据还在








