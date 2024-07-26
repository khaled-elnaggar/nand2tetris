#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "tokinizer.h"

char *tokenTypeString[] = {
    "keyword", "symbol", "identifier", "integerConstant", "stringConstant"};

char *keywords[] = {
    "class", "constructor", "function", "method", "field", "static",
    "var", "int", "char", "boolean", "void", "true", "false", "null", "this",
    "let", "do", "if", "else", "while", "return"};

int tokinize(Token **tokens, char *inputPath, char *outputPath)
{
  int tokenIndex = 0;

  FILE *input = fopen(inputPath, "r");
  if (!input)
  {
    perror("fopen␣failed");
    return EXIT_FAILURE;
  }

  char c = fgetc(input);

  while (c != EOF)
  {
    char tokenBuffer[200];
    int tokenLength = 0;

    while (c == ' ' || c == '\t' || c == '\n')
    {
      c = fgetc(input);
    }

    if (c == '/')
    {
      c = fgetc(input);
      if (c == '/')
      {
        while (c != '\n')
        {
          c = fgetc(input);
        }
        c = fgetc(input);
        continue;
      }
      else if (c == '*')
      {
        char prev = fgetc(input);
        c = fgetc(input);
        while (1)
        {
          if (prev == '*' && c == '/')
          {
            c = fgetc(input);
            break;
          }
          else
          {
            prev = c;
            c = fgetc(input);
          }
        }
      }
      else
      {
        tokenBuffer[tokenLength] = '/';
        tokenLength++;
        createToken(tokens, tokenIndex, tokenBuffer, tokenLength, SYMBOL);
        tokenIndex++;
        continue;
      }
    }

    if (isSymbol(c))
    {
      tokenBuffer[tokenLength] = c;
      tokenLength++;
      createToken(tokens, tokenIndex, tokenBuffer, tokenLength, SYMBOL);
      tokenIndex++;
      c = fgetc(input);
      continue;
    }

    if (c == '"')
    {
      c = fgetc(input);
      while (c != '"')
      {
        tokenBuffer[tokenLength] = c;
        tokenLength++;
        c = fgetc(input);
      }

      if (tokenLength > 0)
      {
        createToken(tokens, tokenIndex, tokenBuffer, tokenLength, STRING_CONST);
        tokenIndex++;
      };
      c = fgetc(input);
      continue;
    }

    while (c != ' ' && c != EOF && c != '\n' && c != '/' && c != '"' && !isSymbol(c))
    {
      tokenBuffer[tokenLength] = c;
      tokenLength++;
      c = fgetc(input);
    }

    if (tokenLength > 0)
    {
      createToken(tokens, tokenIndex, tokenBuffer, tokenLength, KEYWORD);
      tokens[tokenIndex]->type = getTokenType(tokens[tokenIndex]->value);
      tokenIndex++;
    };
  }

  fclose(input);
  printTokens(tokens, tokenIndex, outputPath);
  return tokenIndex;
}

void createToken(Token **tokens, int tokenIndex, char tokenBuffer[200], int tokenLength, TokenType type)
{
  tokens[tokenIndex] = malloc(sizeof(Token));
  tokens[tokenIndex]->value = malloc(tokenLength + 1);
  strncpy(tokens[tokenIndex]->value, tokenBuffer, tokenLength);
  tokens[tokenIndex]->value[tokenLength] = '\0';
  tokens[tokenIndex]->type = type;
}

TokenType getTokenType(char *token)
{
  for (int i = 0; i < INTERNAL_KEYWORDS_LENGTH; i++)
  {
    if (strcmp(token, keywords[i]) == 0)
    {
      return KEYWORD;
    }
  }

  char *endptr;
  strtol(token, &endptr, 10);
  if (*endptr == '\0')
  {
    return INT_CONST;
  }

  return IDENTIFIER;
}

void printTokens(Token **tokens, int size, char *inputPath)
{
  FILE *outputFile = fopen(inputPath, "w");
  fprintf(outputFile, "<tokens>\n");
  for (int i = 0; i < size; i++)
  {
    Token token = *tokens[i];
    char *value = token.value;
    char *actualValue = token.value;

    TokenType type = token.type;
    if (type == SYMBOL)
    {
      if (value[0] == '<')
      {
        actualValue = "&lt;";
      }
      if (value[0] == '>')
      {
        actualValue = "&gt;";
      }
      if (value[0] == '"')
      {
        actualValue = "&quot;";
      }
      if (value[0] == '&')
      {
        actualValue = "&amp;";
      }
    }
    fprintf(outputFile, "<%s> %s </%s>\n", tokenTypeString[type], actualValue, tokenTypeString[type]);
  }
  fprintf(outputFile, "</tokens>\n");
  fclose(outputFile);
}

int isSymbol(char c)
{
  return c == '{' || c == '}' || c == '(' || c == ')' || c == '[' || c == ']' || c == '.' || c == ',' || c == ';' ||
         c == '+' || c == '-' || c == '*' || c == '/' || c == '&' || c == '|' || c == '<' || c == '>' || c == '=' || c == '~';
}

void freeTokensList(Token **tokens, int size)
{
  for (int i = 0; i < size; i++)
  {
    free(tokens[i]->value);
    free(tokens[i]);
  }
  free(tokens);
}
