package l5.z1;

/**
 * Created by dawidwegner on 23/03/2017.
 */
public class CarVehicle implements IVehicle {
    private int weight;

    CarVehicle(int weight) {
        this.weight = weight;
    }

    public int getWeight() {
        return weight;
    }

    public int getTypeWeight() {
        return 0;
    }

    public int compareTo(IVehicle vehicle) {
        if(vehicle instanceof CarVehicle) {
            CarVehicle carVehicle = (CarVehicle)vehicle;
            return Integer.compare(getWeight(), carVehicle.getWeight());
        }
        return Integer.compare(getTypeWeight(), vehicle.getTypeWeight());
    }

    @Override
    public String toString() {
        return "Car (" + Integer.toString(weight) + ")";
    }

}
