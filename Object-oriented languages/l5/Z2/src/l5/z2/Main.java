package l5.z2;

import java.util.Hashtable;

public class Main {

    public static void main(String[] args) {
        Hashtable<String, Integer> varMap = new Hashtable<String, Integer>();
        varMap.put("n", 3);
        varMap.put("m", 4);
        varMap.put("k", 5);
        IExpression nExpr = new VarExpression("n", varMap);
        IExpression mExpr = new VarExpression("m", varMap);
        IExpression kExpr = new VarExpression("k", varMap);
        IExpression c1Expr = new ConstExpression(1);
        IExpression c2Expr = new ConstExpression(2);
        IExpression addExpr = new AddExpression(nExpr, mExpr);
        IExpression subExpr = new SubExpression(kExpr, c1Expr);
        IExpression mulExpr = new MulExpression(addExpr, subExpr);
        IExpression divExpr = new DivExpression(mulExpr, c2Expr);
        System.out.println(divExpr);
        System.out.println(divExpr.compute());
        varMap.put("k", 6);
        System.out.println(divExpr);
        System.out.println(divExpr.compute());
    }
}
