#循环结构
#LOOP，WHILE，REPEAT

#循环结构之：LOOP
#要搭配LEAVE去使用，否则是死循环
/*
LOOP循环语句用来重复执行某些语句。LOOP内的语句一直重复执行直到循环被退出（使用LEAVE子
句），跳出循环过程。
*/
/*
格式：
[loop_label:] LOOP
循环执行的语句
END LOOP [loop_label]
*/
#举例1：
DELIMITER $
CREATE PROCEDURE test_loop()
BEGIN
	DECLARE num INT DEFAULT 0;
	#循环
	#loop_label是起的标签名
	loop_label:LOOP
	#循环语句
	SET num=num+1;
	IF num>10 THEN LEAVE loop_label;
	END id;#循环语句结束
	END LOOP loop_label;
	#查看值
	SELECT num;
END $
DELIMITER ;

#举例：当市场环境变好时，公司为了奖励大家，决定给大家涨工资。
#声明存储过程“update_salary_loop()”，声明OUT参数num，
#输出循环次数。存储过程中实现循环给大家涨薪，薪资涨为
#原来的1.1倍。直到全公司的平均薪资达到12000结束。并统计循环次数。
DELIMITER //
CREATE PROCEDURE update_salary_loop(OUT num INT)
BEGIN
	#①初始化
	#定义平均工资变量
	DECLARE avg_salary DOUBLE;
	#定义循环的执行次数变量
	DECLARE loop_count INT DEFAULT 0;
	#查询平均工资，并赋值
	SELECT AVG(salary) INTO avg_salary FROM employees;
	#循环
	label_loop:LOOP
	#②循环条件
	#如果大于了平均工资，就直接结束循环
	IF avg_salary >= 12000 THEN LEAVE label_loop;
	END IF;
	#③循环体
	#如果没有，就加工资
	UPDATE employees SET salary = salary * 1.1;
	#加薪次数加1
	SET loop_count = loop_count + 1;
	#④迭代
	#注意加薪玩之后一定要重新计算平均工资
	SELECT AVG(salary) INTO avg_salary FROM employees;
	#结束循环
	END LOOP label_loop;
	#给输出的值赋值
        SET num = loop_count;
END //
DELIMITER ;



#循环结构之：WHILE
#先判断条件，在进行一次循环
/*
WHILE语句创建一个带条件判断的循环过程。WHILE在执行语句执行时，先对指定的表达式进行判断，如
果为真，就执行循环内的语句，否则退出循环。
*/

/*
格式：
[while_label:] WHILE 循环条件 DO
循环体
END WHILE [while_label];
*/


#举例1：i值小于10时，将重复执行循环过程
DELIMITER //
CREATE PROCEDURE test_while()
BEGIN
	#①初始化：
	DECLARE i INT DEFAULT 0;
	#②循环条件：i<10
	WHILE i < 10 DO
	#③循环体...这里没写
	#④迭代：
	SET i = i + 1;
	END WHILE;
	SELECT i;
END //
DELIMITER ;



#循环条件：REPEAT
#上来直接执行一次循环，类似于do...while...
/*
REPEAT语句创建一个带条件判断的循环过程。与WHILE循环不同的是，REPEAT 循环首先会执行一次循
环，然后在 UNTIL 中进行表达式的判断，如果满足条件就退出，即 END REPEAT；如果条件不满足，则会
就继续执行循环，直到满足退出条件为止。
*/

/*
格式：
[repeat_label:] REPEAT
循环体的语句
UNTIL 结束循环的条件表达式
END REPEAT [repeat_label]
*/
#举例1：变量加1
DELIMITER $
CREATE PROCEDURE test_repeat()
BEGIN
	#①初始化
	#声明变量
	DECLARE num INT DEFAULT 0;
	#循环
	REPEAT
	#②循环体
	#③迭代
	SET num=num+1
	#④循环条件
	#这里循环条件和上面的意思是反过来的，注意
	UNTIL num>=10#这里不能有分号，注意
	END REPEAT;
	
	#查看
	SELECT num;

END $
DELIMITER ;








