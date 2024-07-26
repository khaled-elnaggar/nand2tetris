#ifndef TOKINIZER_H_
#define TOKINIZER_H_

#define TOTAL_NUMBER_OF_TOKENS 10000
#define INTERNAL_KEYWORDS_LENGTH 21

typedef enum
{
  KEYWORD,
  SYMBOL,
  IDENTIFIER,
  INT_CONST,
  STRING_CONST
} TokenType;


typedef struct Token
{
  char *value;
  TokenType type;
} Token;

int tokinize(Token **tokens, char *inputPath, char *outputPath);
int isSymbol(char c);
void createToken(Token **tokens, int tokenIndex, char tokenBuffer[200], int tokenLength, TokenType type);
TokenType getTokenType(char *token);
void printTokens(Token **tokens, int size, char *inputPath);
void freeTokensList(Token **tokens, int size);

#endif
