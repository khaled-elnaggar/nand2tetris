package model.DS;

import java.util.ArrayList;

public class Code {
    private ArrayList<Pair> compL;
    private ArrayList<Pair> destL;
    private ArrayList<Pair> jumpL;

    public Code() {
        compL = new ArrayList<>();
        destL = new ArrayList<>();
        jumpL = new ArrayList<>();
        // Comp
        compL.add(new Pair("0", "0101010"));
        compL.add(new Pair("1", "0111111"));
        compL.add(new Pair("-1", "0111010"));
        compL.add(new Pair("D", "0001100"));
        compL.add(new Pair("A", "0110000"));
        compL.add(new Pair("!D", "0001101"));
        compL.add(new Pair("!A", "0110001"));
        compL.add(new Pair("-D", "0001111"));
        compL.add(new Pair("-A", "0110011"));
        compL.add(new Pair("D+1", "0011111"));
        compL.add(new Pair("A+1", "0110111"));
        compL.add(new Pair("D-1", "0001110"));
        compL.add(new Pair("A-1", "0110010"));
        compL.add(new Pair("D+A", "0000010"));
        compL.add(new Pair("D-A", "0010011"));
        compL.add(new Pair("A-D", "0000111"));
        compL.add(new Pair("D&A", "0000000"));
        compL.add(new Pair("D|A", "0010101"));
        compL.add(new Pair("M", "1110000"));
        compL.add(new Pair("!M", "1110001"));
        compL.add(new Pair("-M", "1110011"));
        compL.add(new Pair("M+1", "1110111"));
        compL.add(new Pair("M-1", "1110010"));
        compL.add(new Pair("D+M", "1000010"));
        compL.add(new Pair("D-M", "1010011"));
        compL.add(new Pair("M-D", "1000111"));
        compL.add(new Pair("D&M", "1000000"));
        compL.add(new Pair("D|M", "1010101"));

        // Dest
        destL.add(new Pair("null", "000"));
        destL.add(new Pair("M", "001"));
        destL.add(new Pair("D", "010"));
        destL.add(new Pair("MD", "011"));
        destL.add(new Pair("A", "100"));
        destL.add(new Pair("AM", "101"));
        destL.add(new Pair("AD", "110"));
        destL.add(new Pair("AMD", "111"));

        //Jump
        jumpL.add(new Pair("null", "000"));
        jumpL.add(new Pair("JGT", "001"));
        jumpL.add(new Pair("JEQ", "010"));
        jumpL.add(new Pair("JGE", "011"));
        jumpL.add(new Pair("JLT", "100"));
        jumpL.add(new Pair("JNE", "101"));
        jumpL.add(new Pair("JLE", "110"));
        jumpL.add(new Pair("JMP", "111"));
    }

    public String find(String s, ArrayList<Pair> list) {
        for (Pair p : list) {
            if (p.getSymbol().equals(s)) {
                return p.getValue();
            }
        }
        return "";
    }

    public String comp(String s){
        return find(s, compL);
    }
    public String dest(String s){
        return find(s, destL);
    }
    public String jump(String s){
        return find(s, jumpL);
    }
}
