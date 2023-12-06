#游标
#作用:精确定位到一条记录，并对这条记录进行操作，具体的使用一条一条的数据
#不同的DBMS，对游标的操作不同
#使用过程：
#1.定义游标：DECLARE 游标名 CURSOR FOR 结果集（通常是查询语句）;
#2.使用游标：OPEN 游标名;
#3.使用游标，取数据，注意字段的对应：FETCH 游标名 INTO 定义好的变量名 ;
#假设我的游标SELECT了员工名和工资，那么在使用游标时，当走到一条具体的记录，
#就会有两个值员工名和工资，可以将这两个值赋值给定义好的变量，注意字段与变量的对应，就可以进行操作了
#4.关闭游标：CLOSE 游标名;

#举例：使用游标
/*
创建存储过程“get_count_by_limit_total_salary()”，声明IN参数 limit_total_salary，DOUBLE类型；声明
OUT参数total_count，INT类型。函数的功能可以实现累加薪资最高的几个员工的薪资值，直到薪资总和
达到limit_total_salary参数的值，返回累加的人数给total_count。
*/
DELIMITER $
CREATE PROCEDURE test_cursor(IN limit_total_salary DOUBLE,OUT total_count INT )
BEGIN
	#声明局部变量
	#记录累加的工资
	DECLARE sum_sal DOUBLE DEFAULT 0.0;
	#记录每一条工资
	DECLARE emp_sal DOUBLE DEFAULT 0.0;
	#记录取了几个人的工资
	DECLARE emp_count INT DEFAULT 0;

	#开始用游标
	#1.声明游标
	DECLARE emp_cursor CURSOR FOR SELECT salary FROM employees ORDER salary DESC;
	#2.打开游标
	OPEN emp_cursor;
	#3.使用游标，取数据
	WHILE sum_sal<limit_total_salary DO
	FETCH emp_cursor INTO emp_sal;
	SET sum_sal=sum_sal+emp_sal;
	SET emp_count=emp_count+1;
	END WHILE;
	SET total_count=emp_count;
	#4.关闭游标
	CLOSE emp_cursor;
	
END $
DELIMITER ;

CALL test_cursor(200000,@);














