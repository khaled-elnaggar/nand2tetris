package model;

public class Parser {
//    Scanner sc = null;
//    public String currentLine = null;
//
//    public Parser(String file) {
//        sc = new Scanner(file);
//    }
//
//    public boolean hasMoreCommands() {
//        return sc.hasNext();
//    }
//
//    public void advance() {
//        String x = sc.nextLine();
//        while(sc.hasNext() && (x.charAt(0) == '/' || x.isEmpty())){
//            sc.nextLine();
//        }
//    }

    public String commandType(String currentLine) {
        switch (currentLine.charAt(0)) {
            case '@' :
                return "A_COMMAND";
            case '(' :
                return "L_COMMAND";
            default:
                return "C_COMMAND";
        }
    }

    //should check if A or L type
    public String symbol(String currentLine) {
        String[] arr1 = currentLine.split(" ");
        if (commandType(currentLine).equals("A_COMMAND")) {
            return arr1[0].substring(1, arr1[0].length());
        } else {
            return arr1[0].substring(1, arr1[0].length() - 1);
        }
    }

    //if not A or L type then dest, comp, jump;
    public String dest(String currentLine) {
        if (currentLine.contains("=")) {
            String[] arr = currentLine.split("=");
            return arr[0];
        } else {
            return "null";
        }
    }

    public String comp(String currentLine) {
        String[] arrx = currentLine.split(" ");
        currentLine = arrx[0];
        if (currentLine.contains("=")) {
            String[] arr1 = currentLine.split("=");
            return arr1[1];
        } else {
            String[] arr1 = currentLine.split(";");
            return arr1[0];

        }
    }

    public String jump(String currentLine) {
        if (currentLine.contains(";")) {
            String[] arr1 = currentLine.split(";");
            String[] arr2 = arr1[1].split(" ");
            return arr2[0];
        } else {
            return "null";
        }
    }
}
