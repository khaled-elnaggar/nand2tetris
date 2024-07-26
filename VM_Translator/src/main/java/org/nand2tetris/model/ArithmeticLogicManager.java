package org.nand2tetris.model;

import java.util.Map;
import java.util.Random;

public class ArithmeticLogicManager {

  private static final Random random = new Random();

  public static Map<String, String> operations = Map.of(
          "add", "M=D+M",
          "sub", "M=M-D",
          "neg", "M=-D",
          "and", "M=D&M",
          "or", "M=D|M",
          "not", "M=!D"
  );

  public static String executeOperation(String indentation, String command, String left, String right) {
    String comment = indentation + "// Executing command " + command + "\n";
    indentation += "  ";
    return comment + String.format("%s@%s\n%sD=M\n%s@%s\n%s%s\n", indentation, right, indentation, indentation, left, indentation, operations.get(command));
  }

  public static String executeComparison(String indentation, String command, String left, String right) {
    int randomNumber = random.nextInt(10000, 90000);
    String comment = indentation + "// Executing command " + command + "\n";
    indentation += "  ";
    String instruction = "";

    instruction += executeOperation(indentation, "sub", left, right);
    instruction += String.format("%s@R14\n%sD=M\n", indentation, indentation);
    instruction += String.format("%s@%d_R14_MATCH\n%sD;J%s\n%s@R14\n%sM=0\n%s@%d_END_IF\n%s0;JMP\n",
            indentation, randomNumber, indentation, command.toUpperCase(), indentation, indentation, indentation, randomNumber, indentation);

    instruction += String.format("%s(%d_R14_MATCH)\n%s@R14\n%sM=-1\n%s(%d_END_IF)\n",
            indentation, randomNumber, indentation, indentation, indentation, randomNumber);

    return comment + instruction;
  }
}
