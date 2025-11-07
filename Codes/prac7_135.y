%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%token PLUS MULT

%%

expr:
      expr expr PLUS   { $$ = $1 + $2; }
    | expr expr MULT   { $$ = $1 * $2; }
    | NUMBER           { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a postfix expression:\n");
    if (yyparse() == 0)
        printf("Valid postfix expression.\n");
    return 0;
}

