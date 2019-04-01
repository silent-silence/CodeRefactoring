#include <stdio.h>
#include <algorithm>

#include "lex_yacc/config.hpp"
#include "lex_yacc/yacc.hpp"

using std::cout;
using std::endl;
using std::atoi;

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
