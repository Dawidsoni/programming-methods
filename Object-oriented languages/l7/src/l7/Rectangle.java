package l7;

/**
 * Created by dawidwegner on 06/04/2017.
 */
public class Rectangle extends Shape {
    private static final long serialVersionUID = 1L;
    protected int width, height;

    public Rectangle(int id, String name, int width, int height) {
        super(id, name);
        this.width = width;
        this.height = height;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getWidth() {
        return width;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getHeight() {
        return height;
    }

    @Override
    public String toString() {
        return "Rectangle";
    }

    public void draw() {
        System.out.println("Drawing triangle");
    }
}
