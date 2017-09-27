package l6.z5;

/**
 * Created by dawidwegner on 30/03/2017.
 */
public class ConcurrentSort {

    public static void MergeSort(int arr[]) {
        new MergeSort(arr, 0, arr.length - 1).run();
    }
}
