/*
    Zadatak 1:
      Napraviti skener koji prepoznaje:
          1. Cele brojeve. Na primer: +45645, -4356, 642642, +1. 
             Celi brojevi ne smeju počinjati cifrom 0.

          2. Heksadecimalne brojeve—započinju cifrom 0, iza koje sledi malo ili veliko slovo x, 
             a zatim najmanje jedna, a najviše 4 heksadecimalne cifre. 
             Na primer: 0x7A3F, 0X1234, 0xf, 0x123, 0xffce.

          3. Realne brojeve (tačka i bar jedna cifra pre tačke su obavezni). 
             Na primer: 2.345, 0.0, 5., 123.456, +123.456, -123.456.

             Dodatno: realni brojevi su i brojevi oblika 12.345e+123, 5.e-4, -1.23E+04 gde eksponencijalni deo

          4. Ključnu reč break, ali case-insensitive. Na primer: break, BrEaK, BREAK.
*/
%option noyywrap

%%

[+-]?0|[1-9][0-9]*                      { printf("Decimalni broj: %s\n", yytext); }      // pod 1
0[xX][0-9a-fA-F]{1,4}                   { printf("Hexadecimalni broj: %s\n", yytext); }  // pod 2
[+-]?[0-9]+\.[0-9]?                     { printf("Realni broj: %s\n", yytext); } // pod 3a
[+-]?[0-9]+\.[0-9]*[eE][+-]?[0-9]{1,3}  { printf("Realni broj sa eksponentnom: %s\n", yytext); }     // pod 3b
[bB][rR][eE][aA][kK]                    { printf("Rec 'break': %s\n", yytext); }     // pod 4

%%

int main() {
  yylex();
}
