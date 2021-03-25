import java.io.FileWriter;
import java.io.IOException;

public class CodeWriter {
    FileWriter output = null;
    String fileName = null;
    int arthIndex = 0, returnIndex = 0;

    public CodeWriter(String file, String type) throws IOException {
        output = new FileWriter(file);
        if (type.equals("dir")) {
            //SP=256
            output.write("////SP = 256\n");
            output.write("@261\n");
            output.write("D=A\n");
            output.write("@SP\n");
            output.write("M=D\n\n");

            //call Sys.init
            output.write("////call Sys.init\n");
            output.write("@Sys.init\n");
            output.write("0; JMP\n\n");
        }
    }

    public void setFileName(String fileName) throws IOException {
        this.fileName = fileName.substring(0, fileName.length() - 3);
        output.write("(" + this.fileName + ")");
    }

    public void writeArithmetic(String command) throws IOException {
        output.write("@SP\n");
        output.write("M=M-1\n");
        output.write("A=M\n");
        output.write("D=M\n");
        output.write("@SP\n");
        output.write("M=M-1\n");
        output.write("A=M\n");

        switch (command) {
            case "add":
                output.write("M=D+M\n");
                break;

            case "sub":
                output.write("M=M-D\n");
                break;

            case "neg":
                output.write("@SP\n");
                output.write("M=M+1\n");
                output.write("A=M\n");
                output.write("D=M\n");
                output.write("M=-M\n");
                break;

            case "eq":
                output.write("D=D-M\n");
                output.write("@TRUE" + arthIndex + "\n");
                output.write("D; JEQ\n");       // if D-M=0 jump to true

                output.write("@SP\n");          // else *sp=0
                output.write("A=M\n");
                output.write("M=0\n");
                output.write("@END" + arthIndex + "\n");
                output.write("0; JMP\n");

                output.write("(TRUE" + arthIndex + ")\n");       //(TURE) *sp=1
                output.write("@SP\n");
                output.write("A=M\n");
                output.write("M=-1\n");
                output.write("(END" + arthIndex + ")\n");          // sp++
                arthIndex++;
                break;

            case "lt":
                output.write("D=M-D\n");
                output.write("@TRUE" + arthIndex + "\n");
                output.write("D; JLT\n");       // if M-D<0 jump to true

                output.write("@SP\n");          // else *sp=0
                output.write("A=M\n");
                output.write("M=0\n");
                output.write("@END" + arthIndex + "\n");
                output.write("0; JMP\n");

                output.write("(TRUE" + arthIndex + ")\n");       //(TURE) *sp=1
                output.write("@SP\n");
                output.write("A=M\n");
                output.write("M=-1\n");
                output.write("(END" + arthIndex + ")\n");          // sp++
                arthIndex++;
                break;

            case "gt":
                output.write("D=M-D\n");
                output.write("@TRUE" + arthIndex + "\n");
                output.write("D; JGT\n");       // if M-D>0 jump to true

                output.write("@SP\n");          // else *sp=0
                output.write("A=M\n");
                output.write("M=0\n");
                output.write("@END" + arthIndex + "\n");
                output.write("0; JMP\n");

                output.write("(TRUE" + arthIndex + ")\n");       //(TURE) *sp=1
                output.write("@SP\n");
                output.write("A=M\n");
                output.write("M=-1\n");
                output.write("(END" + arthIndex + ")\n");          // sp++
                arthIndex++;
                break;

            case "and":
                output.write("M=D&M\n");
                break;

            case "or":
                output.write("M=D|M\n");
                break;

            case "not":
                output.write("@SP\n");
                output.write("M=M+1\n");
                output.write("A=M\n");
                output.write("D=M\n");
                output.write("M=!M\n");
                break;
        }
        output.write("@SP\n");
        output.write("M=M+1\n");

    }

    public void writePush(String segment, int index) throws IOException {
        switch (segment) {
            case "LCL":
            case "ARG":
            case "THIS":
            case "THAT":
                output.write("@" + segment + "\n");
                output.write("D=M\n");
                output.write("@" + index + "\n");
                output.write("A=D+A\n");
                output.write("D=M\n");

                break;
            case "constant":
                output.write("@" + index + "\n");
                output.write("D=A\n");

                break;
            case "pointer":
                output.write("@" + (index + 3) + "\n");
                output.write("D=M\n");

                break;
            case "temp":
                output.write("@" + (index + 5) + "\n");
                output.write("D=M\n");
                break;
            case "static":
                output.write("@" + fileName + "." + index + "\n");
                output.write("D=M\n");
                break;
        }
        output.write("@SP\n");
        output.write("A=M\n");
        output.write("M=D\n");
        output.write("@SP\n");
        output.write("M=M+1\n");
    }

    public void writePop(String segment, int index) throws IOException {
        if (segment.equals("temp")) {
            output.write("@" + (5 + index) + "\n");
            output.write("D=A\n");
        } else if (segment.equals("pointer")) {
            output.write("@" + (3 + index) + "\n");
            output.write("D=A\n");
        } else if (segment.equals("static")) {
            output.write("@" + fileName + "." + index + "\n");
            output.write("D=A\n");
        } else {
            output.write("@" + segment + "\n");
            output.write("D=M\n");
            output.write("@" + index + "\n");
            output.write("D=D+A\n");
        }
        output.write("@R13\n");
        output.write("M=D\n");
        output.write("@SP\n");
        output.write("M=M-1\n");
        output.write("A=M\n");
        output.write("D=M\n");
        output.write("@R13\n");
        output.write("A=M\n");
        output.write("M=D\n");
    }

    public void writeLabel(String label) throws IOException {
        output.write("(" + label + ")\n");
    }

    public void writeGoto(String label) throws IOException {
        output.write("@" + label + "\n");
        output.write("0; JMP\n");
    }

    public void writeIf(String label) throws IOException {
        output.write("@SP\n");
        output.write("M=M-1\n");
        output.write("A=M\n");
        output.write("D=M\n");
        output.write("@" + label + "\n");
        output.write("D; JNE\n");
    }

    public void writeFunction(String functionName, int numVars) throws IOException {
        //generate function label
        output.write("////generate function label\n");
        output.write("(" + functionName + ")\n\n");

        //add numVars local variables = 0
        output.write("////adding " + numVars + " local variables = 0\n");
        for (int i = 0; i < numVars; i++) {
            output.write("@SP\n");
            output.write("A=M\n");
            output.write("M=0\n");
            output.write("@SP\n");
            output.write("M=M+1\n\n");
        }

    }

    public void writeCall(String functionName, int numVars) throws IOException {
        String returnAddress = "return-address" + returnIndex++;

        //push return-address, LCL, ARG, THIS, THAT
        output.write("////push return-address, LCL, ARG, THIS, THAT\n");
        output.write("@" + returnAddress + "\n");
        output.write("D=A\n");
        output.write("@SP\n");
        output.write("A=M\n");
        output.write("M=D\n");
        output.write("@SP\n");
        output.write("M=M+1\n\n");

        for (String seg : new String[]{"LCL", "ARG", "THIS", "THAT"}) {
            output.write("@" + seg + "\n");
            output.write("D=M\n");
            output.write("@SP\n");
            output.write("A=M\n");
            output.write("M=D\n");
            output.write("@SP\n");
            output.write("M=M+1\n\n");
        }

        //ARG = SP - (numVars + 5)
        output.write("////ARG = SP - " + (numVars + 5) + "\n");
        output.write("@" + (numVars + 5) + "\n");
        output.write("D=A\n");
        output.write("@SP\n");
        output.write("D=M-D\n");
        output.write("@ARG\n");
        output.write("M=D\n");

        //LCL = SP
        output.write("@SP\n");
        output.write("D=M\n");
        output.write("@LCL\n");
        output.write("M=D\n");

        //goto functionName
        output.write("@" + functionName + "\n");
        output.write("0; JMP\n");

        //generate label (return-address)
        output.write("(" + returnAddress + ")\n");

    }

    public void writeReturn() throws IOException {
        //(endFrame) = LCL
        output.write("////R13(endFrame) = LCL\n");
        output.write("@LCL\n");
        output.write("D=M\n");
        output.write("@endFrame\n");
        output.write("M=D\n\n");

        //R14(RET) = *(endFrame - 5)
        output.write("////R14(RET) = *(endFrame - 5)\n");
        output.write("@5\n");
        output.write("D=A\n");
        output.write("@endFrame\n");
        output.write("D=M-D\n");
        output.write("A=D\n");
        output.write("D=M\n");
        output.write("@RET\n");
        output.write("M=D\n\n");

        //*ARG = pop()
        output.write("////*ARG = pop()\n");
        output.write("@SP\n");
        output.write("M=M-1\n");
        output.write("A=M\n");
        output.write("D=M\n");
        output.write("@ARG\n");
        output.write("A=M\n");
        output.write("M=D\n\n");

        //SP = ARG + 1
        output.write("////SP = ARG + 1\n");
        output.write("@ARG\n");
        output.write("D=M+1\n");
        output.write("@SP\n");
        output.write("M=D\n\n");

        //Setting THAT THIS ARG LCL from the frame
        output.write("////getting THAT THIS ARG LCL from the frame\n");
        String[] segments = new String[]{"THAT", "THIS", "ARG", "LCL"};
        for (int i = 0; i < segments.length; i++) {
            output.write("@" + (i + 1) + "\n");
            output.write("D=A\n");
            output.write("@endFrame\n");
            output.write("D=M-D\n");
            output.write("A=D\n");
            output.write("D=M\n");
            output.write("@" + segments[i] + "\n");
            output.write("M=D\n\n");
        }

        //goto RET
        output.write("////goto RET\n");
        output.write("@RET\n");
        output.write("A=M\n");
        output.write("0; JMP\n\n");

    }

    // Writes the line from VM as a comment for better debugging
    public void wirteLine(String currentLine) throws IOException {
        output.write("\n\t//" + currentLine + "\n");
    }

    public void close() throws IOException {
        output.close();
    }
}

/*
call Foo.mult n

//Push the frame of the caller function
save the return address??? (the next instruction that is to be carried right after the callee function is over (next line after function invocation as in "call fun x"))
push LCL
push ARG
push THIS
push THAT

//Save SP - 5 - numberOfArguments ARG
@(arg2 + 5)
D=A
@SP
D=M-D
@ARG
M=D

//LCL = SP (the LCL TO FUCKING WHATEVER)
@SP
D=M
@LCL
M=D

// goto functionName
// generate a label for the (return address)
 */

/*
function Foo.mult n

// generate (Foo.mult) label
// add n local variables = 0
for(int i = 0; i < n; i++){
    output.write("@SP\n");
    output.write("A=M\n");
    output.write("M=0\n");
    output.write("@SP\n");
    output.write("M=M+1\n");
}
 */

/*
return

// R13 = LCL
@LCL
D=M
@R13
M=D

//return address = *(endFrame - 5)
@5
D=A
@R13
D=M-D
A=D
D=M
@R14
M=D

*ARG = pop()

// SP = ARG + 1
// THAT = *(endFrame - 1);
// THIS = *(endFrame - 2);
// ARG = *(endFrame - 3);
// LCL = *(endFrame - 4);

// goto retAddress
 */