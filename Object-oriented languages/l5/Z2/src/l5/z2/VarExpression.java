package l5.z2;
import java.util.*;
/**
 * Created by dawidwegner on 23/03/2017.
 */
public class VarExpression implements IExpression {

    protected String varName;
    protected Hashtable<String, Integer> varMap;

    public VarExpression(String varName, Hashtable<String, Integer> varMap) {
        this.varName = varName;
        this.varMap = varMap;
    }

    public int compute() {
        return varMap.get(varName);
    }

    @Override
    public String toString() {
        return Integer.toString(compute());
    }
}
