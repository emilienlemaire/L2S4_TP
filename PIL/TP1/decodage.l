%%
0$              {printf("a");}
0/(1{2})*[^1]   {printf("a");}
01              {printf("b");}
11              {printf("c");}
.   {
        printf("\nLettre non reconnue: \"%s\"\n", yytext);
        exit(1);
    }
%%
