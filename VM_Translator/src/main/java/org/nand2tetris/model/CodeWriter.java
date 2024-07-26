package org.nand2tetris.model;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class CodeWriter {
  public static final String SP = "SP";
  public static final String R13 = "R13";
  public static final String R14 = "R14";
  private static final String R15 = "R15";
  public static final int TEMP = 5;
  private final FileWriter fileWriter;
  private String fileName;
  private String functionName;
  private int i;

  public static final String ARG = "ARG";
  public static final String LCL = "LCL";
  public static final Map<String, String> MEMORY_SEGMENTS = Map.of(
          "local", LCL,
          "argument", ARG,
          "this", "THIS",
          "that", "THAT");

  public CodeWriter(String binaryPath) throws IOException {
    File binaryFile = new File(binaryPath);
    fileWriter = new FileWriter(binaryFile);
    i = 1;
    initCode();
  }

  public void setCurrentFileName(String fileName) throws IOException {
    this.fileName = fileName;
    write("\n\n//File " + fileName);
  }

  private void initCode() throws IOException {
    String comment = "// bootstrapping code\n@256\nD=A\n@SP\nM=D\n";
    write(comment);
    writeCall("call Sys.init 0", "Sys.init", 0);
  }

  public void writeArithmetic(String command) throws IOException {
    String assemblyInstruction = "\n\n// " + command + "\n";
    String indentation = "  ";

    assemblyInstruction += pop(indentation, R13);
    switch (command) {
      case "add", "sub", "and", "or" -> {
        assemblyInstruction += pop(indentation, R14);
        assemblyInstruction += ArithmeticLogicManager.executeOperation(indentation, command, R14, R13);
      }
      case "neg", "not" -> {
        assemblyInstruction += ArithmeticLogicManager.executeOperation(indentation, command, R14, R13);
      }
      case "eq", "gt", "lt" -> {
        assemblyInstruction += pop(indentation, R14);
        assemblyInstruction += ArithmeticLogicManager.executeComparison(indentation, command, R14, R13);
      }
    }
    assemblyInstruction += push(indentation, R14);

    write(assemblyInstruction);
  }

  private void write(String assemblyInstruction) throws IOException {
    System.out.print(assemblyInstruction);
    fileWriter.write(assemblyInstruction);
  }

  private String push(String indentation, String register) {
    String instruction = indentation + "// PUSH(" + register + ")\n";
    indentation += "  ";
    instruction += load(indentation, register);
    instruction += unloadRam(indentation, SP);
    instruction += increment(indentation, SP);
    return instruction;
  }

  private String pop(String indentation, String register) {
    String instruction = indentation + "// POP(" + register + ")\n";
    indentation += "  ";
    instruction += decrement(indentation, SP);
    instruction += loadRam(indentation, SP);
    instruction += unload(indentation, register);
    return instruction;
  }

  private String load(String indentation, String register) {
    String comment = indentation + "// LOAD(" + register + ")\n";
    indentation += "  ";
    return comment + String.format("%s@%s\n%sD=M\n", indentation, register, indentation);
  }

  private String unload(String indentation, String register) {
    String comment = indentation + "// UNLOAD(" + register + ")\n";
    indentation += "  ";
    return comment + String.format("%s@%s\n%sM=D\n", indentation, register, indentation);
  }

  private String loadRam(String indentation, String address) {
    String comment = indentation + "// LOAD_RAM(" + address + ")\n";
    indentation += "  ";
    return comment + String.format("%s@%s\n%sA=M\n%sD=M\n", indentation, address, indentation, indentation);
  }

  private String unloadRam(String indentation, String address) {
    String comment = indentation + "// UNLOAD_RAM(" + address + ")\n";
    indentation += "  ";
    return comment + String.format("%s@%s\n%sA=M\n%sM=D\n", indentation, address, indentation, indentation);
  }

  private String increment(String indentation, String register) {
    String comment = indentation + "// INCREMENT(" + register + ")\n";
    indentation += "  ";
    return comment + String.format("%s@%s\n%sM=M+1\n", indentation, register, indentation);
  }

  private String decrement(String indentation, String register) {
    String comment = indentation + "// DECREMENT(" + register + ")\n";
    indentation += "  ";
    return comment + String.format("%s@%s\n%sM=M-1\n", indentation, register, indentation);
  }


  public void writePush(String command, String segment, int index) throws IOException {
    String assemblyInstruction = "\n\n// " + command + "\n";
    String indentation = "  ";

    switch (segment) {
      case "constant" -> {
        assemblyInstruction += String.format("%s@%d\n%sD=A\n", indentation, index, indentation);
      }
      case "temp" -> {
        assemblyInstruction = getTempAddress(index, assemblyInstruction, indentation);
        assemblyInstruction += String.format("%sD=M\n", indentation);
      }
      case "local", "argument", "this", "that" -> {
        assemblyInstruction += getSegmentPlusOffsetAddress(segment, index, indentation);
        assemblyInstruction += unload(indentation, R13);
        assemblyInstruction += loadRam(indentation, R13);
      }
      case "static" -> {
        assemblyInstruction = getStaticAddress(index, assemblyInstruction, indentation);
        assemblyInstruction += String.format("%sD=M\n", indentation);
      }
      case "pointer" -> {
        assemblyInstruction = getPointerAddress(index, assemblyInstruction, indentation);
        assemblyInstruction += String.format("%sD=M\n", indentation);
      }

    }
    assemblyInstruction += unload(indentation, R14);
    assemblyInstruction += push(indentation, R14);
    write(assemblyInstruction);
  }

  public void writePop(String command, String segment, int index) throws IOException {
    String assemblyInstruction = "\n\n// " + command + "\n";
    String indentation = "  ";
    switch (segment) {
      case "local", "argument", "this", "that" -> {
        assemblyInstruction += getSegmentPlusOffsetAddress(segment, index, indentation);
      }
      case "temp" -> {
        assemblyInstruction = getTempAddress(index, assemblyInstruction, indentation);
      }
      case "static" -> {
        assemblyInstruction = getStaticAddress(index, assemblyInstruction, indentation);
      }
      case "pointer" -> {
        assemblyInstruction = getPointerAddress(index, assemblyInstruction, indentation);
      }
    }
    assemblyInstruction += unload(indentation, R13);
    assemblyInstruction += pop(indentation, R14);
    assemblyInstruction += load(indentation, R14);
    assemblyInstruction += unloadRam(indentation, R13);
    write(assemblyInstruction);
  }

  private String getSegmentPlusOffsetAddress(String segment, int index, String indentation) {
    return String.format("%s@%d\n%sD=A\n%s@%s\n%sD=D+M\n",
            indentation, index, indentation, indentation, MEMORY_SEGMENTS.get(segment), indentation);
  }

  private String getTempAddress(int index, String assemblyInstruction, String indentation) {
    assemblyInstruction += String.format("%s@%d\n%sD=A\n%s@%d\n%sAD=D+A\n",
            indentation, index, indentation, indentation, TEMP, indentation);
    return assemblyInstruction;
  }

  private String getStaticAddress(int index, String assemblyInstruction, String indentation) {
    assemblyInstruction += String.format("%s@%s.%d\n%sD=A\n", indentation, fileName, index, indentation);
    return assemblyInstruction;
  }

  private String getPointerAddress(int index, String assemblyInstruction, String indentation) {
    assemblyInstruction += String.format("%s@%d\n%sD=A\n%s@THIS\n%sAD=D+A\n",
            indentation, index, indentation, indentation, indentation);
    return assemblyInstruction;
  }

  public void writeLabel(String command, String labelName) throws IOException {
    String instruction = "\n\n// " + command + "\n";
    instruction += String.format("  (%s.%s$%s)\n", fileName, functionName, labelName);
    write(instruction);
  }

  public void writeGoto(String command, String labelName) throws IOException {
    String instruction = "\n\n// " + command + "\n";
    instruction += String.format("  @%s.%s$%s\n  0;JMP\n", fileName, functionName, labelName);
    write(instruction);
  }

  public void writeIf(String command, String labelName) throws IOException {
    String instruction = "\n\n// " + command + "\n";
    instruction += pop("  ", R14);
    instruction += String.format("  @%s.%s$%s\n  D;JNE\n", fileName, functionName, labelName);
    write(instruction);
  }

  public void writeFunction(String command, String functionName, int numberOfLocalVars) throws IOException {
    this.functionName = functionName;
    String instruction = "\n\n// " + command + "\n";
    instruction += String.format("  (%s)\n", functionName);
    instruction += numberOfLocalVars == 0 ? "" : "  // For the next part going to initialize local vars to zero\n";
    write(instruction);
    for (int i = 0; i < numberOfLocalVars; i++) {
      writePush("push constant 0", "constant", 0);
      writePop("pop local " + i, "local", i);
    }
  }

  public void writeReturn(String command) throws IOException {
    String instruction = "\n\n// " + command + "\n";
    String indentation = "    ";

    instruction += "  // frame (R15) = LCL\n";
    instruction += load(indentation, LCL);
    instruction += unload(indentation, R15);

    instruction += "  // retAdd (R14) = *(frame - 5)\n";
    instruction += String.format("%s@5\n%sD=A\n%s@R15\n%sA=M-D\n%sD=M\n",
            indentation, indentation, indentation, indentation, indentation);
    instruction += unload(indentation, R14);

    instruction += "  // *ARG=pop()\n";
    instruction += decrement(indentation, SP);
    instruction += loadRam(indentation, SP);
    instruction += unloadRam(indentation, ARG);

    instruction += "  // SP=ARG+1\n";
    instruction += String.format("%s@ARG\n%sD=M+1\n", indentation, indentation);
    instruction += unload(indentation, SP);

    instruction += "  // THAT=*(frame-1); THIS=*(frame-2); ARG=*(frame-3); LCL=*(frame-4)\n";

    List<String> memorySegments = List.of("THAT", "THIS", "ARG", LCL);
    for (String segment : memorySegments) {
      instruction += decrement(indentation, R15);
      instruction += loadRam(indentation, R15);
      instruction += unload(indentation, segment);
    }

    instruction += " // goto retAddr(R14)\n";
    instruction += String.format("%s@R14\n%sA=M\n%s0;JMP\n", indentation, indentation, indentation);

    write(instruction);
  }

  public void writeCall(String command, String functionName, int numberOfArgs) throws IOException {
    String instruction = "\n\n// " + command + "\n";
    String indentation = "    ";

    instruction += "  // push file.function$ret.i \n";
    String returnLabel = String.format("%s.%s$ret.%d", fileName, functionName, i++);
    instruction += String.format("%s@%s\n%sD=A\n", indentation, returnLabel, indentation);
    instruction += unload(indentation, R14);
    instruction += push(indentation, R14);

    instruction += "  // push LCL,ARG,THIS,THAT \n";
    List<String> memorySegments = List.of(LCL, "ARG", "THIS", "THAT");
    for (String segment : memorySegments) {
      instruction += push(indentation, segment);
    }

    instruction += "  // ARG = SP-5-nArgs \n";
    instruction += String.format("%s@%d\n%sD=A\n%s@SP\n%sD=M-D\n",
            indentation, 5 + numberOfArgs, indentation, indentation, indentation);
    instruction += unload(indentation, ARG);

    instruction += "  // LCL = SP \n";
    instruction += load(indentation, SP);
    instruction += unload(indentation, LCL);

    instruction += "  // goto fileName.functionName \n";
    instruction += String.format("%s@%s\n%s0;JMP\n", indentation, functionName, indentation);
    instruction += String.format("%s(%s)\n", indentation, returnLabel);

    write(instruction);
  }

  public void close() throws IOException {
    fileWriter.close();
  }
}
