#定义条件与处理程序

#案例1：
#案例分析：创建一个名称为“UpdateDataNoCondition”的存储过程
DELIMITER //

CREATE PROCEDURE UpdateDataNoCondition()
BEGIN
	SET @x = 1;
UPDATE employees SET email = NULL WHERE last_name = 'Abel';
	SET @x = 2;
UPDATE employees SET email = 'aabbel' WHERE last_name = 'Abel';
	SET @x = 3;
END //

DELIMITER ;

#调用存储过程：
CALL UpdateDataNoCondition();
#错误代码： 1048 Column 'email' cannot be null
#查看x的值，看出存储过程在哪里停止
SELECT @x;#x=1，


#1.定义条件：
/*
定义条件就是给MySQL中的错误码命名，这有助于存储的程序代码更清晰。
它将一个 错误名字 和 指定的
错误条件 关联起来。这个名字可以随后被用在定义处理程序的 
DECLARE HANDLER 语句中。
*/

/*
错误码的说明：
MySQL_error_code 和 sqlstate_value 都可以表示MySQL的错误。
MySQL_error_code是数值类型错误代码。
sqlstate_value是长度为5的字符串类型错误代码。
例如，在ERROR 1418 (HY000)中，1418是MySQL_error_code，'HY000'是sqlstate_value。
例如，在ERROR 1142（42000）中，1142是MySQL_error_code，'42000'是sqlstate_value。
*/

#举例：定义条件
#格式：DECLARE 错误名称 CONDITION FOR 错误码（或错误条件）

#举例1：定义“Field_Not_Be_NULL”错误名与MySQL中违反非空约束的错误类型是“ERROR 1048 (23000)”对
#应。
#方式1：使用MYSQL ERROR CODE
DECLARE Field_Not_Be_NULL CONDITION FOR 1048;
#方式2: 使用sqlstate_value
DECLARE Field_Not_Be_NULL CONDITION FOR SQLSTATE '23000';





#2.定义处理程序：
/*
处理方式：处理方式有3个取值：CONTINUE、EXIT、UNDO。
CONTINUE ：表示遇到错误不处理，继续执行。
EXIT ：表示遇到错误马上退出。
UNDO ：表示遇到错误后撤回之前的操作。MySQL中暂时不支持这样的操作。
错误类型（即条件）可以有如下取值：
SQLSTATE '字符串错误码' ：表示长度为5的sqlstate_value类型的错误代码；
MySQL_error_code ：匹配数值类型错误代码；
错误名称 ：表示DECLARE ... CONDITION定义的错误条件名称。
SQLWARNING ：匹配所有以01开头的SQLSTATE错误代码；
NOT FOUND ：匹配所有以02开头的SQLSTATE错误代码；
SQLEXCEPTION ：匹配所有没有被SQLWARNING或NOT FOUND捕获的SQLSTATE错误代码；

*/

#格式：DECLARE 处理方式 HANDLER FOR 错误类型 处理语句

#方法1：捕获sqlstate_value
DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @info = 'NO_SUCH_TABLE';
#方法2：捕获mysql_error_value
DECLARE CONTINUE HANDLER FOR 1146 SET @info = 'NO_SUCH_TABLE';
#方法3：先定义条件，再调用
DECLARE no_such_table CONDITION FOR 1146;
DECLARE CONTINUE HANDLER FOR NO_SUCH_TABLE SET @info = 'NO_SUCH_TABLE';
#方法4：使用SQLWARNING
DECLARE EXIT HANDLER FOR SQLWARNING SET @info = 'ERROR';
#方法5：使用NOT FOUND
DECLARE EXIT HANDLER FOR NOT FOUND SET @info = 'NO_SUCH_TABLE';
#方法6：使用SQLEXCEPTION
DECLARE EXIT HANDLER FOR SQLEXCEPTION SET @info = 'ERROR';


#案例：重新定义存储过程，体现完整的错误的处理程序

#先定义错误条件，错误码
DECLARE Field_Not_Be_NULL CONDITION FOR 1048;
DECLARE Field_Not_Be_NULL CONDITION FOR SQLSTATE '23000';

#在定义存储过程，在其中定义处理程序
DELIMITER //

CREATE PROCEDURE UpdateDataNoCondition()
BEGIN
	#声明处理程序
	#处理方式1（多选1即可）：
	DECLARE CONTINUE HANDLER FOR 1048 SET @info = 'NO_SUCH_TABLE';
	#处理方式2（多选1即可）：
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @info = 'NO_SUCH_TABLE';
	
	SET @x = 1;
UPDATE employees SET email = NULL WHERE last_name = 'Abel';
	SET @x = 2;
UPDATE employees SET email = 'aabbel' WHERE last_name = 'Abel';
	SET @x = 3;
END //

DELIMITER ;










