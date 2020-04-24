%{
// Une calculatrice avec uniquement addition et soustraction
// et une seule expression est calculée (une seule ligne)
#include <stdio.h>
int A = 0;
%}

%token NOMBRE
%token VAR
%token AFFICHE

%%
page    : page ligne 
        | ligne 
        ;
ligne   : expr {printf("%d\n", $1);}
        | affect
        | affiche
        ;
expr    : expr '+' terme {$$ = $1 + $3;}
        | terme
        ;
terme   : terme '*' diff {$$ = $1 * $3;}
        | diff
        ;
diff    : diff '-' quot {$$ = $1 - $3;}
        | quot
        ;
quot    : quot '/' facteur {$$ = $1 / $3;}
        | facteur
        ;
facteur : '(' expr ')' {$$ = $2;}
        | NOMBRE
        | VAR {$$ = A;}
        ;
affect  : VAR '=' expr {
                A = $3;
                printf("A=%d\n", $3);
            }
        ;
affiche : AFFICHE {printf("%d\n", A);};


%%

#include "lex.yy.c"
