#非符号类型运算符

/*-----------------------------------------------------------------------*/

# IS NULL，是NULL
SELECT commission_pct
FROM employees
WHERE commission_pct IS NULL;#得到奖金率是NULL的员工

/*-----------------------------------------------------------------------*/

# IS NOT NULL，非NULL
SELECT commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;#得到奖金率非NULL的员工

/*-----------------------------------------------------------------------*/

# NOT ...NULL，否定...NULL
SELECT commission_pct
FROM employees
WHERE NOT commission_pct IS NULL;#commission_pct IS NULL 是NULL 加了
                                 #NOT 是非NULL

/*-----------------------------------------------------------------------*/

# LEAST(数1,数2,数3)  在多个数中返回最小值
# GREATEST(数1,数2,数3)在多个数中返回最大值
SELECT LEAST(1,2,3);#结果是1
SELECT GREATEST(1,2,3);#结果是3

/*-----------------------------------------------------------------------*/

# BETWEEN...AND... 区间
SELECT salary 
FROM employees
WHERE salary BETWEEN 6000 AND 8000;#结果中包含了6000和8000
                                   #注意区间大小的顺序，否则没结果

/*-----------------------------------------------------------------------*/

#IN(数1,数2,数3)   离散值的查找 只能找这三个数
#NOT IN(数1,数2,数3)
SELECT salary 
FROM employees
WHERE salary IN(6000,8000,9000);#查询的结果只有6000,8000,9000

/*-----------------------------------------------------------------------*/

#LIKE ''  模糊查询
#%代表不确定个数的字符

#查询last_name中包含a的员工
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%';#在a前面和后面都有不确定个数的字符

/*-----------------------------------------------------------------------*/

# _ 表示一个不确定的字符
#查询last_name中第三个字符是a的员工
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';#两个下划线即可 后面再加上%

/*-----------------------------------------------------------------------*/

# \ 转义字符
#查询last_name中 第二个字符是_ 第三个字符是a的员工
SELECT last_name
FROM employees
WHERE last_name LIKE '_\_a%';#第一个字符是不确定的，第二个字符是_
                             #第三个字符是a，之后的字符不确定
                             
                             


