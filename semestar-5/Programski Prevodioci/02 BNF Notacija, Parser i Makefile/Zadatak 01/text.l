%option noyywrap yylineno
%{
  #include "text.tab.h"
%}

%%

[ \t\n]+    { /* skip */ }

"."         { return _DOT; }
[A-Z][a-z]* { return _CAPITAL_WORD; }
[a-z]+      { return _WORD; }

"?"         { return _QUESTION_MARK; }
"!"         { return _EXLAMATION_MARK; }

.           { printf("\nline %d: LEXICAL ERROR on char %c", 
                      yylineno, *yytext); }    

