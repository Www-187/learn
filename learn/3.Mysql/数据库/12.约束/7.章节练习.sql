#约束章节练习
#练习一：
CREATE TABLE emp2(
id INT,
emp_name VARCHAR(15)
);

CREATE TABLE dept2(
id INT,
dept_name VARCHAR(15)
);

#1.向表emp2的id列中添加PRIMARY KEY约束
#方式1：
ALTER TABLE emp2
ADD PRIMARY KEY(id);#使用表级约束方式，相当于直接在创建表最后添加约束

#方式2：
ALTER TABLE emp2
MODIFY id INT PRIMARY KEY;#使用列级约束方式，相当于在字段后面添加约束


#2. 向表dept2的id列中添加PRIMARY KEY约束
#方式1：
ALTER TABLE dept2
ADD PRIMARY KEY(id);
#方式2：
ALTER TABLE dept2
MODIFY id INT PRIMARY KEY;

#3. 向表emp2中添加列dept_id，并在其中定义FOREIGN KEY约束，
#与之相关联的列是dept2表中的id列。
ALTER TABLE emp2
ADD COLUMN dept_id INT;

ALTER TABLE emp2
ADD CONSTRAINT fk_emp2_dept_id FOREIGN KEY(dept_id) REFERENCES dept2(id);



#练习二：
#给书编号id加主键
ALTER TABLE books
ADD PRIMARY KEY(id);
#给书编号id加自增列
ALTER TABLE books
MODIFY id INT AUTO_INCREMENT;
#给书作者加非空
ALTER TABLE books
MODIFY `authors` VARCHAR(100) NOT NULL;
#给书价格加非空
ALTER TABLE books
MODIFY `price` FLOAT  NOT NULL;
#给书出版日期加非空
ALTER TABLE books
MODIFY `pubdate` YEAR  NOT NULL;
#给书库存加非空
ALTER TABLE books
MODIFY `num` INT(11) NOT NULL;


#练习三：
#2. 按照下表给出的表结构在test04_company数据库中创建两个数据表offices和employees
CREATE TABLE offices(
	officeCode INT(10) PRIMARY KEY,
	city VARCHAR(50) NOT NULL,
	address VARCHAR(50),
	country VARCHAR(50) NOT NULL,
	postalCode VARCHAR(15) UNIQUE
);
CREATE TABLE employees(
	employeeNumber INT(11) PRIMARY KEY AUTO_INCREMENT,
	lastname VARCHAR(50) NOT NULL,
	firstname VARCHAR(50) NOT NULL,
	mobile VARCHAR(25) UNIQUE,
	officeCode INT(10) NOT NULL,
	jobTitle VARCHAR(50) NOT NULL,
	brith DATETIME NOT NULL,
	note VARCHAR(255),
	sex VARCHAR(5),
	
	CONSISTENT fk1 FOREIGN KEY(officeCode) REFERENCES offices(officeCode)
);

#3. 将表employees的mobile字段修改到officeCode字段后面
#AFTER的使用
ALTER TABLE employees
MODIFY mobile VARCHAR(25) UNIQUE AFTER officeCode;

#4. 将表employees的birth字段改名为employee_birth
#修改CHANGE
ALTER TABLE employees
CHANGE brith employee_brith DATETIME;

#5. 修改sex字段，数据类型为CHAR(1)，非空约束
#注意依旧存在约束
ALTER TABLE employees
MODIFY sex CHAR(1) NOT NULL;

#6. 删除字段note
ALTER TABLE employees
DROP COLUMN note;

#7. 增加字段名favoriate_activity，数据类型为VARCHAR(100)
ALTER TABLE employees
ADD favoriate_activity VARCHAR(100);

#8. 将表employees名称修改为employees_info
ALTER TABLE employees
RENAME employees_info










