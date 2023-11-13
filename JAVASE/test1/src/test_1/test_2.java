package test_1;

import org.testng.annotations.Test;

/**
 * ClassName: test_2
 * Package: test_1
 * Description:String与char
 *
 * @Author: www
 * @Create: 2023/3/9 - 20:53
 * @Version: v1.0
 */
public class test_2 {
    public static void main(String[] args) {
        String s1 = "hello world";
        String s2 = "a";
//        string里可以没有字符
        String A = "";
//        char c=""; 错误，char有且仅有一个字符
        char c = 'a';
        int i1 = 1;
        boolean b1 = true;


        //String s3=123 错误
        String s3 = 123 + "";//正确 结果是 “123”
//        int num=(int)s3; 错误string与int不能进行强制转换，需要使用其他包装类

        System.out.println();
    }

}
