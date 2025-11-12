%{
#include <stdio.h>
#include <string.h>

int lines = 0, spaces = 0, comments = 0, keywords = 0, identifiers = 0, words = 0;

char *keyword_list[] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do", "double",
    "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register",
    "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef",
    "union", "unsigned", "void", "volatile", "while"
};

int is_keyword(char *word) {
    for (int i = 0; i < sizeof(keyword_list)/sizeof(char*); i++) {
        if (strcmp(word, keyword_list[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%
"//".*                       { comments++; lines++; }
"/*"([^*]|\*+[^*/])*\*+"/"   { comments++; }
[ \t]+                      { spaces += yyleng; }
[\n]+                       { lines += yyleng; }
[a-zA-Z_][a-zA-Z0-9_]*       {
                                words++;
                                if (is_keyword(yytext)) {
                                    keywords++;
                                } else {
                                    identifiers++;
                                }
                            }
.                           { words++; }
%%

int yywrap() { return 1; }

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror("File open failed");
        return 1;
    }

    yyin = f;
    yylex();
    fclose(f);

    printf("\n--- ANALYSIS REPORT ---\n");
    printf("Lines      : %d\n", lines);
    printf("Spaces     : %d\n", spaces);
    printf("Words      : %d\n", words);
    printf("Comments   : %d\n", comments);
    printf("Keywords   : %d\n", keywords);
    printf("Identifiers: %d\n", identifiers);

    return 0;
}

