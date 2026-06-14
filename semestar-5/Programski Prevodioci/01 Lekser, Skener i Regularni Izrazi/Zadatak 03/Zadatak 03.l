/*
    Zadatak 3:
        Napraviti skener koji u ulaznom tekstu temperaturu izraženu u Farenhajtima prepravlja u
        temperaturu izraženu u Celzijusima. Ostatak teksta treba da ostane isti.
        Formula za konverziju temperature: (°F - 32) x 5/9 = °C.

        Na primer, tekst:
            Normalna temperatura ljudskog tela je 98F.
            Temperatura od 50F je daleko ispod proseka za mesec maj.
            Voda kljuca na 212F.

        Treba da se prevede u:
            Normalna temperatura ljudskog tela je 36C.
            Temperatura od 10C je daleko ispod proseka za mesec maj.
            Voda kljuca na 100C.
*/

%option noyywrap

%%

[+-]?[0-9]+F  { printf("%dC", ((atoi(yytext) - 32) * 5/9 )); }

%%

int main() {
  yylex();
}