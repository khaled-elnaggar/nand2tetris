import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class VMTranslator {
    public static void main(String[] args) throws IOException {
        CodeWriter codeWriter = null;

        if (args[0].endsWith(".vm")) {
            String outputFile = args[0].substring(0, args[0].length() - 3) + ".asm";
            codeWriter = new CodeWriter(outputFile, "file");
        } else {
            File temp = new File(args[0]);
            String outputFile = args[0] + "/" + temp.getName() + ".asm";
            codeWriter = new CodeWriter(outputFile, "dir");
        }

        // Getting a list of all files in the directory and store it in result
        List<String> result = null;
        try (Stream<Path> walk = Files.walk(Paths.get(args[0]))) {
            result = walk.filter(Files::isRegularFile)
                    .map(Path::toString).collect(Collectors.toList());
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Filtering out the files ending with .vm to store in files[]
        ArrayList<String> files = new ArrayList<>();
        assert result != null;
        for (String s : result) {
            String x = s.substring(s.length() - 3, s.length());
            if (x.equals(".vm")) {
                files.add(s);
            }
        }



        // For each file in the folder we try to compile it
        for (String path : files) {

            System.out.println(path);

            File file = new File(path);
            String fileName = file.getName();

            Parser parser = new Parser(file);

            codeWriter.setFileName(fileName);

            while (parser.hasMoreCommands()) {
                parser.advance();
                codeWriter.wirteLine(parser.getCurrentLine());

                String cT = parser.commandType();
                if (cT.equals("C_ARITHMETIC")) {
                    codeWriter.writeArithmetic(parser.arg0());
                } else if (cT.equals("C_PUSH")) {
                    codeWriter.writePush(parser.arg1(), parser.arg2());
                } else if (cT.equals("C_POP")) {
                    codeWriter.writePop(parser.arg1(), parser.arg2());
                } else if (cT.equals("C_LABEL")) {
                    codeWriter.writeLabel(parser.arg1());
                } else if (cT.equals("C_GOTO")) {
                    codeWriter.writeGoto(parser.arg1());
                } else if (cT.equals("C_IF")) {
                    codeWriter.writeIf(parser.arg1());
                } else if (cT.equals("C_CALL")) {
                    codeWriter.writeCall(parser.arg1(), parser.arg2());
                } else if (cT.equals("C_FUNCTION")) {
                    codeWriter.writeFunction(parser.arg1(), parser.arg2());
                } else if (cT.equals("C_RETURN")) {
                    codeWriter.writeReturn();
                }
            }
        }
        codeWriter.close();
    }
}
