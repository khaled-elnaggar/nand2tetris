#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "vm_writer.h"

static FILE *outputVMFile;

void initializeVMWriter(char *outputVMFilePath)
{
  outputVMFile = fopen(outputVMFilePath, "w");
}

void writePush(char *segment, int index)
{
  fprintf(stdout, "push %s %d\n", segment, index);
  fprintf(outputVMFile, "push %s %d\n", segment, index);
}

void writePop(char *segment, int index)
{
  fprintf(stdout, "pop %s %d\n", segment, index);
  fprintf(outputVMFile, "pop %s %d\n", segment, index);
}

void writeArithmetic(char *command)
{
  fprintf(stdout, "%s\n", command);
  fprintf(outputVMFile, "%s\n", command);
}

void writeCall(char *name, int nArgs)
{
  fprintf(stdout, "call %s %d\n", name, nArgs);
  fprintf(outputVMFile, "call %s %d\n", name, nArgs);
}

void writeFunction(char *name, int nVars)
{
  fprintf(stdout, "function %s %d\n", name, nVars);
  fprintf(outputVMFile, "function %s %d\n", name, nVars);
}

void writeReturn()
{
  fprintf(stdout, "return\n");
  fprintf(outputVMFile, "return\n");
}

void writeLabel(char *label)
{
  fprintf(stdout, "label %s\n", label);
  fprintf(outputVMFile, "label %s\n", label);
}
void writeGoto(char *label)
{
  fprintf(stdout, "goto %s\n", label);
  fprintf(outputVMFile, "goto %s\n", label);
}
void writeIf(char *label)
{
  fprintf(stdout, "if-goto %s\n", label);
  fprintf(outputVMFile, "if-goto %s\n", label);
}

void closeVMWriter(){
  fclose(outputVMFile);
}