%{
#include <stdio.h>
#include <ctype.h>
int yylex(void);
int yyerror(char *s);
int dom_max, dom_min;
%}

%union{
int i_num;
float f_num;
}

%token <i_num> INT
%token <f_num> FLOAT
%token LPARENS
%token RPARENS
%token LBRACK
%token RBRACK
%token SEMICOLON
%token COMMA

%%

mem_func_final: LPARENS mem_func_tuple RPARENS
		{ printf("\nThe input string is SYNTACTICALLY CORRECT (says the checker).\n\n"); }
;

mem_func_tuple: dom_tuple COMMA val_tuple_list_done
;

dom_tuple: LPARENS INT COMMA INT RPARENS
		{ dom_min = $2; 
		  dom_max = $4; 
		}
;

val_tuple_list_done: LBRACK val_tuple_list RBRACK
;

val_tuple_list: val_tuple | val_tuple SEMICOLON val_tuple_list
;

val_tuple: LPARENS INT COMMA FLOAT RPARENS 
		{ if ($2 > dom_max || $2 < dom_min) {
			yyerror("syntax error");
			YYERROR;
		  }
		}
;

%%

