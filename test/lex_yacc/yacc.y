%{
#include "config.hpp"

using std::cout;
using std::endl;
using std::cerr;

extern "C"
{
	void yyerror(const char *s);
	extern int yylex(void);
}

%}

%token<m_type_of_data.m_boolean>Type_Boolean
%token<m_type_of_data.m_character>Type_Character
%token<m_type_of_data.m_integer>Type_Integer
%token<m_type_of_data.m_float>Type_Float
%token<m_type_of_data.m_double>Type_Double
%token<m_variable_name>Variable_Name
%token<m_constant.m_integer>Constant_Int
%token<m_operator.m_assignment>Operator_Assignment

%%
declare_integer: 
	type_of_data assignment {
		cout<<"declare_integer"<<endl;
	};

assignment: 
	Variable_Name Operator_Assignment constant {
		cout<<"assignment: "<<$1<<" "<<$2<<endl;
	};

constant: 
	Constant_Int {
		cout<<"constant: "<<$1<<endl;
	};

type_of_data: 
	Type_Integer{
		cout<<"type_of_data: "<<$1<<endl;
	};
%%

void yyerror(const char *s)
{
	cerr<<s<<endl;
} 
