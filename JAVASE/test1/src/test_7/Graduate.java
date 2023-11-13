package test_7;

/**
 * ClassName: Graduate
 * Package: test_7
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 20:01
 * @Version: v1.0
 */
public class Graduate extends Student {
    public String major = "IT";

    public String getInfo() {
        return "name:" + this.name + "  age:" + this.age + " school:" + this.school + " major:" + this.major;
    }

}
