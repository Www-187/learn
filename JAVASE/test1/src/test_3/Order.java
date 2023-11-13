package test_3;

/**
 * ClassName: Order
 * Package: test_3
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/12 - 21:04
 * @Version: v1.0
 */

public class Order {

    private int orderPrivate;
    int orderDefault;
    protected int orderProtected;
    public int orderPublic;

    private void methodPrivate() {
        System.out.println("methodPrivate");
    }

    void methodDefault() {
        System.out.println("methodDefault");

    }

    protected void methodProtected() {
        System.out.println("methodProtected");
    }

    public void methodPublic() {
        System.out.println("methodPublic");
    }

}
