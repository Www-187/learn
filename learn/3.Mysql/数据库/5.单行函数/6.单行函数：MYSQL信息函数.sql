#MYSQL信息函数
#VERSION() 返回当前MySQL的版本号
#CONNECTION_ID() 返回当前MySQL服务器的连接数
#DATABASE()，SCHEMA() 返回MySQL命令行当前所在的数据库
#USER()，CURRENT_USER()、SYSTEM_USER()，
#SESSION_USER()，返回当前连接MySQL的用户名，返回结果格式为“主机名@用户名”
#CHARSET(value) 返回字符串value自变量的字符集
#COLLATION(value) 返回字符串value的比较规则
SELECT VERSION(),CONNECTION_ID(),DATABASE(),USER(),CURRENT_USER(),
SYSTEM_USER(),SESSION_USER(),CHARSET('你好'),COLLATION(123);


#其他函数
#FORMAT(value,n)返回对数字value进行格式化后的结果数据。n表示 四舍五入 后保留到小数点后n位
# 如果n的值小于或者等于0，则只保留整数部分，注意与前面的区分
SELECT FORMAT(123.456,1);

#CONV(value,from,to) 将value的值进行不同进制之间的转换
SELECT CONV(123.456,10,2);

#INET_ATON(ipvalue) 将以点分隔的IP地址转化为一个数字
SELECT INET_ATON('223.5.5.5');

#INET_NTOA(value) 将数字形式的IP地址转化为以点分隔的IP地址
SELECT INET_NTOA(123);

#BENCHMARK(n,expr)将表达式expr重复执行n次。用于测试MySQL处理expr表达式所耗费的时间
SELECT BENCHMARK(1000000,MD5('mysql'));

#CONVERT(value USING char_code)将value所使用的字符编码修改为char_code
SELECT CONVERT(100 USING 'utf8mb4');






