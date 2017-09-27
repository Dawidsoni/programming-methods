package l7;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;

/**
 * Created by dawidwegner on 06/04/2017.
 */
public abstract class ShapeControl extends JFrame implements ActionListener {
    protected JButton cancelButton, saveButton;

    private void initLayout(int yPos) {
        setLayout(null);
        setSize(400, yPos + 80);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }

    protected void initControls() {
        int yPos = getBottomPosition() + 20;
        cancelButton = new JButton("Cancel");
        cancelButton.setBounds(10, yPos, 120, 30);
        cancelButton.addActionListener(this);
        getContentPane().add(cancelButton);
        saveButton = new JButton("Save");
        saveButton.setBounds(150, yPos, 120, 30);
        saveButton.addActionListener(this);
        getContentPane().add(saveButton);
        initLayout(yPos);
    }

    protected void closeWindow() {
        setVisible(false);
        dispatchEvent(new WindowEvent(this, WindowEvent.WINDOW_CLOSING));
        dispose();
    }

    public void actionPerformed(ActionEvent event) {
        Object source = event.getSource();
        if(source == cancelButton) {
            cancelState();
        }else if(source == saveButton) {
            saveState();
        }
    }

    abstract int getBottomPosition();
    abstract public void saveState();
    abstract public void cancelState();
}
