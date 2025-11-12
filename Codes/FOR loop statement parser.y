%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}
%union {
    char *str;
    int num;
}
%token <str> ID
%token <num> NUM
%token FOR
%token LT ASSIGN INC
%token SEMI LPAREN RPAREN LBRACE RBRACE
%%
program:
    for_loop
;
for_loop:
    FOR LPAREN init SEMI cond SEMI incr_opt RPAREN statement_opt
    {
        printf("Valid for loop syntax\n");
    }
;
init:
    ID ASSIGN NUM
;
cond:
    ID LT NUM
;
incr_opt:
    /* empty */
    | incr
;
incr:
    ID INC
;
statement_opt:
    /* empty */
    | statement
;
statement:
    LBRACE RBRACE
    | LBRACE statements RBRACE
;
statements:
    statement
    | statements statement
;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
}
int main(void) {
    printf("Enter your for loop:\n");
    return yyparse();
}
