package l7;

import java.io.*;

/**
 * Created by dawidwegner on 06/04/2017.
 */
public class ShapeSerializer {

    public static void saveShape(Shape shape, String fileName) throws FileNotFoundException, IOException {
        FileOutputStream fileStream = new FileOutputStream(fileName, false);
        ObjectOutputStream objStream = new ObjectOutputStream(fileStream);
        objStream.writeObject(shape);
    }

    public static Shape getShape(String fileName) throws FileNotFoundException, IOException, ClassNotFoundException {
        FileInputStream fileStream = new FileInputStream(fileName);
        ObjectInputStream objStream = new ObjectInputStream(fileStream);
        return (Shape)objStream.readObject();
    }
}
