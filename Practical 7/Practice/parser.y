%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%token PLUS MULT LPAREN RPAREN

%left PLUS
%left MULT

%%

expr:
      expr PLUS expr    { $$ = $1 + $3; }
    | expr MULT expr    { $$ = $1 * $3; }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER            { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter an expression:\n");
    if (yyparse() == 0)
        printf("Valid expression.\n");
    return 0;
}

