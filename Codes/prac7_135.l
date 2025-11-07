%{
#include "y.tab.h"
%}

%%
[0-9]+        { yylval = atoi(yytext); return NUMBER; }
"+"           { return PLUS; }
"*"           { return MULT; }
[ \t\n]+      ;   // ignore whitespace
.             { return 0; }
%%

int yywrap() { return 1; }

