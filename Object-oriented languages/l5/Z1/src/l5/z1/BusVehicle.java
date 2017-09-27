package l5.z1;

/**
 * Created by dawidwegner on 23/03/2017.
 */
public class BusVehicle implements IVehicle {

    public int getTypeWeight() {
        return 1;
    }

    public int compareTo(IVehicle vehicle) {
        return Integer.compare(getTypeWeight(), vehicle.getTypeWeight());
    }

    @Override
    public String toString() {
        return "Bus";
    }
}
