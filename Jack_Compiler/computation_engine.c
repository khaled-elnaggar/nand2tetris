#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "symbol_table.h"
#include "tokinizer.h"
#include "vm_writer.h"
#include "computation_engine.h"

extern char *tokenTypeString[];
extern char *keywords[];
extern char *variableKindString[];

static FILE *parseTreeFile;
static Token **tokens;
static int *currentIndex;
static char *indentation;
static char *subroutineReturnType;
static int ifLabelId = 0;
static int whileLabelId = 0;
static char *className;

void initializeVariables(Token **_tokens, char *parseTreeFilePath)
{
  tokens = _tokens;
  currentIndex = malloc(sizeof(int));
  *currentIndex = 0;
  indentation = malloc(200 * sizeof(char));
  indentation[0] = '\0';
  parseTreeFile = fopen(parseTreeFilePath, "w");
}

void compileClass(Token **_tokens, char *parseTreeFilePath)
{
  initializeVariables(_tokens, parseTreeFilePath);
  printXML("<class>\n");
  increaseIndentation();
  process("class", KEYWORD);
  className = tokens[*currentIndex]->value;
  process(tokens[*currentIndex]->value, IDENTIFIER);
  process("{", SYMBOL);
  compileClassVarDec();
  compileSubroutineDec();
  process("}", SYMBOL);
  decreaseIndentation();
  printXML("</class>\n");
  free(currentIndex);
  currentIndex = NULL;
  free(indentation);
  indentation = NULL;
  fclose(parseTreeFile);
  clearClassSymbolTable();
}

void compileClassVarDec()
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  VariableKind kind = getVariableKind(currentTokenValue);
  if (kind == STATIC || kind == FIELD)
  {
    printXML("<classVarDec>\n");
    increaseIndentation();
    handleClassVar(kind);
    decreaseIndentation();
    printXML("</classVarDec>\n");
    // process further lines of classVarDec
    compileClassVarDec();
  }
}

void handleClassVar(VariableKind kind)
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  char *type = tokenTypeString[tokens[*currentIndex]->type];

  // process static or field
  char *buffer = malloc(200 * sizeof(char));
  sprintf(buffer, "<%s> %s </%s>\n", type, currentTokenValue, type);
  printXML(buffer);
  *currentIndex = *currentIndex + 1;
  free(buffer);
  buffer = NULL;

  char *variableType = tokens[*currentIndex]->value;
  // process var type
  processCurrentToken();

  char *variableName = malloc(200 * sizeof(char));
  strcpy(variableName, tokens[*currentIndex]->value);
  // process first var name
  process(tokens[*currentIndex]->value, IDENTIFIER);

  // write code - process symbol table for class
  defineClassVariable(variableName, variableType, kind);

  // process commas and variables
  while (!strcmp(tokens[*currentIndex]->value, ","))
  {
    process(",", SYMBOL);
    char *variableName = malloc(200 * sizeof(char));
    strcpy(variableName, tokens[*currentIndex]->value);
    process(tokens[*currentIndex]->value, IDENTIFIER);
    // write code - process symbol table for class
    defineClassVariable(variableName, variableType, kind);
  }

  // process semicolon
  process(";", SYMBOL);
}

void compileSubroutineDec()
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  SubroutineKind kind = getSubroutineKind(currentTokenValue);
  if (kind == METHOD || kind == CONSTRUCTOR || kind == FUNCTION)
  {
    printXML("<subroutineDec>\n");
    increaseIndentation();
    handleSubroutineDec(kind);
    decreaseIndentation();
    printXML("</subroutineDec>\n");
    // process further subroutines
    compileSubroutineDec();
  }
}

void handleSubroutineDec(SubroutineKind kind)
{

  // clear local and argument symbol table
  clearSubroutineSymbolTable();
  whileLabelId = 0;
  ifLabelId = 0;
  char *currentTokenValue = tokens[*currentIndex]->value;
  char *type = tokenTypeString[tokens[*currentIndex]->type];
  // process constructor, function or method
  char *buffer = malloc(200 * sizeof(char));
  sprintf(buffer, "<%s> %s </%s>\n", type, currentTokenValue, type);
  printXML(buffer);
  *currentIndex = *currentIndex + 1;
  free(buffer);
  buffer = NULL;

  // process subroutine return type
  subroutineReturnType = tokens[*currentIndex]->value;
  type = tokenTypeString[tokens[*currentIndex]->type];
  if (!strcmp(subroutineReturnType, "void") || isCurrentTokenPrimitiveType() ||
      tokens[*currentIndex]->type == IDENTIFIER)
  {
    char *buffer = malloc(200 * sizeof(char));
    sprintf(buffer, "<%s> %s </%s>\n", type, subroutineReturnType, type);
    printXML(buffer);
    *currentIndex = *currentIndex + 1;
    free(buffer);
    buffer = NULL;
  }
  else
  {
    printError("\n handleSubroutineDec expects type\n");
  }

  // process subroutine name
  char *subroutineName = tokens[*currentIndex]->value;
  process(tokens[*currentIndex]->value, IDENTIFIER);
  process("(", SYMBOL);
  // process parameter list
  compileParameterList(kind);
  process(")", SYMBOL);
  // process subroutine body
  compileSubroutineBody(subroutineName, kind);
}

void compileParameterList(SubroutineKind kind)
{
  printXML("<parameterList>\n");
  increaseIndentation();

  // write code - if subroutine type = method, then add this of type className and kind ARG to symbol table
  if (kind == METHOD)
  {
    char *buffer = malloc(5 * sizeof(char));
    strcpy(buffer, "this");
    defineSubroutineVariable(buffer, className, ARG);
  }

  if (isCurrentTokenPrimitiveType() || tokens[*currentIndex]->type == IDENTIFIER)
  {
    char *variableType = tokens[*currentIndex]->value;
    // process parameter type
    processCurrentToken();

    char *variableName = malloc(200 * sizeof(char));
    strcpy(variableName, tokens[*currentIndex]->value);
    // process parameter name
    process(tokens[*currentIndex]->value, IDENTIFIER);

    // write code - process symbol table for argument
    defineSubroutineVariable(variableName, variableType, ARG);

    // process commas and variables
    while (!strcmp(tokens[*currentIndex]->value, ","))
    {
      process(",", SYMBOL);

      variableType = tokens[*currentIndex]->value;
      // process parameter type
      processCurrentToken();
      variableName = malloc(200 * sizeof(char));
      strcpy(variableName, tokens[*currentIndex]->value);
      // process parameter name
      process(tokens[*currentIndex]->value, IDENTIFIER);

      // write code - process symbol table for argument
      defineSubroutineVariable(variableName, variableType, ARG);
    }
  }

  decreaseIndentation();
  printXML("</parameterList>\n");
}

void compileSubroutineBody(char *subroutineName, SubroutineKind kind)
{
  printXML("<subroutineBody>\n");
  increaseIndentation();
  process("{", SYMBOL);

  compileVarDec();

  // write code - function class.name varCount(VAR)
  char buffer[200];
  sprintf(buffer, "%s.%s", className, subroutineName);
  writeFunction(buffer, variableCount(VAR));

  // write code - if subroutine type is constructor: push constant varCount(FIELD)
  // write code -                                    call Memory.alloc 1
  // write code -                                    pop pointer 0

  if (kind == CONSTRUCTOR)
  {
    writePush("constant", variableCount(FIELD));
    writeCall("Memory.alloc", 1);
    writePop("pointer", 0);
  }

  // write code - if subroutine type is method: push argument 0
  // write code -                               pop pointer 0

  if (kind == METHOD)
  {
    writePush("argument", 0);
    writePop("pointer", 0);
  }

  compileStatements();
  process("}", SYMBOL);
  decreaseIndentation();
  printXML("</subroutineBody>\n");
}

void compileVarDec()
{

  if (!strcmp(tokens[*currentIndex]->value, "var"))
  {
    printXML("<varDec>\n");
    increaseIndentation();

    process("var", KEYWORD);

    char *variableType = tokens[*currentIndex]->value;
    // process variable type
    processCurrentToken();

    char *variableName = malloc(200 * sizeof(char));
    strcpy(variableName, tokens[*currentIndex]->value);
    // process variable name
    process(tokens[*currentIndex]->value, IDENTIFIER);

    // write code - process symbol table for local
    defineSubroutineVariable(variableName, variableType, VAR);

    while (!strcmp(tokens[*currentIndex]->value, ","))
    {
      process(",", SYMBOL);

      variableName = malloc(200 * sizeof(char));
      strcpy(variableName, tokens[*currentIndex]->value);
      // process variable name
      process(tokens[*currentIndex]->value, IDENTIFIER);

      // write code - process symbol table for argument
      defineSubroutineVariable(variableName, variableType, VAR);
    }
    process(";", SYMBOL);

    decreaseIndentation();
    printXML("</varDec>\n");

    compileVarDec();
  }
}

void compileStatements()
{

  printXML("<statements>\n");
  increaseIndentation();

  handleInternalStatements();

  decreaseIndentation();
  printXML("</statements>\n");

  // compile further statements
}

void handleInternalStatements()
{
  if (!strcmp(tokens[*currentIndex]->value, "let"))
  {
    compileLetStatement();
  }
  else if (!strcmp(tokens[*currentIndex]->value, "if"))
  {
    compileIfStatement();
  }
  else if (!strcmp(tokens[*currentIndex]->value, "while"))
  {
    compileWhileStatement();
  }
  else if (!strcmp(tokens[*currentIndex]->value, "do"))
  {
    compileDoStatement();
  }
  else if (!strcmp(tokens[*currentIndex]->value, "return"))
  {
    compileReturnStatement();
  }
  else
  {
    return;
  }
  handleInternalStatements();
}

void compileLetStatement()
{
  printXML("<letStatement>\n");
  increaseIndentation();

  // process let
  process("let", KEYWORD);

  // process variable name
  if (tokens[*currentIndex]->type != IDENTIFIER)
  {
    printError("compileLetStatement() expected identifier");
  }

  char *variableName = tokens[*currentIndex]->value;
  processCurrentToken();

  SymbolTableEntry entry;
  int isInSymbolTable = getEntry(variableName, &entry);

  if (!isInSymbolTable)
  {
    printError("compileLetStatement() Unknown type");
  }

  bool isArrayAccess = false;

  // process optional array access
  if (!strcmp(tokens[*currentIndex]->value, "["))
  {
    isArrayAccess = true;
    process("[", SYMBOL);
    compileExpression();
    // write code - push variableKind index
    writePush(variableKindString[entry.kind], entry.index);
    // write code - add
    writeArithmetic("add");
    process("]", SYMBOL);
  }

  process("=", SYMBOL);
  compileExpression();
  process(";", SYMBOL);

  // if array - write code - pop temp 0
  // if array - write code - pop pointer 1
  // if array - write code - push temp 0
  // if array - write code - pop that 0
  if (isArrayAccess)
  {
    writePop("temp", 0);
    writePop("pointer", 1);
    writePush("temp", 0);
    writePop("that", 0);
  }
  else
  {
    // todo else pop in variable name
    writePop(variableKindString[entry.kind], entry.index);
  }

  decreaseIndentation();
  printXML("</letStatement>\n");
}

void compileIfStatement()
{
  printXML("<ifStatement>\n");
  increaseIndentation();

  process("if", KEYWORD);

  process("(", SYMBOL);
  compileExpression();
  process(")", SYMBOL);

  char IF_TRUE[200];
  sprintf(IF_TRUE, "IF_TRUE%d", ifLabelId);

  char IF_FALSE[200];
  sprintf(IF_FALSE, "IF_FALSE%d", ifLabelId);

  char IF_END[200];
  sprintf(IF_END, "IF_END%d", ifLabelId++);

  // write code - if-goto IF_TRUE
  // write code - goto IF_FALSE
  writeIf(IF_TRUE);
  writeGoto(IF_FALSE);

  // write code - label IF_TRUE
  writeLabel(IF_TRUE);

  process("{", SYMBOL);
  compileStatements();
  process("}", SYMBOL);
  if (!strcmp(tokens[*currentIndex]->value, "else"))
  {
    // write code - goto IF_END
    writeGoto(IF_END);
  }

  // write code - label IF_FALSE
  writeLabel(IF_FALSE);

  // process optional else
  if (!strcmp(tokens[*currentIndex]->value, "else"))
  {
    process("else", KEYWORD);
    process("{", SYMBOL);
    compileStatements();
    process("}", SYMBOL);

    // write code - label IF_END
    writeLabel(IF_END);
  }

  decreaseIndentation();
  printXML("</ifStatement>\n");
}

void compileWhileStatement()
{
  printXML("<whileStatement>\n");
  increaseIndentation();

  process("while", KEYWORD);

  char L1[200];
  sprintf(L1, "WHILE_EXP%d", whileLabelId);

  char L2[200];
  sprintf(L2, "WHILE_END%d", whileLabelId++);

  // write code - label L1
  writeLabel(L1);

  process("(", SYMBOL);
  compileExpression();
  process(")", SYMBOL);
  // write code - not
  // write code - if-goto L2
  writeArithmetic("not");
  writeIf(L2);

  process("{", SYMBOL);
  compileStatements();

  // write code - goto L1
  writeGoto(L1);
  // write code - label L2
  writeLabel(L2);
  process("}", SYMBOL);

  decreaseIndentation();
  printXML("</whileStatement>\n");
}

void compileDoStatement()
{

  printXML("<doStatement>\n");
  increaseIndentation();

  process("do", KEYWORD);

  compileSubroutineCall();
  process(";", SYMBOL);

  // write code - pop temp 0
  writePop("temp", 0);
  decreaseIndentation();
  printXML("</doStatement>\n");
}

void compileSubroutineCall()
{
  compileExpression();
}

void compileReturnStatement()
{
  printXML("<returnStatement>\n");
  increaseIndentation();

  // write code - if void, push dummy 0
  if (!strcmp(subroutineReturnType, "void"))
  {
    writePush("constant", 0);
  }

  process("return", KEYWORD);

  if (strcmp(tokens[*currentIndex]->value, ";"))
  {
    compileExpression();
  }

  writeReturn();
  process(";", SYMBOL);

  decreaseIndentation();
  printXML("</returnStatement>\n");
}

void compileExpression()
{
  printXML("<expression>\n");
  increaseIndentation();
  compileTerm();

  if (isCurrentTokenOperation())
  {
    // save operation
    char op = tokens[*currentIndex]->value[0];
    processCurrentToken();

    // process exp 2
    compileTerm();

    // write code - push op (+ = add, - = sub, * = call Math.multiply 2, / = * = call Math.divide 2)
    switch (op)
    {
    case '+':
      writeArithmetic("add");
      break;
    case '-':
      writeArithmetic("sub");
      break;
    case '*':
      writeCall("Math.multiply", 2);
      break;
    case '/':
      writeCall("Math.divide", 2);
      break;
    case '&':
      writeArithmetic("and");
      break;
    case '|':
      writeArithmetic("or");
      break;
    case '<':
      writeArithmetic("lt");
      break;
    case '>':
      writeArithmetic("gt");
      break;
    default:
      writeArithmetic("eq");
    }
  }

  decreaseIndentation();
  printXML("</expression>\n");
}

void compileTerm()
{
  printXML("<term>\n");
  increaseIndentation();

  char *currentTokenValue = tokens[*currentIndex]->value;
  TokenType type = tokens[*currentIndex]->type;

  char *nextTokenValue = tokens[*currentIndex + 1]->value;

  if (type == INT_CONST || type == STRING_CONST || isCurrentTokenKeywordConstant())
  {
    if (!strcmp(currentTokenValue, "false") || !strcmp(currentTokenValue, "null"))
    {
      // false and null = push const 0;
      writePush("constant", 0);
    }
    if (!strcmp(currentTokenValue, "true"))
    {
      // true = push const 0, not;
      writePush("constant", 0);
      writeArithmetic("not");
    }
    if (!strcmp(currentTokenValue, "this"))
    {
      // this = push pointer 0
      writePush("pointer", 0);
    }
    if (type == INT_CONST)
    {
      // int const = push const x
      char *endptr;
      writePush("constant", strtol(currentTokenValue, &endptr, 10));
    }
    if (type == STRING_CONST)
    {
      // string: push constant length
      //         call String.new 1
      //         for(char c : string) {push constant c, call String.appendChar 1}
      int length = strlen(currentTokenValue);
      writePush("constant", length);
      writeCall("String.new", 1);
      for (int i = 0; i < length; i++)
      {
        writePush("constant", currentTokenValue[i]);
        writeCall("String.appendChar", 2);
      }
    }

    processCurrentToken();
  }
  else if (!strcmp(currentTokenValue, "("))
  {
    process("(", SYMBOL);
    compileExpression();
    process(")", SYMBOL);
  }
  else if (!strcmp(currentTokenValue, "-") || !strcmp(currentTokenValue, "~"))
  {
    char op = currentTokenValue[0];
    processCurrentToken();

    compileTerm();

    // write code - to push uniary op
    if (op == '-')
    {
      writeArithmetic("neg");
    }
    else
    {
      writeArithmetic("not");
    }
  }
  else if (!strcmp(nextTokenValue, "["))
  {
    //  write code - calc array base
    char *arrayVariable = tokens[*currentIndex]->value;
    SymbolTableEntry entry;
    int isInSymbolTable = getEntry(arrayVariable, &entry);

    processCurrentToken();
    process("[", SYMBOL);
    compileExpression();
    process("]", SYMBOL);

    //  write code - push array base
    writePush(variableKindString[entry.kind], entry.index);

    // write code - add
    writeArithmetic("add");
    //  write code - pop pointer 1
    writePop("pointer", 1);
    //  write code - push that 0
    writePush("that", 0);
  }
  else if (!strcmp(nextTokenValue, "."))
  {
    char *subroutineClassName = tokens[*currentIndex]->value;
    processCurrentToken();
    process(".", SYMBOL);
    char *subroutineName = tokens[*currentIndex]->value;
    processCurrentToken();
    process("(", SYMBOL);
    SymbolTableEntry entry;
    int isInSymbolTable = getEntry(subroutineClassName, &entry);
    // write code - need to check the variable first, if it is in Symbol table, then it is an object
    // then push variable (push local/arg/field/static x) (as arg 0)
    if (isInSymbolTable)
    {
      writePush(variableKindString[entry.kind], entry.index);
    }
    int nArgs = compileExpressionList();
    process(")", SYMBOL);
    // if it is in symbol table, call (entry.getType).method nArgs + 1
    // else call className.methodName nArgs + 1
    char buffer[200];
    if (isInSymbolTable)
    {
      sprintf(buffer, "%s.%s", entry.type, subroutineName);
      nArgs++;
    }
    else
    {
      sprintf(buffer, "%s.%s", subroutineClassName, subroutineName);
    }
    writeCall(buffer, nArgs);
  }
  else if (!strcmp(nextTokenValue, "("))
  {
    // write code - push this first (as arg 0)
    writePush("pointer", 0);
    char *subroutineName = tokens[*currentIndex]->value;
    processCurrentToken();
    process("(", SYMBOL);
    int nArgs = compileExpressionList();
    process(")", SYMBOL);
    // write code - call className.methodName nArgs + 1
    char buffer[200];
    sprintf(buffer, "%s.%s", className, subroutineName);
    writeCall(buffer, nArgs + 1);
  }
  else
  {
    // then push variable (push local/arg/field/static x)

    char *variableName = malloc(200 * sizeof(char));
    strcpy(variableName, tokens[*currentIndex]->value);
    SymbolTableEntry entry;
    getEntry(variableName, &entry);
    writePush(variableKindString[entry.kind], entry.index);
    processCurrentToken();
    free(variableName);
  }

  decreaseIndentation();
  printXML("</term>\n");
}

int compileExpressionList()
{
  printXML("<expressionList>\n");
  increaseIndentation();
  int nArgs = 0;
  if (strcmp(tokens[*currentIndex]->value, ")"))
  {
    nArgs++;
    compileExpression();
    while (!strcmp(tokens[*currentIndex]->value, ","))
    {
      process(",", SYMBOL);
      nArgs++;
      compileExpression();
    }
  }

  decreaseIndentation();
  printXML("</expressionList>\n");
  return nArgs;
}

void processCurrentToken()
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  char *type = tokenTypeString[tokens[*currentIndex]->type];

  // process variable type
  char *buffer = malloc(200 * sizeof(char));
  sprintf(buffer, "<%s> %s </%s>\n", type, currentTokenValue, type);
  printXML(buffer);
  *currentIndex = *currentIndex + 1;
  free(buffer);
  buffer = NULL;
}

void process(char *expectedKeyword, TokenType expectedType)
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  char *type = tokenTypeString[tokens[*currentIndex]->type];
  char *buffer = malloc(200 * sizeof(char));
  if (!strcmp(currentTokenValue, expectedKeyword) && tokens[*currentIndex]->type == expectedType)
  {
    sprintf(buffer, "<%s> %s </%s>\n", type, currentTokenValue, type);
    printXML(buffer);
    *currentIndex = *currentIndex + 1;
  }
  else
  {
    sprintf(buffer, "\nSyntax error! expected value %s of type %s, but found %s of type %s\n",
            expectedKeyword, type, currentTokenValue, tokenTypeString[expectedType]);
    printError(buffer);
  }
  free(buffer);
  buffer = NULL;
}

int isCurrentTokenPrimitiveType()
{
  char *tokenValue = tokens[*currentIndex]->value;

  return !strcmp(tokenValue, "int") ||
         !strcmp(tokenValue, "char") || !strcmp(tokenValue, "boolean");
}

int isCurrentTokenKeywordConstant()
{
  char *tokenValue = tokens[*currentIndex]->value;

  return !strcmp(tokenValue, "true") || !strcmp(tokenValue, "false") ||
         !strcmp(tokenValue, "null") || !strcmp(tokenValue, "this");
}

int isCurrentTokenOperation()
{
  char op = tokens[*currentIndex]->value[0];
  return op == '+' || op == '-' || op == '*' || op == '/' || op == '&' ||
         op == '|' || op == '<' || op == '>' || op == '=';
}

void printXML(char *line)
{
  // fprintf(stdout, "%s%s", indentation, line);
  fprintf(parseTreeFile, "%s%s", indentation, line);
}

void printError(char *message)
{
  fprintf(stderr, "%s", message);
  fclose(parseTreeFile);
  exit(EXIT_FAILURE);
}

void increaseIndentation()
{
  strcat(indentation, "  ");
}

void decreaseIndentation()
{
  int length = strlen(indentation) - 2;
  indentation[length] = '\0';
}
