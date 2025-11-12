%{
#include <stdio.h>
#include <string.h>
int line_number = 1;
%}

%%
.*com$          { printf("Line %d ends with 'com': %s\n", line_number, yytext); }
.*\n            { line_number++; }
.               { /* ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    return 0;
}
