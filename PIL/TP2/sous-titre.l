%{
  // Lit et affiche les sous-titres (sans prendre en compte les sauts
  // de lignes) avec leurs temps de début et de fin dans un
  // fichier .sub
  int t0 = 25;
  int t1 = 0;
  int t2 = 0;
%}
/** Indication: le contenu d'un sous-titre est une chaine de caractères
 * qui ne commence pas par "{" et qui ne contient pas de retour à  la
 * ligne.
 **/

TIME     \{[0-9]+\}
START    ^{TIME}    
END      {TIME}
SUBLINE  [^\n\|]*
FSTLINE  [^\{0-9\}\n\|]{SUBLINE}
LINE     \|[^\n\|]*{SUBLINE}

%%
{START} {
  usleep((t2-t1)*1000000/25);
  system("clear");
  t1 = atoi(yytext+1);
  usleep((t1-t2)*1000000/25);
}
{END} {
  t2 = atoi(yytext+1);
}
{FSTLINE} {
  system("clear");
  printf("%s\n", yytext);
}
{LINE} {
  printf("%s\n", yytext+1);
}
(\n) {}
. {}

%%
int main() {
  yylex();
  return 0;
}