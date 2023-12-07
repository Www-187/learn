#存储过程与存储函数的查看修改和删除

#查看
#1.使用SHOW CREATE查看存储过程函数创建时的信息
SHOW CREATE PROCEDURE select_all_data;
SHOW CREATE FUNCTION select_emp_name;

#2.使用SHOW STATUS查看存储过程函数的状态信息
#客户端工具显示不清晰，可以使用命令行查看
#查看全部的存储过程函数的状态信息
SHOW PROCEDURE STATUS;
SHOW FUNCTION STATUS;

#查看某一个存储过程函数的状态信息
#加LIKE语句
SHOW PROCEDURE STATUS LIKE 'select_all_data';
SHOW CREATE FUNCTION LIKE 'select_emp_name';


#从information_schema.Routines表中查看存储过程和函数的信息
#PROCEDURE/FUNCTION要大写
SELECT * FROM information_schema.Routines
WHERE ROUTINE_NAME='存储过程或函数的名' [AND ROUTINE_TYPE = {'PROCEDURE/FUNCTION'}];


#修改
#此时只能修改存储过程函数的特性，即修改BEGIN前面的东西
#如果查询语句错了，只能删除存储过程函数在新建存储过程函数
ALTER PROCEDURE/FUNCTION select_all_data
SQL SECURITY INVOKER ,
COMMIT '修改信息';

#删除
DROP PROCEDURE/FUNCTION IF EXISTS select_all_data;

































