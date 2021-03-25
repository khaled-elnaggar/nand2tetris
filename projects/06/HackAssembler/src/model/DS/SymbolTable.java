package model.DS;

import java.util.ArrayList;

public class SymbolTable {
    private ArrayList<Pair> ST;

    public SymbolTable() {
        ST = new ArrayList<>();
        this.add("SP", "0");
        this.add("LCL", "1");
        this.add("ARG", "2");
        this.add("THIS", "3");
        this.add("THAT", "4");
        this.add("R0", "0");
        this.add("R1", "1");
        this.add("R2", "2");
        this.add("R3", "3");
        this.add("R4", "4");
        this.add("R5", "5");
        this.add("R6", "6");
        this.add("R7", "7");
        this.add("R8", "8");
        this.add("R9", "9");
        this.add("R10", "10");
        this.add("R11", "11");
        this.add("R12", "12");
        this.add("R13", "13");
        this.add("R14", "14");
        this.add("R15", "15");
        this.add("SCREEN", "16384");
        this.add("KBD", "24576");
    }

    public void add(String x, String y) {
        ST.add(new Pair(x, y));
    }

    public String getAddress(String symbol) {
        for (Pair p : ST) {
            if (p.getSymbol().equals(symbol)) {
                return p.getValue();
            }
        }
        return "";
    }

    public boolean contains(String symbol) {
        for (Pair p : ST) {
            if (p.getSymbol().equals(symbol)) {
                return true;
            }
        }
        return false;
    }
}
