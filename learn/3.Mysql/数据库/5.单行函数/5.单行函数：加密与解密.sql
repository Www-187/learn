#加密与解密函数
#PASSWORD(str)，返回字符串str的加密版本，41位长的字符串。加密结果 不可
#                逆 ，常用于用户的密码加密
#在MYSQL8.0中就不能使用了
SELECT PASSWORD('abc');

#MD5(str)，返回字符串str的md5加密后的值，也是一种加密方式。若参数为NULL，则会返回NULL
#不可逆加密
SELECT MD5('abc');

#SHA(str)，从原明文密码str计算并返回加密后的密码字符串，当参数为NULL时，返回NULL。 SHA加密算法比MD5更加安全 。
#不可逆加密
SELECT SHA('abc');
SELECT SHA('123');

#ENCODE(value,password_seed) 返回使用password_seed作为加密密码加密value
#在MYSQL8.0中就不能使用了

#DECODE(value,password_seed) 返回使用password_seed作为加密密码解密value
#在MYSQL8.0中就不能使用了