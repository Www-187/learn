#比较运算符

#在算术和比较时，当两边不是同一类型时，字符串都存在隐式转换
SELECT 1='a';#结果是0 即错
SELECT 0='a';#结果是1 即对 字符a 转换不成数字，就是0 0=0
 
#安全等于 <=> 适用于字段中存在NULL的情况
SELECT commission_pct 
FROM employees
WHERE commission_pct<=>NULL;#得到的结果全是代NULL的












