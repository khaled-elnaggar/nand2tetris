#ifndef SYMBOL_TABLE_H_
#define SYMBOL_TABLE_H_

#define MAX_SYMBOL_COUNT 100

typedef enum 
{
  STATIC,
  FIELD,
  ARG,
  VAR,
  NONE_VAR_KIND
} VariableKind;

typedef enum
{
  METHOD,
  CONSTRUCTOR,
  FUNCTION,
  NONE_SUBROUTINE_KIND
} SubroutineKind;

typedef struct SymbolTableEntry
{
  char *name;
  char *type;
  VariableKind kind;
  int index;
} SymbolTableEntry;

void clearClassSymbolTable();
void clearSubroutineSymbolTable();
void freeTable(SymbolTableEntry table[MAX_SYMBOL_COUNT], int *size);
void freeEntry(SymbolTableEntry entry);
void defineClassVariable(char *name, char *type, VariableKind kind);
void defineSubroutineVariable(char *name, char *type, VariableKind kind);
int getEntry(char *name, SymbolTableEntry *entry);
int searchTableForName(SymbolTableEntry table[MAX_SYMBOL_COUNT], int size, char *name, SymbolTableEntry *entry);
int variableCount(VariableKind kind);
VariableKind getVariableKind(char *variable);
SubroutineKind getSubroutineKind(char *subroutine);
#endif
