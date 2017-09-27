package l7;

import java.io.Serializable;

/**
 * Created by dawidwegner on 06/04/2017.
 */
public abstract class Shape implements Serializable {
    protected int id;
    protected String name;

    public Shape(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "Circle";
    }

    public abstract void draw();
}
