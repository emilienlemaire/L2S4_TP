%{
// Fichier lex pour une calculatrice avec uniquement adddition et soustraction, et une seule
// expression calculée. Convient aussi si on y ajoute les deux autres opérations.
%}

COMMENT \/\/.*\n
AFF A\n
%%

{COMMENT} ;

{AFF} {
    return AFFICHE;
}

[ \t\n] ;

A {
    return VAR;
}

[0-9]+ {
    yylval = atoi(yytext);
    return NOMBRE;
}


.   return yytext[0];


%%
