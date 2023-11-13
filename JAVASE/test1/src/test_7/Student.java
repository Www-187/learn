package test_7;

/**
 * ClassName: Student
 * Package: test_7
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 20:00
 * @Version: v1.0
 */
public class Student extends Person {
    protected String school = "pku";

    public String getInfo() {
        return "name:" + this.name + "  age:" + this.age + " school:" + this.school;

    }
}
