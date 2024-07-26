package org.nand2tetris.model;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class Parser {
  private static final Map<String, CommandType> COMMANDS = Map.of(
          "push", CommandType.C_PUSH,
          "pop", CommandType.C_POP,
          "label", CommandType.C_LABEL,
          "goto", CommandType.C_GOTO,
          "if-goto", CommandType.C_IF,
          "function", CommandType.C_FUNCTION,
          "return", CommandType.C_RETURN,
          "call", CommandType.C_CALL
  );
  private Scanner fileScanner;
  private String currentLine;
  private String nextLine;

  public Parser(String vmFilePath) throws FileNotFoundException {
    this.fileScanner = new Scanner(new File(vmFilePath));
    currentLine = "";
    nextLine = "";
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

  public String getCommand() {
    return currentLine;
  }

  public String arg1() {
    String[] commandSegments = currentLine.split(" ");
    if (getCommandType() == CommandType.C_RETURN) {
      throw new RuntimeException("Return commands have no arguments");
    }
    if (getCommandType() == CommandType.C_ARITHMETIC) {
      return commandSegments[0];
    } else {
      return commandSegments[1];
    }
  }

  public int arg2() {
    String[] commandSegments = currentLine.split(" ");
    if (List.of(CommandType.C_POP, CommandType.C_PUSH, CommandType.C_FUNCTION, CommandType.C_CALL)
            .contains(getCommandType())) {
      return Integer.parseInt(commandSegments[2]);
    } else {
      throw new RuntimeException("Command not supported." + getCommandType());
    }
  }

  public CommandType getCommandType() {
    String[] commandSegments = currentLine.split(" ");
    return COMMANDS.getOrDefault(commandSegments[0], CommandType.C_ARITHMETIC);
  }

}
