package l6.z1;
import java.io.*;

public class Main {
    private static void saveSampleList() {
        LinkedList<Integer> list = new LinkedList<Integer>();
        list.pushBegin(1);
        list.pushEnd(2);
        list.pushEnd(3);
        list.pushBegin(0);
        try {
            FileOutputStream fileStream = new FileOutputStream("list.txt", false);
            ObjectOutputStream objStream = new ObjectOutputStream(fileStream);
            objStream.writeObject(list);
        }catch (Exception exc) {
            System.out.println(exc.getMessage());
        }
    }

    private static void readSampleList() {
        try {
            FileInputStream fileStream = new FileInputStream("list.txt");
            ObjectInputStream objStream = new ObjectInputStream(fileStream);
            LinkedList<Integer> list = (LinkedList<Integer>)objStream.readObject();
            for(int i = 0; i < 4; i++) {
                System.out.println(list.removeBegin());
            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }
    }

    public static void main(String[] args) {
        readSampleList();
    }
}
