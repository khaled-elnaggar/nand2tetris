#ifndef PARSER_H_
#define PARSER_H_
#include "tokinizer.h"

void compileClass(Token **tokens, char *outputPath);
void process(char *expectedKeyword, TokenType expectedType);
void printXML(char *line);
void printError(char *message);
void increaseIndentation();
void decreaseIndentation();
void compileClassVarDec();
void handleClassVar();
void compileSubroutineDec();
void handleSubroutineDec();
void compileParameterList();
void compileSubroutineBody();
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
void compileExpressionList();
void compileTerm();

int isCurrentTokenOperation();
int isCurrentTokenKeywordConstant();
int isCurrentTokenPrimitiveType();
#endif
