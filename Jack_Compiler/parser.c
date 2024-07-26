#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "tokinizer.h"
#include "parser.h"

extern char *tokenTypeString[];
extern char *keywords[];

static FILE *outputFile;
static Token **tokens;
static int *currentIndex;
static char *indentation;

void initializeVariables(Token **_tokens, char *outputPath)
{
  tokens = _tokens;
  currentIndex = malloc(sizeof(int));
  *currentIndex = 0;
  indentation = malloc(200 * sizeof(char));
  indentation[0] = '\0';
  outputFile = fopen(outputPath, "w");
}

void compileClass(Token **_tokens, char *outputPath)
{
  initializeVariables(_tokens, outputPath);
  printXML("<class>\n");
  increaseIndentation();
  process("class", KEYWORD);
  process(tokens[*currentIndex]->value, IDENTIFIER);
  process("{", SYMBOL);
  compileClassVarDec();
  compileSubroutineDec();
  process("}", SYMBOL);
  decreaseIndentation();
  printXML("</class>\n");
  free(currentIndex);
  free(indentation);
  fclose(outputFile);
}

void compileClassVarDec()
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  if (!strcmp(currentTokenValue, "static") || !strcmp(currentTokenValue, "field"))
  {
    printXML("<classVarDec>\n");
    increaseIndentation();
    handleClassVar();
    decreaseIndentation();
    printXML("</classVarDec>\n");
    // process further lines of classVarDec
    compileClassVarDec();
  }
}

void handleClassVar()
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  char *type = tokenTypeString[tokens[*currentIndex]->type];

  // process static or field
  char *buffer = malloc(200 * sizeof(char));
  sprintf(buffer, "<%s> %s </%s>\n", type, currentTokenValue, type);
  printXML(buffer);
  *currentIndex = *currentIndex + 1;
  free(buffer);
  // process var type
  processCurrentToken();

  // process first var name
  process(tokens[*currentIndex]->value, IDENTIFIER);

  // process commas and variables
  while (!strcmp(tokens[*currentIndex]->value, ","))
  {
    process(",", SYMBOL);
    process(tokens[*currentIndex]->value, IDENTIFIER);
  }

  // process semicolon
  process(";", SYMBOL);
}

void compileSubroutineDec()
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  if (!strcmp(currentTokenValue, "constructor") || !strcmp(currentTokenValue, "function") || !strcmp(currentTokenValue, "method"))
  {
    printXML("<subroutineDec>\n");
    increaseIndentation();
    handleSubroutineDec();
    decreaseIndentation();
    printXML("</subroutineDec>\n");
    // process further subroutines
    compileSubroutineDec();
  }
}

void handleSubroutineDec()
{
  char *currentTokenValue = tokens[*currentIndex]->value;
  char *type = tokenTypeString[tokens[*currentIndex]->type];
  // process constructor, function or method
  char *buffer = malloc(200 * sizeof(char));
  sprintf(buffer, "<%s> %s </%s>\n", type, currentTokenValue, type);
  printXML(buffer);
  *currentIndex = *currentIndex + 1;
  free(buffer);

  // process subroutine return type
  currentTokenValue = tokens[*currentIndex]->value;
  type = tokenTypeString[tokens[*currentIndex]->type];
  if (!strcmp(currentTokenValue, "void") || isCurrentTokenPrimitiveType() ||
      tokens[*currentIndex]->type == IDENTIFIER)
  {
    char *buffer = malloc(200 * sizeof(char));
    sprintf(buffer, "<%s> %s </%s>\n", type, currentTokenValue, type);
    printXML(buffer);
    *currentIndex = *currentIndex + 1;
    free(buffer);
  }
  else
  {
    printError("\n handleSubroutineDec expects type\n");
  }

  // process subroutine name
  process(tokens[*currentIndex]->value, IDENTIFIER);
  process("(", SYMBOL);
  // process parameter list
  compileParameterList();
  process(")", SYMBOL);
  // process subroutine body
  compileSubroutineBody();
}

void compileParameterList()
{
  printXML("<parameterList>\n");
  increaseIndentation();

  if (isCurrentTokenPrimitiveType() || tokens[*currentIndex]->type == IDENTIFIER)
  {
    // process parameter type
    processCurrentToken();
    // process parameter name
    process(tokens[*currentIndex]->value, IDENTIFIER);
    // process commas and variables
    while (!strcmp(tokens[*currentIndex]->value, ","))
    {
      process(",", SYMBOL);
      // process parameter type
      processCurrentToken();
      // process parameter name
      process(tokens[*currentIndex]->value, IDENTIFIER);
    }
  }

  decreaseIndentation();
  printXML("</parameterList>\n");
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
}

void compileSubroutineBody()
{
  printXML("<subroutineBody>\n");
  increaseIndentation();
  process("{", SYMBOL);

  compileVarDec();

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
    // process variable type
    processCurrentToken();
    // process variable name
    process(tokens[*currentIndex]->value, IDENTIFIER);

    while (!strcmp(tokens[*currentIndex]->value, ","))
    {
      process(",", SYMBOL);
      // process variable name
      process(tokens[*currentIndex]->value, IDENTIFIER);
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
  if (tokens[*currentIndex]->type == IDENTIFIER)
  {
    processCurrentToken();
  }

  // process optional array access
  if (!strcmp(tokens[*currentIndex]->value, "["))
  {
    process("[", SYMBOL);
    compileExpression();
    process("]", SYMBOL);
  }

  process("=", SYMBOL);
  compileExpression();
  process(";", SYMBOL);

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

  process("{", SYMBOL);
  compileStatements();
  process("}", SYMBOL);

  // process optional else
  if (!strcmp(tokens[*currentIndex]->value, "else"))
  {
    process("else", KEYWORD);
    process("{", SYMBOL);
    compileStatements();
    process("}", SYMBOL);
  }

  decreaseIndentation();
  printXML("</ifStatement>\n");
}

void compileWhileStatement()
{
  printXML("<whileStatement>\n");
  increaseIndentation();

  process("while", KEYWORD);

  process("(", SYMBOL);
  compileExpression();
  process(")", SYMBOL);

  process("{", SYMBOL);
  compileStatements();
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

  decreaseIndentation();
  printXML("</doStatement>\n");
}

void compileSubroutineCall()
{
  if (tokens[*currentIndex]->type == IDENTIFIER)
  {
    processCurrentToken();
  }
  else
  {
    printError("\ncompileSubroutineCall expect identifier\n");
  }

  if (!strcmp(tokens[*currentIndex]->value, "."))
  {
    process(".", SYMBOL);
    if (tokens[*currentIndex]->type == IDENTIFIER)
    {
      processCurrentToken();
    }
    else
    {
      printError("\ncompileSubroutineCall identifier.identifier expect identifier\n");
    }
  }

  process("(", SYMBOL);
  compileExpressionList();
  process(")", SYMBOL);
}

void compileReturnStatement()
{
  printXML("<returnStatement>\n");
  increaseIndentation();

  process("return", KEYWORD);

  if (strcmp(tokens[*currentIndex]->value, ";"))
  {
    compileExpression();
  }

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
    processCurrentToken();
    compileTerm();
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
    processCurrentToken();
    compileTerm();
  }
  else if (!strcmp(nextTokenValue, "["))
  {
    processCurrentToken();
    process("[", SYMBOL);
    compileExpression();
    process("]", SYMBOL);
  }
  else if (!strcmp(nextTokenValue, "."))
  {
    processCurrentToken();
    process(".", SYMBOL);
    processCurrentToken();
    process("(", SYMBOL);
    compileExpressionList();
    process(")", SYMBOL);
  }
  else
  {
    processCurrentToken();
  }

  decreaseIndentation();
  printXML("</term>\n");
}

void compileExpressionList()
{
  printXML("<expressionList>\n");
  increaseIndentation();

  // TODO fix later
  if (strcmp(tokens[*currentIndex]->value, ")"))
  {
    compileExpression();
    while (!strcmp(tokens[*currentIndex]->value, ","))
    {
      process(",", SYMBOL);
      compileExpression();
    }
  }

  decreaseIndentation();
  printXML("</expressionList>\n");
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
  fprintf(outputFile, "%s%s", indentation, line);
}

void printError(char *message)
{
  fprintf(stderr, "%s", message);
  fclose(outputFile);
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
