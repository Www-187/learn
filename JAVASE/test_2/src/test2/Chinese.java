package test2;

/**
 * ClassName: Chinese
 * Package: test2
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/14 - 21:28
 * @Version: v1.0
 */
public class Chinese {
    private String name;
    private int age;
    public static String nation;

    public Chinese() {
    }

    public Chinese(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    public  static  void  show(){
        System.out.println("你好");
    }
}
