import model.DS.Code;
import model.DS.SymbolTable;
import model.Parser;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class HackAssembler {

    public static String toBinary(String decimal) {
        String b0;
        b0 = Long.toBinaryString(Long.parseLong(decimal));
        long b1 = Long.parseLong(b0);
        return String.format("%016d", b1);
    }

    public static void main(String[] args) throws IOException {
        File inputFile = new File("D:\\Private\\Khalid\\CS\\Architecture, OS, Systems\\nand2tetris\\projects\\06\\pong\\Pong.asm");
        FileWriter outputFile = new FileWriter("D:\\Private\\Khalid\\CS\\Architecture, OS, Systems\\nand2tetris\\projects\\06\\Pong.hack");

        Scanner sc = new Scanner(inputFile);
        Parser parser = new Parser();
        Code code = new Code();
        SymbolTable symbolTable = new SymbolTable();
        String currentLine, compiled, address;
        int variableAddress = 16, counter = 0;


        while (sc.hasNext()) {
            currentLine = sc.nextLine();
            if (currentLine.isEmpty() || currentLine.charAt(0) == '/') {
                continue;
            }
            if (parser.commandType(currentLine).equals("L_COMMAND")) {
                String label = parser.symbol(currentLine);
                symbolTable.add(label, Integer.toString(counter));
            } else {
                counter++;
            }
        }


        sc = new Scanner(inputFile);
        while (sc.hasNext()) {
            currentLine = sc.nextLine();
            if (currentLine.isEmpty() || currentLine.charAt(0) == '/') {
                continue;
            }

            if (parser.commandType(currentLine).equals("A_COMMAND")) {
                String symbol = parser.symbol(currentLine);
                try {
                    Integer.parseInt(symbol);
                    address = symbol;
                } catch (Exception e) {
                    if (symbolTable.contains(symbol)) {
                        address = symbolTable.getAddress(symbol);
                    } else {
                        symbolTable.add(symbol, Integer.toString(variableAddress++));
                        address = symbolTable.getAddress(symbol);
                    }
                }
                compiled = toBinary(address);
                outputFile.write(compiled + "\n");

            } else if (parser.commandType(currentLine).equals("C_COMMAND"))  {
                String d = parser.dest(currentLine);
                String c = parser.comp(currentLine);
                String j = parser.jump(currentLine);
                String dd = code.dest(d);
                String cc = code.comp(c);
                String jj = code.jump(j);
                compiled = "111" + cc + dd + jj;
                outputFile.write(compiled + "\n");

            }

//            System.out.println(compiled);
        }
        outputFile.close();
    }
}
