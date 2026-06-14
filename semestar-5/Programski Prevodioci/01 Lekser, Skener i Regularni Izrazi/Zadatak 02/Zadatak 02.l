/*
    Zadatak 2:
    Napraviti skener koji prepoznaje single-line komentar i izbacuje ga iz koda. 
    Za testiranje se može koristiti test2.c. 
    Izlaz treba da bude početni kod, sa izostavljenim linijama koje počinju
    stringom '//'
*/

%option noyywrap

%%

"//".*

%%

int main() {
  yylex();
}