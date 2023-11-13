package test_8;

/**
 * ClassName: Cricle
 * Package: test_8
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 20:16
 * @Version: v1.0
 */
public class Cricle extends GeometricObject{
    private double radius;

    public Cricle(String color, double weight, double radius) {
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
}
