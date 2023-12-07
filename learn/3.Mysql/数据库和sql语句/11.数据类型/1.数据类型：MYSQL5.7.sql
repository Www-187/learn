#MySQL数据类型精讲
#以MYSQL5.7为主


#1.字符集设置
#在创建数据库时可以设置字符集
#在创建表时也可以设置字符集
#在创建字段时也可以设置字符集
#都是使用的：CHARACTER SET '字符集'
#没设置数据库，表，字段的字符集，默认向上寻找字符集
#没设置数据库字符集，就找配置文件my.ini
#推荐在创建数据库时设置字符集，之后的表和字段就不设置
CREATE TABLE emp01(
 id INT CHARACTER SET 'utf8',
 `name` VARCHAR(20) CHARACTER SET 'utf8'
)CHARACTER SET 'utf8' ;


#2.整数类型
#可以在创建字段时，指明其是无符号的数值（UNSIGNED）
#整数类型，字节，有符号取值范围，无符号取值范围（UNSIGNED）
#TINYINT，   1 ，   -128~127，      0~255
#SMALLINT ，2 ，  -32768~32767，  0~65535
#MEDIUMINT，3 ， -8388608~8388607，0~16777215
#INT、INTEGER ，4，-2147483648~2147483647，0~4294967295
#BIGINT，   8 ，-9223372036854775808~9223372036854775807 ，0~18446744073709551615

#举例：
CREATE DATABASE dbtest12;
USE dbtest12;

CREATE TABLE test_int(
	f1 TINYINT,
	f2 SMALLINT,
	f3 MEDIUMINT,
	f4 INT,
	f5 BIGINT
);

INSERT INTO test_int(f1)
VALUES(12);

INSERT INTO test_int(f1)
VALUES(128);
#错误信息：Out of range value for column 'f1' at row 1

DESC test_int;
#在5.7中显示时，会在Type中显示数字，如tinyint(4),这个数是数据的宽度，有符号表示
#-128~+127，此时带上正负号就是4位，因此是4

#2.2可选属性
#在5.7中
#M：例如，int(5)：当数据宽度小于5位的时候在数字前面需要用
#   字符填满宽度。该项功能需要配合“ ZEROFILL ”使用，表示用“0”填满宽度，否则指定显示宽度无效。
#ZEROFILL:用0填充，搭配M使用，在使用ZEROFILL时，会自动使用UNSIGNED
#UNSIGNED:使用无符号范围（即0~范围，只取正数）

#举例：使用M和ZEROFILL
CREATE TABLE test_int2(
	f1 INT,
	f2 INT(5),
	f3 INT(5) ZEROFILL#显示宽度为5，不足时用0填充，超过5位无所谓
);

INSERT INTO test_int2(f1,f2)
VALUES(123,123),(123465,123456);

INSERT INTO test_int2(f3)
VALUES(123),(123465);

SELECT * FROM test_int2;#此时f3字段的123会使00123，而1234565依旧不变


#举例：使用UNSIGNED
CREATE TABLE test_int3(
	f1 INT UNSIGNED
);#此时f1的取值范围变成了0~4294967295

INSERT INTO test_int3
VALUES(123456);


#在8.0中，不推荐使用int类型的M和ZEROFILl属性

#整数类型使用推荐：
#TINYINT ：一般用于枚举数据，比如系统设定取值范围很小且固定的场景。
#SMALLINT ：可以用于较小范围的统计数据，比如统计工厂的固定资产库存数量等。
#MEDIUMINT ：用于较大整数的计算，比如车站每日的客流量等。
#INT、INTEGER ：取值范围足够大，一般情况下不用考虑超限问题，用得最多。比如商品编号。
#BIGINT ：只有当你处理特别巨大的整数时才会用到。比如双十一的交易量、大型门户网站点击量、证
#券公司衍生产品持仓等。








