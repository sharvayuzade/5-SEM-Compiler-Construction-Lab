%{
#include "y.tab.h"
#include <stdlib.h>
void yyerror(char *);
%}

%%
[0-9]+      { 
                yylval = atoi(yytext);
                return NUMBER;
            }
[-+*/\n]    { return *yytext; }
[ \t]       ;
.           { yyerror("Invalid character"); }

%%

int yywrap(void) {
    return 1;
}
