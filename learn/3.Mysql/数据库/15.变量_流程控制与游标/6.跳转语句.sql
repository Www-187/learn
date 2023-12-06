#跳转语句

#LEAVE
/*
可以用在循环语句内，或者以 BEGIN 和 END 包裹起来的程序体内，
表示跳出循环或者跳出程序体的操作。
如果你有面向过程的编程语言的使用经验，你可以把 LEAVE 理解为 break。
*/
/*
格式：
LEAVE 标记名
*/

/*
举例：
创建存储过程 “leave_begin()”，声明INT类型的IN参数num。给BEGIN...END加标记名，并在
BEGIN...END中使用IF语句判断num参数的值。
如果num<=0，则使用LEAVE语句退出BEGIN...END；
如果num=1，则查询“employees”表的平均薪资；
如果num=2，则查询“employees”表的最低薪资；
如果num>2，则查询“employees”表的最高薪资。
*/
DELIMITER $
CREATE PROCEDURE test_leave(IN num INT)
#创建LEAVE标签，注意 ：
begin_label:BEGIN
	IF num<=0
		THEN LEAVE begin_label;#离开 标签
	ELSEIF num=1
		THEN SELECT AVG(salary) FROM employees;
	ELSEIF num=1
		THEN SELECT MIN(salary) FROM employees;
	ELSE 
		THEN SELECT MAX(salary) FROM employees;
	END IF;

END $
DELIMITER ;




#ITERATE
/*
ITERATE语句：只能用在循环语句（LOOP、REPEAT和WHILE语句）内，表示重新开始循环，将执行顺序
转到语句段开头处。如果你有面向过程的编程语言的使用经验，你可以把 ITERATE 理解为 continue，意
思为“再次循环”。
*/

/*
格式：
ITERATE label
*/

#： 定义局部变量num，初始值为0。循环结构中执行num + 1操作。
#如果num < 10，则继续执行循环；
#如果num > 15，则退出循环结构；

DELIMITER //
CREATE PROCEDURE test_iterate()
BEGIN
	DECLARE num INT DEFAULT 0;
	#循环
	my_loop:LOOP
	SET num = num + 1;
	IF num < 10 THEN ITERATE my_loop;#开始下一次循环
	ELSEIF num > 15 THEN LEAVE my_loop;
	END IF;
	END LOOP;
END //
DELIMITER ;
























