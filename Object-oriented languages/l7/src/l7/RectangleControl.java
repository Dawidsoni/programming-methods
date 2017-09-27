package l7;

import javax.swing.*;
import java.awt.event.WindowEvent;

/**
 * Created by dawidwegner on 06/04/2017.
 */
public class RectangleControl extends ShapeControl {
    protected Rectangle rectangle;
    protected JSpinner idField, widthField, heightField;
    protected JTextField nameField;

    @Override
    protected void initControls() {
        idField = new JSpinner(new SpinnerNumberModel(0, 0, 1000, 1));
        idField.setBounds(10, 10, 300, 30);
        getContentPane().add(idField);
        nameField = new JTextField("");
        nameField.setBounds(10, 50, 300, 30);
        getContentPane().add(nameField);
        widthField = new JSpinner(new SpinnerNumberModel(0, 0, 1000, 1));
        widthField.setBounds(10, 90, 300, 30);
        getContentPane().add(widthField);
        heightField = new JSpinner(new SpinnerNumberModel(0, 0, 1000, 1));
        heightField.setBounds(10, 130, 300, 30);
        getContentPane().add(heightField);
        super.initControls();
    }

    protected void initValues() {
        idField.setValue(rectangle.getId());
        nameField.setText(rectangle.getName());
        widthField.setValue(rectangle.getWidth());
        heightField.setValue(rectangle.getHeight());
    }

    public RectangleControl(Rectangle rectangle) {
        this.rectangle = rectangle;
        initControls();
        initValues();
    }

    public int getBottomPosition() {
        return heightField.getBounds().y + heightField.getBounds().height;
    }

    public void saveState() {
        rectangle.setId((Integer)idField.getValue());
        rectangle.setName(nameField.getText());
        rectangle.setWidth((Integer)widthField.getValue());
        rectangle.setHeight((Integer)heightField.getValue());
        closeWindow();
    }

    public void cancelState() {
        closeWindow();
    }
}
