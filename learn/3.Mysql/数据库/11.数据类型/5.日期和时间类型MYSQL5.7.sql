#日期和时间类型

#日期时间注意单引号

/*
YEAR 类型通常用来表示年
DATE 类型通常用来表示年、月、日
TIME 类型通常用来表示时、分、秒
DATETIME 类型通常用来表示年、月、日、时、分、秒
TIMESTAMP 类型通常用来表示带时区的年、月、日、时、分、秒
*/


#1.YEAR
#YEAR类型用来表示年份，在所有的日期时间类型中所占用的存储空间最小，只需要 1个字节 的存储空间。
#以4位字符串或数字格式表示YEAR类型，其格式为YYYY，最小值为1901，最大值为2155。

CREATE TABLE test_year1(
`year` YEAR
);

INSERT INTO test_year1
VALUES('2011');

SELECT * FROM test_year1;

#2.DATE
#格式为 YYYY-MM-DD /YYYYMMDD
#其最小取值为1000-01-01，最大取值为9999-12-03。YYYYMMDD格式会被转化为YYYY-MM-DD格式。

CREATE TABLE test_date1(
f1 DATE
);

INSERT INTO test_date1
VALUES('2022-11-11');

INSERT INTO test_date1
VALUES('20110203');

INSERT INTO test_date1
VALUES(NOW());#此时只取年月日，舍去时分秒

SELECT * FROM test_date1;


#3.TIME
#可以使用“HH:MM:SS”格式来表示TIME类型，其中，HH表示小时，MM表示分钟，SS表示秒。
#见课件
CREATE TABLE test_time1(
f1 TIME
);

INSERT INTO test_time1
VALUES('2 12:30:29'), ('12:35:29'), ('12:40'), ('2 12:40'),('1 05'), ('45');
#       60:30:29        12:35:29    12:40:00   60:40:00     29:00:00 00:00:45
INSERT INTO test_time1
VALUES ('123520'), (124011),(1210);
#       12:35:20   12:40:11 00:12:10 
INSERT INTO test_time1
VALUES (NOW()), (CURRENT_TIME());
#      18:35:09  18:35:09

SELECT * FROM test_time1;


#4.DATETIME
#见课件
CREATE TABLE test_datetime1(
dt DATETIME
);

INSERT INTO test_datetime1
VALUES ('2021-01-01 06:50:30'), ('20210101065030');

INSERT INTO test_datetime1
VALUES ('99-01-01 00:00:00'), ('990101000000'), ('20-01-01 00:00:00'),
('200101000000');

INSERT INTO test_datetime1
VALUES (20200101000000), (200101000000), (19990101000000), (990101000000);

INSERT INTO test_datetime1
VALUES (CURRENT_TIMESTAMP()), (NOW());

SELECT * FROM test_datetime1;

#5.TIMESTAMP

CREATE TABLE test_timestamp1(
ts TIMESTAMP
);

INSERT INTO test_timestamp1
VALUES ('1999-01-01 03:04:50'), ('19990101030405'), ('99-01-01 03:04:05'),
('990101030405');

INSERT INTO test_timestamp1
VALUES ('2020@01@01@00@00@00'), ('20@01@01@00@00@00');

INSERT INTO test_timestamp1
VALUES (CURRENT_TIMESTAMP()), (NOW());

#Incorrect datetime value
INSERT INTO test_timestamp1
VALUES ('2038-01-20 03:14:07');





