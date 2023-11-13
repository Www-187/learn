package test_7;

/**
 * ClassName: Person
 * Package: test_7
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 19:57
 * @Version: v1.0
 */
public class Person {
    protected String name = "person";
    protected int age = 50;

    public String getInfo() {
        return "name:" + this.name + "  age:" + this.age;
    }

}
