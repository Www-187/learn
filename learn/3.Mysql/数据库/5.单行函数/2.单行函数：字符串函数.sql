#字符串函数
#ASCII(S)，返回字符串S中的第一个字符的ASCII码值
#CHAR_LENGTH(s) ，返回字符串s的字符数。作用与CHARACTER_LENGTH(s)相同
#LENGTH(s)，返回字符串s的字节数，和字符集有关
SELECT ASCII('abc'),CHAR_LENGTH('123'),LENGTH('123')
FROM DUAL;

#CONCAT(s1,s2,......,sn) ，连接s1,s2,......,sn为一个字符串
SELECT CONCAT(e1.last_name,'服务于',e2.last_name)
FROM employees e1 
JOIN  employees e2 ON e1.`manager_id`=e2.`employee_id`;

#CONCAT_WS(x,s1,s2,......,sn)，同CONCAT(s1,s2,...)函数，但是每个字符串之间要加上x
SELECT CONCAT_WS('--',123,123,13);

#INSERT(str, idx, len,replacestr)，将字符串str从第idx位置开始，len个字符长的子串替换为字符串replacestr

SELECT INSERT('helloworld',2,3,'aaaa')
FROM DUAL;

#REPLACE(str, a, b) ，用字符串b替换字符串str中所有出现的字符串a
SELECT REPLACE('hello','ll','ee')
FROM DUAL;

#UPPER(s) 或 UCASE(s) ，将字符串s的所有字母转成大写字母
#LOWER(s) 或LCASE(s) ，将字符串s的所有字母转成小写字母
SELECT UPPER('aa'),LOWER('AA')
FROM DUAL;

#LEFT(str,n) ，返回字符串str最左边的n个字符
#RIGHT(str,n) ，返回字符串str最右边的n个字符
SELECT LEFT('abcdef',3) FROM DUAL;
SELECT RIGHT('abcdef',3) FROM DUAL;

#LPAD(str, len, pad),实现右对齐效果，用字符串pad对str最左边进行填充，直到str的长度为len个字符，
#RPAD(str ,len, pad) ,实现左对齐效果，用字符串pad对str最右边进行填充，直到str的长度为len个字符
SELECT  employee_id,last_name,LPAD(salary,10,'--')
FROM employees;
SELECT  employee_id,last_name,RPAD(salary,10,'--')
FROM employees;

#TRIM(s) ，去掉字符串s开始与结尾的空格
#LTRIM(s) ,去掉字符串s左侧的空格
#RTRIM(s) ,去掉字符串s右侧的空格
SELECT TRIM(' a b c d '),LTRIM(' a b c d '),RTRIM(' a b c d ')
FROM DUAL;

#TRIM(s1 FROM s) ,去掉字符串s开始与结尾的s1
SELECT TRIM('aa' FROM 'aabcd')
FROM DUAL;
#TRIM(LEADING s1 FROM s),去掉字符串s开始处的s1
#TRIM(TRAILING s1 FROM s)，去掉字符串s结尾处的s1


#REPEAT(str, n) ,返回str重复n次的结果
SELECT REPEAT('aaa',5)
FROM DUAL;

#SPACE(n),返回n个空格
SELECT SPACE(5)
FROM DUAL;

#STRCMP(s1,s2) ，比较字符串s1,s2的ASCII码值的大小
#SUBSTR(s,index,len)，返回从字符串s的index位置其len个字符，作用与SUBSTRING(s,n,len)、
#                      MID(s,n,len)相同

#LOCATE(substr,str)，返回字符串substr在字符串str中首次出现的位置，作用于POSITION(substr
#                    IN str)、INSTR(str,substr)相同。未找到，返回0

#ELT(m,s1,s2,…,sn)，返回指定位置的字符串，如果m=1，则返回s1，如果m=2，则返回s2，如
#                     果m=n，则返回sn

#FIELD(s,s1,s2,…,sn)，返回字符串s在字符串列表中第一次出现的位置

#FIND_IN_SET(s1,s2)，返回字符串s1在字符串s2中出现的位置。其中，字符串s2是一个以逗号分隔的字符串

#REVERSE(s) ，返回s反转后的字符串

#NULLIF(value1,value2)，比较两个字符串，如果value1与value2相等，则返回NULL，否则返回value1
SELECT employee_id,NULLIF(LENGTH(first_name),LENGTH(last_name))
FROM employees;

















