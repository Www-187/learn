package test_7;

/**
 * ClassName: ToString
 * Package: test_7
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/14 - 14:45
 * @Version: v1.0
 */
public class ToString {
    /*
    toString()
    1.当我们输出对象的引用时，实际上就是调用toString()方法
    2.像String类，Data类都重写了toString()方法，调用时，都是返回实际的内容
    3.自定义类根据实际需要直接生成新的toString()方法


    * */
    public static void main(String[] args) {
        Person p1=new Person();
        System.out.println(p1.toString());//输出对象的地址值
        System.out.println(p1);//也是输出对象的地址值
    }

}
