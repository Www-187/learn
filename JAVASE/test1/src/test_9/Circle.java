package test_9;

import test_8.Cricle;
import test_8.GeometricObject;

/**
 * ClassName: Circle
 * Package: test_9
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/14 - 15:01
 * @Version: v1.0
 */
public class Circle extends GeometricObject {
    private double radius;

    public Circle() {
    }

    public Circle(double radius) {
        this.radius = radius;
    }

    public Circle(String color, double weight, double radius) {
        super(color, weight);
        this.radius = radius;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public double findArea() {
        return 3.14 * radius;


    }

    public boolean equals(Object obj) {
//        看地址值是否相等
        if (this == obj) {
            return true;
        }
//        地址值不相等 看是否是相同的 类的类型 如果是将传入的类强转成
//        Cricle 在进行判断，本对象是否与传入的对象相等
        if (obj instanceof Cricle) {
            Cricle c = (Cricle) obj;
            if (this.radius == c.getRadius()) {
                return true;
            } else {
                return false;
            }
        }
        else{
            return false;
        }


    }
}