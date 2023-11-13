package test_6;

/**
 * ClassName: Woman
 * Package: test_6
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 14:32
 * @Version: v1.0
 */
public class Woman extends Person {
    boolean isBeauty;
    public void goShopping(){
        System.out.println("女，购物");
    }
    public void eat() {
        System.out.println("女，少吃");
    }
    public void walk(int instance) {
        System.out.println("女人走了" + instance + "公里");
    }

}
