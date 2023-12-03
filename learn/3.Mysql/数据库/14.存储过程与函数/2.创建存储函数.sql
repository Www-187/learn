#存储函数
#就类比与开发语言的函数，括号里只是传入参数，一定有返回值

#举例1：创建存储函数（空参）
DELIMITER $
CREATE FUNCTION select_emp_name()
#这里写函数的特性等...
#如果不写会报错：“ you might want to use the less safe
#log_bin_trust_function_creators variable ”

#解决方式一：加上函数的特性即可
RETURNS VARCHAR(25)
	DETERMINISTIC
	CONTAINS SQL
	 READS SQL DATA
	 
#解决方式二，设置全局变量：SET GLOBAL log_bin_trust_function_creators = 1;	 	 
	 
BEGIN
RETURN(
	SELECT email
	FROM employees
	WHERE last_name='Abel'
);
END $

DELIMITER ;

#举例2：调用存储函数
SELECT select_emp_name();


#举例3：创建存储函数（有参）
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $
CREATE FUNCTION select_email_by_id(emp_id INT)#注意参数数据类型
RETURNS VARCHAR(20) #这里写RETURNS，返回值数据类型
BEGIN
RETURN(
	SELECT email
	FROM employees
	WHERE employee_id=emp_id
	);
END $
DELIMITER ;

#举例3：调用存储函数（有参）
#方式1：
SELECT select_email_by_id(101);
#方式2：
SET @emp_id=101;
SELECT select_email_by_id(@emp_id);
































