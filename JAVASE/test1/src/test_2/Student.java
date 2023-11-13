package test_2;

/**
 * ClassName: Student
 * Package: test_2
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/12 - 20:23
 * @Version: v1.0
 */
public class Student extends Person{
    String major;
    public  Student(){

    }

    public Student(String major) {
        this.major = major;
    }
    public void study(){
        System.out.println("学习，专业是"+major);
    }
//    对父类中的方法进行重写
    public void eat(int a){
        System.out.println("学生吃饭");
    }
}
