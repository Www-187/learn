#创建和管理数据库
CREATE DATABASE IF NOT EXISTS test1;


#使用数据库
#1.查看全部的数据库
SHOW DATABASES;

#2.切换数据库
USE test1;

#3.查看当前数据库有那些表
USE atguigudb;
SHOW TABLES;

#4.查看当前使用的数据库
SELECT DATABASE();

#5.查看指定数据库下保存的表
#from后加数据库
SHOW TABLES FROM mysql;


#5.5查看创建数据库的结构
SHOW CREATE DATABASE test1;

#6.修改数据库（再没表时使用，否则成本高）
#修改数据库的字符集
ALTER DATABASE test1 CHARACTER SET 'gbk';


#7.删除数据库
DROP DATABASE IF EXISTS test1;



