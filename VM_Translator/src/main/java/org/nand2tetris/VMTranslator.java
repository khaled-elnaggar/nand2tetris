package org.nand2tetris;

import org.nand2tetris.model.CodeWriter;
import org.nand2tetris.model.CommandType;
import org.nand2tetris.model.Parser;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class VMTranslator {

  private static String outputFilePath;
  private static List<Path> vmFilesPaths;

  public static void main(String[] args) throws IOException {
    Path inputPath = Paths.get(args.length == 0 ? "." : args[0]).toRealPath();
    if (args.length == 0) System.out.println("\nNo input detected, trying path current path " + inputPath + "\n");
    readInputPathFiles(inputPath);
    if (vmFilesPaths.isEmpty()) {
      throw new RuntimeException("No VM files detected. Aborting ...");
    }

    CodeWriter codeWriter = new CodeWriter(outputFilePath);

    for (Path path : vmFilesPaths) {
      translateVMFiles(codeWriter, path);
    }

    codeWriter.close();
  }

  private static void readInputPathFiles(Path inputPath) throws IOException {

    if (inputPath.toString().endsWith(".vm")) {
      outputFilePath = inputPath.toString().replace(".vm", ".asm");
      vmFilesPaths = List.of(inputPath);
    } else {
      String outputFileName = inputPath.getFileName().toString() + ".asm";
      outputFilePath = inputPath + File.separator + outputFileName;
      vmFilesPaths = Files.walk(inputPath)
              .filter(path -> path.toString().endsWith(".vm"))
              .toList();
    }
  }

  private static void translateVMFiles(CodeWriter codeWriter, Path path) throws IOException {
    Parser parser = new Parser(path.toString());
    codeWriter.setCurrentFileName(path.getFileName().toString().replace(".vm", ""));

    while (parser.hasMoreCommands()) {
      parser.advance();
      CommandType commandType = parser.getCommandType();
      String command = parser.getCommand();

      switch (commandType) {
        case C_ARITHMETIC -> codeWriter.writeArithmetic(command);
        case C_PUSH -> codeWriter.writePush(command, parser.arg1(), parser.arg2());
        case C_POP -> codeWriter.writePop(command, parser.arg1(), parser.arg2());
        case C_LABEL -> codeWriter.writeLabel(command, parser.arg1());
        case C_GOTO -> codeWriter.writeGoto(command, parser.arg1());
        case C_IF -> codeWriter.writeIf(command, parser.arg1());
        case C_FUNCTION -> codeWriter.writeFunction(command, parser.arg1(), parser.arg2());
        case C_CALL -> codeWriter.writeCall(command, parser.arg1(), parser.arg2());
        case C_RETURN -> codeWriter.writeReturn(command);
      }
    }
  }

}
