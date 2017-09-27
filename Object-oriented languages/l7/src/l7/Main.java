package l7;

import javax.swing.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.*;

public class Main {

    private static void showForm(JFrame shapeFrame, String fileName, Shape shape) {
        shapeFrame.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                try {
                    ShapeSerializer.saveShape(shape, fileName);
                }catch (Exception exc) {
                    exc.printStackTrace();
                }
            }
        });
        shapeFrame.setVisible(true);
    }

    private static void initForm(String fileName, String shapeType, Shape shape) {
        JFrame shapeFrame;
        switch (shapeType) {
            case "circle":
                shapeFrame = new CircleControl((Circle)shape);
                break;
            case "rectangle":
                shapeFrame = new RectangleControl((Rectangle)shape);
                break;
            default:
                throw new IllegalArgumentException();
        }
        showForm(shapeFrame, fileName, shape);
    }

    public static void main(String[] args) {
        String fileName = args[0];
        String shapeType = args[1].toLowerCase().trim();
        Shape shape;
        try {
            if(new File(fileName).exists()) {
                shape = ShapeSerializer.getShape(fileName);
            }else if(shapeType.equals("circle")) {
                shape = new Circle(0, "", 1);
            }else if(shapeType.equals("rectangle")) {
                shape = new Rectangle(0, "", 1, 1);
            }else {
                throw new IllegalArgumentException();
            }
            initForm(fileName, shapeType, shape);
        }catch (Exception exc) {
            exc.printStackTrace();
        }
    }
}
