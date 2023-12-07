#流程控制
#在存储过程，存储函数中使用

#1.分支结构：IF
/*
IF 表达式1 THEN 操作1
[ELSEIF 表达式2 THEN 操作2]……
[ELSE 操作N]
END IF
*/

#举例：
DELIMITER $

CREATE PROCEDURE test_if()

BEGIN
	#声明局部变量
	DECLARE stu_name VARCHAR(25);
	#IF
	IF stu_name IS NULL THEN SELECT 'if1';#注意这里有;
	ELSEIF stu_name IS NOT NULL THEN SELECT 'elseif2';#注意这里有;
	ELSE SELECT 'else3';#注意这里有;
	END IF;

END $

DELIMITER ;

CALL test_if;


#举例4：声明存储过程“update_salary_by_eid3”，
#定义IN参数emp_id，输入员工编号。判断该员工薪资如果
#低于9000元，就更新薪资为9000元；薪资如果大于等于9000元
#且低于10000的，但是奖金比例为NULL的，就更新奖金比例为0.01
#；其他的涨薪100元。
DELIMITER $
CREATE PROCEDURE update_salary_by_eid3(IN emp_id INT)
BEGIN
	#定义员工的工资
	DECLARE emp_sal DOUBLE;
	#定义员工的奖金率
	DECLARE emp_pct DECIMAL(3,2);
	#查询员工的工资
	SELECT salary INTO emp_sal
	FROM employees
	WHERE employee_id=emp_id;
	#查询员工的奖金率
	SELECT comssion_pct INTO emp_pct
	FROM employees
	WHERE employee_id=emp_id;	
	#判断
	IF emp_sal<9000 
		THEN UPDATE employees SET salary=9000 WHERE employee_id=emp_id;
	ELSEIF emp_sal>9000 AND emp_sal<10000 AND emp_pct IS NULL 
		THEN UPDATE employees SET comssion_pct=0.01 WHERE employee_id=emp_id;
	ELSE 
		UPDATE employees SET salary=salary+100 WHERE employee_id=emp_id;
	END IF;
END $
DELIMITER ;


#2.分支结构：CASE
#和原来在SELECT中的CASE一样


#CASE情况一：WHEN后面是值
/*
CASE 表达式
WHEN 值1 THEN 结果1或语句1(如果是语句，需要加分号)
WHEN 值2 THEN 结果2或语句2(如果是语句，需要加分号)
...
ELSE 结果n或语句n(如果是语句，需要加分号)
END case（如果是放在begin end中需要加上case，如果放在select后面不需要）
*/

#CASE情况二：WHEN后面是表达式，即单位
#情况二：类似于多重if
/*
CASE
WHEN 条件1 THEN 结果1或语句1(如果是语句，需要加分号?)
WHEN 条件2 THEN 结果2或语句2(如果是语句，需要加分号?)
...
ELSE 结果n或语句n(如果是语句，需要加分号？)
END case（如果是放在begin end中需要加上case，如果放在select后面不需要）
*/
DELIMITER $

CREATE PROCEDURE test_case1()

BEGIN
	#定义变量
	DECLARE var1 INT DEFAULT 1;
	#分支
	CASE var1
	WHEN 1 THEN SELECT '1';
	WHEN 2 THEN SELECT '2';
	END CASE;
	#分支
	CASE WHEN var1 IS NOT NULL THEN SELECT '1';
	WHEN var1 IS NULL THEN SELECT '2';
	END CASE;
END $

DELIMITER ;













