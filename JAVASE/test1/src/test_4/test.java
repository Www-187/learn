package test_4;

/**
 * ClassName: test
 * Package: test_4
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/12 - 21:27
 * @Version: v1.0
 */
/*
super：可以理解为父类的，可以调用属性 方法 构造器，类比于this关键字
1.在子类中使用 super. 属性 方法 来调用父类的
2.super调用属性与方法：①子父类出现了同名的属性时，必须使用super来显式调用父类的属性
                    ②子类重写了父类的方法后，在子类调用父类原来的方法时，
                      使用super可以调用原方法
4.super调用构造器：①super(形参列表)，在子类构造器中调用父类的有相同形参列表的构造器
                 ②必须声明在子类构造器的首行
                 ③this(形参列表)和super(形参列表)二选一，只能有一个
                 ④子类构造器中，没有声明this()或super(),默认使用super()，因此要
                 注意父类的默认空参构造器

*/
public class test {
    public static void main(String[] args) {

    }
}
