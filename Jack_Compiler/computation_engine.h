#ifndef COMPILATION_ENGINE_H_
#define COMPILATION_ENGINE_H_

#include "tokinizer.h"
#include "symbol_table.h"


void compileClass(Token **tokens, char *outputPath);
void process(char *expectedKeyword, TokenType expectedType);
void printXML(char *line);
void printError(char *message);
void increaseIndentation();
void decreaseIndentation();
void compileClassVarDec();
void handleClassVar(VariableKind kind);
void compileSubroutineDec();
void handleSubroutineDec(SubroutineKind kind);
void compileParameterList(SubroutineKind kind);
void compileSubroutineBody(char *subroutineName, SubroutineKind kind);
void compileVarDec();
void processCurrentToken();
void compileStatements();
void compileLetStatement();
void compileIfStatement();
void compileWhileStatement();
void compileDoStatement();
void compileReturnStatement();
void compileExpression();
void handleInternalStatements();
void compileSubroutineCall();
int compileExpressionList();
void compileTerm();

int isCurrentTokenOperation();
int isCurrentTokenKeywordConstant();
int isCurrentTokenPrimitiveType();
#endif
