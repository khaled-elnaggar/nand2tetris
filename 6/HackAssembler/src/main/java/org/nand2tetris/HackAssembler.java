package org.nand2tetris;

import org.nand2tetris.model.Code;
import org.nand2tetris.model.InstructionType;
import org.nand2tetris.model.Parser;
import org.nand2tetris.model.SymbolTable;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class HackAssembler {
  public static void main(String[] args) throws IOException {
    if(args.length == 0) throw new RuntimeException("Please include file name");

    String filePath = args[0];
    File assemblyFile = new File(filePath);
    String binaryName = assemblyFile.getName().replace(".asm", ".hack");

    String binaryPath = filePath.replace(assemblyFile.getName(), binaryName);

    File binaryFile = new File(binaryPath);

    Parser parser = new Parser(assemblyFile);
    SymbolTable symbolTable = new SymbolTable();
    Code code = new Code();

    extractSymbols(parser, symbolTable);
    parser.reloadFile();

    writeBinaryCode(binaryFile, parser, symbolTable, code);

  }

  private static void extractSymbols(Parser parser, SymbolTable symbolTable) {
    int lineNumber = 0;
    while (parser.hasMoreCommands()) {
      parser.advance();

      if (InstructionType.L_INSTRUCTION.equals(parser.getInstructionType())) {
        String symbol = parser.getSymbol();
        symbolTable.addSymbol(symbol, lineNumber);
      } else {
        lineNumber++;
      }
    }
  }

  private static void writeBinaryCode(File binaryFile, Parser parser, SymbolTable symbolTable, Code code) throws IOException {
    int lineNumber = 0;
    int variableOffset = 16;

    FileWriter fileWriter = new FileWriter(binaryFile);

    while (parser.hasMoreCommands()) {
      parser.advance();
      if (InstructionType.A_INSTRUCTION.equals(parser.getInstructionType())) {
        String symbol = parser.getSymbol();
        int address = -1;
        if (symbol.matches("^\\d+$")) {
          address = Integer.parseInt(symbol);
        } else {
          if (symbolTable.contains(symbol)) {
            address = symbolTable.getAddress(symbol);
          } else {
            symbolTable.addSymbol(symbol, variableOffset);
            address = variableOffset;
            variableOffset++;
          }
        }
        String binaryAddress = Integer.toBinaryString(address);
        String paddedBinaryAddress = "0".repeat(16).substring(binaryAddress.length()) + binaryAddress;
        System.out.printf("%4s %-6s %s\n", lineNumber, parser.getInstruction(), paddedBinaryAddress);
        fileWriter.write(paddedBinaryAddress);
        fileWriter.write("\n");
        lineNumber++;
      } else if (InstructionType.C_INSTRUCTION.equals(parser.getInstructionType())) {
        String binaryInstruction = "111";
        binaryInstruction += code.comp(parser.getInstruction());
        binaryInstruction += code.dest(parser.getInstruction());
        binaryInstruction += code.jump(parser.getInstruction());
        System.out.printf("%4s %-6s %s\n", lineNumber, parser.getInstruction(), binaryInstruction);
        fileWriter.write(binaryInstruction);
        fileWriter.write("\n");
        lineNumber++;
      }
    }
    fileWriter.close();
  }
}
