package test_2;

/**
 * ClassName: test
 * Package: test_2
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/12 - 20:25
 * @Version: v1.0
 */
/*
方法的重写
1.重写：子类继承父类以后，可以对父类中同名同参的方法进行覆盖操作，注意同名同参
2.在调用时，调用的是子类重写的方法
3.规定：①重写的方法的方法名和形参列表与被重写的方法的方法名和形参列表相同，
       ②子类重写的方法的权限修饰符要大于等于父类的
       ③子类不能重写父类的private方法
       ④父类的方法返回值类型是void 子类重写的方法的返回值类型必须是void
       ⑤父类的方法返回值类型是A,子类重写的方法的返回值类型可以使A类或A类的子类
       ⑥父类的方法返回值类型是基本数据类型，子类重写的方法的返回值类型也必须是基本数据类型
          同⑤ 基本数据类型没有子类
       ⑦子类重写的方法抛出的异常不大于父类被重写的方法抛出的异常
*/
public class test {
    public static void main(String[] args) {
Student s1=new Student();
s1.eat(2);
    }
}
