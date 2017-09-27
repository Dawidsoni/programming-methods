package l5.z1;

/**
 * Created by dawidwegner on 23/03/2017.
 */
public class TruckVehicle implements IVehicle {
    private int capacity;

    public TruckVehicle(int capacity) {
        this.capacity = capacity;
    }

    public int getCapacity() {
        return capacity;
    }

    public int getTypeWeight() {
        return 2;
    }

    public int compareTo(IVehicle vehicle) {
        if(vehicle instanceof TruckVehicle) {
            TruckVehicle truckVehicle = (TruckVehicle)vehicle;
            return Integer.compare(capacity, truckVehicle.getCapacity());
        }
        return Integer.compare(getTypeWeight(), vehicle.getTypeWeight());
    }

    @Override
    public String toString() {
        return "Truck (" + Integer.toString(capacity) + ")";
    }
}
