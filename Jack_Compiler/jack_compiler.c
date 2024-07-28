#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

#include "symbol_table.h"
#include "tokinizer.h"
#include "vm_writer.h"
#include "computation_engine.h"

int main(int argc, char *argv[argc + 1])
{
  char *inputPath;
  if (argc <= 1)
  {
    inputPath = ".";
  }
  else
  {
    inputPath = argv[1];
  }

  char **jackFiles = malloc(20 * sizeof(char *));
  int totalFiles = 0;
  struct dirent *de; // Pointer for directory entry

  DIR *dr = opendir(inputPath);

  if (dr != NULL) // opendir returns NULL if couldn't open directory
  {
    while ((de = readdir(dr)) != NULL)
    {
      int l = strlen(de->d_name);
      if (!strcmp((de->d_name) + l - 5, ".jack"))
      {
        jackFiles[totalFiles] = malloc(200 * sizeof(char));
        strcat(jackFiles[totalFiles], inputPath);
        strcat(jackFiles[totalFiles], "/");
        strcat(jackFiles[totalFiles], de->d_name);
        totalFiles++;
      }
    }
    closedir(dr);
  }
  else
  {
    jackFiles[totalFiles] = argv[1];
    totalFiles++;
  }

  if (totalFiles == 0)
  {
    perror("\nNo .jack file found in directory\n");
  }

  for (int i = 0; i < totalFiles; i++)
  {
    char *inputFilePath = malloc(200 * sizeof(char));
    strcpy(inputFilePath, jackFiles[i]);

    Token **tokens = malloc(TOTAL_NUMBER_OF_TOKENS * sizeof(Token *));
    if (!tokens)
    {
      return 1;
    }

    char *outputTokensPath = malloc(200 * sizeof(char));
    int basePathLength = strlen(inputFilePath) - 5;
    strncpy(outputTokensPath, inputFilePath, basePathLength);
    outputTokensPath[basePathLength] = '\0';
    strcat(outputTokensPath, "_tokens.xml");
    
    int totalTokens = tokinize(tokens, inputFilePath, outputTokensPath);
    
    char *outputVMFilePath = malloc(200 * sizeof(char));
    strncpy(outputVMFilePath, inputFilePath, basePathLength);
    outputVMFilePath[basePathLength] = '\0';
    strcat(outputVMFilePath, "_my.vm");

    initializeVMWriter(outputVMFilePath);

    char *parseTreeFilePath = malloc(200 * sizeof(char));
    strncpy(parseTreeFilePath, inputFilePath, basePathLength);
    parseTreeFilePath[basePathLength] = '\0';
    
    strcat(parseTreeFilePath, "_parsed.xml");
    
    compileClass(tokens, parseTreeFilePath);

    freeTokensList(tokens, totalTokens);
    free(inputFilePath);
    inputFilePath = NULL;
    free(outputTokensPath);
    outputTokensPath = NULL;
    free(parseTreeFilePath);
    parseTreeFilePath = NULL;
    free(outputVMFilePath);
    outputVMFilePath = NULL;
  }

  return EXIT_SUCCESS;
}
