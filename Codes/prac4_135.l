%{
#include <stdio.h>
#include <ctype.h>
%}

%%

[a-z]    { printf("%c", toupper(yytext[0])); }
[A-Z]    { printf("%c", tolower(yytext[0])); }
.        { printf("%c", yytext[0]); }
\n       { printf("\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    return 0;
}
