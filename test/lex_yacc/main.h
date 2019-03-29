#ifndef MAIN_H
#define MAIN_H

#include <iostream>
#include <string>

struct Type
{
    std::string m_sId;
    int m_nInt;
    char m_cOp;
};

#define YYSTYPE Type

#endif // MAIN_H
