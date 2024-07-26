package org.nand2tetris.model;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Parser {
  private final File assemblyFile;
  private Scanner fileScanner;
  private String currentLine;
  private String nextLine;

  public Parser(File assemblyFile) throws FileNotFoundException {
    this.assemblyFile = assemblyFile;
    this.fileScanner = new Scanner(assemblyFile);
    currentLine = "";
    nextLine = "";
  }

  public void reloadFile() throws FileNotFoundException {
    this.fileScanner = new Scanner(assemblyFile);
  }

  public boolean hasMoreCommands() {
    if (!fileScanner.hasNext()) {
      return false;
    }

    nextLine = readLineWithoutCommentsAndWhitespaces();
    while (shouldIgnore(nextLine)) {
      if (fileScanner.hasNext()) {
        nextLine = readLineWithoutCommentsAndWhitespaces();
        continue;
      }
      return false;
    }

    return true;
  }

  private String readLineWithoutCommentsAndWhitespaces() {
    String s = fileScanner.nextLine();
    return s.split("//")[0].trim();
  }

  public void advance() {
    currentLine = nextLine;
  }

  private boolean shouldIgnore(String line) {
    return line.startsWith("//") || line.equals("\n") || line.isBlank();
  }

  public InstructionType getInstructionType() {
    if (currentLine.startsWith("@")) {
      return InstructionType.A_INSTRUCTION;
    }

    if (currentLine.startsWith("(")) {
      return InstructionType.L_INSTRUCTION;
    }

    return InstructionType.C_INSTRUCTION;
  }

  public String getInstruction() {
    return currentLine;
  }

  public String getSymbol() {
    if (getInstructionType() == InstructionType.A_INSTRUCTION) {
      return currentLine.substring(1);
    } else if (getInstructionType() == InstructionType.L_INSTRUCTION) {
      return currentLine.substring(1, currentLine.length() - 1);
    } else {
      throw new RuntimeException("Unsupported type");
    }
  }

}
