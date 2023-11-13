package test_4;

/**
 * ClassName: student
 * Package: test_4
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/12 - 21:24
 * @Version: v1.0
 */
public class student extends  Person{
    String major;
    public student(){

    }

    public student(String major) {
        this.major = major;
    }
    @Override
    public void eat(){
        System.out.println("学生吃饭");
    }
    public void walk(){
        System.out.println("学生走路");
    }
    public void show(){
        System.out.println("name="+this.name+"  age="+super.age);
    }
}



