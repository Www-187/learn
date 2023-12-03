#创建存储过程
#关键字：PROCEDURE，定义存储过程
#关键字：DELIMITER，改变结束符号

#举例1：创建存储过程（无参无返回），查询所有员工
DELIMITER $#定义以$作为结束符号

CREATE PROCEDURE  select_all_data()#记得加括号，这依旧是函数
BEGIN
	SELECT * FROM employees;
END $

DELIMITER ;#在还原回去


#举例2：存储过程（无参无返回）的调用
#关键字：CALL
CALL select_all_data();


#举例3：创建存储过程（无参有返回），返回最高工资
DELIMITER $

CREATE PROCEDURE select_max_salary(OUT ms DOUBLE(10,2))#OUT表示返回，后面加返回值的名和类型
BEGIN
	SELECT MAX(salary) INTO ms#查询的字段要手动传递给返回值，注意数据类型一定要对应上
	FROM employees;
END $

DELIMITER ;

#举例4：调用存储过程（无参有返回），返回最高工资
#ms是用户自定义的变量，返回值
#注意此时是将查询到的值给了ms，我们需要查看输出变量ms，才能看到查询的值
CALL select_max_salary(@ms);
SELECT @ms;



#举例5:创建存储过程（有参无返回），返回某人的工资
DELIMITER $

CREATE PROCEDURE select_someone_salary(IN empname VARCHAR(20))
BEGIN
	SELECT salary
	FROM employees
	WHERE employees.`last_name`=empname;
END $

DELIMITER ;


#举例6:调用存储过程（有参无返回），返回某人的工资
#方式1：
CALL select_someone_salary('Abel');
#方式2：
SET @empname :='Abel';#将字符串赋值给用户定义的变量empname，
CALL select_someone_salary(@empname);#在传递给存储过程


#举例7:创建存储过程（有参有返回），返回某人的工资
DELIMITER $
CREATE PROCEDURE select_someone_salary_INOUT(IN empname VARCHAR(20),OUT sal DOUBLE(10,2))
BEGIN
	SELECT salary INTO sal
	FROM employees
	WHERE employees.`last_name`=empname;
END $
DELIMITER ;

#举例8:调用存储过程（有参有返回），返回某人的工资
SET @empname :='Abel';#将字符串传递给变量
CALL select_someone_salary_INOUT(@empname,@sal);
SELECT @sal;#查看输出变量




#举例9：创建存储过程（有INOUT）,返回某人的领导的姓名
DELIMITER $
CREATE PROCEDURE show_mgr_name(INOUT empname VARCHAR(25))
BEGIN
	SELECT last_name INTO empname
	FROM employees
	WHERE employee_id=(
		SELECT manager_id
		FROM employees e1
		WHERE e1.last_name=empname);
END $
DELIMITER ;

#举例10：调用存储过程（有INOUT）,返回某人的领导的姓名

SET @empname='Abel';
CALL show_mgr_name(@empname);
SELECT @empname;












