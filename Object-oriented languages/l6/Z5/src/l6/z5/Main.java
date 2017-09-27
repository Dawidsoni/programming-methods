package l6.z5;

import java.util.Arrays;

public class Main {

    private static void runTest(int arr[]) {
        ConcurrentSort.MergeSort(arr);
        System.out.println(Arrays.toString(arr));
    }

    public static void main(String[] args) {
        runTest(new int[]{1});
        runTest(new int[]{4, 3, 2, 1});
        runTest(new int[]{1, 3, 2, 4, 7, 6, 5, 9, 10, 12, 11, 13});
        runTest(new int[]{9, 1, 2, 8, 7, 3, 6, 4, 5});
    }
}
