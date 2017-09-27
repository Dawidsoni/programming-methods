package l7;

import javax.swing.*;
import java.awt.event.WindowEvent;

/**
 * Created by dawidwegner on 06/04/2017.
 */
public class CircleControl extends ShapeControl {
    protected Circle circle;
    protected JSpinner idField, radiusField;
    protected JTextField nameField;

    @Override
    protected void initControls() {
        idField = new JSpinner(new SpinnerNumberModel(0, 0, 1000, 1));
        idField.setBounds(10, 10, 300, 30);
        getContentPane().add(idField);
        nameField = new JTextField("");
        nameField.setBounds(10, 50, 300, 30);
        getContentPane().add(nameField);
        radiusField = new JSpinner(new SpinnerNumberModel(0, 0, 1000, 1));
        radiusField.setBounds(10, 90, 300, 30);
        getContentPane().add(radiusField);
        super.initControls();
    }

    protected void initValues() {
        idField.setValue(circle.getId());
        nameField.setText(circle.getName());
        radiusField.setValue(circle.getRadius());
    }

    public CircleControl(Circle circle) {
        this.circle = circle;
        initControls();
        initValues();
    }

    public int getBottomPosition() {
        return radiusField.getBounds().y + radiusField.getBounds().height;
    }

    public void saveState() {
        circle.setId((Integer)idField.getValue());
        circle.setName(nameField.getText());
        circle.setRadius((Integer)radiusField.getValue());
        closeWindow();
    }

    public void cancelState() {
        closeWindow();
    }
}
