#触发器
#创建触发器
/*
CREATE TRIGGER 触发器名称
{BEFORE|AFTER} {INSERT|UPDATE|DELETE|SELECT} ON 关联表名 FOR EACH ROW
触发器执行的语句块
*/
CREATE TABLE test_trigger (
	id INT PRIMARY KEY AUTO_INCREMENT,
	t_note VARCHAR(30)
);
CREATE TABLE test_trigger_log (
	id INT PRIMARY KEY AUTO_INCREMENT,
	t_log VARCHAR(30)
);

/*
创建触发器：创建名称为before_insert的触发器，向test_trigger数据表插入数据之前，向
test_trigger_log数据表中插入before_insert的日志信息。
*/

DELIMITER $

CREATE TRIGGER before_insert_test_tri#触发器的名字
BEFORE INSERT ON test_trigger FOR EACH ROW #关联的表 

BEGIN
	INSERT INTO test_trigger_log(t_log)
	VALUES('before insert');
END $

DELIMITER ;

INSERT INTO test_trigger(t_note)
VALUES('111');


#查看触发器
#1.查看当前数据库的所有触发器的定义
SHOW TRIGGERS;

#2.查看当前数据库中某个触发器的定义
SHOW CREATE TRIGGER 触发器名;

#3.从系统库information_schema的TRIGGERS表中查询“salary_check_trigger”触发器的信息。
SELECT * FROM information_schema.TRIGGERS;

#删除触发器
DROP TRIGGER IF EXISTS 触发器名称;








