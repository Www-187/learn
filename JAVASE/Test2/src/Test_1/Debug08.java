package Test_1;

import java.util.HashMap;

/**
 * ClassName: Debug08
 * Package: com.atguigu.debug
 * Description: 演示8：用户自定义数据视图
 *
 * @Author: 尚硅谷-宋红康
 * @Create: 2022/10/20 23:21
 * @Version 1.0
 */
public class Debug08 {
    public static void main(String[] args) {
        HashMap<Integer,String> map = new HashMap<>();
        map.put(1,"高铁");
        map.put(2,"网购");
        map.put(3,"支付宝");
        map.put(4,"共享单车");

        System.out.println(map);
    }
}
