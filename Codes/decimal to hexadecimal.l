%{
#include <stdio.h>
#include <stdlib.h>

void dec_to_hex(int num) {
    char hex[100];
    int i = 0;
    if (num == 0) {
        printf("0\n");
        return;
    }
    while (num > 0) {
        int rem = num % 16;
        if (rem < 10)
            hex[i++] = rem + '0';
        else
            hex[i++] = rem - 10 + 'A';
        num /= 16;
    }
    for (int j = i - 1; j >= 0; j--)
        printf("%c", hex[j]);
    printf("\n");
}
%}

%%

[0-9]+    { dec_to_hex(atoi(yytext)); }

\n        { }

.         { }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

