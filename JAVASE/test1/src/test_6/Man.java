package test_6;

/**
 * ClassName: Man
 * Package: test_6
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 14:31
 * @Version: v1.0
 */
public class Man extends Person{
    boolean isSmoking;
    public void earnMoney(){
        System.out.println("赚钱");
    }
    public void eat() {
        System.out.println("男，多吃");
    }
    public void walk(int instance) {
        System.out.println("男人走了" + instance + "公里");
    }
}
