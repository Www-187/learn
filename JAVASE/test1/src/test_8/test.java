package test_8;

/**
 * ClassName: test
 * Package: test_8
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 20:20
 * @Version: v1.0
 */
public class test {
    public static void main(String[] args) {
        test t1 =new test();
        Cricle c1 =new Cricle("白",2,2.3);
        Cricle c2 =new Cricle("红",2,2.4);

    }

    public boolean equals(GeometricObject o1, GeometricObject o2) {
        return o1.findArea() == o2.findArea();

    }

    public void display(GeometricObject o) {
        System.out.println("面积为" + o.findArea());

    }


}
