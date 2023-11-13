#单行函数

#1.数值函数

#1.1.基本函数

#ABS(数):取绝对值，
#SIGN(数)：返回数值的符号，负数为-1，整数为+1,0为0
#PI()：返回π，
#CELL(数1)，CELLING(数1)（也叫天花板函数）：返回大于或等于数1的最小整数
#FLOOR(数1)（地板函数）：返回小于或等于某个值的最大整数
#MOD(数1,数2)：返回X除以Y后的余数
SELECT
ABS(-123),ABS(32),SIGN(-23),SIGN(43),PI(),
CEIL(32.32),CEILING(-43.23),FLOOR(32.32),
FLOOR(-43.23),MOD(12,5)
FROM DUAL;

#1.2.取随机数函数
#RAND()：返回0~1的随机值
#RAND(数1)：返回0~1的随机值，其中x的值用作种子值，相同的X值会产生相同的随机
#数
SELECT RAND(),RAND(),RAND(10),RAND(10),RAND(-1),RAND(-1)
FROM DUAL;

#1.3.舍入与截断函数
#ROUND(x,y) ：返回一个对x的值进行四舍五入后，最接近于X的整数
#ROUND(x,y) ：返回一个对x的值进行四舍五入后最接近X的值，并保留到小数点后面Y位
#TRUNCATE(x,y)：返回数字x截断为y位小数的结果 
#SQRT(x) ：返回x的平方根。当X的值为负数时，返回NULL
SELECT
ROUND(12.33),ROUND(12.343,2),ROUND(12.324,-1),#参数为负数，向前一位，2不足五，舍，结果为10
TRUNCATE(12.66,1),TRUNCATE(12.66,-1)#直接截断，不进行舍入
FROM DUAL;

#1.4.开方
#SQRT(x)：返回x的平方根。当X的值为负数时，返回NULL


#2.三角函数

#2.1角度与弧度转换
#RADIANS(x) ：将角度转化为弧度，其中，参数x为角度值
#DEGREES(x) ：将弧度转化为角度，其中，参数x为弧度值
SELECT RADIANS(30),RADIANS(60),RADIANS(90),
DEGREES(2*PI()),DEGREES(RADIANS(90))
FROM DUAL;

#2.2各种三角函数
#注意各种三角函数的参数都是弧度制
SELECT
SIN(RADIANS(30)),DEGREES(ASIN(1)),TAN(RADIANS(45)),DEGREES(ATAN(1)),DEGREES(ATAN2(1,1)
)
FROM DUAL;


#3.指数和对数
SELECT POW(2,5),POWER(2,4),EXP(2),LN(10),LOG10(10),LOG2(4)
FROM DUAL;

#4.进制之间的转换
SELECT BIN(10),HEX(10),OCT(10),CONV(10,2,8)
FROM DUAL;

