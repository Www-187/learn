package test_6;

/**
 * ClassName: PersonTest
 * Package: test_6
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 14:35
 * @Version: v1.0
 */
public class PersonTest {
    /*
    * 多态性
    * 1.理解：一个事物的多种形态
    * 2.什么是多态：子类的对象赋值给父类的引用
    * 3.多态的使用：当调用子父类同名同参的方法时，实际执行的是子类重写父类父方法
    *               即是虚拟方法调用
    *4.多态的使用：有了对象的多态性以后，我们在编译期，只能调用父类声明的方法，
    *            在运行期，我们实际执行的是子类重写父类的方法，
    *            总结：编译看左边，执行看右边
    *              父类名 对象名 = new 子类名
    *5.多态的使用前提：①有类的继承关系，即有子类②子类有方法的重写
    *6.对象的多态性，只适用于方法，不适用于属性，如果用属性，编译运行都是左边
    *   因此多态性禁止用于属性
    *
    *
    * */
    public static void main(String[] args) {
//        多态性
        Person p2 =new Man();
        p2.walk(22);
        p2.eat();

//有了多态以后，内存中加载了子类特有的属性和方法，但是对象为父类类型，导致编译时，
// 只能调用父类的属性和方法，子类特有的属性和方法不能调用

//  如何在多态中，调用子类特有的属性和方法
//   向下转型:使用强转符
        Man m1=(Man) p2;
        m1.earnMoney();
        m1.isSmoking=true;
//       使用强转时，可能出现转换异常
//       如：Woman w1 = (Woman)p1; 编译没错，调用方法出错
//       为了在向下转型时不出现异常，使用instanceof关键字判断
//       a instanceof A：判断对象a是否是类A的实例，是返回true,不是false
        if(p2 instanceof Man){
            System.out.println("Man");
        }
    }
}
