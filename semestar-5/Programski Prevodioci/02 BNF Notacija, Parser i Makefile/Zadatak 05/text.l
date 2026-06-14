%option noyywrap yylineno
%{
  #include "text.tab.h"
%}

%%

[ \t\n]+    { /* skip */ }

"."         { return _DOT; }
[A-Z][a-z]* { return _CAPITAL_WORD; }
[a-z]+      { return _WORD; }

[1-9][0-9]* { return _NUMBER; }

.           { printf("\nline %d: LEXICAL ERROR on char %c", 
                      yylineno, *yytext); }    

