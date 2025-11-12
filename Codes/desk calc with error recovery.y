%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token NUMBER

%%
program:    program expr '\n'   { printf("= %d\n", $2); }
         |
         ;

expr:       NUMBER              { $$ = $1; }
         |  expr expr '+'       { $$ = $1 + $2; }
         |  expr expr '-'       { $$ = $1 - $2; }
         |  expr expr '*'       { $$ = $1 * $2; }
         |  expr expr '/'       { $$ = $1 / $2; }
         ;
%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter postfix expression:\n");
    yyparse();
    return 0;
}
