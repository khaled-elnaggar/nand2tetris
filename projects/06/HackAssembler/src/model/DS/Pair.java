package model.DS;

public class Pair {
    private String symbol;
    private String value;

    public Pair(String symbol, String value){
        this.symbol=symbol;
        this.value=value;
    }
    public String getValue() { return value; }
    public String getSymbol() { return symbol; }
}
