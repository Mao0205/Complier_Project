%option noyywrap
%{
#define YY_NO_UNPUT

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "sunflower.tab.h"

char textIn[20];
int tokenType;
int yyerror(char *s);
int lineCount = 1;

%}

enter	[\n]
delim	[ \t]
ws	{delim}+
letter	[A-Za-z]
digit	[0-9]
id	{letter}({letter}|{digit})*
number	{digit}+
comment "//"[^\n]+

%%

{enter}	{lineCount++;}
{comment} {/*no action or return*/}

{ws}	{/* no action */}
"And" {return And;}
"Begin" {return Begin;}
"Do" {return Do;}
"Else" {return Else;}
"End" {return End;}
"EndIf" {return EndIf;}
"EndWhile" {return EndWhile;}
"Exit" {return Exit;}
"If" {return If;}
"Set" {return Set;}
"Not" {return Not;}
"Or" {return Or;}
"Program" {return Program;}
"Read" {return Read;}
"Then" {return Then;}
"Var" {return Var;}
"While" {return While;}
"Write" {return Write;}
"+" {return Plus;}
"-" {return Subtract;}
"*" {return Multiply;}
"/" {return Divide;}
"%" {return Mod;}
"=" {return To;}
"==" {return Equal;}
"<>" {return NotEqual;}
">" {return Greater;}
">=" {return GreaterEqual;}
"<" {return Less;}
"<=" {return LessEqual;}
"(" {return LeftBracket;}
")" {return RightBracket;}
{id} {
	if(yyleng <= 16){
		return Identifier;
	}
	else {
		fprintf(stderr, "Lexical error: line %d : identifier length too long.\n", lineCount);	
	}
}
{number} {
	int n = atoi(yytext);
	if(n <= 20479 && n >= -20479){
		return IntConst;
	}
	else{
		fprintf(stderr, "Lexical error: line %d : illegal integer constant.\n", lineCount);
	}
}

. {
	fprintf(stderr, "Lexical error: line %d : unknown character \"%s\".\n", lineCount, yytext);
}

%%

