package test3;

/**
 * ClassName: Cricle
 * Package: test3
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/15 - 21:22
 * @Version: v1.0
 */
public class Circle {
    private double radius;
    private int id;
    private static int init = 1001;
    private static int total=0;

    public Circle() {
        id = init++;
        total++;
    }

    public Circle(double radius) {
        this.radius = radius;
        id = init++;
        total++;

    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public static int getTotal() {
        return total;
    }

    public double findArea() {
        return 3.14 * radius * radius;
    }
}
