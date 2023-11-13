package Test_1;

/**
 * ClassName: Debug06
 * Package: com.atguigu.debug
 * Description: 演示6：线程调试
 *
 * @Author: 尚硅谷-宋红康
 * @Create: 2022/10/20 22:46
 * @Version 1.0
 */
public class Debug06 {

    public static void main(String[] args) {

        test("Thread1");
        test("Thread2");


    }

    public static void test(String threadName) {
        new Thread(
                () -> {
                    for (int i = 0; i < 100; i++) {
                        System.out.println(Thread.currentThread().getName() + ":" + i);
                    }
                },
                threadName
        ).start();
    }

}
