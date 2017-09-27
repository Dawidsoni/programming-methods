package l6.z5;

/**
 * Created by dawidwegner on 30/03/2017.
 */
class MergeSort extends Thread {
    private int[] arr;
    private int startInd, endInd;

    private void fillTempArr(int tempArr[], int startInd, int endInd) {
        for(int i = startInd; i <= endInd; i++) {
            tempArr[i - startInd] = arr[i];
        }
        tempArr[endInd - startInd + 1] = Integer.MAX_VALUE;
    }

    private void merge(int middleInd) {
        int[] temp1 = new int[middleInd - startInd + 2];
        int[] temp2 = new int[endInd - middleInd + 1];
        fillTempArr(temp1, startInd, middleInd);
        fillTempArr(temp2, middleInd + 1, endInd);
        int temp1Ind = 0, temp2Ind = 0;
        for(int i = startInd; i <= endInd; i++) {
            if(temp1[temp1Ind] < temp2[temp2Ind]) {
                arr[i] = temp1[temp1Ind++];
            }else {
                arr[i] = temp2[temp2Ind++];
            }
        }
    }

    private void solveBaseCase() {
        if(arr[startInd] > arr[endInd]) {
            int temp = arr[startInd];
            arr[startInd] = arr[endInd];
            arr[endInd] = temp;
        }
    }

    private void solveRecCase() {
        int middleInd = (startInd + endInd) / 2;
        MergeSort s1 = new MergeSort(arr, startInd, middleInd);
        MergeSort s2 = new MergeSort(arr,middleInd + 1, endInd);
        s1.start();
        s2.start();
        try {
            s1.join();
            s2.join();
        }catch (Exception exc) {
            solveRecCase();
        }
        merge(middleInd);
    }

    public MergeSort(int[] arr, int startInd, int endInd) {
        this.arr = arr;
        this.startInd = startInd;
        this.endInd = endInd;
    }

    public void run()
    {
        if(endInd - startInd <= 1) {
            solveBaseCase();
        }else {
            solveRecCase();
        }
    }

}
