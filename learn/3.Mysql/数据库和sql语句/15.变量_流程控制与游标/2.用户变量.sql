#用户变量

#分为：
#会话用户变量：使用一个@，作用域和会话变量一样，只对 当前连接 会话有效。
#局部变量：不使用@，因为作用域比较小，只在 BEGIN 和 END 语句块中有效。局部变量只能在 存储过程和函数 中使用。


#1.会话用户变量

#1.1定义
#方式1：“=”或“:=”
SET @用户变量 = 值;
SET @用户变量 := 值;

SET @m1=10;
SET @m2:=20;
SET @m3=@m1+@m2;


#方式2：“:=” 或 INTO关键字
SELECT @用户变量 := 表达式 [FROM 等子句];
SELECT 表达式 INTO @用户变量 [FROM 等子句];

#方式2.1
SELECT @count := COUNT(*) 
FROM employees;

#方式2.2(推荐)
SELECT AVG(salary) INTO @avg_sal
FROM employees;



#1.2查看
SELECT @用户变量

SELECT @m3;
SELECT @count;
SELECT @avg_sal;



#2.局部变量
#只能在存储过程或存储函数中使用，没有@

/*
1.定义：可以使用 DECLARE 语句定义一个局部变量，要有数据类型
2.作用域：仅仅在定义它的 BEGIN ... END 中有效
3.位置：只能放在 BEGIN ... END 中，而且只能放在第一句

4.声明格式：DECLARE 变量名 类型[默认值]，没有默认值为NULL

5.赋值：
方式1：
SET 变量名=值;
SET 变量名:=值;

方式2：
SELECT 字段名 INTO 变量名
FROM 表

6.使用：
SELECT 变量名

*/
DELIMITER $

CREATE PROCEDURE proce_1()
BEGIN
	#声明局部变量，全部都是;
	DECLARE a INT DEFAULT 0;
	DECLARE b INT;#默认是NULL
	DECLARE c,d INT;
	DECLARE `name` VARCHAR(25);
        #赋值，全部都是;
        SET a=2;
        SET b:=3;
        SELECT last_name INTO emp_name 
        FROM employees;
        #使用，全部都是;
        #在存储过程，函数里使用，出了就没法使用
        SELECT a,b,emp_name;

END $

DELIMITER ;




#举例：声明两个变量，求和并打印

#方式1：会话用户变量
SET @a1=10;
SET @a2:=20;
SET @a3=@a1+@a2;
SELECT @a3;

#方式：局部变量
DELIMITER $
CREATE PROCEDURE a1_a2_sum()
BEGIN
	DECLARE b1 INT;
	DECLARE b2 INT;
	DECLARE b3 INT;
	SET b1=10;
	SET b2=20;
	SET b3=b1+b2;
	SELECT b3;

END $

DELIMITER ;

CALL a1_a2_sum;




#举例：创建存储过程“different_salary”查询某员工和他领导的薪资差距，
#并用IN参数emp_id接收员工id，用OUT参数dif_salary输出薪资差距结果。

DELIMITER $
CREATE PROCEDURE different_salary(IN emp_id INT,OUT dif_salary DOUBLE)
BEGIN
	#定义变量
	DECLARE emp_sal DOUBLE DEFAULT 0.0;#记录员工的工资
	DECLARE mgr_sal DOUBLE DEFAULT 0.0;#记录管理者的工资
	DECLARE mgr_id INT DEFAULT 0;#记录管理者的id
	#赋值
	#查看员工的工资
	SELECT salary INTO emp_sal
	FROM employees
	WHERE employee_id=emp_id;
	#查看员工的管理者的id
	SELECT manager INTO mgr_id 
	FROM employees
	WHERE employee_id=emp_id;
	#查看员工的管理者的工资
	SELECT salary INTO mgr_sal
	FROM employees
	WHERE employee_id=mgr_id;
	#计算差值
	SELECT dif_salary=mgr_sal-emp_sal;
	
END $
DELIMITER ;

#定义会话用户变量
SET @emp_id :=101;
SET @def_sal=0;
#调用存储过程，传入参数
CALL different_salary(@emp_id,@dif_sal);
#查看差值
SELECT @def_sal;
