package test2;

/**
 * ClassName: test
 * Package: test2
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/14 - 21:25
 * @Version: v1.0
 */

public class test {
    /*
     * Static 关键字的使用
     * static：静态的  可以用来修饰属性，方法，代码块，内部类
     *
     * 1.static修饰属性：①静态变量/属性（也叫类变量），没有static修饰的属性叫 实例
     *                  属性/变量
     *                 ②创建了类的多个变量，多个变量共享一个静态变量
     *                 ③静态变量随着类的加载而加载，要早于对象的创建
     *                 ④通过 类名.静态变量名 来使用
     *                 ⑤由于类只会加载一次，则静态变量在内存中也只会存在一份，存在方法的静态域中
     *
     * 2.static修饰方法：①随着类的加载而加载，可以通过类名直接调用
     *                 ②静态的方法中，只能调用静态的方法和属性，而非静态的方法都可以
     *                    调用（静态的方法与属性，非静态的方法与属性）
     *                 ③静态的方法中不能使用this和super
     *                 ④静态的属性和方法从生命周期的角度去理解
     *
     *
     *
     * */
    public static void main(String[] args) {
//        可以早于对象的创建而使用静态变量
        Chinese.nation="中国";
        Chinese C1 = new Chinese("要命", 20);

        Chinese.show();//直接用类去调用静态方法



        C1.getName();
        C1.getAge();
        C1.nation="11";
        System.out.println("+++++++++++++++");
        Chinese C2 = new Chinese("你好", 24);
        System.out.println(C2.nation);
    }


}
