%{
#include <stdio.h>
%}

%%
zero|ZERO     { printf("0\n"); }
one|ONE       { printf("1\n"); }
two|TWO       { printf("2\n"); }
three|THREE   { printf("3\n"); }
four|FOUR     { printf("4\n"); }
five|FIVE     { printf("5\n"); }
six|SIX       { printf("6\n"); }
seven|SEVEN   { printf("7\n"); }
eight|EIGHT   { printf("8\n"); }
nine|NINE     { printf("9\n"); }
ten|TEN       { printf("10\n");}
%%

int main() {
    yylex();
    return 0;
}

