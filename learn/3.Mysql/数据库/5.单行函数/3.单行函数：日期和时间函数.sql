#日期和时间函数
#1.获取日期和时间
#CURDATE() ，CURRENT_DATE()，返回当前日期，只包含年、月、日

#CURTIME() ， CURRENT_TIME()，返回当前时间，只包含时、分、秒

#NOW() / SYSDATE() / CURRENT_TIMESTAMP() / LOCALTIME()
# /LOCALTIMESTAMP()，返回当前系统日期和时间

#UTC_DATE()，返回UTC（世界标准时间）日期

#UTC_TIME()，返回UTC（世界标准时间）时间
SELECT
CURDATE(),CURTIME(),NOW(),SYSDATE()+0,UTC_DATE(),
UTC_DATE()+0,UTC_TIME(),UTC_TIME()+0
FROM DUAL;

#2.日期与时间戳的转换
#UNIX_TIMESTAMP()，以UNIX时间戳的形式返回当前时间。
#                   SELECT UNIX_TIMESTAMP() ->1634348884
SELECT UNIX_TIMESTAMP(NOW())
FROM DUAL;

#UNIX_TIMESTAMP(date) 将时间date以UNIX时间戳的形式返回。
SELECT UNIX_TIMESTAMP(CURDATE())
FROM DUAL;

SELECT UNIX_TIMESTAMP('2011-11-11 11:11:11');

#FROM_UNIXTIME(timestamp) 将UNIX时间戳的时间转换为普通格式的时间
SELECT FROM_UNIXTIME(1576380910);


#3.获取月份、星期、星期数、天数等函数
#YEAR(date) / MONTH(date) / DAY(date)， 返回具体的日期值
#HOUR(time) / MINUTE(time) /SECOND(time)，返回具体的时间值
#MONTHNAME(date) 返回月份：January，...
#DAYNAME(date) 返回星期几：MONDAY，TUESDAY.....SUNDAY
#WEEKDAY(date) 返回周几，注意，周1是0，周2是1，。。。周日是6
#QUARTER(date) 返回日期对应的季度，范围为1～4
#WEEK(date) ， WEEKOFYEAR(date) 返回一年中的第几周
#DAYOFYEAR(date) 返回日期是一年中的第几天
#DAYOFMONTH(date) 返回日期位于所在月份的第几天
#DAYOFWEEK(date)返回周几，注意：周日是1，周一是2，。。。周六是7
SELECT YEAR(CURDATE()),MONTH(CURDATE()),DAY(CURDATE()),
HOUR(CURTIME()),MINUTE(NOW()),SECOND(SYSDATE())
FROM DUAL;

SELECT MONTHNAME('2021-10-26'),DAYNAME('2021-10-26'),WEEKDAY('2021-10-26'),
QUARTER(CURDATE()),WEEK(CURDATE()),DAYOFYEAR(NOW()),
DAYOFMONTH(NOW()),DAYOFWEEK(NOW())
FROM DUAL;

#4.日期的操作函数
#EXTRACT(type FROM date)，返回指定日期中特定的部分，type指定返回的值

SELECT EXTRACT(MINUTE FROM NOW()),EXTRACT( WEEK FROM NOW()),
EXTRACT( QUARTER FROM NOW()),EXTRACT( MINUTE_SECOND FROM NOW())
FROM DUAL;

#5. 时间和秒钟转换的函数
#TIME_TO_SEC(time)，将 time 转化为秒并返回结果值。转化的公式为： 小时*3600+分钟
#                                *60+秒
#SEC_TO_TIME(seconds) 将 seconds 描述转化为包含小时、分钟和秒的时间
 SELECT TIME_TO_SEC(NOW());

#6.1 计算日期和时间的函数
#DATE_ADD(datetime, INTERVAL expr type)，
#ADDDATE(date,INTERVAL expr type)，返回与给定日期时间相差INTERVAL时
#                                  间段的日期时间
#DATE_SUB(date,INTERVAL expr type)，
#SUBDATE(date,INTERVAL expr type)，返回与date相差INTERVAL时间间隔的日期

SELECT DATE_ADD(NOW(), INTERVAL 1 DAY) AS col1,DATE_ADD('2021-10-21 23:32:12',INTERVAL
1 SECOND) AS col2,
ADDDATE('2021-10-21 23:32:12',INTERVAL 1 SECOND) AS col3,
DATE_ADD('2021-10-21 23:32:12',INTERVAL '1_1' MINUTE_SECOND) AS col4,
DATE_ADD(NOW(), INTERVAL -1 YEAR) AS col5, #可以是负数
DATE_ADD(NOW(), INTERVAL '1_1' YEAR_MONTH) AS col6 #需要单引号
FROM DUAL;

SELECT DATE_SUB('2021-01-21',INTERVAL 31 DAY) AS col1,
SUBDATE('2021-01-21',INTERVAL 31 DAY) AS col2,
DATE_SUB('2021-01-21 02:01:01',INTERVAL '1 1' DAY_HOUR) AS col3
FROM DUAL;

#6.2 计算日期和时间的函数
#ADDTIME(time1,time2)，返回time1加上time2的时间。当time2为一个数字时，代表的是秒 ，可以为负数
#SUBTIME(time1,time2)，返回time1减去time2后的时间。当time2为一个数字时，代表的是 秒 ，可以为负数
#DATEDIFF(date1,date2) 返回date1 - date2的日期间隔天数
#TIMEDIFF(time1, time2) 返回time1 - time2的时间间隔
#FROM_DAYS(N) 返回从0000年1月1日起，N天以后的日期
#TO_DAYS(date) 返回日期date距离0000年1月1日的天数
#LAST_DAY(date) 返回date所在月份的最后一天的日期
#MAKEDATE(year,n) 针对给定年份与所在年份中的天数返回一个日期
#MAKETIME(hour,minute,second) 将给定的小时、分钟和秒组合成时间并返回
#PERIOD_ADD(time,n) 返回time加上n后的时间

SELECT
ADDTIME(NOW(),20),SUBTIME(NOW(),30),SUBTIME(NOW(),'1:1:3'),DATEDIFF(NOW(),'2021-10-
01'),
TIMEDIFF(NOW(),'2021-10-25 22:10:10'),FROM_DAYS(366),TO_DAYS('0000-12-25'),
LAST_DAY(NOW()),MAKEDATE(YEAR(NOW()),12),MAKETIME(10,21,23),PERIOD_ADD(20200101010101,
10)
FROM DUAL;

#7. 日期的格式化与解析
#DATE_FORMAT(date,fmt) 按照字符串fmt格式化日期date值
#TIME_FORMAT(time,fmt) 按照字符串fmt格式化时间time值
#GET_FORMAT(date_type,format_type) 返回日期字符串的显示格式
#STR_TO_DATE(str, fmt) 按照字符串fmt对str进行解析，解析为一个日期
SELECT STR_TO_DATE('09/01/2009','%m/%d/%Y')
FROM DUAL;
SELECT STR_TO_DATE('20140422154706','%Y%m%d%H%i%s')
FROM DUAL;
SELECT STR_TO_DATE('2014-04-22 15:47:06','%Y-%m-%d %H:%i:%s')
FROM DUAL;

SELECT DATE_FORMAT(NOW(),GET_FORMAT(DATE,'USA')),
FROM DUAL;


