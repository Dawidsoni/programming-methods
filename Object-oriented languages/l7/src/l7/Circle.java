package l7;

/**
 * Created by dawidwegner on 06/04/2017.
 */
public class Circle extends Shape {
    private static final long serialVersionUID = 1L;
    protected int radius;

    public Circle(int id, String name, int radius) {
        super(id, name);
        this.radius = radius;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }

    public int getRadius() {
        return radius;
    }

    @Override
    public String toString() {
        return "Circle";
    }

    public void draw() {
        System.out.println("Drawing circle");
    }
}
