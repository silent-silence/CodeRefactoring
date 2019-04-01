%{
#include <stdio.h>
#include "config.hpp"
#include "yacc.hpp"
using std::cout;
using std::endl;

extern "C"
{
	int yywrap(void);
	int yylex(void);
}
%}

%x COMMENT

/*type of data*/
Type_Boolean		"bool"
Type_Character		"char"
Type_Double			"double"
Type_Float			"float"
Type_Integer		"int"
Variable_Name       ([_a-zA-Z][_0-9a-zA-Z]*)
Constant_Int        ([0-9])+
Operator_Assignment ([=])


%%

{Type_Boolean} {
    yylval.m_type_of_data.m_boolean=yytext;
    return Type_Boolean;
}

{Type_Character} {
    yylval.m_type_of_data.m_character=yytext;
    return Type_Character;
}

{Type_Double} {
    yylval.m_type_of_data.m_double=yytext;
    return Type_Double;
}

{Type_Float} {
    yylval.m_type_of_data.m_float=yytext;
    return Type_Float;
}

{Type_Integer} {
    yylval.m_type_of_data.m_integer=yytext;
    return Type_Integer;
}

{Variable_Name} {
    yylval.m_variable_name=yytext;
    return Variable_Name;
}

{Constant_Int} {
    yylval.m_constant.m_integer=yytext;
    return Constant_Int;
}

{Operator_Assignment} {
    yylval.m_operator.m_assignment=yytext;
    return Operator_Assignment;
}
%%

int yywrap(void)  
{  
    puts("-----the file is end");  
    return 1;
}  