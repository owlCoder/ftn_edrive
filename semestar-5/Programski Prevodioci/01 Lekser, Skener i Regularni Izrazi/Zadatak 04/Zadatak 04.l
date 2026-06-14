/*
    Zadatak 4:
        Rešiti prepoznavanje C blok komentara.
*/

%option noyywrap

%%

"/*"([^*]|("*"+[^*/]))*"*"+"/"

%%

int main() {
  yylex();
}