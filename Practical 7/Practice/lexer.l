%{
#include "y.tab.h"  // Include the token definitions
%}

%%

[0-9]+              { yylval = atoi(yytext); return NUMBER; }
[ \t\n]+            ;  // Ignore whitespace
"+"                 return PLUS;
"*"                 return MULT;
"("                 return LPAREN;
")"                 return RPAREN;

.                   return yytext[0];

%%

