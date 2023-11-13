package test_4;

/**
 * ClassName: Person
 * Package: test_4
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/12 - 21:22
 * @Version: v1.0
 */
public class Person {
    String name;
    int age;

    public Person() {
    }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    public void eat(){
        System.out.println("人吃饭");
    }
    public void walk(){
        System.out.println("人走路");
    }
}
