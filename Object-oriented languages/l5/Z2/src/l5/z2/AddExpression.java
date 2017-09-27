package l5.z2;

/**
 * Created by dawidwegner on 23/03/2017.
 */
public class AddExpression extends ArithExpression {

    public AddExpression(IExpression expr1, IExpression expr2) {
        super(expr1, expr2);
    }

    public int compute() {
        return expr1.compute() + expr2.compute();
    }

    @Override
    public String toString() {
        return "(" + expr1 + " + " + expr2 + ")";
    }
}
