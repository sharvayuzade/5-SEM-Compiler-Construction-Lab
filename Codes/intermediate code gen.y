%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);
int tempCount = 1;

char* newTemp() {
    static char t[10];
    sprintf(t, "t%d", tempCount++);
    return strdup(t);
}
%}

%union {
    char* str;
}

%token <str> ID NUM
%left '+' '-'
%left '*' '/'
%right '='
%type <str> expr assignment

%%
program:
      assignment '\n' { printf("\n✅ Intermediate Code Generated Successfully!\n"); }
    | assignment     { printf("\n✅ Intermediate Code Generated Successfully!\n"); }
    ;

assignment:
      ID '=' expr { printf("%s = %s\n", $1, $3); }
    ;

expr:
      expr '+' expr {
          char* temp = newTemp();
          printf("%s = %s + %s\n", temp, $1, $3);
          $$ = temp;
      }
    | expr '-' expr {
          char* temp = newTemp();
          printf("%s = %s - %s\n", temp, $1, $3);
          $$ = temp;
      }
    | expr '*' expr {
          char* temp = newTemp();
          printf("%s = %s * %s\n", temp, $1, $3);
          $$ = temp;
      }
    | expr '/' expr {
          char* temp = newTemp();
          printf("%s = %s / %s\n", temp, $1, $3);
          $$ = temp;
      }
    | '(' expr ')' { $$ = $2; }
    | ID  { $$ = $1; }
    | NUM { $$ = $1; }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "❌ Error: %s\n", s);
}

int main() {
    printf("Enter an arithmetic expression (e.g., a=b+c*d):\n");
    yyparse();
    return 0;
}

