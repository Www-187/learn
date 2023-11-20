# 1、创建数据库test01_library
CREATE DATABASE IF NOT EXISTS test01_library CHARACTER SET 'utf8';
USE test01_library;

# 2、创建表 books，表结构如下：
CREATE TABLE books(
	id INT,
	`name` VARCHAR(50),
	`authors` VARCHAR(100),
	price FLOAT,
	pubdate YEAR,
	note VARCHAR(100),
	num INT
);

# 3、向books表中插入记录
# 1）不指定字段名称，插入第一条记录
# 2）指定所有字段名称，插入第二记录
# 3）同时插入多条记录（剩下的所有记录）
#1)
INSERT INTO books
VALUES(1,'Tal of AAA','Dickes',23,'1995','novel',11);

#2)
INSERT INTO books(id,`name`,`authors`,price,pubdate,note,num)
VALUES(2,'EmmaT Jane','lura',35,'1993','joke',22);

SELECT * FROM books;

#3)
INSERT INTO books
VALUES(3,'Story of Jane','Jane Tim',40,'2000','novel',0),
      (4,'Lovey Day','George Byron',20,'2005','novel',30),
      (5,'Old land','Honore Blade',30,'2010','law',0),
      (6,'The Battle Upton','Sara',30,'1999','medicine',40),
      (7,'Rose Hood','Richard haggard',28,'2008','cartoon',28);
      
SELECT * FROM books;

# 4、将小说类型(novel)的书的价格都增加5。
UPDATE  books SET price=price+5
WHERE books.note='novel';

SELECT * FROM books;

# 5、将名称为EmmaT的书的价格改为40，并将说明改为drama。
UPDATE books SET price=40,books.`note`='drama'
WHERE books.`name` LIKE '%EmmaT%';

SELECT * FROM books;

# 6、删除库存为0的记录。
DELETE FROM books 
WHERE books.`num`=0;

SELECT * FROM books;

# 7、统计书名中包含a字母的书
SELECT COUNT(*)
FROM books
WHERE books.`name` LIKE '%a%';

# 8、统计书名中包含a字母的书的数量和库存总量
SELECT COUNT(*),SUM(num)
FROM books
WHERE books.`name` LIKE '%a%';

# 9、找出“novel”类型的书，按照价格降序排列
SELECT *
FROM books b
WHERE b.`note`='novel'
ORDER BY b.`price` DESC;

# 10、查询图书信息，按照库存量降序排列，如果库存量相同的按照note升序排列
SELECT *
FROM books b
ORDER BY b.`num` DESC,b.`note` ASC;

# 11、按照note分类统计书的数量
SELECT COUNT(*),books.`note`
FROM books
GROUP BY books.`note`;

# 12、按照note分类统计书的库存量，显示库存量超过30本的
#在select中出现的字段，一定要在GROUP BY中出现，反之不一定
SELECT b.note
FROM books b
GROUP BY b.note
HAVING SUM(b.num)>30;

# 13、查询所有图书，每页显示5本，显示第二页
SELECT *
FROM books
LIMIT 5,5;

# 14、按照note分类统计书的库存量，显示库存量最多的
#显示库存量最多的：使用排序分页
SELECT b.`note`,SUM(num)
FROM books b
GROUP BY b.`note`
ORDER BY SUM(num) DESC
LIMIT 0,1;

# 15、查询书名达到10个字符的书，不包括里面的空格
#CHAR_LENGTH(),计算字符数
#REPLACE(NAME,' ','')，字段，存在的，替换的
SELECT *
FROM books
WHERE CHAR_LENGTH(REPLACE(NAME,' ',''))>=10;

# 16、查询书名和类型，其中note值为novel显示小说，
#law显示法律，medicine显示医药，cartoon显示卡通，
#joke显示笑话
SELECT b.`name`,CASE b.`note` WHEN 'novel' THEN '小说'
		            WHEN 'law' THEN '法律'
		            WHEN 'medicine' THEN '医药'
		            WHEN 'cartoon' THEN '卡通'
		            WHEN 'joke' THEN '笑话'
		            END AS '分类'
FROM books b;

# 17、查询书名、库存，其中num值超过30本的，显示滞销，
#大于0并低于10的，显示畅销，为0的显示需要无货
SELECT NAME,num,CASE
	WHEN num>30 THEN '滞销'
	WHEN num>0 AND num<10 THEN '畅销'
	WHEN num=0 THEN '无货'
	ELSE '正常'
	END AS "库存状态"
FROM books;

# 18、统计每一种note的库存量，并合计总量
#合计总量:最后使用 WITH ROLLUP
#美化：最后记录的note为NULL，替换NULL
SELECT IFNULL(b.`note`,'合计总量') AS note,SUM(b.`num`)
FROM books b
GROUP BY b.`note` WITH ROLLUP;

# 19、统计每一种note的数量，并合计总量
SELECT IFNULL(b.`note`,'总量') AS note,COUNT(*)
FROM books b
GROUP BY b.`note` WITH ROLLUP;

# 20、统计库存量前三名的图书
SELECT books.`name`
FROM books
ORDER BY books.`num` DESC
LIMIT 0,3;

# 21、找出最早出版的一本书
SELECT *
FROM books b
WHERE b.`pubdate`<=ALL(
	SELECT books.`pubdate`
	FROM books
);

# 22、找出novel中价格最高的一本书
SELECT *
FROM books b
WHERE b.`note`='novel'
ORDER BY b.`price` DESC
LIMIT 0,1;

# 23、找出书名中字数最多的一本书，不含空格
SELECT *
FROM books b
ORDER BY CHAR_LENGTH(REPLACE(b.`name`,' ','')) DESC
LIMIT 0,1;



