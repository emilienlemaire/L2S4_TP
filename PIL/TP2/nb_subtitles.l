%{
  // Lit et affiche les sous-titres (sans prendre en compte les sauts
  // de lignes) avec leurs temps de début et de fin dans un
  // fichier .sub
  int nb = 0;
%}
/** Indication: le contenu d'un sous-titre est une chaine de caractères
 * qui ne commence pas par "{" et qui ne contient pas de retour à  la
 * ligne.
 **/

TIME     \{[0-9]+\}
START    ^{TIME}    
END      {TIME}
SUBLINE  [^\n|]*
FSTLINE  [^{\n|]{SUBLINE}
LINE     \|{SUBLINE}

%%
{START} {}
{END} {}
{FSTLINE} {}
{LINE} {}
(\n) {
  nb++;
}
. {}
%%
int main() {
  yylex();
  printf("%d\n", nb);
  return 0;
}