/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_SUNFLOWER_TAB_H_INCLUDED
# define YY_YY_SUNFLOWER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    Do = 258,
    Else = 259,
    EndIf = 260,
    EndWhile = 261,
    Exit = 262,
    If = 263,
    Read = 264,
    Set = 265,
    Then = 266,
    While = 267,
    Write = 268,
    Program = 269,
    Begin = 270,
    End = 271,
    Identifier = 272,
    Var = 273,
    Or = 274,
    And = 275,
    Not = 276,
    IntConst = 277,
    To = 278,
    Equal = 279,
    NotEqual = 280,
    Greater = 281,
    GreaterEqual = 282,
    Less = 283,
    LessEqual = 284,
    Plus = 285,
    Subtract = 286,
    Multiply = 287,
    Divide = 288,
    Mod = 289,
    Negative = 290,
    LeftBracket = 291,
    RightBracket = 292
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 16 "sunflower.y"

	int intVal;
	char stringVal[16];
	double doubleVal;

#line 101 "sunflower.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SUNFLOWER_TAB_H_INCLUDED  */
