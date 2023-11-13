package test_8;

/**
 * ClassName: MyRectangle
 * Package: test_8
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 20:18
 * @Version: v1.0
 */
public class MyRectangle extends GeometricObject{
    private double width;
    private double height;

    public MyRectangle(String color, double weight, double width, double height) {
        super(color, weight);
        this.width = width;
        this.height = height;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double findArea() {
        return width * height;
    }

}
