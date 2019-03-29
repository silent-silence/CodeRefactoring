#include <stdio.h>
#include "main.h"
#include "yacc.hpp"

int main()
{
    const char* sFile="../res/file.txt";
    FILE* fp=fopen(sFile, "r");
    if(fp==nullptr)
    {
        printf("cannot open %s\n", sFile);
        return -1;
    }
    extern FILE* yyin;
    yyin=fp;

    printf("-----begin parsing %s\n", sFile);
    yyparse();
    puts("-----end parsing");

    fclose(fp);

    return 0;
}
