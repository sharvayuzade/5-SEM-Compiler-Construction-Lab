%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}
%%
for             return FOR;
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.str = strdup(yytext); return ID; }
[0-9]+          { yylval.num = atoi(yytext); return NUM; }
"<"             return LT;
"="             return ASSIGN;
"++"            return INC;
";"             return SEMI;
"("             return LPAREN;
")"             return RPAREN;
"{"             return LBRACE;
"}"             return RBRACE;
[ \t\n]+        ; // skip whitespace
.               { return yytext[0]; }
%%
int yywrap() { return 1; }
