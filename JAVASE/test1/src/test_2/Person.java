package test_2;

/**
 * ClassName: Person
 * Package: test_2
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/12 - 20:21
 * @Version: v1.0
 */
public class Person {
    String name;
    int age;
    public Person(){

    }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    public void eat(){
        System.out.println("吃");
    }
    public void walk(int instance){
        System.out.println("走了"+instance+"公里");
    }
}
