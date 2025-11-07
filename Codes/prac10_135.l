%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.str = strdup(yytext); return ID; }
[0-9]+                   { yylval.str = strdup(yytext); return NUM; }
[ \t]+                   ;   /* ignore spaces and tabs */
\n                       { return '\n'; }
"="                      { return '='; }
"("                      { return '('; }
")"                      { return ')'; }
"+"                      { return '+'; }
"-"                      { return '-'; }
"*"                      { return '*'; }
"/"                      { return '/'; }
.                        { printf("Invalid char: %s\n", yytext); }

%%

int yywrap(void) { return 1; }

