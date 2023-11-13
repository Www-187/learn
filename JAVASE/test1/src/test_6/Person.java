package test_6;

/**
 * ClassName: Person
 * Package: test_6
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 14:30
 * @Version: v1.0
 */
public class Person {
    String name="默认";
    int age=10;

    public Person() {

    }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void eat() {
        System.out.println("吃");
    }

    public void walk(int instance) {
        System.out.println("走了" + instance + "公里");
    }
}
