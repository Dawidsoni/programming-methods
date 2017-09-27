package l5.z2;

/**
 * Created by dawidwegner on 23/03/2017.
 */
public abstract class ArithExpression implements IExpression {
    protected IExpression expr1, expr2;

    public ArithExpression(IExpression expr1, IExpression expr2) {
        this.expr1 = expr1;
        this.expr2 = expr2;
    }
}
