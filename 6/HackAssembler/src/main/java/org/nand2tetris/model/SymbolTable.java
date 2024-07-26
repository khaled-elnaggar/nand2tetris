package org.nand2tetris.model;

import java.util.HashMap;

public class SymbolTable {
  private final HashMap<String, Integer> symbolTable;

  public SymbolTable() {
    this.symbolTable = new HashMap<>();
    initTable();
  }

  private void initTable() {
    for (int i = 0; i <= 15; i++) {
      symbolTable.put("R" + i, i);
    }
    symbolTable.put("SCREEN", 16384);
    symbolTable.put("KBd", 24576);

    symbolTable.put("SP", 0);
    symbolTable.put("LCL", 1);
    symbolTable.put("ARG", 2);
    symbolTable.put("THIS", 3);
    symbolTable.put("THAT", 4);
  }

  public boolean contains(String symbol) {
    return symbolTable.containsKey(symbol);
  }

  public void addSymbol(String symbol, int address) {
    symbolTable.put(symbol, address);
  }

  public int getAddress (String symbol) {
    return symbolTable.get(symbol);
  }
}
