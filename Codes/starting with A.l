%{
#include <stdio.h>
int count = 0;
%}

%%
[Aa][a-zA-Z]*     { count++; }
[bcdefghijklmnopqrstuvwxyzBCDEFGHIJKLMNOPQRSTUVWXYZ][a-zA-Z]*  { }
[ \t\n]+          { }
[^a-zA-Z \t\n]+   { }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    printf("Number of words starting with 'A' or 'a': %d\n", count);
    return 0;
}
