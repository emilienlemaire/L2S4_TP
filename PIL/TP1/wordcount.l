%{
    unsigned int char_count = 0;
    unsigned int word_count = 0;
    unsigned int line_count = 0;
%}

word [^ \t\n]+
eol \n

%%
{word} {
            word_count++;
            char_count += yyleng;
       }
{eol}  {
            char_count++;
            line_count++;
       }
.      {
            char_count++;
       }
%%

int main() {
    yylex();
    printf("lines=%d words=%d char=%d\n",
        line_count, word_count, char_count);
    return 0;
}
