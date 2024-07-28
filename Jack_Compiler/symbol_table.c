#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol_table.h"

static int staticIndex = 0;
static int fieldIndex = 0;
static int localIndex = 0;
static int argumentIndex = 0;

static int classSize = 0;
static int subroutineSize = 0;

static SymbolTableEntry classSymbols[MAX_SYMBOL_COUNT];
static SymbolTableEntry subroutineSymbols[MAX_SYMBOL_COUNT];

char *variableKindString[] = {
    "static", "this", "argument", "local"};

void defineClassVariable(char *name, char *type, VariableKind kind)
{
  int index;
  if (kind == STATIC)
  {
    index = staticIndex++;
  }
  else
  {
    index = fieldIndex++;
  }
  char *typeBuffer = malloc(200 * sizeof(char));
  strcpy(typeBuffer, type);
  classSymbols[classSize] = (SymbolTableEntry){name, typeBuffer, kind, index};
  classSize++;
}

void defineSubroutineVariable(char *name, char *type, VariableKind kind)
{
  int index;
  if (kind == VAR)
  {
    index = localIndex++;
  }
  else
  {
    index = argumentIndex++;
  }
  char *typeBuffer = malloc(200 * sizeof(char));
  strcpy(typeBuffer, type);
  subroutineSymbols[subroutineSize] = (SymbolTableEntry){name, typeBuffer, kind, index};
  subroutineSize++;
}

void clearClassSymbolTable()
{
  freeTable(classSymbols, &classSize);
  staticIndex = 0;
  fieldIndex = 0;
}

void clearSubroutineSymbolTable()
{
  freeTable(subroutineSymbols, &subroutineSize);
  argumentIndex = 0;
  localIndex = 0;
}

void freeTable(SymbolTableEntry table[MAX_SYMBOL_COUNT], int *size)
{
  for (int i = 0; i < *size; i++)
  {
    freeEntry(table[i]);
  }
  *size = 0;
}

void freeEntry(SymbolTableEntry entry)
{
  free(entry.name);
  entry.name = NULL;
  free(entry.type);
  entry.type = NULL;
}

int getEntry(char *name, SymbolTableEntry *entry)
{
  if (searchTableForName(subroutineSymbols, subroutineSize, name, entry))
  {
    return 1;
  }

  if (searchTableForName(classSymbols, classSize, name, entry))
  {
    return 1;
  }

  return 0;
}

int searchTableForName(SymbolTableEntry table[MAX_SYMBOL_COUNT], int size, char *name, SymbolTableEntry *entry)
{

  for (int i = 0; i < size; i++)
  {
    if (!strcmp(table[i].name, name))
    {
      *entry = table[i];
      return 1;
    }
  }
  return 0;
}

int variableCount(VariableKind kind)
{
  switch (kind)
  {
  case STATIC:
    return staticIndex;
    break;
  case FIELD:
    return fieldIndex;
    break;
  case VAR:
    return localIndex;
    break;
  default:
    return argumentIndex;
  }
}

VariableKind getVariableKind(char *variable)
{
  if (!strcmp(variable, "static"))
  {
    return STATIC;
  }
  if (!strcmp(variable, "field"))
  {
    return FIELD;
  }
  if (!strcmp(variable, "ARG"))
  {
    return ARG;
  }
  if (!strcmp(variable, "var"))
  {
    return VAR;
  }
  return NONE_VAR_KIND;
}

SubroutineKind getSubroutineKind(char *subroutine)
{
  if (!strcmp(subroutine, "method"))
  {
    return METHOD;
  }
  if (!strcmp(subroutine, "constructor"))
  {
    return CONSTRUCTOR;
  }
  if (!strcmp(subroutine, "function"))
  {
    return FUNCTION;
  }
  return NONE_SUBROUTINE_KIND;
}
