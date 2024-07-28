#ifndef VM_WRITER_H_
#define VM_WRITER_H_

void initializeVMWriter(char * outputVMFilePath);
void writePush(char * segment, int index);
void writePop(char * segment, int index);
void writeArithmetic(char * command);
void writeLabel(char * label);
void writeGoto(char * command);
void writeIf(char * command);
void writeCall(char * name, int nArgs);
void writeFunction(char * name, int nVars);
void writeReturn();
void closeVMWriter();
#endif
