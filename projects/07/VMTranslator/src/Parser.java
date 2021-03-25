import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Parser {
    Scanner input = null;
    private String currentLine, arg0, arg1, arg2 = null;

    public Parser(File file) throws FileNotFoundException {
        input = new Scanner(file);
//        currentLine = input.nextLine();
    }

    public boolean hasMoreCommands() {
        return input.hasNext();
    }

    public void advance() {
        currentLine = input.nextLine();
        while (input.hasNext() && (currentLine.isEmpty() || currentLine.charAt(0) == '/')) {
            currentLine = input.nextLine();
        }

        if (currentLine.contains("/")) {
            String[] arr = currentLine.split("/");
            currentLine = arr[0];
        }
        updateArgs();
//        System.out.println("currentCommand= " + currentLine);
    }

    private void updateArgs() {
        String[] arr = currentLine.split("\\s+");
        arg0 = arr[0];
        try {
            arg1 = arr[1];
            arg2 = arr[2];
        } catch (Exception ignored) {
        }
    }

    public String arg0() {
        return arg0;
    }

    public String arg1() {
        if (arg1.equals("local")) {
            arg1 = "LCL";
        } else if (arg1.equals("argument")) {
            arg1 = "ARG";
        }
        if (arg1.equals("this")) {
            arg1 = "THIS";
        }
        if (arg1.equals("that")) {
            arg1 = "THAT";
        }
        return arg1;

    }

    public int arg2() {
        return Integer.parseInt(arg2);
    }

    public String getCurrentLine() {
        return currentLine;
    }

    public String commandType() {
        switch (arg0) {
            case "push":
                return "C_PUSH";
            case "pop":
                return "C_POP";
            case "label":
                return "C_LABEL";
            case "goto":
                return "C_GOTO";
            case "if-goto":
                return "C_IF";
            case "function":
                return "C_FUNCTION";
            case "return":
                return "C_RETURN";
            case "call":
                return "C_CALL";
            default:
                return "C_ARITHMETIC";
        }
    }
}
