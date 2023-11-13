package test_8;

/**
 * ClassName: GeometricObject
 * Package: test_8
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 20:13
 * @Version: v1.0
 */
public class GeometricObject {
    protected String color;
    protected double weight;

    public GeometricObject() {
    }

    public GeometricObject(String color, double weight) {
        this.color = color;
        this.weight = weight;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double findArea() {
        return 0.0;
    }
}
