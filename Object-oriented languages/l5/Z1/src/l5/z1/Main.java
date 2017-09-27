package l5.z1;

import java.util.Arrays;

public class Main {

    public static void queueTest() {
        Queue<Integer> intQueue = new Queue<>();
        intQueue.push(3);
        intQueue.push(1);
        intQueue.push(4);
        intQueue.push(2);
        System.out.println(intQueue);
        intQueue.pop();
        intQueue.pop();
        intQueue.pop();
        intQueue.pop();
        intQueue.push(4);
        intQueue.push(2);
        intQueue.push(3);
        System.out.println(intQueue);
        intQueue.pop();
    }

    public static void vehicleTest() {
        CarVehicle car1 = new CarVehicle(3);
        CarVehicle car2 = new CarVehicle(5);
        BusVehicle bus1 = new BusVehicle();
        TruckVehicle truck1 = new TruckVehicle(4);
        TruckVehicle truck2 = new TruckVehicle(6);
        IVehicle[] vehicleArr = {bus1, car2, car1, truck2, truck1};
        Arrays.sort(vehicleArr);
        for(IVehicle vehicle : vehicleArr) {
            System.out.println(vehicle);
        }
    }

    public static void main(String[] args) {
        queueTest();
        System.out.println();
        vehicleTest();
    }
}
