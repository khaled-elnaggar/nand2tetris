package org.nand2tetris.model;

import java.util.HashMap;

public class Code {
  private HashMap<String, String> comp;
  private HashMap<String, String> destination;
  private HashMap<String, String> jump;

  public Code() {
    initCodes();
  }

  private void initCodes() {
    initComputation();
    initDestination();
    initJump();
  }

  private void initComputation() {
    comp = new HashMap<>();
    comp.put("0", "0" + "101010");
    comp.put("1", "0" + "111111");
    comp.put("-1", "0" + "111010");
    comp.put("D", "0" + "001100");
    comp.put("A", "0" + "110000");
    comp.put("M", "1" + "110000");
    comp.put("!D", "0" + "001101");
    comp.put("!A", "0" + "110001");
    comp.put("!M", "1" + "110001");
    comp.put("-D", "0" + "001111");
    comp.put("-A", "0" + "110011");
    comp.put("-M", "1" + "110011");
    comp.put("D+1", "0" + "011111");
    comp.put("A+1", "0" + "110111");
    comp.put("M+1", "1" + "110111");
    comp.put("D-1", "0" + "001110");
    comp.put("A-1", "0" + "110010");
    comp.put("M-1", "1" + "110010");
    comp.put("D+A", "0" + "000010");
    comp.put("D+M", "1" + "000010");
    comp.put("D-A", "0" + "010011");
    comp.put("D-M", "1" + "010011");
    comp.put("A-D", "0" + "000111");
    comp.put("M-D", "1" + "000111");
    comp.put("D&A", "0" + "000000");
    comp.put("D&M", "1" + "000000");
    comp.put("D|A", "0" + "010101");
    comp.put("D|M", "1" + "010101");
  }

  private void initDestination() {
    destination = new HashMap<>();
    destination.put(null, "000");
    destination.put("M", "001");
    destination.put("D", "010");
    destination.put("DM", "011");
    destination.put("MD", "011");
    destination.put("A", "100");
    destination.put("AM", "101");
    destination.put("MA", "101");
    destination.put("AD", "110");
    destination.put("DA", "110");
    destination.put("ADM", "111");
  }

  private void initJump() {
    jump = new HashMap<>();
    jump.put(null, "000");
    jump.put("JGT", "001");
    jump.put("JEQ", "010");
    jump.put("JGE", "011");
    jump.put("JLT", "100");
    jump.put("JNE", "101");
    jump.put("JLE", "110");
    jump.put("JMP", "111");
  }

  public String dest(String instruction) {
    if (instruction.contains("=")) {
      return destination.get(instruction.split("=")[0]);
    }
    return destination.get(null);
  }

  public String jump(String instruction) {
    if (instruction.contains(";")) {
      return jump.get(instruction.split(";")[1]);
    }
    return jump.get(null);
  }

  public String comp(String instruction) {
    if (instruction.contains("=")) {
      instruction = instruction.split("=")[1];
    }
    if (instruction.contains(";")) {
      instruction = instruction.split(";")[0];
    }

    return comp.get(instruction);
  }

}
