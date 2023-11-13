package test_1;

/**
 * ClassName: test_1
 * Package: test_1
 * Description:强制类型转换
 *
 * @Author: www
 * @Create: 2023/3/9 - 20:38
 * @Version: v1.0
 */
public class test_1 {
    public static void main(String[] args) {
//        强制类型转换，可能出现精度损失
//        需要使用强转符 (数据类型)
        double d1=12.9;
//        使用“(数据类型)”来强制类型转换
//        强制类型转换是截断操作，不是四舍五入
        int i1=(int)d1;//结果是12
        System.out.println(i1);
    }




}
