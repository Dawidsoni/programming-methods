package l5.z2;

/**
 * Created by dawidwegner on 23/03/2017.
 */
public class ConstExpression implements IExpression {
    protected int val;

    public ConstExpression(int val) {
        this.val = val;
    }

    public int compute() {
        return val;
    }

    @Override
    public String toString() {
        return Integer.toString(val);
    }
}
