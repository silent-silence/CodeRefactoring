#ifndef CONFIG_HPP
#define CONFIG_HPP

#include <iostream>
#include <string>

struct Type_of_data
{
    std::string m_integer;
    std::string m_boolean;
    std::string m_character;
    std::string m_float;
    std::string m_double;
};

struct Constant
{
    std::string m_integer;
};

struct Operator
{
    std::string m_assignment;
};

struct Type
{
    Constant m_constant;
    Operator m_operator;
    Type_of_data m_type_of_data;
    std::string m_variable_name;
    std::string m_cout;
};

#define YYSTYPE Type

#endif
