%{
#include "main.h"

using std::cout;
using std::endl;
using std::cerr;

extern "C"
{
	void yyerror(const char *s);
	extern int yylex(void);
}

%}

%token<m_nInt>INTEGER
%token<m_sId>IDENTIFIER
%token<m_cOp>OPERATOR
%type<m_sId>file
%type<m_sId>tokenlist

%%

file:
	tokenlist
	{
		cout<<"all id:"<<$1<<endl;
	};
tokenlist:
	{
	}
	| tokenlist INTEGER
	{
		cout<<"int: "<<$2<<endl;
	}
	| tokenlist IDENTIFIER
	{
		$$+=" " + $2;
		cout<<"id: "<<$2<<endl;
	}
	| tokenlist OPERATOR
	{
		cout<<"op: "<<$2<<endl;
	};

%%

void yyerror(const char *s)
{
	cerr<<s<<endl;
} 
