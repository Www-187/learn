#变量
#分为系统变量和用户自定义变量
#系统变量分为全局系统变量（global），会话系统变量（session），和二者都是


#举例1:查看系统变量
#这种查看就是看有哪些变量，不看具体的值

#查看全局系统变量
SHOW GLOBAL VARIABLES;
SHOW GLOBAL VARIABLES LIKE '';


#查看会话系统变量
#不加GLOBAL或SESSION默认就是SESSION
SHOW VARIABLES;
SHOW SESSION VARIABLES;
SHOW SESSION VARIABLES LIKE '';


#举例2：查看指定系统变量
#这种就是查看系统变量的值

/*
作为 MySQL 编码规范，MySQL 中的系统变量以 两个“@” 开头，其中“@@global”仅用于标记全局系统变
量，“@@session”仅用于标记会话系统变量。“@@”首先标记会话系统变量，如果会话系统变量不存在，
则标记全局系统变量。
*/

#查看指定的全局系统变量的值
SELECT @@global.变量名;

#查看指定的会话系统变量的值
SELECT @@session.变量名;
#或者
#（这种就是查看那种都是变量，先查session里有没，再查global有没）
SELECT @@变量名;



#举例3：修改变量

#3.1修改全局系统变量

#方式1：修改MySQL 配置文件 ，继而修改MySQL系统变量的值（该方法需要重启MySQL服务）
#此方法一劳永逸（相当于修改了系统变量的默认值，配置文件里），即使多次重启服务器，也不会改变系统变量的值
#如果在服务器上重启，成本太高了

#方式2：在MySQL服务运行期间，使用“set”命令重新设置系统变量的值
#此方法只适用与数据库实例（相当于没有修改配置文件的默认值），一旦重启MYSQL服务器，就系统变量的值就恢复成了默认值
#方式2.1：
SET @@global.变量名=变量值;

SET GLOBAL 变量名=变量值;


#3.2修改会话系统变量
#针对单次会话有效，重启会话，建立新的会话，会话系统变量就会恢复默认值
SET @@session.变量名=变量值;
SET SESSION 变量名=变量值;




















