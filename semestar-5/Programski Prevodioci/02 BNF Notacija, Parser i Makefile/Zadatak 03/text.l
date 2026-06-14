%option noyywrap yylineno
%{
  #include "text.tab.h"
%}

%%

[ \t]+    { /* skip */ }

"."         { return _DOT; }
[A-Z][a-z]* { return _CAPITAL_WORD; }
[a-z]+      { return _WORD; }

\n+         { return _NEWLINE; }

.           { printf("\nline %d: LEXICAL ERROR on char %c", 
                      yylineno, *yytext); }    

