package test1;

import org.testng.annotations.Test;

/**
 * ClassName: WrapperTst
 * Package: test1
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/14 - 16:15
 * @Version: v1.0
 */
/*
 * 包装类的使用：
 *1.java提供了8中基本数据类型对应的包装类，使得基本数据类型的变量具有了类的特征
 * 2.掌握：8中基本数据类型，包装类，String三者之间的转换
 *        ①基本数据类型转为包装类：新建包装类对象，调包装类的构造器即可
 *                            注：对Boolean进行了优化，只要不是true 全都是false
 *        ②包装类转换成基本数据类型：调用类的xxxvalue()方法
 *            ①和②可以整合进行自动拆箱与装箱
 *
 *        ③整体与
 *
 * 3.
 *
 * */
public class WrapperTst {

    //基本数据类型转为包装类：新建包装类对象，调包装类的构造器即可
    @Test
    public void test1() {
        int num1 = 10;
        Integer in1 = new Integer(num1);
        Integer in2 = new Integer(132);
        System.out.println(in2.toString());

        Float f1 = new Float(13.0f);
        Float f2 = new Float("12.3f");
        System.out.println(f2);

//对Boolean进行了优化，只要不是true 全都是false
        Boolean b1 = new Boolean("true123");
        System.out.println(b1.toString());


    }

    //    包装类转换成基本数据类型：调用类的xxxvalue()方法
    @Test
    public void test2() {
        Integer in1 = new Integer(13);
//        调用Integer的intvalue()方法
        int i1 = in1.intValue();
        System.out.println(i1);

//        JDK 5.0新特性：自动装箱与拆箱
//        自动装箱:不用new直接赋值即可
        int num1 = 12;
        Integer In1 = num1;
//        自动拆箱：直接将一个对象赋值给变量
        int num2 = In1;
    }

    //基本数据类型，包装类 转换成 String类型
    @Test
    public void test3() {
//        方式一：
        int num1 = 12;
        String St1 = num1 + "";
//        方式二：调用String的valueOf()方法
        float f1 = 12.3f;
        String St2 = String.valueOf(f1);

    }

    //String类型转换成基本数据类型，包装类
//    调用包装类的parsexxx()方法
    @Test
    public void test5() {
        String str1 = "123";
//        String转换成基本数据类型
        int num = Integer.parseInt(str1);
    }

}
