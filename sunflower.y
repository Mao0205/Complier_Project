%{
#define YY_NO_UNPUT

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern int lineCount;

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror (const char *s);

%}
%union{
	int intVal;
	char stringVal[16];
	double doubleVal;
};

%token	Do
%token	Else 
%token	EndIf
%token	EndWhile
%token	Exit
%token	If
%token	Read
%token	Set
%token	Then
%token	While
%token	Write
%token	Program
%token	Begin
%token	End
%token	<stringVal>	Identifier
%token	Var
%token	Or
%token	And
%token	Not
%token	<intVal>	IntConst
%token	To
%token	Equal
%token	NotEqual
%token	Greater
%token	GreaterEqual
%token	Less
%token	LessEqual
%token	Plus
%token	Subtract
%token	Multiply
%token	Divide
%token	Mod
%token	Negative
%token	LeftBracket
%token	RightBracket


%start	program

%%

program: Program Identifier Begin declarations statements End {
		printf("program -> Program Identifier Begin declarations statements End\n");
	}
	;
declarations: declarations Var Identifier {
		printf("declarations -> declarations Var Identifier\n");
	}
	| /* empty */	{
		printf("declarations -> empty\n");
	}
	;
statements: statements statement {
		printf("statements -> statements statement\n");
	}
	| /* empty */	{
		printf("statements -> empty\n");
	}
	;
statement: Set Identifier To arithmeticExpression	{
		printf("statement -> Set Identifier = arithmeticExpression\n");
	}
	| If booleanExpression Then statements EndIf	{
		printf("statement -> If booleanExpression Then statements EndIf\n");
	}
	| If booleanExpression Then statements Else statements EndIf	{
		printf("statement -> If booleanExpression Then statements Else statements EndIf\n");
	}
	| While booleanExpression Do statements EndWhile	{
		printf("statement -> While booleanExpression Do statements EndWhile\n");
	}
	| Read Identifier	{
		printf("statement -> Read Identifier\n");
	}
	| Write arithmeticExpression	{
		printf("statement -> Write arithmeticExpression\n");
	}
	| Exit	{
		printf("statement -> Exit\n");
	}
	;
booleanExpression: booleanExpression Or booleanTerm	{
		printf("booleanExpression -> booleanExpression Or booleanTerm\n");
	}
	| booleanTerm	{
		printf("booleanExpression -> booleanTerm\n");
	}
	;
booleanTerm: booleanTerm And booleanFactor	{
		printf("booleanTerm -> booleanTerm And booleanFactor\n");
	}
	| booleanFactor	{
		printf("booleanTerm -> booleanFactor\n");
	}
	;
booleanFactor: Not booleanFactor	{
		printf("booleanFactor -> Not booleanFactor\n");
	}
	| relationExpression	{
		printf("booleanFactor -> Not relationExpression\n");
	}
	;
relationExpression: arithmeticExpression Equal arithmeticExpression	{
		printf("relationExpression -> arithmeticExpression == arithmeticExpression\n");
	}
	| arithmeticExpression NotEqual arithmeticExpression	{
		printf("relationExpression -> arithmeticExpression <> arithmeticExpression\n");
	}
	| arithmeticExpression Greater arithmeticExpression	{
		printf("relationExpression -> arithmeticExpression > arithmeticExpression\n");
	}
	| arithmeticExpression GreaterEqual arithmeticExpression	{
		printf("relationExpression -> arithmeticExpression >= arithmeticExpression\n");
	}
	| arithmeticExpression Less arithmeticExpression	{
		printf("relationExpression -> arithmeticExpression < arithmeticExpression\n");
	}
	| arithmeticExpression LessEqual arithmeticExpression	{
		printf("relationExpression -> arithmeticExpression <= arithmeticExpression\n");
	}
	;
arithmeticExpression: arithmeticExpression Plus arithmeticTerm	{
		printf("arithmeticExpression -> arithmeticExpression + arithmeticTerm\n");
	}
	| arithmeticExpression Subtract arithmeticTerm	{
		printf("arithmeticExpression -> arithmeticExpression – arithmeticTerm\n");
	}
	| arithmeticTerm	{
		printf("arithmeticExpression -> arithmeticTerm\n");
	}
	;
arithmeticTerm: arithmeticTerm Multiply arithmeticFactor	{
		printf("arithmeticTerm -> arithmeticTerm * arithmeticFactor\n");
	}
	| arithmeticTerm Divide arithmeticFactor	{
		printf("arithmeticTerm -> arithmeticTerm / arithmeticFactor\n");
	}
	| arithmeticTerm Mod arithmeticFactor	{
		printf("arithmeticTerm -> arithmeticTerm %% arithmeticFactor\n");
	}
	| arithmeticFactor	{
		printf("arithmeticTerm -> arithmeticFactor\n");
	}
	;
arithmeticFactor: Negative arithmeticFactor {
		printf("arithmeticFactor -> - arithmeticFactor\n");
	}
	| primaryExpression	{
		printf("arithmeticFactor -> primaryExpression\n");
	}
	;
primaryExpression: IntConst	{
		printf("primaryExpression -> IntConst\n");
	}
	| Identifier	{
		printf("primaryExpression -> Identifier\n");
	}
	| LeftBracket arithmeticExpression RightBracket	{
		printf("primaryExpression -> ( arithmeticExpression )\n");
	}
	;
%%
int main(int argc, char **argv) {
	
	yyin = fopen( argv[1], "r" );
	
	yyparse();


	return 0;
}

void yyerror (const char *s){
  //fprintf(stderr, "%s\n", s);
  fprintf(stderr, "Syntax error: line %d \n", lineCount);
}

